local status, lspkind = pcall(require, "lspkind")
if not status then
  return
end

lspkind.init({
  -- enables text annotations
  --
  -- default: true
  mode = "symbol",

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = "codicons",

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "",
    Method = "ƒ",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "𝓒",
    Interface = "ﰮ",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "ℰ",
    Keyword = "",
    Snippet = "﬌",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "𝓢",
    Event = "🗲",
    Operator = "",
    TypeParameter = "𝙏",
  },
})
