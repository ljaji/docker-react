#FROM node:alpine as builder
FROM node:alpine

WORKDIR '/var/opt/react'

COPY package.json ./
RUN npm install

COPY . ./

CMD ["npm", "run", "start"]

#second section for multi-step container
FROM nginx
EXPOSE 80
COPY --from=0 /var/opt/react/build /usr/share/nginx/html