
set termcommand to text returned of (display dialog "Enter the command to run:" default answer "" buttons {"exit", "Run"} default button "Run")
if termcommand contains "" then
	error number -128
else if termcommand contains termcommand then
	try
		set resultdisp to do shell script termcommand
		display alert resultdisp
	on error
		display alert "The command failed to run"
	end try
end if
