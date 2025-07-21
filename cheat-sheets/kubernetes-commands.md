# Kubernetes Commands Reference Table

## Cluster Information and Configuration

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl version` | Shows client and server version | `kubectl version --short` |
| `kubectl cluster-info` | Displays cluster information | `kubectl cluster-info` |
| `kubectl config view` | Shows merged kubeconfig settings | `kubectl config view` |
| `kubectl config get-contexts` | Lists available contexts | `kubectl config get-contexts` |
| `kubectl config current-context` | Shows current context | `kubectl config current-context` |
| `kubectl config use-context` | Switches context | `kubectl config use-context production` |
| `kubectl config set-context` | Sets context entry | `kubectl config set-context --current --namespace=dev` |
| `kubectl config set-cluster` | Sets cluster entry | `kubectl config set-cluster prod --server=https://1.2.3.4` |
| `kubectl config set-credentials` | Sets user entry | `kubectl config set-credentials user --token=bearer_token` |
| `kubectl api-resources` | Lists all resource types | `kubectl api-resources` |
| `kubectl api-versions` | Lists API versions | `kubectl api-versions` |
| `kubectl explain` | Shows resource documentation | `kubectl explain pod.spec.containers` |

## Resource Creation and Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl create` | Creates resource from file or stdin | `kubectl create -f pod.yaml` |
| `kubectl create deployment` | Creates deployment | `kubectl create deployment nginx --image=nginx` |
| `kubectl create service` | Creates service | `kubectl create service clusterip my-svc --tcp=80:8080` |
| `kubectl create configmap` | Creates ConfigMap | `kubectl create configmap my-config --from-file=config.txt` |
| `kubectl create secret` | Creates secret | `kubectl create secret generic my-secret --from-literal=password=secret` |
| `kubectl create namespace` | Creates namespace | `kubectl create namespace development` |
| `kubectl create job` | Creates job | `kubectl create job my-job --image=busybox -- echo "Hello"` |
| `kubectl create cronjob` | Creates CronJob | `kubectl create cronjob my-cron --schedule="*/5 * * * *" --image=busybox -- echo "Hello"` |
| `kubectl apply` | Creates/updates resources | `kubectl apply -f manifest.yaml` |
| `kubectl apply -f` | Applies configuration from file | `kubectl apply -f deployment.yaml` |
| `kubectl apply -k` | Applies kustomization | `kubectl apply -k ./kustomization` |
| `kubectl apply --dry-run` | Shows what would be applied | `kubectl apply -f pod.yaml --dry-run=client` |
| `kubectl replace` | Replaces resource | `kubectl replace -f pod.yaml` |
| `kubectl patch` | Updates field of resource | `kubectl patch deployment nginx -p '{"spec":{"replicas":3}}'` |
| `kubectl edit` | Edits resource in editor | `kubectl edit deployment nginx` |
| `kubectl delete` | Deletes resources | `kubectl delete pod nginx` |
| `kubectl delete -f` | Deletes from file | `kubectl delete -f deployment.yaml` |
| `kubectl delete --all` | Deletes all resources of type | `kubectl delete pods --all` |

## Resource Viewing and Inspection

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl get` | Lists resources | `kubectl get pods` |
| `kubectl get all` | Lists common resources | `kubectl get all` |
| `kubectl get -o wide` | Shows additional columns | `kubectl get pods -o wide` |
| `kubectl get -o yaml` | Shows as YAML | `kubectl get pod nginx -o yaml` |
| `kubectl get -o json` | Shows as JSON | `kubectl get pod nginx -o json` |
| `kubectl get -o custom-columns` | Custom output columns | `kubectl get pods -o custom-columns=NAME:.metadata.name,STATUS:.status.phase` |
| `kubectl get -w` | Watches for changes | `kubectl get pods -w` |
| `kubectl get --show-labels` | Shows labels | `kubectl get pods --show-labels` |
| `kubectl get -l` | Filters by label | `kubectl get pods -l app=nginx` |
| `kubectl get --field-selector` | Filters by field | `kubectl get pods --field-selector status.phase=Running` |
| `kubectl get -A` | Gets from all namespaces | `kubectl get pods -A` |
| `kubectl describe` | Shows detailed information | `kubectl describe pod nginx` |
| `kubectl logs` | Shows container logs | `kubectl logs nginx` |
| `kubectl logs -f` | Follows log output | `kubectl logs -f nginx` |
| `kubectl logs --tail` | Shows last N lines | `kubectl logs --tail=50 nginx` |
| `kubectl logs --since` | Shows logs since time | `kubectl logs --since=1h nginx` |
| `kubectl logs -c` | Logs from specific container | `kubectl logs nginx -c sidecar` |
| `kubectl logs -p` | Shows previous container logs | `kubectl logs -p nginx` |
| `kubectl logs --all-containers` | Shows logs from all containers | `kubectl logs nginx --all-containers=true` |

## Pod and Container Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl run` | Creates and runs pod | `kubectl run nginx --image=nginx` |
| `kubectl run --rm -it` | Runs temporary interactive pod | `kubectl run --rm -it busybox --image=busybox -- sh` |
| `kubectl exec` | Executes command in container | `kubectl exec nginx -- ls /` |
| `kubectl exec -it` | Executes interactive command | `kubectl exec -it nginx -- bash` |
| `kubectl exec -c` | Executes in specific container | `kubectl exec nginx -c sidecar -- ls` |
| `kubectl attach` | Attaches to running container | `kubectl attach nginx` |
| `kubectl port-forward` | Forwards ports to local machine | `kubectl port-forward pod/nginx 8080:80` |
| `kubectl port-forward svc/` | Forwards service port | `kubectl port-forward svc/nginx 8080:80` |
| `kubectl cp` | Copies files to/from containers | `kubectl cp nginx:/path/to/file ./local/file` |
| `kubectl cp` | Copies from local to container | `kubectl cp ./local/file nginx:/path/to/file` |
| `kubectl top pod` | Shows pod resource usage | `kubectl top pod nginx` |
| `kubectl top pod --containers` | Shows container resource usage | `kubectl top pod nginx --containers` |

