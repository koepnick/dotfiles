local lsp_util = require('vim.lsp.util')

local function symbols_to_loc_list()
    local params = { textDocument = lsp_util.make_text_document_params() }
    vim.lsp.buf_request(0, 'textDocument/documentSymbol', params, function(err, _, result, _)
        if err or not result then return end
        local items = lsp_util.symbols_to_items(result)
        print(result)
        print(items)
        vim.fn.setloclist(0, {},' ', { title = 'Document Symbols', items = items })
    end)
end

return {
    symbols_to_loc_list = symbols_to_loc_list,
}
