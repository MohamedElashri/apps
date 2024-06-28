-- This AppleScript prompts the user to enter the name or part of the name of an application or process.
-- It then searches for all running processes that match the input and displays their Process IDs (PIDs).
-- If no matching processes are found, it informs the user.

-- Prompt user to enter the name or part of the name of the application to search for its PID
set applaunch to text returned of (display dialog "Enter the name or part of the name of the application to find its PID:" default answer "" buttons {"Go"} default button "Go")

tell application "System Events"
	-- Get lists of process names and their corresponding PIDs that contain the entered text
	set {processList, pidList} to the {name, unix id} of (every process whose name contains applaunch)
	
	-- Check if any processes matched the user's input
	if length of processList > 0 then
		-- Create a displayable string of process names and their PIDs
		set displayText to ""
		repeat with i from 1 to length of processList
			set displayText to displayText & item i of processList & " - PID: " & item i of pidList & return
		end repeat
		display dialog "Matching processes and their PIDs:" & return & return & displayText buttons {"OK"} default button "OK"
	else
		-- Inform the user if no processes match the input
		display dialog "No processes found matching '" & applaunch & "'." buttons {"OK"} default button "OK"
	end if
end tell