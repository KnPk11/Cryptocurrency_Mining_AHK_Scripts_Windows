#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

XStep := 40
XStep_2 := 95
X0Start := 5
X1Start := X0Start + XStep_2
X2Start := X0Start + 2*XStep_2
X3Start := X0Start + 3*XStep_2
X2 := X1Start + XStep
X2_1 := X2Start + XStep
X2_2 := X2Start + 2*XStep
X3_1 := X3Start + XStep

YStep := 25
Y0Start := 10
Y1Start := 45
Y2Start := 135
Y2 := Y1Start + YStep
Y3 := Y1Start + 2*YStep
Y4 := Y1Start + 3*YStep
Y5 := Y1Start + 4*YStep
Y6 := Y1Start + 5*YStep
Y7 := Y1Start + 6*YStep

; Add your paths here.
XMRStakCPU := "D:\Остальное\Криптовалюта\Добыча\xmr-stak-cpu-win64\xmr-stak-cpu.exe"
XMRStakCPU_Config := "D:\Остальное\Криптовалюта\Добыча\xmr-stak-cpu-win64\config.txt"
EWBF1 := "D:\Остальное\Криптовалюта\Добыча\EWBF's miner 0.3.4b\start1.bat"
EWBF2 := "D:\Остальное\Криптовалюта\Добыча\EWBF's miner 0.3.4b\start2.bat"

; Panel #0
; =========================================
gui, add, button, x%X0Start% y%Y0Start% h20 w90 gsubRM, Ryzen Master
gui, add, button, x%X0Start% y40 h20 w90 gsubRM, MSI Afterburner
gui, add, button, x%X0Start% y70 h20 w90 gsubRM, Mboard manager

; Panel #1
; =========================================
gui, add, button, x%X1Start% y%Y0Start% h30 w90 gsubLM, XMR-Stak-CPU
gui, add, button, x%X1Start% y%Y1Start% h20 w35 gsub1, c1
gui, add, button, x%X2% y%Y1Start% h20 w35 gsub2, c2
gui, add, button, x%X1Start% y%Y2% h20 w35 gsub3, c3
gui, add, button, x%X2% y%Y2% h20 w35 gsub4, c4
gui, add, button, x%X1Start% y%Y3% h20 w35 gsub5, c5
gui, add, button, x%X2% y%Y3% h20 w35 gsub6, c6
gui, add, button, x%X1Start% y%Y4% h20 w35 gsub7, c7
gui, add, button, x%X2% y%Y4% h20 w35 gsub8, c8

; Panel #2
; =========================================
gui, add, button, x%X2Start% y%Y0Start% h30 w90 gsubZC_1, EWBF - GTX 1080 Ti
gui, add, button, x%X2Start% y%Y1Start% h20 w35 gsubi1_1, i2
gui, add, button, x%X2_1% y%Y1Start% h20 w35 gsubi2_1, i4
gui, add, button, x%X2Start% y%Y2% h20 w35 gsubi3_1, i8
gui, add, button, x%X2_1% y%Y2% h20 w35 gsubi4_1, i16
gui, add, button, x%X2Start% y%Y3% h20 w35 gsubi5_1, i32
gui, add, button, x%X2_1% y%Y3% h20 w35 gsubi6_1, i64

; Panel #3
; =========================================
gui, add, button, x%X3Start% y%Y0Start% h30 w90 gsubZC_2, EWBF - GTX 1080
gui, add, button, x%X3Start% y%Y1Start% h20 w35 gsubi1_2, i2
gui, add, button, x%X3_1% y%Y1Start% h20 w35 gsubi2_2, i4
gui, add, button, x%X3Start% y%Y2% h20 w35 gsubi3_2, i8
gui, add, button, x%X3_1% y%Y2% h20 w35 gsubi4_2, i16
gui, add, button, x%X3Start% y%Y3% h20 w35 gsubi5_2, i32
gui, add, button, x%X3_1% y%Y3% h20 w35 gsubi6_2, i64

; Panel #4
; =========================================
gui, add, button, x%X2Start% y%Y2Start% h30 w90 gsubZC_1, XMR - GTX 1080 Ti
gui, add, button, x%X2Start% y%Y6% h20 w35 gsubi1_3, i12
gui, add, button, x%X2_1% y%Y6% h20 w35 gsubi2_3, i14
gui, add, button, x%X2Start% y%Y7% h20 w35 gsubi3_3, i16
gui, add, button, x%X2_1% y%Y7% h20 w35 gsubi4_3, i18

