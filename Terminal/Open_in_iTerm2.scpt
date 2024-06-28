(*
 Open in iTerm2
 To use:
  * Drag Open In iTerm2 to the toolbar of any Finder window to add it to the toolbar
*)

on run
    tell application "Finder"
        if selection is {} then
            set finderSelection to folder of the front window as string
        else
            set finderSelection to selection as alias list
        end if
    end tell

    openInIterm(finderSelection)
end run

-- script was drag-and-dropped onto
on open (theList)
    openInIterm(theList)
end open

-- open in iTerm2
on openInIterm(listOfAliases)
    tell application "iTerm"
        activate
        set newWindow to create window with default profile
        repeat with anItem in listOfAliases
            tell current session of newWindow
                write text "cd " & quoted form of POSIX path of anItem
            end tell
        end repeat
    end tell
end openInIterm