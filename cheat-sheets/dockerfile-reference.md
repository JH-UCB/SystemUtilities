# Dockerfile Reference Table

## Base Image Instructions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `FROM image:tag` | Sets base image for build | `FROM ubuntu:22.04` |
| `FROM image@digest` | Uses specific image digest | `FROM ubuntu@sha256:abcd1234...` |
| `FROM image:tag AS stage` | Names build stage for multi-stage builds | `FROM node:18 AS builder` |
| `FROM scratch` | Empty base image for minimal containers | `FROM scratch` |
| `FROM --platform=linux/amd64` | Specifies target platform | `FROM --platform=linux/arm64 ubuntu:22.04` |

## File and Directory Operations

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `COPY source dest` | Copies files/directories from build context | `COPY package.json /app/` |
| `COPY --chown=user:group` | Copies with ownership | `COPY --chown=node:node . /app` |
| `COPY --from=stage` | Copies from another build stage | `COPY --from=builder /app/dist /usr/share/nginx/html` |
| `COPY --chmod=permissions` | Copies with specific permissions | `COPY --chmod=755 script.sh /usr/local/bin/` |
| `COPY . .` | Copies entire context to workdir | `COPY . .` |
| `COPY ["src", "dest"]` | JSON form for paths with spaces | `COPY ["my file.txt", "/app/"]` |
| `ADD source dest` | Copies files with URL/tar support | `ADD app.tar.gz /app/` |
| `ADD --chown=user:group` | Adds with ownership | `ADD --chown=www-data:www-data src/ /var/www/` |
| `ADD URL dest` | Downloads file from URL | `ADD https://example.com/file.tar.gz /tmp/` |
| `WORKDIR /path` | Sets working directory | `WORKDIR /app` |
| `WORKDIR $VAR` | Uses variable for workdir | `WORKDIR ${APP_HOME}` |

## Environment and Configuration

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `ENV key=value` | Sets environment variable | `ENV NODE_ENV=production` |
| `ENV key value` | Alternative syntax (deprecated) | `ENV NODE_ENV production` |
| `ENV key1=value1 key2=value2` | Multiple variables | `ENV PORT=3000 HOST=0.0.0.0` |
| `ARG name` | Declares build argument | `ARG VERSION` |
| `ARG name=default` | Build argument with default | `ARG NODE_VERSION=18` |
| `ARG --from=stage name` | Uses arg from previous stage | `ARG --from=builder APP_VERSION` |
| `EXPOSE port` | Documents exposed port | `EXPOSE 80` |
| `EXPOSE port/protocol` | Specifies protocol | `EXPOSE 80/tcp 53/udp` |
| `VOLUME ["/path"]` | Creates mount point | `VOLUME ["/data"]` |
| `VOLUME /path` | Alternative syntax | `VOLUME /var/lib/mysql` |

## User and Permissions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `USER username` | Sets user for RUN, CMD, ENTRYPOINT | `USER node` |
| `USER uid` | Sets user by UID | `USER 1000` |
| `USER username:group` | Sets user and group | `USER www-data:www-data` |
| `USER uid:gid` | Sets by numeric IDs | `USER 1000:1000` |
| `RUN useradd` | Creates new user | `RUN useradd -m -s /bin/bash appuser` |
| `RUN groupadd` | Creates new group | `RUN groupadd -g 1001 appgroup` |
| `RUN chown` | Changes ownership | `RUN chown -R node:node /app` |
| `RUN chmod` | Changes permissions | `RUN chmod +x /entrypoint.sh` |

## Execution Instructions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `RUN command` | Executes command during build | `RUN apt-get update && apt-get install -y curl` |
| `RUN ["executable", "param"]` | Exec form (no shell) | `RUN ["apt-get", "install", "-y", "curl"]` |
| `RUN --mount=type=cache` | Uses build cache mount | `RUN --mount=type=cache,target=/root/.cache pip install -r requirements.txt` |
| `RUN --mount=type=bind` | Mounts file/directory during build | `RUN --mount=type=bind,source=.,target=/src make build` |
| `RUN --mount=type=secret` | Mounts secret during build | `RUN --mount=type=secret,id=aws,target=/root/.aws/credentials aws s3 cp ...` |
| `RUN --mount=type=ssh` | Mounts SSH agent socket | `RUN --mount=type=ssh git clone git@github.com:user/repo.git` |
| `RUN --network=none` | Disables network for command | `RUN --network=none make build` |
| `RUN --security=insecure` | Runs with elevated privileges | `RUN --security=insecure cat /proc/self/status` |
| `CMD ["executable","param"]` | Default command (exec form) | `CMD ["nginx", "-g", "daemon off;"]` |
| `CMD command param` | Default command (shell form) | `CMD npm start` |
| `CMD ["param1","param2"]` | Default parameters for ENTRYPOINT | `CMD ["--help"]` |
| `ENTRYPOINT ["executable"]` | Configures container executable | `ENTRYPOINT ["docker-entrypoint.sh"]` |
| `ENTRYPOINT command` | Shell form entrypoint | `ENTRYPOINT exec java -jar app.jar` |
| `SHELL ["shell", "param"]` | Changes default shell | `SHELL ["/bin/bash", "-c"]` |

