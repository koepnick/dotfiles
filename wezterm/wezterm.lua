local wezterm = require 'wezterm'
return {
    -- color_scheme = 'Poimandres',
    -- config.hyperlink_rules = wezterm.default_hyperlink_rules(),

    -- make task numbers clickable
    -- the first matched regex group is captured in $1.
    -- table.insert(config.hyperlink_rules, {
      -- regex = [[\b[tt](\d+)\b]],
      -- format = 'https://example.com/tasks/?t=$1',
    -- })
    --

    webgpu_power_preference = "LowPower",

    webgpu_preferred_adapter = {
        backend = "Gl",
        device = 0,
        device_type = "IntegratedGpu",
        name = "Mesa Intel(R) Xe Graphics (TGL GT2)",
        vendor = 32902,
    },

    window_padding = {
        left = 10,
        right = 10,
        top = 2,
        bottom = 0,
    },
    window_frame = {
        border_left_width = '0.05cell',
        border_right_width = '0.05cell',
        border_bottom_height = '0.02cell',
        border_top_height = '0.02cell',
        border_left_color = 'green',
        border_right_color = 'green',
        border_bottom_color = 'green',
        border_top_color = 'green',
    },
    window_decorations = 'RESIZE',
    window_background_gradient = {

        orientation = 'Vertical',
        -- Specifies the set of colors that are interpolated in the gradient.
        -- Accepts CSS style color specs, from named colors, through rgb
        -- strings and more
        colors = {
            '#111111FF',
            '#444444DD',
        },

        -- preset = "Warm",

        -- Specifies the interpolation style to be used.
        -- "Linear", "Basis" and "CatmullRom" as supported.
        -- The default is "Linear".
        interpolation = 'Linear',

        -- How the colors are blended in the gradient.
        -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
        -- The default is "Rgb".
        blend = 'Hsv',

        -- To avoid vertical color banding for horizontal gradients, the
        -- gradient position is randomly shifted by up to the `noise` value
        -- for each pixel.
        -- Smaller values, or 0, will make bands more prominent.
        -- The default value is 64 which gives decent looking results
        -- on a retina macbook pro display.
        noise = 64,

        -- By default, the gradient smoothly transitions between the colors.
        -- You can adjust the sharpness by specifying the segment_size and
        -- segment_smoothness parameters.
        -- segment_size configures how many segments are present.
        -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
        -- 1.0 is a soft edge.

        segment_size = 11,
        segment_smoothness = 1.0,
    },


    enable_scroll_bar = false,
    color_scheme = 'Pnevma',
    check_for_updates = false,
    show_update_window = false,
    font_size = 12.0,
    max_fps = 144,
    animation_fps = 30,
    enable_tab_bar = true,
    use_fancy_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    enable_wayland = false,
    switch_to_last_active_tab_when_closing_tab = true,
    command_palette_font_size = 12.0,
    -- In tmux this generates multiple "up" events
    -- alternate_buffer_wheel_scroll_speed = 3,

    -- Cursor
    cursor_blink_rate = 1000,
    cursor_thickness = "2px",
    custom_block_glyphs = false,
    -- default_cursor_style = 'BlinkingBlock',
    default_cursor_style = 'BlinkingBar',

    -- Fonts
    dpi = 120.0,
    freetype_load_target = "Light",
    freetype_render_target = "HorizontalLcd",
    font = wezterm.font_with_fallback {
        'JetBrains Mono',
        'Berkeley Mono',
        'FiraCode Nerd Font Mono',
    },
    warn_about_missing_glyphs = false,
    -- font_dirs = {"/usr/share/fonts"},
    use_cap_height_to_scale_fallback_fonts = true
}
