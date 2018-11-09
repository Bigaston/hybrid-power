function array(pRow, pCol, pDefault)
	local tab = {}

	for row=1, pRow do
		local tab_col = {}
		for col=1, pCol do
			table.insert(tab_col, pDefault)
		end
		table.insert(tab, tab_col)
	end

	return tab
end