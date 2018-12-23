PWD := $(shell pwd)

server: vendor/bundle
	bundle exec jekyll server

vendor/bundle:
	bundle install --path vendor/bundle

.PHONY:	docker
docker:
	@echo Running Jekyll
	@docker kill jekyll 2> /dev/null || true
	@docker run -t --name jekyll --rm -v $(PWD):/usr/src/app -p 4000:4000 starefossen/github-pages 
