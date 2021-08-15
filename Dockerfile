#build the app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#move the compiled code to nginx container
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html