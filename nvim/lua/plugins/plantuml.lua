return {
  "weirongxu/plantuml-previewer.vim",
  dependencies = { "aklt/plantuml-syntax", "tyru/open-browser.vim" },
  init = function()
    vim.cmd([[let g:plantuml_previewer#plantuml_jar_path = "/home/fraco/Downloads/plantuml-mit-1.2025.2.jar"]])
  end,
}
