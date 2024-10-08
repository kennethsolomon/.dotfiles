local ls = require('luasnip')

-- require("luasnip.loaders.from_snipmate").lazy_load()

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
})

ls.add_snippets('php', {
  ls.parser.parse_snippet('class', 'class $1\n{\n    $0\n}'),
  ls.parser.parse_snippet('pubf', 'public function $1($2)\n{\n    $0\n}'),
  ls.parser.parse_snippet('phpdoc', '/**\n * A short description. \n * @param array<int> $a A parameter summary.\n * @return int A return value summary. \n */'),
  -- ls.parser.parse_snippet('pubf', 'public function $1($2): $3\n{\n    $0\n}'),
  ls.parser.parse_snippet('prif', 'private function $1($2): $3\n{\n    $0\n}'),
  ls.parser.parse_snippet('prof', 'protected function $1($2): $3\n{\n    $0\n}'),
  ls.parser.parse_snippet('testt', 'public function test_$1()\n{\n    $0\n}'),
  ls.parser.parse_snippet('testa', '/** @test */\npublic function $1()\n{\n    $0\n}'),
  ls.parser.parse_snippet('wroutegc', '/** @Web Route Closure GET */\nRoute::get(\'$1\', function () {\n    $0\n});'),
  ls.parser.parse_snippet('wroutepc', '/** @Web Route Closure POST */\nRoute::post(\'$1\', function (Request $request) {\n    $0\n});'),
  ls.parser.parse_snippet('foreach', 'foreach ($array as $element) {\n    $0\n}'),
})

ls.add_snippets('typescript', {
  ls.parser.parse_snippet('import', "import $1 from '$0'"),
})

ls.add_snippets('vue', {
  ls.parser.parse_snippet('defineProps', 'defineProps<{\n  $0\n}>()'),
})
