# Articulate Ruby Images

## Ruby 2.7

### 2.7-buster-slim-minimal

This is our recommended build if you don't need `node`, `qt5`, `imagemagick` or `postgres-client`

### 2.7-buster-slim

This is our recommended build if you need any of the requirements not provided in `*-minimal`

- Node: Latest 12.x
- Postgres Client: Latest postgres-client in `buster`

## Ruby 2.6

### 2.6-stretch-slim-minimal

This is our recommended 2.6 build if you don't need `node`, `qt5`, `imagemagick` or `postgres-client`

### 2.6-stretch-slim

- Node: Latest 12.x
- Postgres Client: Latest 9.6.x

## Ruby 2.5

### 2.5-stretch-slim-minimal

This is our recommended 2.5 build if you don't need `node`, `qt5`, `imagemagick` or `postgres-client`

### 2.5-stretch-slim

- Node: Latest 12.x
- Postgres Client: Latest 9.6.x

## Ruby 2.4

*Ruby 2.4 is end of life, DO NOT USE*

### 2.4-alpine

- Node: uses the latest node available for alpine 3.7
- Postgres Client: uses the latest postgres-client available for alpine 3.7

### 2.4-stretch-slim

- Node: Latest 8.x
- Postgres Client: Latest 9.6.x

These are all built on Dockerhub as Automated Builds.
