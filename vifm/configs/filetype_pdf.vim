" Pdf
filextype {*.pdf},<application/pdf> zathura %c %i &, apvlv %c, xpdf %c
fileviewer {*.pdf},<application/pdf> pdftotext -nopgbrk %c -
fileviewer *.pdf
    \ vifmimg pdf %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear
