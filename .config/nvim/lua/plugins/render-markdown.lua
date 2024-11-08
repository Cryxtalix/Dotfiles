-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }
  },
  {
    'ChuufMaster/markdown-toc', --https://github.com/ChuufMaster/markdown-toc
    -- ":GenerateTOC"
    -- ":DeleteTOC"
    opts = {

      -- The heading level to match (i.e the number of "#"s to match to) max 6
      heading_level_to_match = -1,

      -- Set to True display a dropdown to allow you to select the heading level
      ask_for_heading_level = false,

      -- TOC default string
      -- WARN
      toc_format = '%s- [%s](<%s#%s>)',
    }
  }
}
