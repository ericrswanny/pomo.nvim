local M = {}

local timer_handle = nil

function M.start(duration, label)
	if timer_handle then
		print("A timer is already running!")
		return
	end

	local remaining = duration
	print(label .. " started! Duration: " .. math.floor(duration / 60) .. " minutes.")

	timer_handle = vim.loop.new_timer()
	timer_handle:start(
		1000,
		1000,
		vim.schedule_wrap(function()
			remaining = remaining - 1
			if remaining <= 0 then
				print(label .. " completed!")
				M.stop()
			else
				print("Time remaining: " .. remaining .. " seconds.")
			end
		end)
	)
end

function M.stop()
	if timer_handle then
		timer_handle:stop()
		timer_handle:close()
		timer_handle = nil
	end
end

return M
