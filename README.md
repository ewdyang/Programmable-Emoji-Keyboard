Programmable Clip Keyboard v1.1
By edabonacci
With code from Taran of Linus Tech Tips (https://github.com/TaranVH/2nd-keyboard)
Inspired by Tom Scott's Emoji Keyboards (https://www.youtube.com/watch?v=lIFE7h3m40U)

----------------------------------------

Prerequisites:
Extra keyboard
LuaMacros: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
AutoHotKey: https://autohotkey.com/download/

Installation:
Place "ClipKeyboard.ahk" and "ClipKeyboardMacro.lua" in the root folder of luamacros.
Run "ClipKeyboard.ahk" using AutoHotKey.
"ClipListSaved.txt" and "KeyPressed.txt" will be automatically created the first time the script is run.
Press a key on the keyboard you want to use as your Clip Keyboard when the menu pops up.
Start using Programmable ClipKeyboard!

Use:
All of the keys on the ClipKeyboard are programmable, except for special modifier keys such as control, shift, caps lock, etc.

Ctrl + [key]: Assign highlighted text to that key.
	So by selecting text from anywhere, you can pick and choose which text you want saved to your Clip keyboard.

[key]: Activates the text assigned to that key. It will enter it into the text box that your text cursor is currently in.

Shift: Saves the current text clip associations to file. The script automatically saves any assigned text before it exits, but you can use this key to manually save.

Ctrl + Shift: Reloads the text clip associations from file.

Enter/Backspace: These two keys function (mostly) normally, so you can use them while typing.

Configuration:
The text file "ClipListSaved.txt" contains all the text associations that you have programmed while using the script.
You can manually edit this to add text to your keyboard if you wish.
The formatting is as follows: (FORMATTING IS BROKEN ON GITHUB, DOWNLOAD AND OPEN TO SEE CORRECT FORMAT)
a	Sample Text
b	Lorem Ipsum
c	Even more text!
minus	🍙
[key](tab)[text]

Instructions on how to pre-select your keyboard so you don't have to identify it each time you run the script are in "ClipKeyboardMacro.lua".
