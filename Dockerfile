FROM node:alpine as builder

WORKDIR /var/opt/react

COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "start"]

#second section for multi-step container
FROM nginx

COPY --from=builder /var/opt/react/build /usr/share/nginx/html

