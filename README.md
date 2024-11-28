# Minimal dockerfiles for running a basic LLM locally

Run llamafile in a minimalistic podman container.

## cpu-only

The cpu-only version has *nothing* but busybox.
Usage:  
1. copy some llamafile to ./models/ from https://github.com/Mozilla-Ocho/llamafile  
2. (check if filenames need hardcoding)  
3. sh start.sh  

## nvidia

Usage:
1. nvidia-ctk stuff, see gpu/start\_gpu.sh
2. cd gpu ; ./start\_gpu.sh

