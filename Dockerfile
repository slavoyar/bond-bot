FROM node:18-alpine

WORKDIR /app

COPY . .
RUN npm install --frozen-lockfile && npm install -g node-red

EXPOSE 1880
EXPOSE 8443
CMD ["node-red", "--userDir", "/app"]
