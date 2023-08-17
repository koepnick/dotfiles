# Tridactyl

Mostly just notes since Tridactyl keeps its configuration within a Mozilla profile, but luckily persists configurations when made from the browser. 

## Native Messenger

`:nativeinstall`

Note: Don't forget to symlink the firefox directory to librewolf if using

`ln -s ~/.firefox/native-messaging-hosts ~/.librewolf/`

## My Keybindings

`:bind B fillcmdline tab`
`:bind B fillcmdline taball`
`:bind P tabprev`
`:bind N tabnext`
`:bind M `
`:bind r reloadhard`
`:bind R reader`
`:unbind f`
`:bind ff hint`
`bind fd hint -k`
`bind fD hint -K`
`bind fs hint -s`
`bind fi hint -I`
`bind fp hint -wp`
`unbind h`
`unbind l`
`bind h back`
`bind l forward`

## My Styles
`:bind I blacklistadd`
`:colorscheme midnight`

## My Settings

`:set leavegithubalone true`
`:set browser librewolf`
`set externalclipboardcmd wl-copy`

## My Fixes

There doesn't yet seem to be a way to alter aspects of a theme without creating a brand new one. So we use Stylus to hack on it.

[https://addons.mozilla.org/en-US/firefox/addon/styl-us/](https://addons.mozilla.org/en-US/firefox/addon/styl-us/)
```css

```

## Help

`:bindshow`
`:viewconfig`
