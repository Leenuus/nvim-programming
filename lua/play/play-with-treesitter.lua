local logger = require("plenary.log")
local parser = vim.treesitter.get_parser()

local lang = parser:lang()

local tree = parser:parse()[1]

local root = tree:root()

local t = vim.treesitter.get_node_text(root, 0)

local query_text = [[(variable_declaration) @good]]
local q = vim.treesitter.query.parse(lang, query_text)

for id, node, metadata in q:iter_captures(root, 0, 0, 22) do
	local name = q.captures[id] -- name of the capture in the query
	-- typically useful info about the node:
	local type = node:type()
	logger.info(vim.treesitter.get_node_text(node, 0))
	local row1, col1, row2, col2 = node:range() -- range of the capture
	logger.info(name)
	logger.info(type)
end
