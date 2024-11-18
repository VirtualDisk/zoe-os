# https://blue-build.org/learn/universal-blue/
mkdir ./iso-output
sudo docker run --rm --privileged --volume ./iso-output:/build-container-installer/build --pull=always \
  ghcr.io/jasonn3/build-container-installer:latest \
  IMAGE_REPO=ghcr.io/virtualdisk \
  IMAGE_NAME=zoe-os \
  IMAGE_TAG=latest \
  VARIANT=Bazzite # should match the variant your image is based on
