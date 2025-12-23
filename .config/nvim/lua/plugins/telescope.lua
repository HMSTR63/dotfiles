return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            -- Load extensions
            -- Wrap in pcall to avoid errors if extension is missing
            pcall(telescope.load_extension, "ui-select")
            pcall(telescope.load_extension, "noice") 

            -- Keymaps
            -- Find Files: Search for files in your project
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            -- Live Grep: Search for text string inside files
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
            -- Buffers: List open buffers
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            -- Help Tags: Search Neovim help documentation
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
            -- Old Files: Search recent files
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope recent files" })
        end,
    },
}