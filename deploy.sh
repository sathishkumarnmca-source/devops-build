#!/bin/bash
docker stop react-app-container || true
docker rm react-app-container || true
docker run -d -p 80:80 --name react-app  react-app
