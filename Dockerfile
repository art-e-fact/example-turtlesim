FROM osrf/ros2:humble-desktop
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade setuptools
RUN pip install artefacts-cli
ENV DISPLAY=$DISPLAY
WORKDIR turtle
COPY artefacts.yaml .
COPY launch_turtle.py .
COPY sample_node.py .
CMD artefacts run basic_tests
