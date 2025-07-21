# Docker Commands Reference Table

## Docker System and Information

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker version` | Shows Docker version information | `docker version` |
| `docker info` | Displays system-wide information | `docker info` |
| `docker system df` | Shows Docker disk usage | `docker system df` |
| `docker system prune` | Removes unused data | `docker system prune` |
| `docker system prune -a` | Removes all unused images | `docker system prune -a --volumes` |
| `docker events` | Shows real-time events | `docker events` |
| `docker events --filter` | Filters events | `docker events --filter type=container` |
| `docker stats` | Shows container resource usage | `docker stats` |
| `docker stats --no-stream` | Shows stats without streaming | `docker stats --no-stream` |
| `docker top` | Shows running processes in container | `docker top container_name` |

## Image Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker images` | Lists images | `docker images` |
| `docker images -a` | Lists all images (including intermediates) | `docker images -a` |
| `docker images -q` | Lists only image IDs | `docker images -q` |
| `docker image ls` | Lists images (new syntax) | `docker image ls` |
| `docker image history` | Shows image history | `docker image history nginx:latest` |
| `docker image inspect` | Shows detailed image information | `docker image inspect nginx:latest` |
| `docker pull` | Downloads image from registry | `docker pull nginx:latest` |
| `docker pull --all-tags` | Downloads all tagged images | `docker pull --all-tags ubuntu` |
| `docker push` | Uploads image to registry | `docker push myuser/myimage:tag` |
| `docker build` | Builds image from Dockerfile | `docker build -t myapp:latest .` |
| `docker build -f` | Builds from specific Dockerfile | `docker build -f Dockerfile.prod -t myapp:prod .` |
| `docker build --no-cache` | Builds without using cache | `docker build --no-cache -t myapp:latest .` |
| `docker build --build-arg` | Sets build-time variables | `docker build --build-arg VERSION=1.0 -t myapp .` |
| `docker tag` | Creates tag for image | `docker tag myapp:latest myapp:v1.0` |
| `docker rmi` | Removes image | `docker rmi nginx:latest` |
| `docker rmi -f` | Force removes image | `docker rmi -f nginx:latest` |
| `docker image prune` | Removes dangling images | `docker image prune` |
| `docker image prune -a` | Removes all unused images | `docker image prune -a` |
| `docker save` | Saves image to tar archive | `docker save -o nginx.tar nginx:latest` |
| `docker load` | Loads image from tar archive | `docker load -i nginx.tar` |
| `docker import` | Creates image from tarball | `docker import container.tar mynewimage` |
| `docker export` | Exports container to tarball | `docker export container_id > container.tar` |

## Container Lifecycle Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker run` | Creates and starts container | `docker run nginx` |
| `docker run -d` | Runs container in background | `docker run -d nginx` |
| `docker run -it` | Runs interactive container | `docker run -it ubuntu bash` |
| `docker run --name` | Assigns name to container | `docker run --name webserver nginx` |
| `docker run -p` | Maps port | `docker run -p 8080:80 nginx` |
| `docker run -P` | Maps all exposed ports | `docker run -P nginx` |
| `docker run -v` | Mounts volume | `docker run -v /host/path:/container/path nginx` |
| `docker run --mount` | Mounts volume (new syntax) | `docker run --mount source=myvol,target=/data nginx` |
| `docker run -e` | Sets environment variable | `docker run -e MYSQL_ROOT_PASSWORD=secret mysql` |
| `docker run --env-file` | Sets environment from file | `docker run --env-file .env myapp` |
| `docker run --rm` | Removes container after exit | `docker run --rm ubuntu echo "Hello"` |
| `docker run --restart` | Sets restart policy | `docker run --restart=always nginx` |
| `docker run --network` | Connects to network | `docker run --network=mynet nginx` |
| `docker run --link` | Links containers (deprecated) | `docker run --link db:database webapp` |
| `docker run --memory` | Sets memory limit | `docker run --memory="1g" nginx` |
| `docker run --cpus` | Sets CPU limit | `docker run --cpus="1.5" nginx` |
| `docker create` | Creates container without starting | `docker create --name mycontainer nginx` |
| `docker start` | Starts stopped container | `docker start mycontainer` |
| `docker start -a` | Starts and attaches to container | `docker start -a mycontainer` |
| `docker stop` | Stops running container | `docker stop mycontainer` |
| `docker stop -t` | Stops with timeout | `docker stop -t 30 mycontainer` |
| `docker restart` | Restarts container | `docker restart mycontainer` |
| `docker pause` | Pauses container | `docker pause mycontainer` |
| `docker unpause` | Unpauses container | `docker unpause mycontainer` |
| `docker kill` | Force stops container | `docker kill mycontainer` |
| `docker rm` | Removes container | `docker rm mycontainer` |
| `docker rm -f` | Force removes running container | `docker rm -f mycontainer` |
| `docker rm -v` | Removes container and volumes | `docker rm -v mycontainer` |

