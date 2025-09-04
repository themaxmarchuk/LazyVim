local test_file_path = string.sub(vim.o.rtp, 1, string.find(vim.o.rtp, ",") - 1) .. "/test_file"

local lines = vim.fn.readfile(test_file_path, "b")
vim.print(lines[1])

vim.fn.writefile({ "kanagawa-dragon" }, test_file_path, "b")
