-- Local development entry point for pomo.nvim
-- This file is not part of the plugin itself; it is for testing and development.

-- Add the current directory to the runtime path to load the plugin locally
vim.opt.runtimepath:append(".") -- Assuming you are running from the project root
vim.opt.runtimepath:prepend("~/.config/nvim/lua/plugins/pomo.nvim")

-- Require and set up the plugin
local pomo = require("pomo")
pomo.setup()

-- Optional: Add some test tasks for development
local tasks = {
	"Write documentation for pomo.nvim",
	"Add UI rendering for task list",
	"Fix timer overlap bug",
}

-- Add test tasks automatically
for _, task in ipairs(tasks) do
	vim.cmd("PomoAddTask " .. task)
end

-- Keybindings for easier testing
vim.keymap.set("n", "<leader>pp", ":PomoToggle<CR>", { desc = "Toggle Pomo UI" })
vim.keymap.set("n", "<leader>ps", ":PomoStartPomodoro<CR>", { desc = "Start Pomodoro" })
vim.keymap.set("n", "<leader>pb", ":PomoStartBreakShort<CR>", { desc = "Start Short Break" })
vim.keymap.set("n", "<leader>pl", ":PomoStartBreakLong<CR>", { desc = "Start Long Break" })
vim.keymap.set("n", "<leader>pc", ":PomoGetCurrentTask<CR>", { desc = "Get Current Task" })
vim.keymap.set("n", "<leader>pf", ":PomoFinishTask<CR>", { desc = "Finish Current Task" })
vim.keymap.set("n", "<leader>px", ":PomoStop<CR>", { desc = "Stop Timer" })

print("pomo.nvim development environment loaded!")
