在VB中运行DOS命令
本示例项目演示了如何在Visual Basic应用程序中读取环境变量和执行DOS命令。

制作DOS命令项目
在Visual Basic 6.0中打开一个新项目。
在项目菜单上选择Project1属性，将启动对象设置为Sub Main，然后单击确定。。
将以下代码复制到表单中。 Option Explicit

Sub Main()
    'Passes the DOS command as a parameter to the RunCommand procedure.
    RunCommand "dir /b > c:\temp.txt"
End Sub

Public Sub RunCommand(strCommand As String)
    'Runs the DOS command.
    Shell Environ("COMSPEC") & " /c " & strCommand, vbHide
End Sub
运行项目。在C：驱动器的根文件夹中查找temp.txt文件，然后检查其内容。
评论
这个项目充满了Windows古老历史带来的令人愉悦的小曲折。准备好自己研究DOS命令和开关，命令解释器和环境变量的奥秘。该示例中的操作就是RunCommand过程...仅一行。RunCommand将vbHide常量，作为参数传入的DOS命令以及要执行的Shell函数的环境变量交给用户。我将分解所有这些内容，从结尾开始再到前端。

首先，vbHide常数只是一个告诉Shell函数不显示窗口的常数。在此之前，变量strCommand包含从Sub Main过程传入的字符串。在此之前，/ c参数告诉Command.com以命令形式运行后面的字符串，在这种情况下，该字符串是变量strCommand的内容。接下来，Environ函数返回命令处理器command.com的位置。最后，Shell函数将所有这些打包在一起并运行它。按照设计，Shell函数运行.Exe文件。在这种情况下，我们将以下命令行传递给Shell函数以执行：“ C：\ WINDOWS \ COMMAND.COM / c dir / b> c：\ temp.txt”。最后，该命令行包含两个附加的开关：/ b参数告诉Dir命令仅返回文件名，每行一个；

而已！仅两行可执行代码有很多曲折。
