local M = {}

local tasks = require("pomo.core").tasks
local current_task = require("pomo.core").current_task
local timer = require("pomo.timer")

function M.add_task(task_name)
	print("Enter add_task")
	table.insert(tasks, { name = task_name, status = "pending" })
	print("Added task: " .. task_name)
end

function M.finish_task()
	print("Enter finish_task")
	if not current_task then
		print("No current task to finish!")
		return
	end
	current_task.status = "done"
	current_task = nil
	print("Finished the current task!")
end

function M.get_current_task()
	print("Enter get_current_task")
	if current_task then
		print("Current Task: " .. current_task.name)
	else
		print("No task currently selected.")
	end
end

function M.start_pomodoro()
	print("Enter start_pomodoro")
	if not current_task then
		print("Select a task before starting a Pomodoro session.")
		return
	end
	timer.start(25 * 60, "Pomodoro")
end

function M.start_break_short()
	print("Enter start_break_short")
	timer.start(5 * 60, "Short Break")
end

function M.start_break_long()
	print("Enter start_break_long")
	timer.start(15 * 60, "Long Break")
end

function M.stop_timer()
	print("Enter stop_timer")
	timer.stop()
	print("Timer stopped.")
end

return M
