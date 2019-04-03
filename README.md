# docker-dragonwell8
docker build for alibaba dragonwell8

# Pre requirements
* Install [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/)
* Download `dragonwell8` source code and put it in `code` forder like this `./code/dragonwell8/...`
```
cd code
# note:this version fix some compile errors in original source code https://github.com/alibaba/dragonwell8.git
git clone https://github.com/terwer/dragonwell8.git
cd dragonwell8
chmod +x ./get_source_dragonwell.sh
bash ./get_source_dragonwell.sh -s github
```
* Download jdk7 bootjdk and put int in `bootjdk` forder like this `bootjdk/jdk1.7.0_80`,you can download it in `https://terwer.oss-cn-qingdao.aliyuncs.com/soft/jdk/jdk-7u80-linux-x64.tar.gz`
* If you want to build in windows,you must install `git bash` and run following script first

```bash
find . -type f -print0 | xargs -0 -n 1 -P 4 dos2unix
```

# FAQ

Q: build error:`/home/dragonwell8/hotspot/src/share/vm/jfr/utilities/jfrJavaLog.cpp:47:72: error: format not a string literal and no format arguments [-Werror=format-security]`

A: see https://github.com/alibaba/dragonwell8_hotspot/pull/2/commits/e6af6156d489a079c2a7b0a7cc3e6dc4f40f42c5

# Build && Run

```
docker-compose up
```

# Check result

```
docker exec -it docker-draggonwell8 bash
java -version
```
