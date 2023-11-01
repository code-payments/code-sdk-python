.PHONY: build test

build:
	@docker build -t code-wallet-python:test .

test: build
	@docker run --rm code-wallet-python:test