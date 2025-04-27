local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	s("pubf", {
		t("public function "),
		i(1, "functionName"),
		t("("),
		i(2),
		t(") {"),
		t({ "", "\t" }),
		i(3),
		t({ "", "}" }),
	}),
	s("protf", {
		t("protected function "),
		i(1, "functionName"),
		t("("),
		i(2),
		t(") {"),
		t({ "", "\t" }),
		i(3),
		t({ "", "}" }),
	}),
	s("privf", {
		t("protected function "),
		i(1, "functionName"),
		t("("),
		i(2),
		t(") {"),
		t({ "", "\t" }),
		i(3),
		t({ "", "}" }),
	}),
	s("fn", {
		t("function ("),
		i(1),
		t(") {"),
		t({ "", "\t" }),
		i(2),
		t({ "", "}" }),
	}),
}
