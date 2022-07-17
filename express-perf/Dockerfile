FROM node:lts AS builder
ADD . /app
WORKDIR /app
RUN npm ci --only=production

# Copy application with its dependencies into distroless image
FROM node:lts-buster-slim
COPY --from=builder /app /app
WORKDIR /app
CMD ["server.js"]