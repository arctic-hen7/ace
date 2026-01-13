local M = {}

local function strip_json_comments(s)
	-- Remove /* block comments */ (non-greedy)
	s = s:gsub("/%*.-%*/", "")
	-- Remove // line comments
	s = s:gsub("//[^\n]*", "")
	return s
end

function M.load(name)
	local p = vim.fn.expand("$ACE_MAIN_DIR/dotfiles/nvim/themes/" .. name .. ".jsonc")
	local ok, lines = pcall(vim.fn.readfile, p)
	if not ok then
		error("mytheme.loader: failed to read file: " .. p)
	end
	local raw = table.concat(lines, "\n")
	local clean = strip_json_comments(raw)

	-- Prefer vim.json.decode when available (Neovim 0.9+)
	local decoder = (vim.json and vim.json.decode) or vim.fn.json_decode
	local ok2, data = pcall(decoder, clean)
	if not ok2 then
		error("mytheme.loader: JSON decode failed for " .. p)
	end
	return data
end

return M
