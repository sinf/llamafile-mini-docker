FROM debian:12

RUN apt update && apt upgrade -y && apt install -y curl gnupg vim

RUN sed -i 's/^Components: main$/& contrib non-free/' /etc/apt/sources.list.d/debian.sources \
 	&& grep -q non-free /etc/apt/sources.list.d/debian.sources \
 	&& apt update
#	&& ( apt install -y nvidia-cuda-toolkit-gcc || true )

RUN sed -i 's/^Components: main$/& contrib non-free/' /etc/apt/sources.list.d/debian.sources \
 	&& grep -q non-free /etc/apt/sources.list.d/debian.sources \
\
	&& curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
	&& curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
\
	&& apt update \
	&& apt install -y nvidia-container-toolkit-base nvidia-smi
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

# Trying to avoid the 50GB of stupid bloat nvidia-cuda-toolkit would install (including nvidia-openjdk and javascript-common, WTF!?)
RUN \
set -xe; \
. /etc/os-release; ( \
curl https://developer.download.nvidia.com/compute/cuda/repos/debian${VERSION_ID}/$(uname -m)/cuda-keyring_1.1-1_all.deb -o cuda-keyring.deb \
&& dpkg -i cuda-keyring.deb \
&& apt update \
&& apt install -y cuda-nvcc-12-6 libcublas-dev-12-6 \
)

CMD /bin/bash

