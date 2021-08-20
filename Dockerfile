#build the app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#move the compiled code to nginx container
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html