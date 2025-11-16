FROM dustynv/ros:melodic-ros-base-l4t-r32.7.1

ENV DEBIAN_FRONTEND=noninteractive

# 기본 패키지 설치
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

