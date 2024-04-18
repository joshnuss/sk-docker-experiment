FROM node:21-alpine AS builder
LABEL org.opencontainers.image.source="https://github.com/joshnuss/sk-docker-experiment"
WORKDIR /app
RUN npm install -g pnpm
COPY package.json .
COPY pnpm-lock.yaml .
RUN pnpm install
COPY . .
RUN pnpm prisma generate
RUN pnpm run build
RUN pnpm prune --production

FROM node:21-alpine
WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY package.json .
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "node", "build" ]
