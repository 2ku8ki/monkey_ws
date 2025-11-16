FROM nvcr.io/nvidia/l4t-ros:melodic-ros-base-r32.7.1

ENV DEBIAN_FRONTEND=noninteractive

# 기본 패키지
RUN apt-get update && apt-get install -y \
    python3-pip python3-dev python3-numpy python3-opencv \
    ros-melodic-image-transport \
    ros-melodic-compressed-image-transport \
    ros-melodic-cv-bridge \
    ros-melodic-vision-opencv \
    ros-melodic-sensor-msgs \
    ros-melodic-geometry-msgs \
    ros-melodic-roscpp ros-melodic-rospy \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리
WORKDIR /workspace/monkey_ws

CMD ["bash"]

