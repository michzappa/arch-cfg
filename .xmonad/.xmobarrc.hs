Config {

   -- appearance
     font =         "xft:System San Fransisco Display:pixelsize=16:antialias=true:hinting=true"
   , bgColor =      "#2E3440"
   , fgColor =      "#ECEFF4"
   , position =     Top
   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       True    -- enable/disable hiding (True = disabled)
   , template = " %StdinReader% %music%}{ | %default:Master% | %battery% | %date% | %kbd% "

   , commands =
        [
          Run Com "/bin/bash" ["-c", "~/.scripts/spotify_info.sh"] "music" 10
          --volume monitor
         , Run Volume "default" "Master" [] 5

        -- network activity monitor (dynamic interface resolution)
         , Run DynNetwork     [ "--template" , "<dev>: <tx>kB/s|<rx>kB/s"
                             , "--Low"      , "1000"       -- units: B/s
                             , "--High"     , "5000"       -- units: B/s
                             , "--low"      , "#88C0D0" -- , "darkgreen"
                             , "--normal"   , "#88C0D0" -- , "darkorange"
                             , "--high"     , "#88C0D0" -- , "darkred"
                             ] 10

        -- cpu activity monitor
        , Run MultiCpu       [ "--template" , "Cpu: <total0>%|<total1>%"
                             , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "#88C0D0" -- , "darkgreen"
                             , "--normal"   , "#88C0D0" -- , "darkorange"
                             , "--high"     , "#88C0D0" -- , "darkred"
                             ] 10

        -- cpu core temperature monitor
        , Run CoreTemp       [ "--template" , "Temp: <core0>°C|<core1>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "#88C0D0" -- , "darkgreen"
                             , "--normal"   , "#88C0D0" -- , "darkorange"
                             , "--high"     , "#88C0D0" -- , "darkred"
                             ] 50

        -- memory usage monitor
        , Run Memory         [ "--template" ,"Mem: <usedratio>%"
                             , "--Low"      , "20"        -- units: %
                             , "--High"     , "90"        -- units: %
                             , "--low"      , "#88C0D0" -- , "darkgreen"
                             , "--normal"   , "#88C0D0" -- , "darkorange"
                             , "--high"     , "#88C0D0" -- , "darkred"
                             ] 10

        -- battery monitor
        , Run Battery        [ "--template" , "Batt: <acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "#88C0D0" -- , "darkred"
                             , "--normal"   , "#88C0D0" -- , "darkorange"
                             , "--high"     , "#88C0D0" -- , "darkgreen"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#88C0D0>Charging</fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#81A1C1>Charged</fc>"
                             ] 50

        -- time and date indicator
        --   (%F = y-m-d date, %a = day of week, %T = h:m:s time)
        , Run Date           "<fc=#ECEFF4>%F (%a) %H:%M</fc>" "date" 10

        -- keyboard layout indicator
        , Run Kbd            [ ("us(intl)" , "<fc=#81A1C1>INT</fc>")
                             , ("us"         , "<fc=#81A1C1>US</fc>")
                             ]
        , Run StdinReader
        ]
   }
