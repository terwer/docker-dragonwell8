# docker-dragonwell8
docker build for alibaba dragonwell8

# Pre requirements
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

# Build && Run

```
docker-compose up
```

# Check result

```
docker exec -it docker-draggonwell8 bash
java -version
```
