return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          gradle = {
            enabled = true,
            wrapper = {
              enabled = true,
            },
          },
          import = {
            gradle = {
              enabled = true,
              offline = false,
            },
            maven = { enabled = true },
            generatesMetadataFilesAtProjectRoot = false,
          },
          eclipse = {
            downloadSources = true,
          },
          maven = {
            downloadSources = true,
          },
          references = { includeDecompiledSources = true },
          inlayHints = {
            parameterNames = { enabled = "all" },
          },
        },
      })

      -- Đảm bảo dùng Gradle wrapper
      opts.init_options = vim.tbl_deep_extend("force", opts.init_options or {}, {
        workspaceFolders = { vim.fn.getcwd() },
      })

      return opts
    end,
  },
}
