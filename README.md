Programmable Emoji Keyboard v1.0
By edabonacci
With code from Taran of Linus Tech Tips (https://github.com/TaranVH/2nd-keyboard)
Inspired by Tom Scott's Emoji Keyboards (https://www.youtube.com/watch?v=lIFE7h3m40U)

----------------------------------------

Prerequisites:
Extra keyboard
LuaMacros: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
AutoHotKey: https://autohotkey.com/download/

Installation:
Place "EmojiKeyboard.ahk" and "EmojiKeyBoardMacro.lua" in the root folder of luamacros.
Run "EmojiKeyboard.ahk" using AutoHotKey.
"EmojiListSaved.txt" and "KeyPressed.txt" will be automatically created the first time the script is run.
Press a key on the keyboard you want to use as your Emoji Keyboard when the menu pops up.
Start using Programmable Emoji Keyboard!

Use:
All of the keys on the Emoji Keyboard are programmable, except for special modifier keys such as control, shift, caps lock, etc.

Ctrl + [key]: Assign highlighted Emoji (or any text) to that key.
	So by selecting emoji from anywhere on the web, you can pick and choose which emojis you want on your keyboard.

[key]: Activates the emoji assigned to that key. It will enter it into the text box that your text cursor is currently in.
	A tooltip showing which emoji is assigned to that key will also briefly appear next to the mouse cursor.

Shift: Saves the current emoji associations to file. The script automatically saves any assigned emojis before it exits, but you can use this key to manually save.

Ctrl + Shift: Reloads the emoji associations from file.

Enter/Backspace: These two keys function (mostly) normally, so you can use them while typing emoji.

Configuration:
The text file "EmojiListSaved.txt" contains all the emoji associations that you have programmed while using the script.
You can manually edit this to add emoji to your keyboard if you wish.
The formatting is as follows:
a	😁
b	😜
c	🌰
minus	🍙
[key](tab)[emoji]

Instructions on how to pre-select your keyboard so you don't have to identify it each time you run the script are in "EmojiKeyboardMacro.lua".
