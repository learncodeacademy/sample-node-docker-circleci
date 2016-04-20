#!/bin/bash
docker push willrstern/sample-node:staging

ssh deploy@107.170.19.19 << EOF
docker pull willrstern/sample-node:staging
docker stop web || true
docker rm web || true
docker rmi willrstern/sample-node:current || true
docker tag willrstern/sample-node:staging willrstern/sample-node:current
docker run -d --net app --restart always --name web -p 3000:3000 willrstern/sample-node:current
EOF
