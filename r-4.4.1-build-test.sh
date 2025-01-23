#!/bin/bash
echo starting build and test of R container from image
if (docker run -it onsdigital/jenkins-r:4.4.1 /opt/R/4.4.1/bin/R --version) then
  echo "R container built and tested successfully"
else
  echo "R container build and test failed"
  exit 1
fi