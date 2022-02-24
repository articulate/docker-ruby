all: 2.5 2.6 2.7

2.5: 2.5-stretch-slim 2.5-stretch-slim-minimal 2.5-stretch-slim-qt

2.6: 2.6-stretch-slim 2.6-stretch-slim-minimal 2.6-stretch-slim-qt 2.6-bullseye-slim 2.6-bullseye-slim-minimal 2.6-bullseye-slim-qt

2.7: 2.7-buster-slim 2.7-buster-slim-minimal 2.7-buster-slim-qt

.PHONY: all 2.5 2.6 2.7

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

2.6-stretch-slim-qt:
	docker build -t local/articulate-ruby:2.6-stretch-slim-qt 2.6-stretch-slim-qt
.PHONY: 2.6-stretch-slim-qt

2.6-bullseye-slim:
	docker build -t local/articulate-ruby:2.6-bullseye-slim 2.6-bullseye-slim
.PHONY: 2.6-bullseye-slim

2.6-bullseye-slim-minimal:
	docker build -t local/articulate-ruby:2.6-bullseye-slim-minimal 2.6-bullseye-slim-minimal
.PHONY: 2.6-bullseye-slim-minimal

2.6-bullseye-slim-qt:
	docker build -t local/articulate-ruby:2.6-bullseye-slim-qt 2.6-bullseye-slim-qt
.PHONY: 2.6-bullseye-slim-qt

2.7-buster-slim:
	docker build -t local/articulate-ruby:2.7-buster-slim 2.7-buster-slim
.PHONY: 2.7-buster-slim

2.7-buster-slim-minimal:
	docker build -t local/articulate-ruby:2.7-buster-slim-minimal 2.7-buster-slim-minimal
.PHONY: 2.7-buster-slim-minimal

2.7-buster-slim-qt:
	docker build -t local/articulate-ruby:2.7-buster-slim-qt 2.7-buster-slim-qt
.PHONY: 2.7-buster-slim-qt
