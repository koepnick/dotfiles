" Images
"filextype {*.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm},<image/*>
"        \ {View in sxiv}
"        \ sxiv %f,
"        \ {View in gpicview}
"        \ gpicview %c,
"        \ {View in shotwell}
"        \ shotwell,
"fileviewer {*.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm},<image/*>
"         \ identify %f
filetype *.bmp,*.jpg,*.JPG,*.jpeg,*JPEG,*.png,*.xpm,*.cr2,*.heic,*.HEIC,*.nef
            \ /sbin/swayimg %f --all --scale=fit --fullscreen --info 2>/dev/null &,

"fileviewer *.bmp,*.jpg,*.jpeg,*.png,*.xpm
"    \ kitty +kitten icat --transfer-mode=file --place=%pwx%ph@%pxx%py %c %N
"    \ %pc
"    \ kitty +kitten icat --transfer-mode=file --place=%pwx%ph@%pxx%py --clear %N

fileviewer {*.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm,*.cr2,*.heic,*.HEIC},<image/*>
   \ ~/.config/vifm/preview.sh %f %pw %ph %pd,*.nef
   \ sixel %c %pw %ph %pd 2>&1 /tmp/out,
   \ lsix %d %pd,
"   \ ~/.local/python/bin/python3 ~/.config/vifm/preview.sh %f,
"   \ sixel %c %pw %ph %pd,

"fileviewer <image/*>
"    \ viu %px %py %pw %ph %c
"    \ %pc
"        \ vifmimg clear
"


