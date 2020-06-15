#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
OnExit, ExitSave ;Label to activate when the script is ending

Run, LuaMacros.exe ClipKeyboardMacro.lua -r ;runs LuaMacros with the appropriate .lua file, auto-running the file as soon as the application loads

global clipList := {}

clipList := readArray("ClipListSaved.txt") ;Loads associations from file into array 'clipList'

MsgBox ClipKeyboard Initialized.

;F24 - Run key in "KeyPressed.txt"
;F23 - Ctrl
;F22 - Enter
;F21 - Shift

F24:: ;Activate keys
FileRead, key, keypressed.txt
;Tippy(clipList[key])
if clipList[Key]
{
readyClip := clipList[Key]
;SendInput {Raw}%readyClip%
clipStorage := ClipboardAll ;made changes to use clipboard to send text instead of raw input for speed when sending large amounts of text
clipboard =
clipboard = %readyClip%
ClipWait, 5
SendInput, ^v
Sleep 100
clipboard := clipStorage
}
return

^F24:: ;Program keys
FileRead, key, keypressed.txt
AddToClipList(key)
;MsgBox % "Added: " key ": " clipList[key]
return

+F21::saveArray() ;Save associations

^+F21::loadArray() ;Load associations

~F22::Send, {Enter} ;Workaround to restore normal function of enter key

Tippy(tipsHere, wait:=333) ;Makes a tooltip appear by the cursor
{
ToolTip, %tipsHere%
SetTimer, noTip, %wait% ;--in 1/3 seconds by default, remove the tooltip
}
noTip:
	ToolTip,
	;removes the tooltip
return

AddToClipList(keyAssign) ;Adds the currently highlighted text to the list of associations, assigning it to keyAssign 
{
global clipList
clipStorage := ClipboardAll
clipboard =
Send, ^c
ClipWait, 0
if ErrorLevel
{
    MsgBox, Adding clip failed!
    return
}
clip = %clipboard%
;MsgBox %clipboard%
;MsgBox %clip%
clipList[keyAssign] := clip
clipboard := clipStorage
clipStorage =
clip = 
}

genTextArray() ;Converts the array that holds the associations into text form for saving
{
global clipList
fileCache =
For key, value in clipList
{
	;MsgBox % key A_Tab value
	fileCache := fileCache . key A_Tab value . "`n"
}
return fileCache
}


readArray(fileName) ;Loads associations from fileName
{
arrayCache := {}
	Loop, read, %fileName%
	{
		parseArray := StrSplit(A_LoopReadLine, A_Tab)
		arrayCache[parseArray[1]] := parseArray[2]
		;MsgBox % parseArray[1]
		;MsgBox % parseArray[2]
		;MsgBox % arrayCache[parseArray[1]]
	}
return arrayCache
}

saveArray() ;Saves associations to ClipListSaved.txt
{
textArray := genTextArray()
FileDelete, ClipListSaved.txt
file := FileOpen("ClipListSaved.txt", "rw","UTF-8")
file.Write(textArray)
file.close
MsgBox Saved to file!
return 0
}

loadArray() ;Saves associations to ClipListSaved.txt
{
clipList := readArray("ClipListSaved.txt")
MsgBox Loaded from file!
return 0
}

;Esc::ExitApp ;debug hotkeys
;F12::Reload

ExitSave: ;Responsible for saving associations to file and closing LuaMacros when the script ends (See "OnExit, ExitSave" at beginning of script)
saveArray()
Process, Close, LuaMacros.exe
ExitApp