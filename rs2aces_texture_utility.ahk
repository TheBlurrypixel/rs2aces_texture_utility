if A_Args.Length() < 2
{
    MsgBox % "This script requires 2 parameters"
    ExitApp
}

; parameter 1 is the OCIO profile to convert from
; parameter 2 is the texture to convert
; param index starts at 1
; MsgBox % A_Args[1]

ocioExe := "resources\ocio_apps\ocioconvert.exe"
EnvGet, progData, PROGRAMDATA
rsTextProc := progData . "\Redshift\bin\redshiftTextureProcessor.exe"

SplitPath, % A_Args[2], name, dir, ext, name_no_ext, drive
tempPath := dir . "\" . name_no_ext . "_temp" . ".exr"
rstextbintempPath := dir . "\" . name_no_ext . "_temp" . ".rstexbin"
rstextbinPath := dir . "\" . name_no_ext . ".rstexbin"

acesPath := A_ScriptDir . "\resources\aces_1.2\config.ocio"
setOCIO := "set OCIO=" . acesPath

runCmd := """" . setOCIO . " && " . """" . A_ScriptDir . "\" . ocioExe . """" . A_Space . """" . A_Args[2] . """" . A_Space . """" . A_Args[1] . """" . A_Space . """" . tempPath . """" . A_Space . """ACEScg""" . """"
RunWait %comspec% /c %runCmd%

textProcCmd := """" . """" . rsTextProc . """" . A_Space . """" . tempPath . """" . """"
RunWait %comspec% /c %textProcCmd%

FileGetTime, modTime, % A_Args[2]
FileSetTime, %modTime%, % rstextbintempPath
FileMove, %rstextbintempPath%, %rstextbinPath%
FileDelete, %tempPath%
