.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean: ## Clean up
	@echo "Cleaning up..."
	rm -rf node_modules

install: ## Install dependencies
	@echo "Installing npm modules..."
	@npm install

css: ## Update CSS
	@echo "Updating CSS..."
	@rm node_modules/markdown-resume/assets/css/*.css
	@cp resume.css node_modules/markdown-resume/assets/css

init: clean install css ## Install requirements

generate: ## Generate HTML + PDF versions of the resume
	@echo "Generating HTML..."
	@node node_modules/markdown-resume/bin/md2resume resume.md
	
