import XMonad

import qualified XMonad.StackSet as W

-- Utils
import XMonad.Util.EZConfig -- additionalKeysP for shortcuts
import XMonad.Util.Ungrab -- Use for shortcuts
import XMonad.Util.SpawnOnce -- Use for startup commands

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops

-- Layouts
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.Spacing -- for "smart gaps"

-- Actions
import XMonad.Actions.GridSelect

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

-- Variables
--myFont :: String
--myFont = "xft:SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask        -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "alacritty"    -- Sets default terminal

myBrowser :: String
myBrowser = "firefox "  -- Sets qutebrowser as browser

myEditor :: String
myEditor = myTerminal ++ " -e vim "    -- Sets vim as editor

myBorderWidth :: Dimension
myBorderWidth = 2           -- Sets border width for windows

-- myNormColor :: String       -- Border color of normal windows
-- myNormColor   = colorBack   -- This variable is imported from Colors.THEME
--
-- myFocusColor :: String      -- Border color of focused windows
-- myFocusColor  = color15     -- This variable is imported from Colors.THEME

-- Startup
myStartupHook :: X ()
myStartupHook = do
    -- spawn "killall conky"   -- kill current conky on each restart
    -- spawn "killall trayer"  -- kill current trayer on each restart

    spawnOnce "nm-applet &" -- Network system tray
    spawnOnce "flameshot &" -- Screenshot utility
    spawnOnce "pasystray &" -- Pavucontrol system tray
    spawnOnce "setxkbmap -layout us -variant intl"  -- Set US international layout
    spawnOnce "feh --randomize --bg-fill ~/git-repos/dotfiles/wallpapers/*"  -- feh set random wallpaper
    -- Start program after boot
    spawnOnce "telegram-desktop"
    spawnOnce "spotify"
    spawnOnce myBrowser

main = xmonad . ewmh =<< xmobar myConfig

myConfig = def
    { modMask = myModMask
    , terminal = myTerminal
    , startupHook = myStartupHook
    , borderWidth = myBorderWidth
    , layoutHook = myLayout  -- Use custom layouts
    }
  `additionalKeysP`
    [ ("<XF86AudioLowerVolume>", spawn "amixer -D pipewire sset Master 5%-") -- Laptop Keyboard dedicted keys
    , ("<XF86AudioRaiseVolume>", spawn "amixer -D pipewire sset Master 5%+") -- Laptop Keyboard dedicted keys
    , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle") -- Laptop Keyboard dedicted keys
    , ("<XF86AudioMicMute>", spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle") -- Laptop Keyboard dedicted keys
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10") -- Laptop Keyboard dedicted keys
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10") -- Laptop Keyboard dedicted keys
    , ("<Print>", spawn "flameshot gui") -- Take a screenshot
    , ("M-S-w", spawn "feh --randomize --bg-fill git-repos/dotfiles/wallpapers/*") -- Change Wallpaper
    , ("M-s", goToSelected def) -- GridSelect Change Window
    , ("M-d", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"") -- Start DMENU
    , ("M-<Return>", spawn myTerminal)
    , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
    , ("M-S-s", spawnSelected def ["alacritty","firefox","vim","spotify","telegram-desktop"]) -- GridSelect Start App
    , ("M-S-b", spawn "notify-send \"Batteria\" \"$(acpi)\"") -- Notification for battery
    ]
