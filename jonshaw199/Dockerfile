# Stage 1: Build the React app
FROM node:18-alpine AS build

RUN apk update && apk add git

WORKDIR /

RUN git clone https://github.com/jonshaw199/jonshaw199.git

WORKDIR /jonshaw199

RUN npm install

RUN npm run build

# Stage 2: Serve the React app using nginx
FROM nginx:alpine

COPY --from=build /jonshaw199/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
