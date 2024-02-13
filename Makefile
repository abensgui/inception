all:
	docker-compose -f srcs/docker-compose.yml up --build

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean: clean
	docker system prune --all -f
	rm -rf /home/abensgui/data/wordpress /home/abensgui/data/mariadb
	mkdir /home/abensgui/data/wordpress /home/abensgui/data/mariadb
	
re: fclean all