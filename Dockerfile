FROM dustynv/ros:melodic-ros-base-l4t-r32.7.1

ENV DEBIAN_FRONTEND=noninteractive

# ------------------------------------------
# 1) 깨진 기존 ROS repo를 완전히 제거
# ------------------------------------------
RUN rm -f /etc/apt/sources.list.d/ros1-latest.list || true
RUN rm -f /etc/apt/sources.list.d/ros-latest.list || true
RUN rm -f /etc/apt/sources.list.d/kitware* || true

# ------------------------------------------
# 2) GPG key 및 keyring 방식으로 ROS repo 재등록
# ------------------------------------------
RUN apt-get update && apt-get install -y curl gnupg2 ca-certificates

RUN mkdir -p /etc/apt/keyrings

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    -o /etc/apt/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=arm64 signed-by=/etc/apt/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros/ubuntu bionic main" \
    > /etc/apt/sources.list.d/ros1.list

# ------------------------------------------
# 3) ROS 패키지 설치
# ------------------------------------------
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

