FROM node:24-slim

LABEL maintainer="it241509@ustp-students.at"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

WORKDIR /usr/src/app

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

RUN npm i -g typeorm

COPY package.json ./
COPY pnpm-lock.yaml ./

RUN pnpm i --frozen-lockfile

COPY . .

RUN pnpm build
