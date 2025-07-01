FROM osrf/ros:jazzy-simulation

RUN apt-get update && apt-get install --yes --no-install-recommends \
    python3-venv \
    ros-jazzy-turtlesim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

RUN pip install numpy
RUN pip install artefacts-cli

ENV DISPLAY=$DISPLAY

COPY artefacts.yaml .
COPY launch_turtle.py .
COPY sample_node.py .

CMD artefacts run basic_tests
