local setup, wilder = pcall(require, "wilder")
if not setup then
	return
end

wilder.setup({modes = {':', '/', '?'}})