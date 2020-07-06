# Build Stage
FROM node:alpine as buildStage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Run Stage
FROM nginx
COPY --from=buildStage /app/build /usr/share/nginx/html
## nginx automatically starts up