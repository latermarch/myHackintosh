### 黑苹果装机说明
---
#### 1  配置说明
- 技嘉b85m-d3v
- i54590
- gtx750ti(10.14以上无法驱动)
---

#### 2 `安装说明`
##### 2.1 `安装工具一会放进来`
制作u盘，替换ufi。EFI见git,自己把它传上去
##### 2.2 `安装显卡和驱动`


```bash
#安装显卡
bash <(curl -s https://raw.githubusercontent.com/Benjamin-Dobell/nvidia-update/master/nvidia-update.sh)
# 安装cuda,见目录
```
##### 2.3 `安装声卡驱动`

我的声卡是acl 887注入驱动时使用的是11 
---

#### 3 优化说明
##### 3.1：启动系统进入clover前出现乱码。

从`EFI/CLOVER/drivers64UEFI`中把apfs.efi删除。然后从[这里](https://github.com/acidanthera/AppleSupportPkg/releases)下载驱动文件`AppleSupport-v2.0.7-RELEASE.zip`，放在同级目录下，替代apfs.efi。

##### 3.2：系统进入clover后分辨很低。

打开`EFI/CLOVER/config.plist` gui下设置分辨率，想设成多少就调成多少。在bios下，选择win8模式，关闭csm。重启画面就会变得清晰了

##### 3.3：2k显示器开启hidpi，没意义，分辨率太低，显示内容太少，不用 折腾这种

- **a 获取显示器的两个id号。**
```bash
zhangzuoyundeiMac:~ zhangzuoyun$ ioreg -l | grep "DisplayVendorID"
    | |   |   | |   |       "DisplayVendorID" = 4268
zhangzuoyundeiMac:~ zhangzuoyun$ ioreg -l | grep "DisplayProductID"
    | |   |   | |   |       "DisplayProductID" = 16701
 ```
 - **b 将两个数字变成16进制**
 4628  -->10ac
 16701-->413d
在桌面创建一个文件夹，名字为：`DisplayVendorID-10ac`；在此文件夹下创建一个文件，名字为：`DisplayProductID-413d`。
- **c 打开[网址](https://comsysto.github.io/Display-Override-PropertyList-File-Parser-and-Generator-with-HiDPI-Support-For-Scaled-Resolutions/)**,将两个id号填入，生成的内容复制下来，放到上面那个文件中。
-  **d 下载[rdm 2.2 dmg版](http://avi.alkalay.net/software/RDM/)并安装**
- **e command+R进入recoverary模式，在终端下输入：`csrutil enable` 打开sip，重启**
- **f 重启后，打开终端，输入s**
```bash
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
```
- **g 打开`/System/Library/Displays/Contents/Resources/Overrides/`路径，将上面制作好的文件夹拖入**

##### 3.4：核显开启硬解

- 核显硬解  [参考一](http://bbs.pcbeta.com/viewthread-1785873-1-3.html)和[参考二](http://bbs.pcbeta.com/viewthread-1778305-1-1.html)。主要是参考二，辅助参考一。所有需要的文件都已放入efi文件，后面安装直接把这个文件拷进来就可以了，不需要再重复弄了
- 测试方法  4K测试视频:[图片]https://yun.baidu.com/s/1c4hyFW 密码:6666  记得用mac自带的QuickTime player播放测试
在线测试显卡性能选择多条鱼的[网站](https://testdrive-archive.azurewebsites.net/Performance/FishIETank/)

##### 3.5 电脑休眠后唤醒鼠标失灵（只有我的冰豹失灵，其它比如罗技是正常的，ikbc也正常），重新插后又能正常使用。

解决思路就是 唤醒后重启那个usb口，[参考](https://github.com/acai66/lenovo-miix-520-hackintosh-10.14-CLOVER)。
- 1 安装brew，终端执行如下命令
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
- 2 安装sleepwatcher，终端执行如下命令
```bash
brew install sleepwatcher
```
- 3 下载解压补丁包 : 解决唤醒后需要拔插键盘问题的方案.zip。修改目录下的acai/patch，将出现问题的鼠标usb口地址替换进去。

- 4 终端进入补丁包目录，执行如下命令
```bash
sudo sh ./patch.sh
```
- 最后总结，休眠过程中，如果同时按下鼠标和键盘，电脑会重新启动
#####  3.6 usb定制
- 参考小兵教程 [地址](https://blog.daliansky.net/Intel-FB-Patcher-tutorial-and-insertion-pose.html)


##### 3.7：美化clover界面
- 参考[视频](https://www.bilibili.com/video/av51121031)
##### 3.8：改键。
- 偏好设置》键盘》修饰键 替换contrl和command键就符合windows习惯了
- 自定义键 可以使用Karabiner,来定义声音键
#####  3.9：装ssr等工具

从[这里](https://github.com/qinyuhang/ShadowsocksX-NG-R/releases/tag/1.4.4-r8)下载

##### 3.10：终端配色方案
参考[地址](https://www.jianshu.com/p/150e9e1ac79f)

sh -c  "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

---
#### 4 快捷键
- comand + contrl + f   全屏和退出全屏（只对部分应用有效）
- contrl + t  打开新标签（浏览器和终端）
- contrl + e 关闭标签
- contrl + d  左右分屏（终端） 
- contrl + q 退出应用

- contrl + <--/--> 切换全屏应用和桌面
- contrl + 上/下  同样
- comand + option+A 自定义打开应用集
- contrl + l  自定义锁屏