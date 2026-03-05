FROM node:24-bookworm

WORKDIR /app

RUN apt-get update
RUN apt-get install git -yq

RUN git clone https://github.com/matrix-org/matrix.to

WORKDIR /app/matrix.to

RUN npm install

RUN npm run build

CMD ["npm", "start"]
