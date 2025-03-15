FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

COPY . .

# Production Image
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app .

RUN npm install -g node-red

EXPOSE 1880
CMD ["node-red", "--userDir", "/app"]
