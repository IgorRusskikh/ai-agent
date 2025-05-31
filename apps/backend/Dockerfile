FROM node:20-alpine AS base

WORKDIR /app

COPY package*.json ./
COPY apps/backend/package*.json ./apps/backend/

RUN npm ci --only=production && npm cache clean --force

FROM node:20-alpine AS build

WORKDIR /app

COPY . .

RUN npm ci

RUN npx nx build @ai-agent/backend

FROM node:20-alpine AS production

WORKDIR /app

RUN addgroup -g 1001 -S nodejs
RUN adduser -S nestjs -u 1001

COPY --from=base /app/node_modules ./node_modules

COPY --from=build /app/apps/backend/dist ./apps/backend/dist
COPY --from=build /app/apps/backend/package.json ./apps/backend/package.json

COPY --from=build /app/apps/backend/prisma ./apps/backend/prisma

RUN chown -R nestjs:nodejs /app
USER nestjs

EXPOSE 3000

WORKDIR /app/apps/backend

CMD ["node", "dist/main.js"] 