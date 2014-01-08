import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Prompt
import XMonad.Prompt.Shell(shellPrompt)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/jason/.xmobarrc"
  xmonad $ defaultConfig
    { normalBorderColor = "#222222"
    , focusedBorderColor = "#EF2929"
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , logHook = dynamicLogWithPP $ xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppCurrent = xmobarColor "red" "" . wrap "[" "]"
      , ppTitle = xmobarColor "gray" "" . shorten 50
      , ppUrgent= xmobarColor "red" "black"
      , ppVisible = wrap "(" ")"
      }
    , terminal = "/usr/bin/uxterm -fg \\#585858 -bg \\#000000 -tn xterm-256color"
    } `additionalKeys`
    [    ((mod1Mask .|. shiftMask, xK_z), spawn "/usr/bin/xscreensaver-command -lock")
       , ((mod1Mask .|. shiftMask, xK_p), shellPrompt defaultXPConfig
           { bgColor = "#000000"
           , fgColor = "#585858"
           , borderColor = "#222222"
           }
         )
    ] 

