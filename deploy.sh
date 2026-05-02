#!/bin/bash
docker stop react-app-container || true
docker rm react-app-container || true
<<<<<<< HEAD
docker run -d -p 80:80 --name reactbuild  reactuild
=======
docker run -d -p 80:80 --name reactbuild-app  reactbuild-app
>>>>>>> origin/dev
