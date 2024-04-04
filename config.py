"""Qtile Config."""

# Imports {{{

import os
import subprocess
from libqtile import bar, layout, hook
from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.command.client import InteractiveCommandClient as c

# }}}

# Defintions and Functions{{{
mod = "mod4"


def hide_show_bar(qtile):
    """Toggle the eww bar."""
    script = os.path.expanduser('~/.config/qtile/scripts/toggleBar.sh')
    subprocess.call([script])
    gap1 = qtile.screens[0].top
    gap2 = qtile.screens[1].top
    if gap1.size == 0:
        gap1.size = 32
        gap2.size = 32
    else:
        gap1.size = 0
        gap2.size = 0


def open_spotify_widget(qtile):
    """Toggle the eww bar."""
    script = os.path.expanduser('~/.config/qtile/scripts/toggleSpot.sh')
    subprocess.call([script])


@lazy.function
def streaming_launch(qtile):
    lazy.spawn("kitty")


@hook.subscribe.startup
def autostart():
    """Toggle the eww bar."""
    home = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.call([home])


@hook.subscribe.client_new
def float_windows(qtile):
    wm_class = qtile.window.get_wm_class()
    w_name = qtile.window.get_name()
    if (
        wm_class == ("Steam", "Steam")
        and (
            w_name != "Steam"
            or "PMaxSize" in qtile.window.get_wm_normal_hints().get("flags", ())
        )
    ):
        qtile.floating = True

    if (
        wm_class == ("zrythm", "zrythm")
        and (
            w_name != "Zrythm"
            or "maximum" in window.window.get_wm_normal_hints().get("flags", ())
        )
    ):
        qtile.floating = True


def textParser(text):
    if text=="?":
        return "󰏬"
    else:
        return "" 


# }}}

# Keys {{{
# The keys list defines the key-bindings that qtile uses.You define key-bindings using a Key object,
# which takes arguments for the keys in the binding, usually the mod key and a letter, then a lazy
# function. When those keys are pressed, the lazy function is activated.

keys = [
    # Switch focus between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to the next window"),

    # Move window in focus left/right or move up/down
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Change window sizes when in tiling mode
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Makes window in focus take up the entire stack/return to its normal state
    # In column mode for example, the window will take up the whole side of the
    # screen that its on
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Launch a terinal
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # Close Window in Focus
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Kill focused window"),

    # Restart/Quit Qtile
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "control", "shift"], "q", lazy.spawncmd("shutdown now"), desc="Shutdown Qtile"),
    Key([mod, "control"], "s", lazy.spawn("kitty -e shutdown now")),
    # Run apps. Very variable success rate, another app launcher like rofi is reccomended
    Key([mod], "r", lazy.spawncmd(),desc="Spawn a command using a prompt widget"),

    # Spawn apps
    Key([mod, "shift"], "m", lazy.spawn("qutebrowser"), desc="Launch Browser"),
    Key([mod, "shift"], "s", lazy.function(streaming_launch), desc="Launch Browser"),
    Key([mod, "shift"], "a", lazy.spawn("kitty -e nvim"), desc="Launch Editor"),
    Key([mod, "shift"], "o", lazy.spawn("libreoffice"), desc="Launch Libreoffice"),
    Key([mod, "shift"], "p", lazy.spawn("kitty -e ranger"), desc="Launch File Manager"),
    Key([mod, "shift"], "v", lazy.spawn("termite -e ncpamixer"), desc="Launch Spotify"),
    Key([mod, "shift"], "n", lazy.spawn("termite -e nmtui"), desc="Launch Spotify"),
    Key([mod], "p", lazy.spawn("rofi -m -4 -show drun"), desc="Launch rofi"),
    Key([mod, "shift"], "w", lazy.spawn("rofi -m -4 -show window"), desc="Launch rofi"),

    # Adjust Volume levels
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 2.5%- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 2.5%+ unmute")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 2.5%- unmute")),

    # openBar
    Key([mod], "o", lazy.hide_show_bar()),
    Key([mod], "s", lazy.function(open_spotify_widget)),

    Key([mod], "period", lazy.to_screen(1)),
    Key([mod], "comma", lazy.to_screen(0)),

    Key([mod], "7", lazy.group["0"].toscreen()),
    Key([mod], "8", lazy.group["1"].toscreen()),
    Key([mod], "9", lazy.group["2"].toscreen()),
    Key([mod], "0", lazy.group["3"].toscreen()),
    Key([mod], "y", lazy.group["4"].toscreen()),
    Key([mod], "u", lazy.group["5"].toscreen()),
    Key([mod], "i", lazy.group["6"].toscreen()),

    Key([mod, "shift"], "7", lazy.window.togroup("0")),
    Key([mod, "shift"], "8", lazy.window.togroup("1")),
    Key([mod, "shift"], "9", lazy.window.togroup("2")),
    Key([mod, "shift"], "0", lazy.window.togroup("3")),
    Key([mod, "shift"], "y", lazy.window.togroup("4")),
    Key([mod, "shift"], "u", lazy.window.togroup("5")),
    Key([mod, "shift"], "i", lazy.window.togroup("6")),
]
# }}}

# Groups{{{
# The groups list governs the workspaces that windows can exist in. Each group is defined by a name
# which is used by qtile as a reference for moving between groups. Each group also has a label,
# which in this case is a font awesome icon, like this: . Some groups spawn programs on startup,
# using the spawn argument. Other groups steal specific apps from other places, using the matches
# parameter. For example, everytime the browser is opened, group 4 steals it, and runs it there
# The for loop at the bottom just adds key-bindings to the keys list that allow for navigation
# between groups. By pressing the mod key and the number of the group, qtile displays the windows in
# the group. Pressing this combination, and the shift button moves the window in focus to that
# group, then displays that group
groups = [
                Group("0",
                      label="",),

                Group("1",
                      label="",),

                Group("2",
                      label="󰈙",),

                Group("3",
                      label=""),

                Group("4",
                      label="󰘦",),

                Group("5",
                      label="󱛻",),

                Group("6",
                      label="󰋋",),
]
# }}}

