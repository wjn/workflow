# Build Stage
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Run Stage
FROM nginx
# Elastic Beanstalk looks for Expose instruction and maps automatically
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
## nginx automatically starts up