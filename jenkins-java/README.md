Jenkins Setup for **Java project** using Docker and managed through docker-compose.

- jenkins-master : Jenkins master server with **docker**, **docker-compose** and **maven**
- jenkins-nginx : Proxy / Load balancer infront of Jenkins master
- jenkins-data : For data (user, job, build & plugins) persitance on node.