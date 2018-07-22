#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance
#Persistent
SetTimer, Check, 5000
return

Check:
IfGreater, A_TimeIdlePhysical, 60000
{
	Process, Exist, miner.exe
	NewPID = %ErrorLevel%  ; Save the value immediately since ErrorLevel is often changed.
	if NewPID = 0
	{
		;Run, %A_ScriptDir%\..exe
		Send, #r
		Sleep, 500
		Clipboard := "D:\Остальное\Криптовалюта\Добыча\EWBF's miner 0.3.4b\start.bat"
		Send, ^v
		Send, {Enter}
		;Process, close, ..exe
	}
	
	;Send, #d
	Sleep, 4000
	Process, Exist, xmr-stak-cpu.exe
	NewPID = %ErrorLevel%  ; Save the value immediately since ErrorLevel is often changed.
	if NewPID = 0
	{
		Run, %A_ScriptDir%\..exe
		sleep, 3000
		Send, #r
		Sleep, 500
		Clipboard := "D:\Остальное\Криптовалюта\Добыча\xmr-stak-cpu-win64\xmr-stak-cpu.exe"
		Send, ^v
		Send, {Enter}
		;Run, "D:\Остальное\Криптовалюта\Добыча\xmr-stak-cpu-win64\xmr-stak-cpu.exe"
		Process, close, ..exe
	}
}
return