FROM osrf/ros:galactic-desktop
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade setuptools
RUN pip install artefacts-client --extra-index-url https://d5cw4z7oemmfd.cloudfront.net/pep503/ -U
ENV DISPLAY=$DISPLAY
WORKDIR turtle
COPY artefacts.yaml .
COPY launch_turtle.py .
COPY sample_node.py .
CMD artefacts run basic_tests
