FROM node:20-alpine AS build-stage
WORKDIR /app

COPY package*.json ./
RUN npm ci
RUN npm install -g @angular/cli
COPY . .
RUN npm run build --configuration=production

FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist/shop-app/browser /usr/share/nginx/html

EXPOSE 80

#docker build -t patrickdevcoffee/techx-frontend . 
#docker run --rm -d -p 8080:80 patrickdevcoffee/techx-frontend