return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                insert = "<C-s>",
                insert_line = "<C-S>",
                normal = "S",
                normal_cur = "Ss",
                normal_line = "SS",
                normal_cur_line = "SS",
                visual = "S",
                visual_line = "S",
                delete = "sd",
                change = "sc",
                change_line = "sC",
            },
        })
    end
}
