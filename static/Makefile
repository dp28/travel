.PHONY: install clean start build deploy

export ENVIRONMENT ?= local

install: node_modules

clean:
	rm -rf node_modules build

start: node_modules
	npm start

build: node_modules
	npm run-script build

deploy: build
	aws s3 sync build/ s3://www.rndtravels.com --acl public-read

node_modules: package.json
	npm install
	touch node_modules
