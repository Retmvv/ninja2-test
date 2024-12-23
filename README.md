
# CloudBuild - 通用的分布式编译解决方案

![输入图片说明](doc/pic/CloudBuild.jpg)

* [系统介绍](./doc/introduction/introduction.md)
* [安装教程](./doc/installation/installation.md)
* [使用说明](./doc/tutorial/tutorial.md)
* [案例演示](./doc/demo/demo.md)

## CloudBuild应用效果

![输入图片说明](doc/pic/CloudBuildResult.png)


## CloudBuild私有云简易部署方法

* 安装CloudBuild

```
wget https://gitee.com/cloudbuild888/cloudbuild/releases/download/v1.0/cloudbuild.zip && unzip cloudbuild.zip && cd cloudbuild
```

* 主机A(Client+Server)

`./cloudbuild --easy`

* 主机B、C、D...(Executor)

`./cloudbuild -eA_ip(主机A的IP地址，注意-e后没有空格直接跟IP地址)`

## CloudBuild使用方法

* 以LLVM项目为例CloudBuild使用方法（以在主机A上为例）

`git clone https://gitee.com/mirrors/LLVM.git`

* 生成Ninja工程文件

`cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=MinSizeRel`

* 启动分布式编译

`ninja -c grpc://127.0.0.1:1985 -r ProjectPath`

* AOSP项目编译配置比较复杂，如有需要请联系孟宁老师：mengning@ustc.edu.cn

## CloudBuild-ShareBuild版

* https://gitee.com/cloudbuild888/sharebuild

# License

* [Ninja2](https://github.com/ninja-cloudbuild/ninja2) and [CloudBuild](https://gitee.com/cloudbuild888/cloudbuild) are released under a dual license of AGPL-3.0 and a paid commercial license.
* [Ninja](https://github.com/ninja-build/ninja) is released under Apache License 2.0.