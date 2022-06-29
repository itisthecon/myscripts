function theme_toggle()
    local themes = {
        function ()
            vg.gruvbox_italics=1
            vg.gruvbox_italicize_strings=1
            vg.gruvbox_filetype_hi_groups = 1
            vg.gruvbox_plugin_hi_groups = 1
            return "colorscheme gruvbox8"
        end,

        function () return "colorscheme onedark" end,

        function ()
            vg.sonokai_enable_italic = 1
            vg.sonokai_better_performance = 1
            vg.sonokai_transparent_background = 1
            vg.sonokai_diagnostic_line_highlight = 1
            return "colorscheme sonokai"
        end,

        function ()
            vg.gruvbox_material_enable_italic = 1
            vg.gruvbox_material_better_performance = 1
            return "colorscheme gruvbox-material"
        end,

        function () return "colorscheme nord" end,

        function () return "colorscheme doom-one" end,

        function ()
            vg.everforest_enable_italic = 1
            vg.everforest_better_performance = 1
            return "colorscheme everforest"
        end,

        function () return "colorscheme nightfox" end,

        function () return "colorscheme kanagawa" end
    }

    local theme = nil

    while( not theme )
        do
            theme = themes[ math.random( 0, #themes - 1 ) ]
    end

    print( theme() )

    vim.cmd( theme() )
end

function bg_trans_toggle()
    local theme = vg.colors_name
    print ('current theme is : ' .. theme )
end
