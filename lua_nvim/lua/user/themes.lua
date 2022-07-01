function theme_toggle()
    local themes = {
        function ()
            vg.gruvbox_italics=1
            vg.gruvbox_italicize_strings=1
            vg.gruvbox_filetype_hi_groups = 1
            vg.gruvbox_plugin_hi_groups = 1
            return "gruvbox8"
        end,

        function () return "onedark" end,

        function ()
            vg.sonokai_enable_italic = 1
            vg.sonokai_better_performance = 1
            vg.sonokai_transparent_background = 1
            vg.sonokai_diagnostic_line_highlight = 1
            return "sonokai"
        end,

        function ()
            vg.gruvbox_material_enable_italic = 1
            vg.gruvbox_material_better_performance = 1
            return "gruvbox-material"
        end,

        function () return "nord" end,

        function () return "doom-one" end,

        function ()
            vg.everforest_enable_italic = 1
            vg.everforest_better_performance = 1
            return "everforest"
        end,

        function () return "nightfox" end,

        function () return "kanagawa" end
    }

    local theme = nil

    while( not theme )
        do
            theme = themes[ math.random( 0, #themes - 1 ) ]
    end

    local colorscheme = theme()
    vim.notify("setting theme to " .. colorscheme .. " ...", "INFO")

    local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. theme())
    if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. "not found!", "error")
        return
    end
end

function bg_trans_toggle()
    local theme = vg.colors_name
    print ('current theme is : ' .. theme )
end
