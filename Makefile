# General Makefile to manage all project services
# IMPORTANT: Command lines (like '@make ...') MUST be indented with a single TAB character, not spaces.

# Declare all targets as phony to avoid conflicts with filenames
.PHONY: n8n-up n8n-down n8n-start n8n-stop n8n-logs n8n-restart n8n-ps help

# Default target executed when you run `make`
.DEFAULT_GOAL := help

# --- n8n Service Commands ---

n8n-up: ## [N8N] Start the n8n stack
	@make -f makefile-n8n up

n8n-down: ## [N8N] Stop the n8n stack
	@make -f makefile-n8n down

n8n-start: n8n-up ## [N8N] Alias for 'n8n-up'

n8n-stop: n8n-down ## [N8N] Alias for 'n8n-down'

n8n-logs: ## [N8N] View logs from the n8n stack
	@make -f makefile-n8n logs

n8n-restart: ## [N8N] Restart the n8n stack
	@make -f makefile-n8n restart

n8n-ps: ## [N8N] List running n8n containers
	@make -f makefile-n8n ps

# --- General Commands ---

help: ## Display this help screen
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@perl -ne 'if (/^([a-zA-Z_-]+):.*?## (.*)\r?$$/) { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' Makefile

