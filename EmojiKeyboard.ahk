#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
OnExit, ExitSave ;Label to activate when the script is ending

Run, LuaMacros.exe EmojiKeyboardMacro.lua -r ;runs LuaMacros with the appropriate .lua file, auto-running the file as soon as the application loads

global emojiList := {}

emojiList := loadArray("EmojiListSaved.txt") ;Loads associations from file into array 'emojiList'

MsgBox Emoji Keyboard Initialized.

;F24 - Run key in "KeyPressed.txt"
;F23 - Ctrl
;F22 - Enter
;F21 - Shift

F24:: ;Activate keys
FileRead, key, keypressed.txt
Tippy(emojiList[key])
if emojiList[Key]
{
readyEmoji := emojiList[Key]
Send %readyEmoji%
}
return

^F24:: ;Program keys
FileRead, key, keypressed.txt
AddToEmojiList(key)
;MsgBox % "Added: " key ": " emojiList[key]
return

+F21::saveArray() ;Save associations

^+F21::loadArray("EmojiListSaved.txt") ;Load associations

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

AddToEmojiList(keyAssign) ;Adds the currently highlighted text to the list of associations, assigning it to keyAssign 
{
global emojiList
clipStorage := ClipboardAll
clipboard =
Send, ^c
ClipWait, 0
if ErrorLevel
{
    MsgBox, Adding emoji failed!
    return
}
emoji = %clipboard%
;MsgBox %clipboard%
;MsgBox %emoji%
emojiList[keyAssign] := emoji
clipboard := clipStorage
clipStorage =
emoji = 
}

genTextArray() ;Converts the array that holds the associations into text form for saving
{
global emojiList
fileCache =
For key, value in emojiList
{
	;MsgBox % key A_Tab value
	fileCache := fileCache . key A_Tab value . "`n"
}
return fileCache
}


loadArray(fileName) ;Loads associations from fileName
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

saveArray() ;Saves associations to EmojiListSaved.txt
{
textArray := genTextArray()
FileDelete, EmojiListSaved.txt
file := FileOpen("EmojiListSaved.txt", "rw","UTF-8")
file.Write(textArray)
file.close
MsgBox Saved!
return 0
}

;Esc::ExitApp ;debug hotkeys
;F12::Reload

ExitSave: ;Responsible for saving associations to file and closing LuaMacros when the script ends (See "OnExit, ExitSave" at beginning of script)
saveArray()
Process, Close, LuaMacros.exe
ExitApp