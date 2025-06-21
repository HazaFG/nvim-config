local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- TypeScript snippet for Redux Slice
ls.add_snippets("typescript", {
  s("slice", {
    t({ "import { createSlice, PayloadAction } from '@reduxjs/toolkit';", "", "" }),
    t("interface "), i(1, "SliceState"), t({" {", "  "}),
    i(2, "// define state type here"),
    t({ "", "}", "", "" }),
    t("const initialState: "), i(1), t(" = {"),
    i(3, "// initial values"),
    t({ "", "};", "", "" }),
    t("const "), i(4, "sliceName"), t(" = createSlice({"),
    t({ "", "  name: '" }), i(5, "sliceName"), t({ "',", "  initialState,", "  reducers: {", "    " }), 
    i(6, "// reducers here"),
    t({ "", "  }", "});", "", "" }),
    t("export const { "), i(7, "// actions"), t(" } = "), i(4), t(".actions;"),
    t({ "", "export default " }), i(4), t(".reducer;"),
  }),
})

