# Restore
docker load -i falcoarch.tar
docker load -i archlinux.tar
docker tag "someID" base/archlinux:2015.06.01
docker tag "someID" falco/arch:latest