## Container Inspection and Interaction

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker ps` | Lists running containers | `docker ps` |
| `docker ps -a` | Lists all containers | `docker ps -a` |
| `docker ps -q` | Lists only container IDs | `docker ps -q` |
| `docker ps --filter` | Filters container list | `docker ps --filter status=exited` |
| `docker ps --format` | Formats output | `docker ps --format "table {{.Names}}\t{{.Status}}"` |
| `docker container ls` | Lists containers (new syntax) | `docker container ls` |
| `docker inspect` | Shows detailed container info | `docker inspect mycontainer` |
| `docker inspect -f` | Formats inspect output | `docker inspect -f '{{.State.Running}}' mycontainer` |
| `docker logs` | Shows container logs | `docker logs mycontainer` |
| `docker logs -f` | Follows log output | `docker logs -f mycontainer` |
| `docker logs --tail` | Shows last N lines | `docker logs --tail 50 mycontainer` |
| `docker logs --since` | Shows logs since timestamp | `docker logs --since 2h mycontainer` |
| `docker exec` | Executes command in container | `docker exec mycontainer ls -la` |
| `docker exec -it` | Executes interactive command | `docker exec -it mycontainer bash` |
| `docker exec -u` | Executes as specific user | `docker exec -u root mycontainer whoami` |
| `docker attach` | Attaches to running container | `docker attach mycontainer` |
| `docker cp` | Copies files to/from container | `docker cp mycontainer:/path/to/file ./local/path` |
| `docker cp` | Copies from host to container | `docker cp ./local/file mycontainer:/path/to/dest` |
| `docker diff` | Shows filesystem changes | `docker diff mycontainer` |
| `docker port` | Shows port mappings | `docker port mycontainer` |
| `docker rename` | Renames container | `docker rename oldname newname` |
| `docker wait` | Waits for container to stop | `docker wait mycontainer` |
| `docker commit` | Creates image from container | `docker commit mycontainer mynewimage` |

## Volume Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker volume create` | Creates volume | `docker volume create myvolume` |
| `docker volume ls` | Lists volumes | `docker volume ls` |
| `docker volume inspect` | Shows volume details | `docker volume inspect myvolume` |
| `docker volume rm` | Removes volume | `docker volume rm myvolume` |
| `docker volume prune` | Removes unused volumes | `docker volume prune` |
| `docker run -v` | Mounts volume | `docker run -v myvolume:/data nginx` |
| `docker run -v` | Bind mounts directory | `docker run -v /host/path:/container/path nginx` |
| `docker run --mount` | Mounts with options | `docker run --mount type=bind,source=/host,target=/container nginx` |
| `docker run --volumes-from` | Mounts from another container | `docker run --volumes-from datacontainer webapp` |

## Network Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker network create` | Creates network | `docker network create mynetwork` |
| `docker network create --driver` | Creates with specific driver | `docker network create --driver bridge mybridge` |
| `docker network ls` | Lists networks | `docker network ls` |
| `docker network inspect` | Shows network details | `docker network inspect bridge` |
| `docker network rm` | Removes network | `docker network rm mynetwork` |
| `docker network prune` | Removes unused networks | `docker network prune` |
| `docker network connect` | Connects container to network | `docker network connect mynetwork mycontainer` |
| `docker network disconnect` | Disconnects from network | `docker network disconnect mynetwork mycontainer` |
| `docker run --network` | Runs container in network | `docker run --network=mynetwork nginx` |
| `docker run --net=host` | Uses host network | `docker run --net=host nginx` |
| `docker run --net=none` | Disables networking | `docker run --net=none nginx` |
| `docker port` | Shows port mappings | `docker port mycontainer` |

