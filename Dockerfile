FROM quay.io/mohamedf0/node:16.10 AS build

WORKDIR /build

COPY tsconfig*.json package*.json ./

RUN npm install

COPY . ./

RUN npm run build


FROM quay.io/mohamedf0/serve

COPY --from=build /build/dist/document-management /app

CMD ["serve", "-s", "-p", "80", "/app"]

EXPOSE 80
