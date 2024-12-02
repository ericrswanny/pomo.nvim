local M = {}

local tasks = {}
local current_task = nil
local timer = nil

function M.setup()
	vim.api.nvim_create_user_command("PomoAddTask", function(opts)
		require("pomo.commands").add_task(opts.args)
	end, { nargs = 1, desc = "Add a new task" })

	vim.api.nvim_create_user_command("PomoToggle", function()
		require("pomo.ui").toggle_ui()
	end, { desc = "Toggle Pomo UI" })

	vim.api.nvim_create_user_command("PomoFinishTask", function()
		require("pomo.commands").finish_task()
	end, { desc = "Finish the current task" })

	vim.api.nvim_create_user_command("PomoGetCurrentTask", function()
		require("pomo.commands").get_current_task()
	end, { desc = "Get the current task" })

	vim.api.nvim_create_user_command("PomoStartPomodoro", function()
		require("pomo.commands").start_pomodoro()
	end, { desc = "Start a Pomodoro session" })

	vim.api.nvim_create_user_command("PomoStartBreakShort", function()
		require("pomo.commands").start_break_short()
	end, { desc = "Start a short break" })

	vim.api.nvim_create_user_command("PomoStartBreakLong", function()
		require("pomo.commands").start_break_long()
	end, { desc = "Start a long break" })

	vim.api.nvim_create_user_command("PomoStop", function()
		require("pomo.commands").stop_timer()
	end, { desc = "Stop the current timer" })
end

return M
