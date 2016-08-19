build:
	@docker-compose build
run:
	@docker-compose up -d
initialAdminPassword:
	@docker-compose exec jenkinsmaster cat /var/jenkins_home/secrets/initialAdminPassword
stop:
	@docker-compose stop
clean:	stop
	@docker-compose rm jenkinsmaster jenkinsnginx
clean-data: clean
	@docker-compose rm -v jenkinsdata
clean-images:
	@docker rmi $(docker images -q -f "dangling=true")