; Panel #5
; =========================================
gui, add, button, x%X3Start% y%Y2Start% h30 w90 gsubZC_1, XMR - GTX 1080
gui, add, button, x%X3Start% y%Y6% h20 w35 gsubi1_3, i12
gui, add, button, x%X3_1% y%Y6% h20 w35 gsubi2_3, i14
gui, add, button, x%X3Start% y%Y7% h20 w35 gsubi3_3, i16
gui, add, button, x%X3_1% y%Y7% h20 w35 gsubi4_3, i18

;gui, add, button, x5 y60 h20 w35 gexit, Exit Script
gui, show, w400
return

guiclose:
exit:
{
	exitapp
}
return

; Panel #1
; =========================================
subLM:
{
	Send, #r
	Sleep, 200
	Clipboard := XMRStakCPU
	Send, ^v
	Send, {Enter}
	SetTitleMatchMode, 2
	Sleep, 500
	WinActivate, Добытчик
}
return

sub1:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

sub2:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 3 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

sub3:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 3 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 5 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

sub4:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 3 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 5 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 7 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

sub5:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 3 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 5 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 7 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 9 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

sub6:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 3 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 5 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 7 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 9 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 11 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

sub7:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 3 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 5 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 7 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 9 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 11 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 13 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

sub8:
{
	FileRead, Content, %XMRStakCPU_Config%
	NewStr := RegExReplace(Content, """cpu_threads_conf""(.*?)\],", """cpu_threads_conf"" :[{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 1 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 3 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 5 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 7 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 9 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 11 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 13 },{ ""low_power_mode"" : false, ""no_prefetch"" : true, ""affine_to_cpu"" : 15 },],")
	FileDelete, %XMRStakCPU_Config%
	FileAppend, %NewStr%, %XMRStakCPU_Config%
}
return

subRM:
{
	Run, C:\Program Files\AMD\RyzenMaster\bin\AMD Ryzen Master.exe
}
return

; Panel #2
; =========================================
subZC_1:
{
	Send, #r
	Sleep, 200
	Clipboard := EWBF1
	Send, ^v
	Send, {Enter}
	SetTitleMatchMode, 2
	Sleep, 500
	WinActivate, Добытчик
}
return

subi1_1:
{
	FileRead, Content, %EWBF1%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 2")
	FileDelete, %EWBF1%
	FileAppend, %NewStr%, %EWBF1%
}
return

subi2_1:
{
	FileRead, Content, %EWBF1%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 4")
	FileDelete, %EWBF1%
	FileAppend, %NewStr%, %EWBF1%
}
return

subi3_1:
{
	FileRead, Content, %EWBF1%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 8")
	FileDelete, %EWBF1%
	FileAppend, %NewStr%, %EWBF1%
}
return

subi4_1:
{
	FileRead, Content, %EWBF1%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 16")
	FileDelete, %EWBF1%
	FileAppend, %NewStr%, %EWBF1%
}
return

subi5_1:
{
	FileRead, Content, %EWBF1%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 32")
	FileDelete, %EWBF1%
	FileAppend, %NewStr%, %EWBF1%
}
return

subi6_1:
{
	FileRead, Content, %EWBF1%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 64")
	FileDelete, %EWBF1%
	FileAppend, %NewStr%, %EWBF1%
}
return

; Panel #3
; =========================================
subZC_2:
{
	Send, #r
	Sleep, 200
	Clipboard := EWBF2
	Send, ^v
	Send, {Enter}
	SetTitleMatchMode, 2
	Sleep, 500
	WinActivate, Добытчик
}
return

subi1_2:
{
	FileRead, Content, %EWBF2%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 2")
	FileDelete, %EWBF2%
	FileAppend, %NewStr%, %EWBF2%
}
return

subi2_2:
{
	FileRead, Content, %EWBF2%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 4")
	FileDelete, %EWBF2%
	FileAppend, %NewStr%, %EWBF2%
}
return

subi3_2:
{
	FileRead, Content, %EWBF2%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 8")
	FileDelete, %EWBF2%
	FileAppend, %NewStr%, %EWBF2%
}
return

subi4_2:
{
	FileRead, Content, %EWBF2%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 16")
	FileDelete, %EWBF2%
	FileAppend, %NewStr%, %EWBF2%
}
return

subi5_2:
{
	FileRead, Content, %EWBF2%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 32")
	FileDelete, %EWBF2%
	FileAppend, %NewStr%, %EWBF2%
}
return

subi6_2:
{
	FileRead, Content, %EWBF2%
	NewStr := RegExReplace(Content, "intensity \d+", "intensity 64")
	FileDelete, %EWBF2%
	FileAppend, %NewStr%, %EWBF2%
}
return

; Panel #4
; =========================================
subi1_3:
subi2_3:
subi3_3:
subi4_3:

; Panel #5
; =========================================
subi1_4:
subi2_4:
subi3_4:
subi4_4: