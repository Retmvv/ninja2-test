FROM mcr.microsoft.com/devcontainers/base:dev-ubuntu-20.04

# 安装所需的工具
RUN apt-get update &&           \
    apt-get install -y          \
        flex bison build-essential zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc fontconfig -y && sudo apt install make git-core gnupg zip unzip curl python3 openjdk-11-jdk \
    mkdir ~/bin && curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo > ~/bin/repo && chmod a+x ~/bin/repo \    
    export PATH=~/bin:$PATH

COPY aosp14 ~/workspace

CMD ["bash"]

# sudo docker build -f aosp14.Dockerfile -t ubuntu-20.04:aosp14 .