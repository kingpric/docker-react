FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# builded file will be located 
# at /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
