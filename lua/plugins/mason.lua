return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.registries = {
        "github:mason-org/mason-registry",
        "github:nvim-java/mason-registry",
      }
    end,
  },
}
