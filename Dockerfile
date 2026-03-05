FROM node:24-bookworm

WORKDIR /app

RUN apt-get update
RUN apt-get install git -yq

RUN git clone https://github.com/matrix-org/matrix.to

WORKDIR /app/matrix.to

# Replace the default redirect url to our self hosted instance
RUN sed -i 's/app.element.io/$ELEMENT_HOST_URL/g' src/open/clients/Element.js

RUN npm install

RUN npm run build

CMD ["npm", "start"]
