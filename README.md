# PEA_RRT* Algorithm Project

This repository contains the implementation of the PEA_RRT* (Probabilistic Roadmap-based Rapidly-exploring Random Tree) algorithm for the AI term paper under Dr Shashi Shekher Jha.

## Table of Contents

- [Introduction](#introduction)
- [Algorithm Overview](#algorithm-overview)
- [Implementation Details](#implementation-details)
- [Usage](#usage)




## Introduction

This project implements the PEA_RRT* algorithm, a variant of the RRT* algorithm, designed for unmanned vehicles especially UAVs

## Algorithm Overview

The Probabilistic Roadmap-based Rapidly-exploring Random Tree (PEA_RRT*) algorithm is an extension of the classic RRT* algorithm. It is known for its efficiency in solving path planning problems in various applications.
It is perception and energy aware RRT* algorithm

## Implementation Details

The code is implemented in Matlab as an extension of code provided by the paper :
R. Takemura, N. Aoki, and G. Ishigami, “Energy-and-perception-aware
planning and navigation framework for unmanned aerial vehicles,”
Advances in Mechanical Engineering, vol. 15, no. 4, 2023


## Usage

[Explain how to use or integrate the PEA_RRT* algorithm into your project. Include code snippets or usage instructions.]

```run main_plan.m```
Run main_plan.m and PEA-RRT* will come up with a perceptionally and energetically optimal path for the UAVs
Make sure to add UAVspec.m , Map.m and RRTStarClass.m from the R. Takemura code

