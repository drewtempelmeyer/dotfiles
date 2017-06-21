[colors]
background = #ee292d3e
foreground = {{foreground}}
yellow = {{yellow}}
black = {{black}}
white = {{white}}
red = {{red}}
green = {{green}}
blue = {{blue}}
magenta = {{magenta}}
cyan = {{cyan}}

[bar/master]
width = 100%
height = 26
separator = " "
background = ${colors.background}
foreground = ${colors.foreground}
underline-size = 0
overline-size = 0
font-0 = "DejaVu Sans Mono:pixelsize=9:antialias=false;1"
font-1 = "FontAwesome:pixelsize=9:antialias=false;1"

[bar/top]
inherit = bar/master
modules-left = wm
modules-center = title
modules-right = ovpn ram cpu temperature pavolume time

padding-right = 1

[module/ovpn]
type = internal/network
interface = tun0
interval = 3.0
exec-if = pgrep openvpn

format-connected-padding = 1
format-disconnected-padding = 1

format-connected = <label-connected>

label-connected = 
label-connected-foreground = ${colors.cyan}

label-disconnected = 
label-disconnected-foreground = ${colors.red}

[module/pavolume]
type = custom/script
interval = 2
exec = ~/.config/polybar/pavolume.sh

click-right = exec pavucontrol
click-left = ~/.config/polybar/pavolume.sh --togmute
scroll-up = ~/.config/polybar/pavolume.sh --up
scroll-down = ~/.config/polybar/pavolume.sh --down

label = %output%
label-foreground = ${colors.yellow}
format-padding = 1

[module/temperature]
type = internal/temperature

thermal-zone = 2

format = <ramp> <label>
format-padding = 1

label-foreground = ${colors.green}

ramp-0 = 
ramp-1 = 
ramp-2 = 

ramp-foreground = ${colors.green}

[module/network]
type = internal/network
interface = wlp3s0
ping-interval = 3
accumlate-stats = true

[module/title]
type = internal/xwindow
label = %title%
label-maxlen = 75

[module/ram]
type = internal/memory
interval = 3

label-foreground = ${colors.blue}
label-padding = 1
format-prefix = ""
format-prefix-foreground = ${colors.blue}
format-padding = 1

[module/cpu]
type = internal/cpu
interval = 1

label-foreground = ${colors.cyan}
label-padding = 1
format-prefix = ""
format-prefix-foreground = ${colors.cyan}
format-padding = 1

[module/wm]
type = internal/i3
enable-click = true
enable-scroll = false
strip-wsnumbers = true

format-padding = 1
label-focused-foreground = ${colors.magenta}
label-focused-padding = 1

label-unfocused-padding = 1

label-visible-padding = 1

label-urgent-foreground = ${colors.red}
label-urgent-padding = 1

[module/time]
type = internal/date
interval = 40

format-padding = 1
label-foreground = ${colors.magenta}

date = "%I:%M %p"
