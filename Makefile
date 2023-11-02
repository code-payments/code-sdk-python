.PHONY: build test package publish

PYPI_TOKEN := $(shell cat .pypi_token)

build:
	@docker build -t code-wallet-python:latest .

test: build
	@docker run --rm code-wallet-python:latest

package:
	@mkdir -p dist
	@docker run --rm -v ${PWD}:/app -v ${PWD}/dist:/app/dist code-wallet-python:latest python /app/setup.py sdist bdist_wheel

publish: build test package
	@docker run --rm -e PYPI_TOKEN=${PYPI_TOKEN} -v ${PWD}/dist:/app/dist code-wallet-python:latest /bin/sh -c "/app/setup-pypirc.sh && twine upload dist/*"