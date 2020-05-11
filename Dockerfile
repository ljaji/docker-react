FROM node:alpine
WORKDIR '/var/opt/react'
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /var/opt/react/build/ /usr/share/nginx/html/.