## Deployment Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl scale` | Scales deployment/replicaset | `kubectl scale deployment nginx --replicas=5` |
| `kubectl autoscale` | Creates HorizontalPodAutoscaler | `kubectl autoscale deployment nginx --min=2 --max=10 --cpu-percent=80` |
| `kubectl rollout status` | Shows rollout status | `kubectl rollout status deployment/nginx` |
| `kubectl rollout history` | Shows rollout history | `kubectl rollout history deployment/nginx` |
| `kubectl rollout undo` | Rolls back deployment | `kubectl rollout undo deployment/nginx` |
| `kubectl rollout undo --to-revision` | Rolls back to specific revision | `kubectl rollout undo deployment/nginx --to-revision=2` |
| `kubectl rollout restart` | Restarts deployment | `kubectl rollout restart deployment/nginx` |
| `kubectl rollout pause` | Pauses rollout | `kubectl rollout pause deployment/nginx` |
| `kubectl rollout resume` | Resumes rollout | `kubectl rollout resume deployment/nginx` |
| `kubectl set image` | Updates container image | `kubectl set image deployment/nginx nginx=nginx:1.19` |
| `kubectl set env` | Sets environment variables | `kubectl set env deployment/nginx MYSQL_ROOT_PASSWORD=secret` |
| `kubectl set resources` | Sets resource limits | `kubectl set resources deployment nginx -c=nginx --limits=cpu=200m,memory=512Mi` |
| `kubectl set selector` | Sets selector on resource | `kubectl set selector service nginx app=nginx` |
| `kubectl set serviceaccount` | Sets service account | `kubectl set serviceaccount deployment nginx myserviceaccount` |

## Node Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl get nodes` | Lists cluster nodes | `kubectl get nodes` |
| `kubectl describe node` | Shows node details | `kubectl describe node node-1` |
| `kubectl cordon` | Marks node as unschedulable | `kubectl cordon node-1` |
| `kubectl uncordon` | Marks node as schedulable | `kubectl uncordon node-1` |
| `kubectl drain` | Drains node for maintenance | `kubectl drain node-1 --ignore-daemonsets` |
| `kubectl taint` | Adds taint to node | `kubectl taint nodes node-1 key=value:NoSchedule` |
| `kubectl taint --remove` | Removes taint from node | `kubectl taint nodes node-1 key:NoSchedule-` |
| `kubectl label node` | Adds label to node | `kubectl label nodes node-1 disktype=ssd` |
| `kubectl top node` | Shows node resource usage | `kubectl top node` |
| `kubectl get node -o custom-columns` | Custom node info | `kubectl get nodes -o custom-columns=NAME:.metadata.name,CPU:.status.capacity.cpu` |

## Namespace Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl get namespaces` | Lists namespaces | `kubectl get namespaces` |
| `kubectl create namespace` | Creates namespace | `kubectl create namespace production` |
| `kubectl delete namespace` | Deletes namespace | `kubectl delete namespace test` |
| `kubectl config set-context --current` | Sets default namespace | `kubectl config set-context --current --namespace=dev` |
| `kubectl -n` | Specifies namespace | `kubectl -n kube-system get pods` |
| `kubectl --all-namespaces` | All namespaces | `kubectl get pods --all-namespaces` |

