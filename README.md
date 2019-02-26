# BarkHelper
BarkHelper 是开源项目Bark的PC端辅助软件，省去了反复复制粘贴修改地址的麻烦。<br>
话说本人现在早已不是程序员，只是在十几年前用Delphi写过一些非商用的软件。一晃这么多年过去，技巧神马的早忘光光了，代码难免笨拙，见谅。
> Bark是什么？<br>
> Bark is an iOS App which allows you to push customed notifications to your iPhone <br>
> 客户端 <https://github.com/Finb/Bark> <br>
> 服务器端 <https://github.com/Finb/go-tools> <br>
> AppStore <https://itunes.apple.com/cn/app/bark-customed-notifications/id1403753865> <br>
## 几点说明
1. 关于360安全卫士误报。因需要在程序中调用浏览器，故use了ShellAPI单元（line 7），并使用了ShellExecute()（line 193）。<br>
2. 经我个人测试，推送链接需要完整的链接（含 Http:// 或 https:// 头），否则将无法跳转，可能是BARK APP本身的限制，但不能确定，有知道的朋友麻烦给个意见或建议，谢谢啦！<br>
## Releases Note
Ver 1.7<br>
1. 增加对chrome、firefox浏览器支持（感谢JuvenRui、rgxgr、Ringoxue、cw的意见及建议），并将调用方式更改为combobox下拉菜单；<br>
2. 增加文本框可视面积（感谢cwup的意见及建议），以便于粘贴后的编辑；同步调整程序内各控件的布局，使之更易于直观使用；<br>
3. 修正“链接”和“自动复制”功能的BUG（感谢cw的意见及建议）；<br>
4. 修改完善不同RadioBtn选中时，文本框中默认的提示文本；<br>
5. 增加文本框控件的SetFocus属性；<br>
6. 增加程序icon；<br>
7. 调整优化部分代码。<br>
<br>
<br>
Ver 1.6<br>
部分代码调整，界面调整等
<br>
<br>
Ver 1.5<br>
增加调用INI文件保存Key配置功能
<br>
<br>
Ver 1.4<br>
增加直接调用360极速浏览器功能；设置在点击RadioBtn之前推送Btn不可用；点击除“标题及内容”之外的其它RadioBtn时，“标题”Edit控件不可用
<br>
<br>
Ver 1.3<br>
增加“仅内容”、“标题及内容”、“链接”、“自动复制”4个RadioBtn
<br>
<br>
Ver 1.2<br>
增加直接调用系统默认浏览器功能，内容填充完成后可以一键推送
<br>
<br>
Ver 1.1<br>
增加“标题”、“链接”、“推送文本”3个edit控件
<br>
<br>
Ver 1.0<br>
初步想法，用软件代替复制粘贴修改等一系列重复动作，尝试“仅内容”的推送功能
