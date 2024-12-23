## AOSP14分布式编译试用版教程

for 内部评估测试专用，严谨使用在生产环境！

###  准备好AOSP源代码并能单机编译通过

开发环境：Ubuntu 20.04 LTS

* AOSP14开发环境搭建过程仅供参考
```plain
sudo apt update && sudo apt install flex bison build-essential zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc fontconfig -y && sudo apt install make git-core gnupg zip unzip curl python3 openjdk-11-jdk -y
mkdir ~/bin && curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo > ~/bin/repo && chmod a+x ~/bin/repo 
export PATH=~/bin:$PATH
repo init -u https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/platform/manifest -b android-14.0.0_r2
repo sync
sudo rm -rf out/ && make clobber
source build/envsetup.sh && lunch aosp_arm-eng
```

* AOSP14单机编译
```plain
ubuntu@VM-0-4-ubuntu:~/aosp$ make
```

确保单机编译可以成功。

注意：本例中AOSP项目的路径以/home/ubuntu/aosp为例。

###  CloudBuild私有云简易部署方法
* 安装CloudBuild
分别在主机A、B、C、D...上安装

```plain
git clone https://gitee.com/cloudbuild888/cloudbuild.git && cd cloudbuild/src
```

* 主机A(Client+Server)
```plain
sudo apt-get install -y nfs-kernel-server
sudo vi /etc/exports
# 将如下一行添加到/etc/exports文件中，保存后可以执行sudo exportfs -a检查一下
/home/ubuntu/aosp/prebuilts *(ro)
```

开始安装部署CloudBuild

```plain
./cloudbuild --easy=/home/ubuntu/aosp
```

* 注意：

> vi ~/aosp/build/soong/ui/build/ninja.go
> 检查该文件中是否添加了"-c", "grpc://127.0.0.1:1985", "--aosp",
> 
> ls -l  prebuilts/build-tools/linux-x86/bin
> 检查ninja是否连接到ninja -> android_ninja

* 主机B、C、D...(Executor)
```plain
echo "/home/ubuntu/aosp" >aosp_path.conf
./cloudbuild -e192.168.0.1 #(主机A的IP地址，注意：-e后面没有空格直接根IP地址)
```

* 注意：

> 检查executor 容器是否正确挂载了aosp项目的prebuilts目录
> ```plain
> sudo docker exec -it executor /bin/bash
> ls $HOME/prebuilts
> ```
> 
> 执行./cloudbuild命令出现问题时可以清理一下环境重试
> ```plain
> ./cloudbuild --clean
> ```


### 开始分布式编译AOSP项目
* AOSP14分布式编译
```plain
source build/envsetup.sh && lunch aosp_arm-eng
make clean && make
```

### 版权说明

Copyright @ Mengning Software 

梦宁软件（江苏）有限公司 版权所有

