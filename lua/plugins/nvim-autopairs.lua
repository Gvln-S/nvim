return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lus = { "string" },
      javascript = { "template_string" },
    }
  }
}
