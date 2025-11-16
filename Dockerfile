# CUDA + OpenCV(CUDA) + ROS Melodic 포함된 Jetson 공식 이미지
FROM dustynv/ros:melodic-opencv-l4t-r32.7.1

ENV DEBIAN_FRONTEND=noninteractive

# 필요한 ROS/파이썬 패키지
RUN apt-get update && apt-get install -y \
    python3-pip python3-dev python3-numpy \
    ros-melodic-cv-bridge \
    ros-melodic-image-transport \
    ros-melodic-compressed-image-transport \
    ros-melodic-sensor-msgs \
    ros-melodic-geometry-msgs \
    ros-melodic-vision-opencv \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리
RUN mkdir -p /workspace/monkey_ws
WORKDIR /workspace/monkey_ws

CMD ["bash"]

