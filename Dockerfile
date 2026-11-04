FROM dhi.io/node:24-alpine3.22-dev AS builder

WORKDIR /app

COPY app/package.json app/yarn.lock ./

RUN corepack enable && yarn install --frozen-lockfile

COPY app/ ./

RUN yarn build

FROM dhi.io/nginx:1.28.0-alpine3.21-dev AS runner


COPY nginx/default.conf /etc/nginx/conf.d/default.conf


COPY --from=builder /app/build/ /usr/share/nginx/html/

USER 65532

EXPOSE 8080


CMD ["nginx", "-g", "daemon off;"]

