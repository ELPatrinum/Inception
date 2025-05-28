# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: muel-bak <muel-bak@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/28 09:05:58 by muel-bak          #+#    #+#              #
#    Updated: 2025/05/28 09:05:59 by muel-bak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

init:
	mkdir -p ./srcs/secrets
	bash ./srcs/tools/init_secrets.sh

up: init build
	docker-compose -f ./srcs/docker-compose.yml up -d

build: init
	mkdir -p /home/$(USER)/data/db /home/$(USER)/data/www /home/$(USER)/data/redis /home/$(USER)/data/static
	docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune -f
	rm -rf /home/$(USER)/data/db/* /home/$(USER)/data/www/* /home/$(USER)/data/redis/* /home/$(USER)/data/static/*

fclean: clean
	docker volume rm $(docker volume ls -q)

re: fclean all