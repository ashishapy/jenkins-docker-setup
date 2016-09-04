build:
	@docker-compose build --pull
run:
	@docker-compose up -d --build
initialAdminPassword:
	@docker-compose exec jenkinsmaster cat /var/jenkins_home/secrets/initialAdminPassword
stop:
	@docker-compose stop
clean:
	@docker-compose down
clean-data: clean
	@docker-compose down -v
clean-images:
	@docker rmi $(docker images -q -f "dangling=true")