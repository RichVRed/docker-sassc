## sassc - SassC is a wrapper around libsass
[![Docker Pulls](https://img.shields.io/docker/pulls/rvannauker/sassc.svg)](https://hub.docker.com/r/rvannauker/sassc/) [![Docker Stars](https://img.shields.io/docker/stars/rvannauker/sassc.svg)](https://hub.docker.com/r/rvannauker/sassc/) [![](https://images.microbadger.com/badges/image/rvannauker/sassc:latest.svg)](https://microbadger.com/images/rvannauker/sassc:latest) [![GitHub issues](https://img.shields.io/github/issues/RichVRed/docker-sassc.svg)](https://github.com/RichVRed/docker-sassc) [![license](https://img.shields.io/github/license/RichVRed/docker-sassc.svg)](https://tldrlegal.com/license/mit-license)

Docker container to install and run sassc

### Installation / Usage
1. Install the rvannauker/sassc container:
```bash
docker pull rvannauker/sassc
```
2. Run sassc through the sassc container:
```bash
sudo docker run --rm --name="sassc" "rvannauker/sassc" {command}
```
3. Optionally create a bash alias:
```bash
alias sassc="docker run --interactive=true --rm=true rvannauker/sassc:<version>"
```

### Download the source:
To run, test and develop the SassC Dockerfile itself, you must use the source directly:
1. Download the source:
```bash
git clone https://github.com/RichVRed/docker-sassc.git
```
2. Build the container:
```bash
sudo docker build --force-rm --tag "rvannauker/sassc" --file sassc.dockerfile .
```
3. Test running the container:
```bash
 $ docker run rvannauker/sassc --help
```