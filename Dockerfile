FROM dustynv/ros:melodic-ros-base-l4t-r32.7.1

ENV DEBIAN_FRONTEND=noninteractive

# --------------------------
# 🔧 Fix ROS Melodic GPG Key
# --------------------------
RUN apt-get update && apt-get install -y curl gnupg ca-certificates

# 새로운 keyring 저장용 폴더 생성
RUN mkdir -p /etc/apt/keyrings

# Open Robotics APT key (만료된 키 대체)
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    -o /etc/apt/keyrings/ros-archive-keyring.gpg

# ROS APT 소스 재등록 (signed-by 옵션 필수)
RUN echo "deb [arch=arm64 signed-by=/etc/apt/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros1.list

# --------------------------
# 🔧 Kitware repo 완전 제거 (문제만 일으킴)
# --------------------------
RUN rm -f /etc/apt/sources.list.d/kitware* || true

# --------------------------
# 🔧 패키지 설치
# --------------------------
RUN apt-get update && apt-get install -y \
    python3-pip python3-dev python3-numpy python3-opencv \
    ros-melodic-cv-bridge \
    ros-melodic-image-transport \
    ros-melodic-compressed-image-transport \
    ros-melodic-sensor-msgs \
    ros-melodic-geometry-msgs \
    ros-melodic-vision-opencv \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace/monkey_ws
CMD ["bash"]

