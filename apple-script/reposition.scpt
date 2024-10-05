set monitorCombination to (do shell script "system_profiler SPDisplaysDataType -json -detailLevel full | /opt/homebrew/bin/jq -r '.SPDisplaysDataType[0].spdisplays_ndrvs | map(._spdisplays_pixels) | join(\",\")'")
if monitorCombination = "4112 x 2658,3840 x 2160,2560 x 1440" then
	
	tell application "System Events"
		set appName to "Microsoft Outlook"
		set theApp to application process appName
		tell theApp
			set theWindows to windows
			set theWindow to item 2 of theWindows
			set position of theWindow to {-660, -1000} -- Change {0, 800} to the position on your main monitor			
			set size of theWindow to {1600, 1000} -- Change to the desired width and height
			-- reminder
			set theWindow to item 1 of theWindows
			set position of theWindow to {1000, -200} -- Change {0, 800} to the position on your main monitor			
			set size of theWindow to {1200, 800} -- Change to the desired width and height
			
		end tell
	end tell
end if
do shell script "echo monitorCombination: " & monitorCombination
