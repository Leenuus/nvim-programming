local logger = require("plenary.log")
local parser = vim.treesitter.get_parser()

local lang = parser:lang()

local tree = parser:parse()[1]

local root = tree:root()

local t = vim.treesitter.get_node_text(root, 0)

local query_text = [[(variable_declaration (assignment_statement) @a) @d]]
local q = vim.treesitter.query.parse(lang, query_text)

local start_line = 0
local end_line = 35
for id, node, metadata in q:iter_captures(root, 0, start_line, end_line) do
	local name = q.captures[id]
	local type = node:type()
	logger.info("node: ", vim.treesitter.get_node_text(node, 0))
	logger.info("name:", name)
	logger.info("type: ", type)
end

for _, match, _ in q:iter_matches(tree:root(), 0, start_line, end_line) do
	for id, node in pairs(match) do
		local name = q.captures[id]
		logger.info("name:", name)
		logger.info("node: ", vim.treesitter.get_node_text(node, 0))
	end
end
