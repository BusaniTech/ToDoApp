# Stage 1: Build Stage
FROM node:14.15.0-alpine AS build

RUN RUN apk add --no-cache g++ make python3
WORKDIR /app
COPY . . 
RUN yarn install

# Stage 2: Production Stage
FROM node:14.15.0-alpine

WORKDIR /app
COPY --from=build /app /app
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
