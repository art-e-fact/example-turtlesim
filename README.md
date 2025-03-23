# Turtlesim Demo Project

This project demonstrates how to run a basic ROS2 end-to-end test in simulation (here turtlesim).

This demo runs either natively or in containers. Native runs work only on Ubuntu version compatible with the tested ROS2 Humble versions (originally working with Galactic too). Container runs work on Linux, Darwin and Windows, with the later run in X11-compatible shells.

## Prerequisite

### Container for Linux/Darwin/Windows

* Container system: Docker (Podman coming)
* X11 window system, like XQuartz on Darwin and MobaXterm on Windows, configured to accept local network connections.

### Native for supported Ubuntu

This is tested and likely to work only on ROS2 Humble Ubuntu systems.

See instructions for example [here for Humble](https://docs.ros.org/en/humble/Installation.html)

## Usage

Usage assumes you clone this repository where you intend to run the demo:

    git clone https://github.com/art-e-fact/example-turtlesim.git
    cd example-turtlesim

From this point on, you can either run natively (supported Ubuntu versions only), or through containers.

### Native for supported Ubuntu

#### Preliminary: Direct test run

You can run the tests directly with:

```
launch_test launch_turtle.py
```

The test should succeed. One way to make it fail for demo purpose is to, say, increment by 0 the turtle velocity, so it never reaches the edge expeced by the test case (see line 19 in `sample_node.py`).

#### Tests with Artefacts

1. Create a free account and project on [Artefacts](https://app.artefacts.com)
2. Install the Artefacts CLI: `pip3 install artefacts-cli`
3. Edit the project name in `artefacts.yaml` to the name of your project in Artefacts (step 1).
4. Run the tests with tracking enabled: `artefacts run basic_tests`
5. Results and detail should shortly be available in your Artefacts dashboard.

### Container runs

Runs should work out of the box, assuming complete X11 configuration:

    artefacts run --in-container basic_tests

This command will build any missing image before running a container. 
