# Articulate Ruby Images

## Ruby 2.7

### 2.7-bullseye-slim

Based off `ruby:2.7-slim-buster`.

- [consul bootstrap](https://github.com/articulate/docker-consul-template-bootstrap)
- Node 16.x
- Postgres Client
- ImageMagick

### 2.7-buster-slim-minimal

This is our recommended build if you don't need `node`, `imagemagick` or `postgres-client`

### 2.7-buster-slim

This is our recommended build if you need any of the requirements not provided in `*-minimal`

- Node: Latest 12.x
- Postgres Client: Latest postgres-client in `buster`

### 2.7-buster-slim-qt

This is our recommended build if you need any of the requirements not provided in `*-minimal` and also need `qt`

- Node: Latest 12.x
- Postgres Client: Latest postgres-client in `buster`

## Ruby 2.6

### 2.6-bullseye-slim-minimal

This is our recommended 2.6 build if you don't need `node`, `imagemagick` or `postgres-client`

### 2.6-bullseye-slim

- Node: Latest 16.x
- Postgres Client: Latest postgres-client in `bullseye`

### 2.6-bullseye-slim-qt

This is our recommended build if you need any of the requirements not provided in `*-minimal` and also need `qt`

## Ruby 2.5

### 2.5-stretch-slim-minimal

This is our recommended 2.5 build if you don't need `node`, `qt5`, `imagemagick` or `postgres-client`

### 2.5-stretch-slim

This is our recommended 2.5 build if you don't need `qt5` or `xvfb`

- Node: Latest 12.x
- Postgres Client: Latest 9.6.x

### 2.5-stretch-slim-qt

- Node: Latest 12.x
- Postgres Client: Latest 9.6.x
- QT: Latest available in stretch
