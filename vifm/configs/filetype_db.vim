fileviewer *.db /sbin/sqlite3 %f ".tables"
" filextype *.db alacritty --command /sbin/sqlite3 %f ".tables"
filetype *.db termdbms -p %f -t nord
