import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, rectangle, shell } from "./utils";

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Control+Option+Shift+Command",
        from: {
          key_code: "caps_lock",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "left_shift",
            modifiers: ["left_control", "left_option", "left_command"],
          },
        ],
        to_after_key_up: [
          {
            key_code: "left_shift",
            modifiers: [],
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },

      //      {
      //        type: "basic",
      //        description: "Disable CMD + Tab to force Hyper Key usage",
      //        from: {
      //          key_code: "tab",
      //          modifiers: {
      //            mandatory: ["left_command"],
      //          },
      //        },
      //        to: [
      //          {
      //            key_code: "tab",
      //          },
      //        ],
      //      },
    ],
  },

  ...createHyperSubLayers({
    spacebar: open(
      "raycast://extensions/stellate/mxstbr-commands/create-notion-todo"
    ),
    // b = "B"rowse
    b: {
      y: open("https://www.youtube.com"),
      f: open("https://www.facebook.com"),
      r: open("https://www.reddit.com"),
    },
    // o = "Open" applications
    o: {
      a: app("Arc"),
      c: app("Cursor"),
      v: app("Visual Studio Code"),
      d: app("Obsidian"),
      s: app("Spotify"),
      p: app("PhpStorm"),
      t: app("Kitty"),
      m: app("Microsoft Teams"),
      g: app("Gimp"),
    },

    // TODO: This doesn't quite work yet.
    // l = "Layouts" via Raycast's custom window management
    // l: {
    //   // Coding layout
    //   c: shell`
    //     open -a "Visual Studio Code.app"
    //     sleep 0.2
    //     open -g "raycast://customWindowManagementCommand?position=topLeft&relativeWidth=0.5"

    //     open -a "Terminal.app"
    //     sleep 0.2
    //     open -g "raycast://customWindowManagementCommand?position=topRight&relativeWidth=0.5"
    //   `,
    // },

    // Currently using moom to manage windows
    // w = "Window" via rectangle.app
    // w: {
    //   semicolon: {
    //     description: "Window: Hide",
    //     to: [
    //       {
    //         key_code: "h",
    //         modifiers: ["right_command"],
    //       },
    //     ],
    //   },
    //   y: rectangle("previous-display"),
    //   o: rectangle("next-display"),
    //   k: rectangle("top-half"),
    //   j: rectangle("bottom-half"),
    //   h: rectangle("left-half"),
    //   l: rectangle("right-half"),
    //   f: rectangle("maximize"),
    //   u: {
    //     description: "Window: Previous Tab",
    //     to: [
    //       {
    //         key_code: "tab",
    //         modifiers: ["right_control", "right_shift"],
    //       },
    //     ],
    //   },
    //   i: {
    //     description: "Window: Next Tab",
    //     to: [
    //       {
    //         key_code: "tab",
    //         modifiers: ["right_control"],
    //       },
    //     ],
    //   },
    //   n: {
    //     description: "Window: Next Window",
    //     to: [
    //       {
    //         key_code: "grave_accent_and_tilde",
    //         modifiers: ["right_command"],
    //       },
    //     ],
    //   },
    //   b: {
    //     description: "Window: Back",
    //     to: [
    //       {
    //         key_code: "open_bracket",
    //         modifiers: ["right_command"],
    //       },
    //     ],
    //   },
    //   // Note: No literal connection. Both f and n are already taken.
    //   m: {
    //     description: "Window: Forward",
    //     to: [
    //       {
    //         key_code: "close_bracket",
    //         modifiers: ["right_command"],
    //       },
    //     ],
    //   },
    // },

    // s = "System"
    s: {
      u: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      k: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      l: {
        to: [
          {
            key_code: "q",
            modifiers: ["right_control", "right_command"],
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      semicolon: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
      // "D"o not disturb toggle
      d: open(
        `raycast://extensions/yakitrak/do-not-disturb/toggle?launchType=background`
      ),
      // "T"heme
      t: open(`raycast://extensions/raycast/system/toggle-system-appearance`),
      c: open("raycast://extensions/raycast/system/open-camera"),
      // 'v'oice
      v: {
        to: [
          {
            key_code: "spacebar",
            modifiers: ["left_option"],
          },
        ],
      },
    },

    // v = "moVe" which isn't "m" because we want it to be on the left hand
    // so that hjkl work like they do in vim
    v: {
      h: {
        to: [{ key_code: "left_arrow" }],
      },
      j: {
        to: [{ key_code: "down_arrow" }],
      },
      k: {
        to: [{ key_code: "up_arrow" }],
      },
      l: {
        to: [{ key_code: "right_arrow" }],
      },
      // Magicmove via homerow.app
      m: {
        to: [{ key_code: "f", modifiers: ["right_control"] }],
        // TODO: Trigger Vim Easymotion when VSCode is focused
      },
      // Scroll mode via homerow.app
      s: {
        to: [{ key_code: "j", modifiers: ["right_control"] }],
      },
      d: {
        to: [{ key_code: "d", modifiers: ["right_shift", "right_command"] }],
      },
      u: {
        to: [{ key_code: "page_down" }],
      },
      i: {
        to: [{ key_code: "page_up" }],
      },
    },

    // c = Musi*c* which isn't "m" because we want it to be on the left hand
    c: {
      p: {
        to: [{ key_code: "play_or_pause" }],
      },
      n: {
        to: [{ key_code: "fastforward" }],
      },
      b: {
        to: [{ key_code: "rewind" }],
      },
    },

    // r = "Raycast"
    r: {
      c: open("raycast://extensions/thomas/color-picker/pick-color"),
      n: open("raycast://script-commands/dismiss-notifications"),
      l: open(
        "raycast://extensions/stellate/mxstbr-commands/create-mxs-is-shortlink"
      ),
      e: open(
        "raycast://extensions/raycast/emoji-symbols/search-emoji-symbols"
      ),
      p: open("raycast://extensions/raycast/raycast/confetti"),
      a: open("raycast://extensions/raycast/raycast-ai/ai-chat"),
      s: open("raycast://extensions/peduarte/silent-mention/index"),
      h: open(
        "raycast://extensions/raycast/clipboard-history/clipboard-history"
      ),
      1: open(
        "raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-1"
      ),
      2: open(
        "raycast://extensions/VladCuciureanu/toothpick/connect-favorite-device-2"
      ),
    },

    // Add arrow key mappings
    h: {
      to: [{ key_code: "left_arrow" }],
    },
    l: {
      to: [{ key_code: "right_arrow" }],
    },
    j: {
      to: [{ key_code: "down_arrow" }],
    },
    k: {
      to: [{ key_code: "up_arrow" }],
    },
  }),
  // {
  //   description: "Change Backspace to Spacebar when Minecraft is focused",
  //   manipulators: [
  //     {
  //       type: "basic",
  //       from: {
  //         key_code: "delete_or_backspace",
  //       },
  //       to: [
  //         {
  //           key_code: "spacebar",
  //         },
  //       ],
  //       conditions: [
  //         {
  //           type: "frontmost_application_if",
  //           file_paths: [
  //             "^/Users/mxstbr/Library/Application Support/minecraft/runtime/java-runtime-gamma/mac-os-arm64/java-runtime-gamma/jre.bundle/Contents/Home/bin/java$",
  //           ],
  //         },
  //       ],
  //     },
  //   ],
  // },
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);
