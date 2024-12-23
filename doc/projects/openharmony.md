## OpenHarmony

```
sudo docker pull swr.cn-south-1.myhuaweicloud.com/openharmony-docker/docker_oh_standard:3.2
wget -c https://repo.huaweicloud.com/openharmony/os/4.1-Release/code-v4.1-Release.tar.gz
tar -zxvf code-v4.1-Release.tar.gz
cd OpenHarmony-v4.1-Release/OpenHarmony
sudo docker run -it -v $(pwd):/home/openharmony swr.cn-south-1.myhuaweicloud.com/openharmony-docker/docker_oh_standard:3.2
root@ada29360c83c:/home/openharmony# ./build.sh --product-name rk3568 --ccache
```

### 参考资料

* https://gitee.com/openharmony/docs
* 开发环境容器镜像https://gitee.com/openharmony/docs/blob/master/zh-cn/device-dev/get-code/gettools-acquire.md