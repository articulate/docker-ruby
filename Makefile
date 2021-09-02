all: 2.5-stretch-slim 2.5-stretch-slim-minimal 2.5-stretch-slim-qt 2.6-stretch-slim 2.6-stretch-slim-minimal 2.7-buster-slim 2.7-buster-slim-minimal

2.5-stretch-slim:
	docker build -t local/articulate-ruby:2.5-stretch-slim 2.5-stretch-slim
.PHONY: 2.5-stretch-slim

2.5-stretch-slim-minimal:
	docker build -t local/articulate-ruby:2.5-stretch-slim-minimal 2.5-stretch-slim-minimal
.PHONY: 2.5-stretch-slim-minimal

2.5-stretch-slim-qt:
	docker build -t local/articulate-ruby:2.5-stretch-slim-qt 2.5-stretch-slim-qt
.PHONY: 2.5-stretch-slim-qt

2.6-stretch-slim:
	docker build -t local/articulate-ruby:2.6-stretch-slim 2.6-stretch-slim
.PHONY: 2.6-stretch-slim

2.6-stretch-slim-minimal:
	docker build -t local/articulate-ruby:2.6-stretch-slim-minimal 2.6-stretch-slim-minimal
.PHONY: 2.6-stretch-slim-minimal

2.7-buster-slim:
	docker build -t local/articulate-ruby:2.7-buster-slim 2.7-buster-slim
.PHONY: 2.7-buster-slim

2.7-buster-slim-minimal:
	docker build -t local/articulate-ruby:2.7-buster-slim-minimal 2.7-buster-slim-minimal
.PHONY: 2.7-buster-slim-minimal
