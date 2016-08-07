Basic Jenkins Setup using Docker and managed through docker-compose.

- jenkins-master : Jenkins master server
- jenkins-nginx : Proxy / Load balancer infront of Jenkins master
- jenkins-data : For data (user, job, build & plugins) persitance on node.