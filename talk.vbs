Dim message, sapi
message = "ARE YOU SURE YOU WANT TO DO THIS?"
Set sapi = CreateObject("SAPI.SpVoice")
sapi.Speak message