## Metadata Instructions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `LABEL key=value` | Adds metadata to image | `LABEL version="1.0"` |
| `LABEL key1=value1 key2=value2` | Multiple labels | `LABEL maintainer="user@example.com" version="1.0"` |
| `LABEL multi.line="value"` | Multi-line label | `LABEL description="This is a \nmulti-line description"` |
| `LABEL "key"="value"` | Quoted keys for special chars | `LABEL "com.example.vendor"="ACME Inc"` |
| `MAINTAINER name` | Sets maintainer (deprecated) | `MAINTAINER John Doe <john@example.com>` |

## Multi-stage Build Instructions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `FROM image AS stage` | Names build stage | `FROM maven:3.8 AS builder` |
| `COPY --from=stage` | Copies from named stage | `COPY --from=builder /app/target/*.jar app.jar` |
| `COPY --from=0` | Copies from stage by index | `COPY --from=0 /app/dist /usr/share/nginx/html` |
| `COPY --from=image` | Copies from external image | `COPY --from=nginx:latest /etc/nginx/nginx.conf /etc/nginx/` |
| `RUN --mount=from=stage` | Mounts from another stage | `RUN --mount=from=builder,source=/app,target=/tmp/app cp -r /tmp/app/* .` |
| `ARG --from=stage` | Uses ARG from previous stage | `ARG --from=builder VERSION` |

## Health Check Instructions

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `HEALTHCHECK CMD command` | Defines health check command | `HEALTHCHECK CMD curl -f http://localhost/ || exit 1` |
| `HEALTHCHECK --interval=30s` | Sets check interval | `HEALTHCHECK --interval=30s CMD wget --spider http://localhost` |
| `HEALTHCHECK --timeout=3s` | Sets timeout for check | `HEALTHCHECK --timeout=3s CMD curl -f http://localhost/health` |
| `HEALTHCHECK --start-period=40s` | Grace period for startup | `HEALTHCHECK --start-period=40s CMD nc -z localhost 3000` |
| `HEALTHCHECK --retries=3` | Number of retries before unhealthy | `HEALTHCHECK --retries=3 CMD pg_isready -U postgres` |
| `HEALTHCHECK NONE` | Disables health check | `HEALTHCHECK NONE` |

## Build Context and .dockerignore

| Pattern | Description | Example Usage |
|---------|-------------|---------------|
| `pattern` | Excludes files matching pattern | `*.log` |
| `!pattern` | Exception to exclusion rule | `!important.log` |
| `*/pattern` | Matches in any direct subdirectory | `*/temp*` |
| `**pattern` | Matches in any subdirectory | `**/*.cache` |
| `pattern/` | Excludes directories only | `node_modules/` |
| `#comment` | Comments in .dockerignore | `# Ignore all log files` |

## Build Arguments and Cache Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `docker build --build-arg` | Passes build argument | `docker build --build-arg VERSION=1.0 .` |
| `docker build --no-cache` | Builds without cache | `docker build --no-cache -t myapp .` |
| `docker build --target` | Builds specific stage | `docker build --target builder -t myapp:builder .` |
| `docker build --cache-from` | Uses external cache source | `docker build --cache-from myapp:latest -t myapp:new .` |
| `docker build --secret` | Passes secret to build | `docker build --secret id=aws,src=$HOME/.aws/credentials .` |
| `docker build --ssh` | Forwards SSH agent | `docker build --ssh default .` |
| `docker build --platform` | Builds for specific platform | `docker build --platform linux/amd64,linux/arm64 .` |
| `docker buildx` | Extended build capabilities | `docker buildx build --push --platform linux/amd64,linux/arm64 .` |

## Best Practices Examples

| Practice | Description | Example |
|----------|-------------|---------|
| Minimize layers | Combine RUN commands | `RUN apt-get update && \`<br>`    apt-get install -y curl git && \`<br>`    rm -rf /var/lib/apt/lists/*` |
| Order for caching | Static content first | `COPY package*.json ./`<br>`RUN npm ci`<br>`COPY . .` |
| Non-root user | Security best practice | `RUN useradd -m appuser`<br>`USER appuser` |
| Multi-stage builds | Reduce image size | `FROM node:18 AS builder`<br>`COPY . .`<br>`RUN npm run build`<br><br>`FROM nginx:alpine`<br>`COPY --from=builder /app/dist /usr/share/nginx/html` |
| Specific tags | Avoid latest tag | `FROM node:18.17.1-alpine3.18` |
| Clean up in same layer | Reduce image size | `RUN apt-get update && \`<br>`    apt-get install -y build-essential && \`<br>`    make && \`<br>`    apt-get remove -y build-essential && \`<br>`    apt-get autoremove -y` |
| Use .dockerignore | Exclude unnecessary files | `.git`<br>`.gitignore`<br>`README.md`<br>`node_modules`<br>`.env` |
| COPY vs ADD | Prefer COPY unless extracting | `COPY app.jar /app/` (not ADD) |
| Explicit EXPOSE | Document ports | `EXPOSE 8080` |
| Exec form for CMD | Proper signal handling | `CMD ["node", "server.js"]` (not `CMD node server.js`) |