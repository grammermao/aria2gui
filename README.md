
Aria2GUI
===========

![UI](http://i.imgur.com/MEZqP9z.png)

## Features:

- 集成aria2c
- 多线程下载
- 未完成任务退出自动保存
- 支持网盘的aria2导出（需要浏览器插件支持）
- 支持PT/BT
- 在Badge显示整体下载速度
- 任务完成通知

## Usage:

- 解压后拖到应用里面运行即可

## Tips:

- 使用Chrome浏览器可配合[YAAW-for-Chrome](https://github.com/acgotaku/YAAW-for-Chrome)插件接管浏览器的所有下载到aria2
- 导出插件：[百度网盘](https://github.com/acgotaku/BaiduExporter)，[115网盘](https://github.com/acgotaku/115)，[迅雷离线](https://github.com/binux/ThunderLixianExporter)
- 网盘插件里面的User-Agent优先级高于客户端，所以修改客户端里面User-Agent不会影响导出下载的速度，默认伪装成Transmission/2.77是为了支持BT/PT
- 速度不理想可以尝试下这个User-Agent(netdisk;2.0.0;pc;pc-mac;10.12;macbaiduyunguanjia)，百度网盘导出插件里面替换原来的User-Agent

## UI
- WebUI使用的[YAAW](https://github.com/binux/yaaw)，aria2的WebUI有好几个版本，你也可以自行替换，web文件都在public文件夹内，我不会维护其他WebUI的版本，也许未来也会出原生UI的版本，替换掉yaaw以及api写得很烂的macgap，当然也有可能不会出。

## Download:

  [Releases](https://github.com/yangshun1029/aria2gui/releases)

## With special thanks to:  

- [Aria2](https://aria2.github.io)
- [YAAW](https://github.com/binux/yaaw)
- [MacGap](https://github.com/MacGapProject)
- [fakeThunder](https://github.com/MartianZ/fakeThunder)

## Contributors:  

  [Nick](https://github.com/yangshun1029)

##License

Aria2GUI is licensed under [MIT License](http://choosealicense.com/licenses/mit/) 
