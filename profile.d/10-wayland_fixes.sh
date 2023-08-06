export MOX_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"
export GTK_BACKEND=wayland
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER="wayland,x11"
export WINIT_UNIX_BACKEND=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Realllly disable NVidia's ratfuckery
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json
