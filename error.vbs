Dim message, sapi
message = "Uhh Ohh! An Error has occured."
Set sapi = CreateObject("SAPI.SpVoice")
sapi.Speak message
