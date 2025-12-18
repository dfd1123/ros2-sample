help:
	@awk 'BEGIN {FS = ":.*?## "}; /^[a-zA-Z0-9_.-]+:.*?## / {printf "  \033[36m%-28s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

ros2-bash: ## ros2 컨테이너로 접근
	docker compose exec ros2 bash

dev: ## docker compose up
	docker compose up

dev-build: ## docker compose up --build
	docker compose up --build