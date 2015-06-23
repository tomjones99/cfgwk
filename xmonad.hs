import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.PerWorkspace
import XMonad.Layout.SimpleFloat

-- main
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- status bar
myBar = "xmobar"

-- default terminal
myTerminal = "urxvt"

-- PP
myPP = xmobarPP { ppCurrent = xmobarColor "#ff0000" "" . wrap "<" ">"
                , ppLayout = xmobarColor "#ff0000" ""
                , ppSep = xmobarColor "#93a1a1" "" " | "
                }

-- show/hide status bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- move applications to a given workspace
myManageHook = composeAll
    [ className =? "Chromium" --> doShift "2:web"
    , className =? "weechat" --> doShift "3:chat"
    , manageDocks
    ]

-- workspaces
myWorkspaces = ["1:dev", "2:web", "3:chat", "4", "5", "6", "7", "8", "9" ]

-- layouts
defaultLayouts = tiled ||| Mirror tiled ||| Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

myLayouts = defaultLayouts

-- launch programs on startup
myStartupHook = do
    spawnOn "1:dev" "urxvt"
    spawnOn "2:web" "chromium"
    --spawnOn "3:chat" "xterm -e weechat-curses"

-- config
myConfig = defaultConfig
    { terminal = myTerminal
    , workspaces = myWorkspaces
    , layoutHook = myLayouts
    , manageHook = myManageHook <+> manageHook defaultConfig
    , startupHook = myStartupHook
    }


