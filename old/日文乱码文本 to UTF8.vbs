If WScript.Arguments.Count<1 Then
	MsgBox "请把HTML文件拖到脚本上运行"
	WScript.Quit
End If
'将参数（文件列表）存入类
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
	'截取文件名
	str = Left(Files(i),InStrRev(Files(i),".")-1)
	newfname = replace(Files(i),str,str & "_CN")
	gTs file,newfname,"Shift-JIS","UTF-8"
next
set fso=nothing
msgbox "完成" & Files.Count & "个"

WScript.Quit