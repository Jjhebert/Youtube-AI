#include <MsgBoxConstants.au3>

;Variable Setup
HotKeySet("{esc}", "playpause")

$url = "https://www.youtube.com/watch?v=N7ZmPYaXoic"
$go = 1
$title = "Youtube view bot!"
$length = 20 ; in seconds

; Main viewing
While $go = 1
		ShellExecute($url)
		MsgBox($MB_SYSTEMMODAL, $title, "Bot is watching for " & $length & " seconds. Press esc to stop!", $length)
		Opt("WinTitleMatchMode", 2)
		$aList = WinList("Firefox")
		For $i = 1 To $aList[0][0]
			WinClose($aList[$i][1])
		Next
		Sleep(5000) ; Wait for 5000millisec (5 Sec)
WEnd

; Helper function
Func playpause()
    $go = $go * -1 + 1
EndFunc