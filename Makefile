DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

.PHONY: up kill down clean fclean restart build

up:
	@echo "Creating data directories..."
	mkdir -p /home/elpatrinum/data/mysql
	mkdir -p /home/elpatrinum/data/wordpress
	@echo "Starting containers..."
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build -d

kill:
	@echo "Stopping containers forcefully..."
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) kill

down:
	@echo "Stopping and removing containers..."
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean:
	@echo "Stopping containers and removing volumes..."
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v

fclean: clean
	@echo "Removing data directories..."
	rm -rf /home/elpatrinum/data/mysql
	rm -rf /home/elpatrinum/data/wordpress
	@echo "Pruning Docker system..."
	docker system prune -a -f

restart: clean up
	@echo "Restarting containers..."
