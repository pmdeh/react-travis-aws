# The first step for building the image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

# The second step 
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/htmldo