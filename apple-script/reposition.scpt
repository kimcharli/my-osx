set monitorCombination to (do shell script "system_profiler SPDisplaysDataType -json -detailLevel full | /opt/homebrew/bin/jq -r '.SPDisplaysDataType[0].spdisplays_ndrvs | map(._spdisplays_pixels) | join(\",\")'")
if (monitorCombination contains "4112 x 2658") and (monitorCombination contains "3840 x 2160") and (monitorCombination contains "4112 x 2658") then
	-- home
	
	tell application "System Events"
		set appName to "Microsoft Outlook"
		set theApp to application process appName
		tell theApp
			set numWindows to count of (get windows)
			set theWindows to windows
			if numWindows is 1 then
				set theWindow to item 1 of theWindows
				my outlook_main(theApp, theWindow, -660, -1000, 1600, 1000)
			else
				set theWindow to item 2 of theWindows
				my outlook_main(theApp, theWindow, -660, -1000, 1600, 1000)
				-- reminder
				set theWindow to item 1 of theWindows
				my outlook_main(theApp, theWindow, 1000, -200, 1200, 800)
			end if
		end tell
	end tell
	
else if (monitorCombination contains "3456 x 2234") and (monitorCombination contains "2560 x 1440") and (monitorCombination contains "3440 x 1440") then
	-- office
	
	tell application "System Events"
		set appName to "Microsoft Outlook"
		set theApp to application process appName
		tell theApp
			set numWindows to count of (get windows)
			set theWindows to windows
			if numWindows is 1 then
				set theWindow to item 1 of theWindows
				my outlook_main(theApp, theWindow, -760, -1000, 1600, 1000)
			else
				set theWindow to item 2 of theWindows
				my outlook_main(theApp, theWindow, -760, -1000, 1600, 1000)
				-- reminder
				set theWindow to item 1 of theWindows
				my outlook_main(theApp, theWindow, 1000, -255, 1200, 800)
			end if
		end tell
	end tell
	
end if

on outlook_main(theApp, theWindow, x, y, width, height)
	tell application "System Events"
		tell application process theApp
			set position of theWindow to {x, y} -- Change {0, 800} to the position on your main monitor			
			set size of theWindow to {width, height} -- Change to the desired width and height
		end tell
	end tell
end outlook_main
-- do shell script "echo monitorCombination: " & monitorCombination
