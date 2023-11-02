.PHONY: build example

build:
	@docker build -t code-wallet-python:example .

example: build
	@docker run --rm -p 3000:3000 code-wallet-python:example