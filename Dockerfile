FROM node:latest

COPY index.js /app/index.js
COPY package.json /app/package.json
COPY views /app/views
COPY uploads /app/uploads
COPY flag.txt /flag.txt

RUN chown -R node:node /app/uploads

WORKDIR /app
RUN npm i

USER node
CMD [ "node", "index.js" ]
