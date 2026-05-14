' ====================================================================
' 🎵 PTA-11 ENGINE ASYNCHRONOUS SYSTEM AUDIO SYSTEM
' ====================================================================
On Error Resume Next

Dim speechVoice, commandArgs
Set speechVoice = CreateObject("SAPI.SpVoice")
Set commandArgs = WScript.Arguments

' Prevent crashes if executed without arguments
If commandArgs.Count > 0 Then
    Select Case LCase(commandArgs(0))
        Case "score"
            ' Speak point capture cues asynchronously (SPF_ASYNC = 1)
            speechVoice.Speak "Point!", 1
        Case "gameover"
            speechVoice.Speak "Game Over!", 1
        Case "trap"
            speechVoice.Speak "Warning, Hazard activated!", 1
        Case "shop"
            speechVoice.Speak "Purchase successful!", 1
        Case Else
            ' Dynamic custom string backup cue pass-through
            speechVoice.Speak commandArgs(0), 1
    End Select
End If

' Keep the script memory space alive briefly to ensure audio streams flush out
WScript.Sleep 800

Set commandArgs = Nothing
Set speechVoice = Nothing
