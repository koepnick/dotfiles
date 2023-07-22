" Video
filetype ,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,*.mov,*.avi,*.flv
         \ /sbin/mpv %f &,

"fileviewer {*.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
"           \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
"           \*.as[fx]},
"          \<video/*>
"         \ ffprobe -hide_banner -pretty %c 2>&1

"         \ *.fl[icv],*.m2v,*.MOV,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
"         \ *.as[fx],
"        \ <video/*>
"
"   fileviewer <video/*>
"       \ vifmimg video %px %py %pw %ph %c
"       \ %pc
"       \ vifmimg clear
