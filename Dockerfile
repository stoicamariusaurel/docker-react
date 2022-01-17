FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
RUN npm i -D -–save-exact mini-css-extract-plugin@2.4.5

COPY . .
RUN npm run build
EXPOSE 80

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
