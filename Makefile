all: 2.7 3.1 3.2

2.7: 2.7-buster-slim 2.7-buster-slim-minimal 2.7-buster-slim-qt 2.7-bullseye-slim 2.7-bullseye-slim-qt

3.1: 3.1-bullseye-slim 3.1-bullseye-slim-minimal 3.1-bullseye-slim-qt

3.2: 3.2-bullseye-slim 3.2-bullseye-slim-minimal 3.2-bullseye-slim-qt

.PHONY: all 2.7 3.1 3.2

2.7-buster-slim:
	docker build -t articulate/articulate-ruby:2.7-buster-slim 2.7-buster-slim
.PHONY: 2.7-buster-slim

2.7-buster-slim-minimal:
	docker build -t articulate/articulate-ruby:2.7-buster-slim-minimal 2.7-buster-slim-minimal
.PHONY: 2.7-buster-slim-minimal

2.7-buster-slim-qt:
	docker build -t articulate/articulate-ruby:2.7-buster-slim-qt 2.7-buster-slim-qt
.PHONY: 2.7-buster-slim-qt

2.7-bullseye-slim:
	docker build -t articulate/articulate-ruby:2.7-bullseye-slim 2.7-bullseye-slim
.PHONY: 2.7-bullseye-slim

2.7-bullseye-slim-qt:
	docker build -t articulate/articulate-ruby:2.7-bullseye-slim-qt 2.7-bullseye-slim-qt
.PHONY: 2.7-bullseye-slim-qt

3.1-bullseye-slim:
	docker build -t articulate/articulate-ruby:3.1-bullseye-slim 3.1-bullseye-slim
.PHONY: 3.1-bullseye-slim

3.1-bullseye-slim-minimal:
	docker build -t articulate/articulate-ruby:3.1-bullseye-slim-minimal 3.1-bullseye-slim-minimal
.PHONY: 3.1-bullseye-slim-minimal

3.1-bullseye-slim-qt:
	docker build -t articulate/articulate-ruby:3.1-bullseye-slim-qt 3.1-bullseye-slim-qt
.PHONY: 3.1-bullseye-slim-qt

3.2-bullseye-slim:
	docker build -t articulate/articulate-ruby:3.2-bullseye-slim 3.2-bullseye-slim
.PHONY: 3.2-bullseye-slim

3.2-bullseye-slim-minimal:
	docker build -t articulate/articulate-ruby:3.2-bullseye-slim-minimal 3.2-bullseye-slim-minimal
.PHONY: 3.2-bullseye-slim-minimal

3.2-bullseye-slim-qt:
	docker build -t articulate/articulate-ruby:3.2-bullseye-slim-qt 3.2-bullseye-slim-qt
.PHONY: 3.2-bullseye-slim-qt
