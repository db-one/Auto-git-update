


命令中的 -d 后面为Debian版本号，-v 后面为64位/32位，【7、8、9、10、11、12】

`bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 11 -v 64 -p xxxxxxxxx`

来源：https://github.com/MoeClub/Note



网络重装 Debian 12 脚本

`curl -fLO https://raw.githubusercontent.com/bohanyang/debi/master/debi.sh && chmod a+rx debi.sh && ./debi.sh --install 'curl wget neofetch htop net-tools git' --hostname debian --bbr --timezone Asia/Shanghai --cloud-kernel --user root --password xxxxxxxxxxxxxxx && shutdown -r now`

来源：https://github.com/bohanyang/debi



注意事项：

- Vicer脚本目前不支持重装为CentOS 7系统，支持CentOS 6.9以下版本。
- 重装的系统源自官方发行版。
- 安装过程全自动进行，无需VNC操作，无需进入救援模式。
- 系统安装完成后的默认用户名为root，**默认密码为: `MoeClub.org`**

##### **重装为CentOS：**

以下命令中的 -c 后面为CentOS版本号，-v 后面为64位/32位，可根据需求进行替换。

```
# CentOS 6.10 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -c 6.10 -v 64 -a -p xxxxxxxxx
# CentOS 6.10 32位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -c 6.10 -v 32 -a -p xxxxxxxxx
```

##### **重装为Debian：**

以下命令中的 -d 后面为Debian版本号，-v 后面为64位/32位，可根据需求进行替换。

```
# Debian 8 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -d 8 -v 64 -a -p xxxxxxxxx
# Debian 9 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -d 9 -v 64 -a -p xxxxxxxxx
# Debian 10 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -d 10 -v 64 -a -p xxxxxxxxx
# Debian 11 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -d 11 -v 64 -a -p xxxxxxxxx
# Debian 11.5 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -d 11.5 -v 64 -a -p xxxxxxxxx
```

##### **重装为Ubuntu：**

以下命令中的 -u 后面为Ubuntu版本号，-v 后面为64位/32位，可根据需求进行替换。

```
# Ubuntu 12.04 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -u 12.04 -v 64 -a -p xxxxxxxxx
# Ubuntu 14.04 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -u 14.04 -v 64 -a -p xxxxxxxxx
# Ubuntu 16.04 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -u 16.04 -v 64 -a -p xxxxxxxxx
# Ubuntu 18.04 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -u 18.04 -v 64 -a -p xxxxxxxxx
# Ubuntu 20.04 64位：
bash <(wget --no-check-certificate -qO- 'https://www.moeelf.com/attachment/LinuxShell/InstallNET.sh') -u 20.04 -v 64 -a -p xxxxxxxxx
```

#### 重装系统后更改root密码

耐心等待系统安装成功后，出于安全考虑，建议立即更改默认密码。

**具体方法：**

1、使用Putty以上文提供的默认密码登录，输入以下命令：`passwd root`

2、接下来会分两次要求输入新的密码，可以手动输入，也可以在其它位置复制一个密码，然后在Putty界面右键点击即可粘贴上去。
**注意：**输入新密码时并不会直接显示出来，光标也不会移动，这是正常的。

3、再次登录系统时，记得使用新的root密码。



来源：https://www.moeelf.com/archives/293.html
