FROM  osrf/ros:galactic-desktop
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
COPY warp-client /warp-client
RUN pip install -e /warp-client/.
ENV DISPLAY=$DISPLAY
#CMD ["ros2", "run", "turtlesim", "turtlesim_node"]
WORKDIR turtle
CMD ["artefacts", "run", "basic_tests"]
