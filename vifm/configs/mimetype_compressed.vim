fileviewer *.zip
            \ unzip -l %f,

"fileviewer {*.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm},<image/*>
"   \ mediainfo %f,
"   \ sixel %c %pw %ph %pd
