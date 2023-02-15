FROM node:16.10 AS build

WORKDIR /build

COPY tsconfig*.json package*.json ./

RUN npm install

COPY . ./

RUN npm run build


FROM nginx

COPY --from=build /build/dist/document-management /usr/share/nginx/html

EXPOSE 80
