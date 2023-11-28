# Bidirectional RRT* Path Planning with MATLAB

## Overview

This MATLAB code implements a bidirectional RRT* (Rapidly-exploring Random Tree) path planning algorithm for unmanned aerial vehicles (UAVs). The bidirectional RRT* algorithm explores paths from both the start and goal positions simultaneously, aiming to find an optimized collision-free path.

## Files

1. `PEARRTstarclass.m`: MATLAB class containing the implementation of the bidirectional RRT* algorithm.
2. `Map.m`: MATLAB class for global map representation, including methods for loading maps, generating occupancy maps, and visualizing the UAV's field of view.
3. `main_plan.m`: Example script demonstrating the usage of the PEA-RRT* algorithm 
4. `UAVSpec.m`: Contains the specifications of the UAV
## Usage

1. **Requirements:** MATLAB R2019b or later.

2. **How to Run:**
    - Open MATLAB and navigate to the directory containing the code.
    - Run `main_plan.m` 

3. **Visualization:**
    - The code includes visualization methods for the final optimized path and the expansion of trees from both the start and goal sides.

## Map Class

The `Map` class is responsible for map representation, loading images, generating occupancy maps, and visualizing the UAV's field of view. It includes a method (`plot_trees_expansion`) to visualize the expansion of trees during the bidirectional RRT* algorithm.

## PEARRTstarclass

This class extends the `RRTStarClass` and includes methods for PEA planning. It utilizes the `Map` class for map representation and visualization.

## Here is the link for video:
    https://youtu.be/LT7RdGUbrHc

