
" Json
"filextype {*.pdf},<application/pdf> zathura %c %i &, apvlv %c, xpdf %c
filextype {*.json} jq < %f
fileviewer {*.json} jq --color-output < %f
"fileviewer {*.pdf},<application/pdf> pdftotext -nopgbrk %c -
"fileviewer *.pdf
"    \ vifmimg pdf %px %py %pw %ph %c
"    \ %pc
"    \ vifmimg clear
