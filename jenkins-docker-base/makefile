build:
	@docker build -t zenjenkins jenkins-master/.
	@docker build -t zenjenkinsdata jenkins-data/.
	@docker build -t zenjenkinsnginx jenkins-nginx/.
run-data:
	@docker run --name=jenkins-data zenjenkinsdata
run:
	@docker run -p 50000:50000 --name=jenkins-master --volumes-from=jenkins-data -d zenjenkins
	@docker run -p 80:80 --name=jenkins-nginx --link jenkins-master:jenkins-master -d zenjenkinsnginx
stop:
	@docker stop jenkins-master
	@docker stop jenkins-nginx
clean:	stop
	@docker rm -v jenkins-master
	@docker rm -v jenkins-nginx
clean-data:  clean
	@docker rm -v jenkins-data
clean-images:
	@docker rmi $(docker images -q --filter="dangling=true")
