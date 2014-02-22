require "xdo/keyboard"
# gem install xdo
# Make sure xdotool, xsel, xwininfo, eject and xkill are installed.

# XDo::Mouse.move(100, 100)
sleep(1.5)
XDo::Keyboard.simulate("This is text.")