# Layouts {{{
# The layouts list just governs the possible layouts that qtile can display windows in. Again, only
# built-in layouts have been used in this build.
layouts = [
    layout.Columns(
      border_focus='#aeeefa',
      border_normal="#0C101B",
      margin=3),
    layout.Max(margin=0),
]

floating_layout = layout.Floating(
    float_rules=[
      *layout.Floating.default_float_rules,
      Match(wm_class='confirmreset'),  # gitk
      Match(wm_class='makebranch'),  # gitk
      Match(wm_class='maketag'),  # gitk
      Match(wm_class='ssh-askpass'),  # ssh-askpass
      Match(wm_class='zoom'),  # ssh-askpass
      Match(wm_class='termite'),  # ssh-askpass
      Match(wm_class='feh'),  # ssh-askpass
      Match(title='branchdialog'),
      Match(title='zrythm'),
      Match(title="Spell and Grammar Check Dialog"),  # gitk
      Match(title='Krita - Edit Text'),
      Match(title='ksnip'),  # Krita Text Editor
      ],
    border_focus="#01a546"
  )

#}}}

# Screens {{{

screens = [

    # Screen 1 {{{
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    ",",
                    foreground='#00000000',
                    decorations=[PowerLineDecoration(path="rounded_right"),],
                ),
                widget.CurrentLayoutIcon(
                    background='#1a212d',
                    scale=0.7,
                ),
                widget.GroupBox(
                    active='#aeeefa',
                    background='#1a212d',
                    borderwidth=2,
                    font='JetBrainsMonoNL NFM',
                    fontsize=25,
                    hide_unused=True,
                    highlight_method='block',
                    inactive='#0C101B',
                    other_current_screen_border='#24b298',
                    other_screen_border='#273240',
                    this_current_screen_border='#f5540c',
                    this_screen_border='#273240',
                    padding_x=9,
                    padding_y=6,
                    decorations=[PowerLineDecoration(path="rounded_left"),],
                ),
                widget.TaskList(
                    padding_y=6,
                    parse_text=textParser,
                ),
                widget.Spacer(),
                widget.TextBox(
                    " ",
                    decorations=[PowerLineDecoration(path="rounded_right"),],
                ),
                widget.Clock(
                    background='#1a212d',
                    format="%H:%M",
                    fontsize=18,
                    padding=10,
                    decorations=[PowerLineDecoration(path="rounded_left"),],
                ),
                widget.Spacer(),
                widget.TextBox(
                    " ",
                    decorations=[PowerLineDecoration(path="rounded_right"),],
                ),
                widget.CheckUpdates(),
                widget.QuickExit(
                    background='#1a212d',
                    countdown_format='{}',
                    default_text='⏻',
                    fontsize=24,
                    font='JetBrains Mono',
                    padding=10,
                    decorations=[PowerLineDecoration(path="rounded_left"),],
                ),
            ],
            33,
            background='#00000000',
            margin=[0, 0, 0, 0],
        ),
    ),

    # }}}

    # Screen 2 {{{
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    " ",
                    decorations=[PowerLineDecoration(path="rounded_right"),],
                ),
                widget.CurrentLayoutIcon(
                    background='#1a212d',
                    scale=0.7,
                ),
                widget.GroupBox(
                    active='#aeeefa',
                    background='#1a212d',
                    borderwidth=2,
                    font='JetBrainsMonoNL NFM',
                    fontsize=25,
                    hide_unused=True,
                    highlight_method='block',
                    inactive='#0C101B',
                    other_current_screen_border='#24b298',
                    other_screen_border='#273240',
                    this_current_screen_border='#f5540c',
                    this_screen_border='#273240',
                    padding_x=9,
                    padding_y=8,
                    decorations=[PowerLineDecoration(path="rounded_left"),],
                ),
                widget.TaskList(
                    padding_y=6,
                    parse_text=textParser,
                ),
                widget.Spacer(),
                widget.TextBox(
                    " ",
                    decorations=[PowerLineDecoration(path="rounded_right"),],
                ),
                widget.Clock(
                    background='#1a212d',
                    format="%H:%M",
                    fontsize=18,
                    padding=10,
                    decorations=[PowerLineDecoration(path="rounded_left"),],
                ),
                widget.Spacer(),
                widget.TextBox(
                    " ",
                    decorations=[PowerLineDecoration(path="rounded_right"),],
                ),
                widget.CheckUpdates(),
                widget.QuickExit(
                    background='#1a212d',
                    countdown_format='{}',
                    default_text='⏻',
                    fontsize=24,
                    font='JetBrains Mono',
                    padding=10,
                    decorations=[PowerLineDecoration(path="rounded_left"),],
                ),
            ],
            33,
            background='#00000000',
            margin=[2, 3, 2, 3],
        ),
    ),

    # }}}

    ]
# }}}

# Mouse {{{
# This bit tells qtile what to do with mouse input. As is usual for window managers, by clicking
# and dragging a window while also pressing the mod button, the window becomes floating, and
# moves with the mouse. You can resize floating windows using the right click, and bring windows
# to front with the wheel
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
#}}}

# Remaining Settings {{{

dgroups_key_binder = None
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"

# }}}
