#!/bin/bash
docker push willrstern/sample-node

ssh deploy@159.203.127.59 << EOF
docker pull willrstern/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi willrstern/sample-node:current || true
docker tag willrstern/sample-node:latest willrstern/sample-node:current
docker run -d --net app --restart always --name web -p 3000:3000 willrstern/sample-node:current
EOF
