-- This AppleScript retrieves and displays system resource usage information including CPU usage, 
-- memory usage, and disk activity. The outputs are copied to the clipboard, allowing the user to 
-- easily paste and review them elsewhere. To use this script, simply run it in the Script Editor 
-- or through any AppleScript executor. Ensure you have permission to execute shell scripts.

-- Get CPU usage for all running processes
set cpuUsage to (do shell script "/bin/ps -xco %cpu,command | /usr/bin/awk '{print $1 \" \" $2}'")
set cpuUsage to "CPU Usage (in %):" & return & cpuUsage & return & return

-- Get memory usage for all running processes
set memoryUsage to (do shell script "/bin/ps -xmo %mem,command | /usr/bin/awk '{print $1 \" \" $2}'")
set memoryUsage to "Memory Usage (in %):" & return & memoryUsage & return & return

-- Get disk read and write activity (requires sudo for detailed stats)
set diskActivity to (do shell script "sudo iotop -b -n 1 | /usr/bin/awk '{print $0}'")
set diskActivity to "Disk Activity (Read/Write in KB/s):" & return & diskActivity & return & return

-- Combine all the information
set systemResources to cpuUsage & memoryUsage & diskActivity

-- Copy the information to the clipboard
set the clipboard to systemResources