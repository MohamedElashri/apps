(*
 Open in Sublime Text
 To use:
  * Drag Open In Sublime Text to the toolbar of any finder
  window to add it to the toolbar
*)

on run
	tell application "Finder"
		if selection is {} then
			set finderSelection to folder of the front window as string
		else
			set finderSelection to selection as alias list
		end if
	end tell
	
	subl(finderSelection)
end run

-- script was drag-and-dropped onto
on open (theList)
	subl(theList)
end open

-- open in Sublime Text
on subl(listOfAliases)
	tell application "Sublime Text"
		activate
		open listOfAliases
	end tell
end subl