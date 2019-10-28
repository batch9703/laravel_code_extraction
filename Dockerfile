# laravel install
FROM composer:1.9.0 as laravel

ARG LARAVEL_VER
RUN composer create-project --prefer-dist laravel/laravel laravel_pj "${LARAVEL_VER}"

# npm build
FROM node:12.11.0-alpine as node

COPY --from=laravel /app/laravel_pj/ /app/

RUN cd /app && npm install && npm run dev
