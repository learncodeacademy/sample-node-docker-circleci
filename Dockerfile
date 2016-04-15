FROM mhart/alpine-node:5.6.0

EXPOSE 3000
WORKDIR /app
ENV NODE_ENV production

# add package.json and run npm install before adding the rest of the files
# this way, you only run npm install when package.json changes
ADD package.json /app
RUN npm install

# add the rest of the files
ADD . /app

CMD ["node", "server.js"]
