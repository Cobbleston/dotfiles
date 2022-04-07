import XMonad

import qualified XMonad.StackSet as W

-- Hooks
import XMonad.Hooks.DynamicLog    -- For xmonabar
import XMonad.Hooks.StatusBar     -- For xmonabar
import XMonad.Hooks.StatusBar.PP  -- For xmonabar

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Hooks.EwmhDesktops  -- Make xmonad EWMH compliant

-- Utils
import XMonad.Util.EZConfig             -- additionalKeysP for shortcuts
import XMonad.Util.Ungrab               -- Use for shortcuts
import XMonad.Util.SpawnOnce            -- Use for startup commands
import XMonad.Util.ClickableWorkspaces  -- For clickable workspaces
import XMonad.Util.Loggers              -- Personalization Xmobar

-- Layouts
import XMonad.Layout.ThreeColumns     -- Three Columns Layout
import XMonad.Layout.Magnifier        -- Magnifier for Layout
import XMonad.Layout.Spacing          -- for "smart gaps"
import XMonad.Layout.ResizableTile    -- for resizing in default layout


main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar ~/.xmonad/xmobar/xmobar.config" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig


myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 5/100  -- Percent of screen to increment by when resizing panes

-- Variables
-- myFont :: String
-- myFont = "xft:SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

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
    spawn "killall trayer"  -- kill current trayer on each restart
    
    -- Start program after boot
    spawnOnce "spotify"
    spawnOnce "telegram-desktop"
    spawnOnce myBrowser

    spawn "sleep 2 && trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34 --height 20"
    spawnOnce "feh --randomize --bg-fill --no-fehbg git-repos/dotfiles/wallpapers/*"  -- feh set random wallpaper

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = myOrder
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    myOrder [ws, l, _, wins] = [ws, l, wins]
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow


    -- | Windows should have *some* title, which should not not exceed a sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""


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
    , ("M-S-w", spawn "feh --randomize --bg-fill --no-fehbg git-repos/dotfiles/wallpapers/*") -- Change Wallpaper
    , ("M-d", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"") -- Start DMENU
    , ("M-<Return>", spawn myTerminal)
    , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
    , ("M-S-b", spawn "notify-send \"Batteria\" \"$(acpi)\"") -- Notification for battery
    , ("M-C-j", sendMessage MirrorExpand)
    , ("M-C-k", sendMessage MirrorShrink)
    ]