## Docker Compose

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker-compose up` | Creates and starts services | `docker-compose up` |
| `docker-compose up -d` | Starts services in background | `docker-compose up -d` |
| `docker-compose up --build` | Rebuilds images before starting | `docker-compose up --build` |
| `docker-compose up --scale` | Scales service instances | `docker-compose up --scale web=3` |
| `docker-compose down` | Stops and removes resources | `docker-compose down` |
| `docker-compose down -v` | Removes volumes too | `docker-compose down -v` |
| `docker-compose start` | Starts existing services | `docker-compose start` |
| `docker-compose stop` | Stops services | `docker-compose stop` |
| `docker-compose restart` | Restarts services | `docker-compose restart` |
| `docker-compose pause` | Pauses services | `docker-compose pause` |
| `docker-compose unpause` | Unpauses services | `docker-compose unpause` |
| `docker-compose ps` | Lists containers | `docker-compose ps` |
| `docker-compose logs` | Shows service logs | `docker-compose logs` |
| `docker-compose logs -f` | Follows log output | `docker-compose logs -f web` |
| `docker-compose exec` | Executes command in service | `docker-compose exec web bash` |
| `docker-compose run` | Runs one-off command | `docker-compose run web python manage.py migrate` |
| `docker-compose build` | Builds service images | `docker-compose build` |
| `docker-compose pull` | Pulls service images | `docker-compose pull` |
| `docker-compose push` | Pushes service images | `docker-compose push` |
| `docker-compose config` | Validates compose file | `docker-compose config` |
| `docker-compose kill` | Force stops services | `docker-compose kill` |
| `docker-compose rm` | Removes stopped containers | `docker-compose rm` |
| `docker-compose top` | Shows running processes | `docker-compose top` |

## Registry and Repository

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker login` | Logs into registry | `docker login` |
| `docker login -u` | Logs in with username | `docker login -u username` |
| `docker logout` | Logs out from registry | `docker logout` |
| `docker search` | Searches Docker Hub | `docker search nginx` |
| `docker search --filter` | Searches with filter | `docker search --filter stars=3 nginx` |
| `docker search --limit` | Limits search results | `docker search --limit 5 nginx` |
| `docker pull` | Downloads image | `docker pull nginx:latest` |
| `docker push` | Uploads image | `docker push myuser/myimage:tag` |
| `docker tag` | Tags image for registry | `docker tag myimage:latest myuser/myimage:v1.0` |

## Docker Swarm

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker swarm init` | Initializes swarm | `docker swarm init` |
| `docker swarm join` | Joins swarm as node | `docker swarm join --token TOKEN HOST:PORT` |
| `docker swarm leave` | Leaves swarm | `docker swarm leave` |
| `docker swarm update` | Updates swarm settings | `docker swarm update --autolock=true` |
| `docker node ls` | Lists swarm nodes | `docker node ls` |
| `docker node inspect` | Shows node details | `docker node inspect node-name` |
| `docker node update` | Updates node | `docker node update --availability drain node-name` |
| `docker service create` | Creates service | `docker service create --name web nginx` |
| `docker service ls` | Lists services | `docker service ls` |
| `docker service ps` | Shows service tasks | `docker service ps web` |
| `docker service scale` | Scales service | `docker service scale web=5` |
| `docker service update` | Updates service | `docker service update --image nginx:alpine web` |
| `docker service rm` | Removes service | `docker service rm web` |
| `docker stack deploy` | Deploys stack | `docker stack deploy -c docker-compose.yml mystack` |
| `docker stack ls` | Lists stacks | `docker stack ls` |
| `docker stack rm` | Removes stack | `docker stack rm mystack` |
| `docker secret create` | Creates secret | `docker secret create mysecret secret.txt` |
| `docker config create` | Creates config | `docker config create myconfig config.txt` |