-- Adds support for highlighting some TODO keywords in Markdown for my task management

local M = {}

local keywords = {
	{ "TODO", "mdKeywordTodo" },
	{ "NEXT", "mdKeywordNext" },
	{ "STACK", "mdKeywordStack" },
	{ "PROB", "mdKeywordProb" },
	{ "DONE", "mdKeywordDone" },
	{ "CONT", "mdKeywordCont" },
	{ "DEADLINE", "mdTagwordDeadline" },
	{ "SCHEDULED", "mdTagwordScheduled" },
	{ ":frog:", "mdTagwordFrog" },
}
local current_mark = 0
local marks = {}

function M.highlight_todos(bufnr)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	for i, line in ipairs(lines) do
		for _, keyword_group in ipairs(keywords) do
			local keyword = keyword_group[1]
			local group = keyword_group[2]
			for match in string.gmatch(line, keyword) do
				local start_col, end_col = string.find(line, match)
				vim.api.nvim_buf_add_highlight(bufnr, -1, group, i - 1, start_col - 1, end_col)
			end
		end
	end
end

function M.cycle_todos(direction)
	if #marks == 0 then
		return
	end
	current_mark = current_mark + direction
	if current_mark < 1 then
		current_mark = #marks
	elseif current_mark > #marks then
		current_mark = 1
	end
	vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_get_extmark_by_id(0, marks[current_mark])[2] + 1, 0 })
end

return M
