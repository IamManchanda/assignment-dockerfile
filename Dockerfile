# fill in the blanks to dockerize this node app
FROM node:12.17-alpine

EXPOSE 3000

RUN apk add --no-cache tini

WORKDIR /app

COPY package.json package-lock*.json ./

RUN npm install && npm cache clean --force

COPY . .

ENTRYPOINT ["tini", "--"]

CMD ["node", "app.js"]