## ConfigMaps and Secrets

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl create configmap` | Creates ConfigMap | `kubectl create configmap app-config --from-file=app.properties` |
| `kubectl create configmap --from-literal` | Creates from literal | `kubectl create configmap app-config --from-literal=key1=value1` |
| `kubectl create secret generic` | Creates generic secret | `kubectl create secret generic db-pass --from-literal=password=secret` |
| `kubectl create secret docker-registry` | Creates Docker registry secret | `kubectl create secret docker-registry regcred --docker-server=... --docker-username=... --docker-password=...` |
| `kubectl create secret tls` | Creates TLS secret | `kubectl create secret tls tls-secret --cert=tls.crt --key=tls.key` |
| `kubectl get configmaps` | Lists ConfigMaps | `kubectl get configmaps` |
| `kubectl get secrets` | Lists secrets | `kubectl get secrets` |
| `kubectl describe configmap` | Shows ConfigMap details | `kubectl describe configmap app-config` |
| `kubectl edit configmap` | Edits ConfigMap | `kubectl edit configmap app-config` |
| `kubectl delete configmap` | Deletes ConfigMap | `kubectl delete configmap app-config` |

## Service Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl expose` | Exposes resource as service | `kubectl expose deployment nginx --port=80 --type=LoadBalancer` |
| `kubectl create service` | Creates service | `kubectl create service clusterip my-svc --tcp=80:8080` |
| `kubectl create service nodeport` | Creates NodePort service | `kubectl create service nodeport my-svc --tcp=80:8080` |
| `kubectl create service loadbalancer` | Creates LoadBalancer service | `kubectl create service loadbalancer my-svc --tcp=80:8080` |
| `kubectl get services` | Lists services | `kubectl get services` |
| `kubectl get endpoints` | Lists service endpoints | `kubectl get endpoints` |
| `kubectl describe service` | Shows service details | `kubectl describe service nginx` |
| `kubectl delete service` | Deletes service | `kubectl delete service nginx` |

## Labels and Selectors

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl label` | Adds/updates labels | `kubectl label pods nginx env=prod` |
| `kubectl label --overwrite` | Overwrites existing label | `kubectl label pods nginx env=staging --overwrite` |
| `kubectl label --all` | Labels all resources | `kubectl label pods --all status=ready` |
| `kubectl annotate` | Adds/updates annotations | `kubectl annotate pods nginx description="web server"` |
| `kubectl get -l` | Gets resources by label | `kubectl get pods -l app=nginx` |
| `kubectl get --selector` | Gets by selector | `kubectl get pods --selector="app in (nginx, apache)"` |
| `kubectl delete -l` | Deletes by label | `kubectl delete pods -l env=test` |

## Troubleshooting and Debugging

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl describe` | Shows detailed resource info | `kubectl describe pod nginx` |
| `kubectl logs` | Shows container logs | `kubectl logs nginx` |
| `kubectl logs --previous` | Shows previous container logs | `kubectl logs nginx --previous` |
| `kubectl exec -it` | Executes shell in container | `kubectl exec -it nginx -- /bin/bash` |
| `kubectl debug` | Creates debugging container | `kubectl debug nginx -it --image=busybox` |
| `kubectl events` | Shows cluster events | `kubectl get events --sort-by='.lastTimestamp'` |
| `kubectl top` | Shows resource usage | `kubectl top pods` |
| `kubectl auth can-i` | Checks authorization | `kubectl auth can-i create pods` |
| `kubectl auth can-i --as` | Checks as different user | `kubectl auth can-i create pods --as developer` |
| `kubectl proxy` | Creates proxy to API server | `kubectl proxy --port=8080` |
| `kubectl api-resources` | Lists API resources | `kubectl api-resources --namespaced=true` |
| `kubectl get --raw` | Makes raw API request | `kubectl get --raw /api/v1/namespaces` |

## Advanced Operations

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `kubectl diff` | Shows diff of applied changes | `kubectl diff -f deployment.yaml` |
| `kubectl wait` | Waits for condition | `kubectl wait --for=condition=ready pod/nginx --timeout=30s` |
| `kubectl kustomize` | Builds kustomization | `kubectl kustomize ./kustomization` |
| `kubectl certificate` | Manages certificates | `kubectl certificate approve csr-name` |
| `kubectl cluster-info dump` | Dumps cluster state | `kubectl cluster-info dump --output-directory=/path/to/dump` |
| `kubectl convert` | Converts config between versions | `kubectl convert -f pod.yaml --output-version v1` |
| `kubectl plugin list` | Lists installed plugins | `kubectl plugin list` |