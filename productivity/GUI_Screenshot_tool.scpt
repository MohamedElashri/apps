-- Initial alert to inform the user about the script's function
display dialog "This script utilizes your computer's built-in screen capture tool and saves the file to your desktop by default."

-- Capture user choice for screenshot type
set theButton to display dialog "Select the screenshot mode: Entire Screen, Specific Window, or Defined Area." buttons {"Entire Screen", "Specific Window", "Defined Area"}
set theChoice to get button returned of theButton

-- Function to capture the screen based on user's choice
on captureScreen(type, windowMode)
    try
        set fileName to (display dialog "Enter a filename for your screenshot:" default answer "" buttons {"OK"} default button 1)
        set newIMGname to get text returned of fileName
        if newIMGname contains " " then error "Filename should not contain spaces."

        set path to "~/Desktop/" & newIMGname & ".png"
        set command to "screencapture "
        if windowMode is not equal to "" then set command to command & windowMode & " "
        set command to command & quoted form of path
        do shell script command
        display notification "Screenshot saved as " & newIMGname & ".png on your Desktop."
    on error errMsg number errNum
        display alert "Error: " & errMsg & " (Error Code: " & errNum & ")"
    end try
end captureScreen

-- Execute appropriate screen capture based on user choice
if theChoice is "Entire Screen" then
    captureScreen("Entire Screen", "")
else if theChoice is "Specific Window" then
    display alert "After closing this alert, use the mouse to select the window for your screenshot."
    captureScreen("Specific Window", "-iW")
else if theChoice is "Defined Area" then
    display alert "After closing this alert, use the mouse to define the area for your screenshot."
    captureScreen("Defined Area", "-s")
end if