cp ./src/main/docker/Dockerfile ./target
cp -r ./etc ./target
cd target
docker build -t ${1} .
