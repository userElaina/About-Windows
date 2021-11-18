If WScript.Arguments.Count<1 Then
    MsgBox "Please drag and drop the HTML file onto this script to run it."
    WScript.Quit
End If
'Store the parameters (list of files) into the class.
Set Files = WScript.Arguments

Function gTs(FilePath1,FilePath2,charset1,charset2)
    dim str
    str = ""
    Set adostream = CreateObject("ADODB.Stream")
    With adostream
        .Type = 2
        .Open
        .Charset = charset1
        .Position = 0
        .LoadFromFile FilePath1
        str = .readtext
        .close
    End With
    Set adostream = Nothing
    Set adostream = CreateObject("ADODB.Stream")
    With adostream
        .Type = 2
        .Open
        .Charset = charset2
        .Position = 0
        .writetext str
        .SaveToFile FilePath2, 2
        .flush
        .close
    End With
    Set adostream = Nothing
End Function

set fso=createobject("scripting.filesystemobject")
for i = 0 to Files.Count-1
    set file = fso.getFile(Files(i))
    'basename
    str = Left(Files(i),InStrRev(Files(i),".")-1)
    newfname = replace(Files(i),str,str & "_CN")
    gTs file,newfname,"Shift-JIS","UTF-8"
next
set fso=nothing
msgbox "Completed " & Files.Count & "."

WScript.Quit
