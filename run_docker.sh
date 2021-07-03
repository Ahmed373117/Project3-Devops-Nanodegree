#!/bin/bash
docker build -t house_prediction .
docker image ls
docker run -p 8000:80 house_prediction