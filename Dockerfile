FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#app/build



FROM nginx
EXPOSE 80
#--from : copy something from different phase  (in this case the phase above below one)
COPY --from=builder /app/build /usr/share/nginx/html