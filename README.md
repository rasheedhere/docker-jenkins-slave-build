# Jenkins Slave with build tools

A Jenkins slave image that can build docker images and includes additional tools used for building

**Includes**:
- Everything from `loyaltyone/jenkins-slave`
- SBT (1.1.0)
- Maven (3.3.9)
- Node (8.1.3, 6.11.0 (default))
- Node Packages: gulp, ecs-service

## Building Docker images

To build docker images with this slave, you must mount `/var/run/docker.sock` from your host
to the same path in the container

### Permissions

To give the jenkins user in the container access to the `docker.sock` you must supply an environment variable:

- **LOCAL_USER_GID** - Specify the GID of the docker group on the host. The jenkins user will be granted access to the `docker.sock`.

*note*: The container must be started as root. It will then downgrade to the `jenkins` user with non-root privileges.


# Tags

**0.1**

- SBT (0.13.15)
- Maven (3.3.9)
- Node (8.1.3, 6.11.0 (default))
- Node Packages: gulp, ecs-service
