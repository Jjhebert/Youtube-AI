#include <MsgBoxConstants.au3>

;Variable Setup
HotKeySet("{esc}", "playpause")

;Variables Initialization
Local $url_list[3] = ["https://www.youtube.com/watch?v=N7ZmPYaXoic","https://www.youtube.com/watch?v=7Hlb8YX2-W8","https://www.youtube.com/watch?v=F9GujgK0y2M"]
$continue = 1
$title = "Youtube view bot!"
$minimum = 10000;Min view duration in milliseconds
$maximum = 20000;Max view duration in milliseconds


; Main viewing Loop
While $continue = 1
	$length = Random($minimum, $maximum, 1) ; Get how long to look at a video
	$index = Random(0,UBound($url_list)-1,1) ; Get which video to look at
	$url = $url_list[$index]; Get the right url
	MsgBox($MB_SYSTEMMODAL, $title, "Bot is watching for " & $length & " milliseconds. Press esc to stop!", 2)
	ShellExecute($url)
	Sleep($length)

	; Delete the window and stop watching the video
	Opt("WinTitleMatchMode", 2)
	$aList = WinList("Firefox")
	For $i = 1 To $aList[0][0]
		WinClose($aList[$i][1])
	Next

	Sleep(5000) ; Wait for 5000millisec (5 Sec)
WEnd

; Helper function
Func playpause()
    $continue = 0
EndFunc