#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance
#Persistent

n = 1
n1 = 1
k = 1
k1 = 1

Miner1 = "C:\Claymore's ZCash AMD GPU Miner 12.4\start.bat"
Miner2 = "C:\EWBF's miner 0.3.4b\start.bat"

Loop
{
	Sleep, 57500 ; Run the checks in roughly 1 minute intervals

	If (n = 480) ; rest after 8 hours
	{
		Process, close, XMR-Strak.exe
		n1 = 1
	}
	If (k = 360) ; rest after 6 hours
	{
		Process, close, EWBF.exe
		k1 = 1
	}
	
	If (n1 = 40) ; restart mining after a 40 minute break
	{
		Process, Exist, xmr-stak-cpu.exe
		NewPID = %ErrorLevel%
		if NewPID = 0
		{
			sleep, 3000
			Send, #r
			Sleep, 250
			Clipboard := Miner1
			Send, ^v
			Send, {Enter}
			Process, close, ..exe
			n := 1 ; restart the count
		}
	}
	
	Sleep, 500
	
	If (k1 = 60) ; restart mining after an hour break
	{
		Process, Exist, miner.exe
		NewPID = %ErrorLevel%
		if NewPID = 0
		{
			Send, #r
			Sleep, 250
			Clipboard := Miner2
			Send, ^v
			Send, {Enter}
			k := 1 ; restart the count
		}
	}
	
	n := n + 1
	n1 := n1 + 1
	k := k + 1
	k1 := k1 + 1
}