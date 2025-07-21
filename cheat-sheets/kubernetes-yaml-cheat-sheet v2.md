# Kubernetes Declarative YAML Cheat Sheet

> **Key insight:** Every Kubernetes manifest must define `apiVersion`, `kind`, `metadata`, and (in most cases) `spec`. From there, each object kind brings its own hierarchy of fields, many of which accept only a fixed set of values. The tables below list each parameter’s requirement level, allowed inputs, concise description, and a concrete example you can drop into your own `.yaml` file.

## 1. Universal YAML Anatomy

| Field               | Required | Allowed Values                            | Description                                                   | Example Usage               |
|---------------------|----------|-------------------------------------------|---------------------------------------------------------------|-----------------------------|
| `apiVersion`        | Yes      | e.g. `v1`, `apps/v1`, `batch/v1`, `networking.k8s.io/v1` | API group and version used to interpret this object.          | `apiVersion: apps/v1`       |
| `kind`              | Yes      | Any built-in or CRD kind (Deployment, Service, Pod, etc.) | Type of resource to create or manage.                         | `kind: Deployment`          |
| `metadata.name`     | Yes      | DNS-compliant name (max 253 chars)        | Unique name for this object in its namespace.                 | `metadata:\n  name: my-app` |
| `metadata.namespace`| No       | string (e.g. `default`, `production`)     | Namespace to scope this object. Defaults to `default`.        | `namespace: prod`           |
| `metadata.labels`   | No       | map[string]string                         | Key-value pairs for grouping and selecting objects.           | `labels:\n    app: nginx`   |
| `metadata.annotations` | No    | map[string]string                         | Unstructured metadata for external tooling or docs.           | `annotations:\n    team: dev` |
| `spec`              | Yes*     | object                                    | Desired state; structure depends on `kind`.                   | See object-specific tables  |
| `status`            | No       | object                                    | Current state; maintained by Kubernetes control plane.        | (never user-specified)      |

\* Some resources (e.g., `Namespace`) accept no `spec`.

---

## 2. Workload Controllers

### 2.1 Deployment (`apps/v1`)

| Field                                                 | Required | Allowed Values                               | Description                                                     | Example Usage                                  |
|-------------------------------------------------------|----------|----------------------------------------------|-----------------------------------------------------------------|------------------------------------------------|
| `spec.replicas`                                       | No       | integer                                      | Desired number of pod replicas. Defaults to `1`.               | `replicas: 3`                                  |
| `spec.selector.matchLabels`                           | Yes      | map[string]string                            | Label selector; must exactly match `template.metadata.labels`.  | `matchLabels:\n    app: nginx`                 |
| `spec.template.metadata.labels`                       | Yes      | map[string]string                            | Labels applied to each Pod; used by the selector.               | `labels:\n    app: nginx`                      |
| `spec.template.spec.containers[]`                     | Yes      | list of `Container` objects                  | Definitions of the containers to run in each Pod.              | `containers:\n  - name: nginx\n    image: nginx:1.21-alpine` |
| `spec.template.spec.containers[].name`                | Yes      | string (DNS_LABEL)                           | Unique container name within its Pod.                           | `name: nginx`                                  |
| `spec.template.spec.containers[].image`               | Yes      | string                                       | Container image reference, optionally with tag or digest.       | `image: nginx:1.21-alpine`                    |
| `spec.template.spec.containers[].ports[].containerPort` | No     | integer (1–65535)                            | Port number the container listens on.                           | `containerPort: 80`                           |
| `spec.strategy.type`                                  | No       | `RollingUpdate`, `Recreate`                  | Rollout strategy. RollingUpdate is default.                     | `strategy:\n    type: RollingUpdate`           |
| `spec.strategy.rollingUpdate.maxSurge`                | No       | integer or percentage (e.g., `25%`)          | Max extra Pods above `.spec.replicas` during update.            | `maxSurge: 25%`                               |
| `spec.strategy.rollingUpdate.maxUnavailable`          | No       | integer or percentage (e.g., `1`)            | Max Pods below desired count during update.                     | `maxUnavailable: 1`                           |
| `spec.minReadySeconds`                                | No       | integer                                      | Seconds a Pod must be ready before counting toward availability. | `minReadySeconds: 30`                         |

### 2.2 StatefulSet (`apps/v1`)

| Field                                               | Required | Allowed Values                              | Description                                                  | Example Usage                                |
|-----------------------------------------------------|----------|---------------------------------------------|--------------------------------------------------------------|----------------------------------------------|
| `spec.serviceName`                                  | Yes      | string                                      | Name of Headless Service managing network identity.          | `serviceName: my-stateful-service`           |
| `spec.replicas`                                     | No       | integer                                     | Desired number of Pods. Defaults to `1`.                     | `replicas: 3`                                |
| `spec.selector.matchLabels`                         | Yes      | map[string]string                           | Selector matching `.template.metadata.labels`.                | `matchLabels:\n    app: db`                  |
| `spec.template.metadata.labels`                     | Yes      | map[string]string                           | Pod labels; must match selector.                              | `labels:\n    app: db`                       |
| `spec.volumeClaimTemplates[]`                       | Yes      | list of `PersistentVolumeClaim` templates    | Template for per-Pod storage.                                 | `volumeClaimTemplates:\n  - metadata:\n      name: pvc\n    spec:\n      accessModes: [\"ReadWriteOnce\"]\n      resources:\n        requests:\n          storage: 1Gi` |
| `spec.podManagementPolicy`                          | No       | `OrderedReady`, `Parallel`                  | Pod startup ordering. `OrderedReady` is default.              | `podManagementPolicy: Parallel`              |
| `spec.updateStrategy.type`                          | No       | `RollingUpdate`, `OnDelete`                 | Update strategy. RollingUpdate is default.                    | `updateStrategy:\n    type: RollingUpdate`   |

### 2.3 DaemonSet (`apps/v1`)

| Field                              | Required | Allowed Values             | Description                                           | Example Usage                                              |
|------------------------------------|----------|----------------------------|-------------------------------------------------------|------------------------------------------------------------|
| `spec.selector.matchLabels`        | Yes      | map[string]string          | Selector for Pods the DaemonSet should manage.       | `matchLabels:\n    app: node-exporter`                     |
| `spec.template.metadata.labels`    | Yes      | map[string]string          | Labels for Pod template; must match selector.        | `labels:\n    app: node-exporter`                          |
| `spec.template.spec.containers[]`  | Yes      | list of `Container` objects | Definitions of the containers to run on each node.   | `containers:\n  - name: exporter\n    image: prom/node-exporter:1.2` |
| `spec.updateStrategy.type`         | No       | `RollingUpdate`, `OnDelete` | DaemonSet update behavior; RollingUpdate is default. | `updateStrategy:\n    type: RollingUpdate`                 |

### 2.4 Job (`batch/v1`)

| Field                              | Required | Allowed Values             | Description                                           | Example Usage                                              |
|------------------------------------|----------|----------------------------|-------------------------------------------------------|------------------------------------------------------------|
| `spec.template`                    | Yes      | `PodTemplateSpec` object    | Pod template containing container and volume specs.   | `template:\n  spec:\n    containers:\n    - name: task\n      image: busybox\n      args: [\"echo\", \"Hello\"]` |
| `spec.completions`                 | No       | integer                     | Total successful completions before Job is complete.  | `completions: 5`                                           |
| `spec.parallelism`                 | No       | integer                     | Max Pods to run in parallel.                          | `parallelism: 2`                                           |
| `spec.backoffLimit`                | No       | integer                     | Retries before marking Job as failed. Defaults to 6. | `backoffLimit: 4`                                          |

### 2.5 CronJob (`batch/v1`)

| Field                              | Required | Allowed Values                             | Description                                                   | Example Usage                                  |
|------------------------------------|----------|--------------------------------------------|---------------------------------------------------------------|------------------------------------------------|
| `spec.schedule`                    | Yes      | cron format string                         | Cron expression defining job schedule.                        | `schedule: \"0 2 * * *\"`                      |
| `spec.jobTemplate`                 | Yes      | embedded `Job` spec                        | Template for Jobs created at each schedule.                   | `jobTemplate:\n  spec:\n    template:\n      spec:\n        containers:\n        - name: backup\n          image: backup:1.0` |
| `spec.suspend`                     | No       | boolean                                    | Temporarily suspend future job creation.                       | `suspend: true`                                |
| `spec.concurrencyPolicy`           | No       | `Allow`, `Forbid`, `Replace`               | Controls concurrent Job runs.                                  | `concurrencyPolicy: Replace`                   |
| `spec.successfulJobsHistoryLimit`  | No       | integer                                    | How many successful Job histories to keep.                     | `successfulJobsHistoryLimit: 3`                |
| `spec.failedJobsHistoryLimit`      | No       | integer                                    | How many failed Job histories to keep.                         | `failedJobsHistoryLimit: 1`                    |

### 2.6 HorizontalPodAutoscaler (`autoscaling/v2`)

| Field                             | Required | Allowed Values                                 | Description                                                      | Example Usage                                                   |
|-----------------------------------|----------|------------------------------------------------|------------------------------------------------------------------|-----------------------------------------------------------------|
| `spec.scaleTargetRef.apiVersion`  | Yes      | e.g. `apps/v1`, `batch/v1`                     | API version of the target resource.                              | `apiVersion: apps/v1`                                           |
| `spec.scaleTargetRef.kind`        | Yes      | `Deployment`, `StatefulSet`, etc.              | Kind of resource to scale.                                       | `kind: Deployment`                                              |
| `spec.scaleTargetRef.name`        | Yes      | string                                         | Name of the target resource.                                     | `name: my-app`                                                  |
| `spec.minReplicas`                | No       | integer                                        | Minimum number of replicas.                                      | `minReplicas: 2`                                                |
| `spec.maxReplicas`                | Yes      | integer                                        | Maximum number of replicas.                                      | `maxReplicas: 10`                                               |
| `spec.metrics[]`                  | No       | list of metric specs (`Resource`, `Pods`, etc.) | Metric sources for scaling decisions.                            | `metrics:\n  - type: Resource\n    resource:\n      name: cpu\n      target:\n        type: Utilization\n        averageUtilization: 75` |

---

## 3. Core Workloads

### 3.1 Pod (`v1`)

| Field                                 | Required | Allowed Values                                    | Description                                                     | Example Usage                                  |
|---------------------------------------|----------|---------------------------------------------------|-----------------------------------------------------------------|------------------------------------------------|
| `spec.containers[]`                   | Yes      | list of `Container` objects                       | Definitions of application containers for the Pod.             | `containers:\n  - name: web\n    image: nginx` |
| `spec.containers[].name`              | Yes      | string (DNS_LABEL)                                | Unique container name in the Pod.                               | `name: web`                                    |
| `spec.containers[].image`             | Yes      | string                                            | Container image reference.                                      | `image: nginx:latest`                         |
| `spec.containers[].ports[].containerPort` | No   | integer                                           | Port exposed by the container.                                  | `containerPort: 80`                           |
| `spec.restartPolicy`                  | No       | `Always`, `OnFailure`, `Never`                    | Pod‐level container restart policy.                             | `restartPolicy: OnFailure`                    |
| `spec.initContainers[]`               | No       | list of `Container` objects                       | Run these to completion before `containers[]`.                  | `initContainers:\n  - name: setup\n    image: busybox`        |
| `spec.volumes[]`                      | No       | list of `Volume` objects                          | Volumes available to containers.                                | `volumes:\n  - name: config\n    configMap:\n      name: my-config` |

---

## 4. Service & Ingress

### 4.1 Service (`v1`)

| Field                          | Required¹ | Allowed Values                                    | Description                                                 | Example Usage                                           |
|--------------------------------|-----------|---------------------------------------------------|-------------------------------------------------------------|---------------------------------------------------------|
| `spec.type`                    | No        | `ClusterIP`, `NodePort`, `LoadBalancer`, `ExternalName` | How the Service is exposed. Defaults to `ClusterIP`.        | `type: NodePort`                                        |
| `spec.selector`                | Yes²      | map[string]string                                | Pod labels to target. Not used for `ExternalName` Service. | `selector:\n    app: frontend`                          |
| `spec.ports[]`                 | Yes       | list of port objects                              | Ports exposed by the Service.                               | `ports:\n  - port: 80\n    targetPort: 8080`             |
| `spec.ports[].port`            | Yes       | integer                                           | Port on which Service is exposed.                           | `port: 80`                                              |
| `spec.ports[].targetPort`      | No        | integer or string (name)                         | Port on Pods; may be named port.                            | `targetPort: 8080`                                      |
| `spec.ports[].nodePort`        | No        | integer (30000–32767)                             | External node port for `NodePort` or `LoadBalancer`.        | `nodePort: 30036`                                       |
| `spec.clusterIP`               | No        | valid IPv4 address or `None`                     | Internal cluster IP. `None` for headless Service.           | `clusterIP: None`                                       |
| `spec.externalName`            | Yes³     | DNS name                                         | Alias for an external Service when `type: ExternalName`.    | `externalName: db.example.com`                          |

¹ Required except for Services of type `ExternalName`.  
² Not required for `ExternalName`.  
³ Only valid when `type: ExternalName`.

### 4.2 Ingress (`networking.k8s.io/v1`)

| Field                                | Required | Allowed Values                                  | Description                                                   | Example Usage                                              |
|--------------------------------------|----------|-------------------------------------------------|---------------------------------------------------------------|------------------------------------------------------------|
| `spec.ingressClassName`              | No       | string                                          | Name of IngressClass handling this Ingress.                  | `ingressClassName: nginx`                                 |
| `spec.rules[]`                       | No       | list of host/path rule objects                  | HTTP routing rules by host and path.                         | `rules:\n  - host: example.com\n    http:\n      paths:\n      - path: /` |
| `spec.rules[].host`                  | Yes      | string (FQDN)                                   | Domain name for this rule.                                   | `host: example.com`                                       |
| `spec.rules[].http.paths[]`          | Yes      | list of path objects                            | Path‐based routing configuration.                            | `paths:\n  - path: /api\n    backend:\n      service:\n        name: api-svc\n        port:\n          number: 80` |
| `spec.tls[]`                         | No       | list of TLS objects                              | TLS termination settings per host.                            | `tls:\n  - hosts: [\"example.com\"]\n    secretName: tls-secret` |

---

## 5. Config & Storage

### 5.1 ConfigMap (`v1`)

| Field        | Required | Allowed Values          | Description                            | Example Usage                              |
|--------------|----------|-------------------------|----------------------------------------|--------------------------------------------|
| `data`       | No       | map[string]string       | Unencoded key-value pairs.             | `data:\n  LOG_LEVEL: info`                |
| `binaryData` | No       | map[string][]byte (base64) | Binary values, base64-encoded.         | `binaryData:\n  cert.pem: <base64>`       |

### 5.2 Secret (`v1`)

| Field        | Required | Allowed Values          | Description                             | Example Usage                                  |
|--------------|----------|-------------------------|-----------------------------------------|------------------------------------------------|
| `type`       | No       | `Opaque`, `kubernetes.io/dockerconfigjson`, etc. | Secret type. Defaults to `Opaque`. | `type: kubernetes.io/dockerconfigjson`         |
| `data`       | No       | map[string][]byte (base64) | Key-value pairs, base64-encoded.        | `data:\n  password: <base64>`                  |
| `stringData` | No       | map[string]string       | Unencoded key-value pairs.              | `stringData:\n  password: s3cr3t`              |

### 5.3 PersistentVolumeClaim (`v1`)

| Field                                 | Required | Allowed Values                                  | Description                                                   | Example Usage                                  |
|---------------------------------------|----------|-------------------------------------------------|---------------------------------------------------------------|------------------------------------------------|
| `spec.accessModes[]`                  | Yes      | `ReadWriteOnce`, `ReadOnlyMany`, `ReadWriteMany`, `ReadWriteOncePod` | Access mode(s) for the volume.                                | `accessModes: [\"ReadWriteOnce\"]`            |
| `spec.resources.requests.storage`     | Yes      | string (e.g., `1Gi`, `500Mi`)                   | Requested storage size.                                       | `resources:\n  requests:\n    storage: 5Gi`    |
| `spec.storageClassName`               | No       | string                                          | StorageClass to use.                                          | `storageClassName: fast-ssd`                  |
| `spec.volumeMode`                     | No       | `Filesystem`, `Block`                           | Volume mode type.                                             | `volumeMode: Block`                           |

### 5.4 StorageClass (`storage.k8s.io/v1`)

| Field                  | Required | Allowed Values                   | Description                                                       | Example Usage                                             |
|------------------------|----------|----------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------|
| `provisioner`          | Yes      | CSI or in-tree driver name       | CSI driver or built-in plugin to provision volumes.               | `provisioner: kubernetes.io/aws-ebs`                      |
| `parameters`           | No       | map[string]string               | Driver-specific configuration.                                    | `parameters:\n  type: gp2`                                |
| `reclaimPolicy`        | No       | `Delete`, `Retain`, `Recycle`     | Behavior when PVC is deleted. Defaults to `Delete`.               | `reclaimPolicy: Retain`                                   |
| `volumeBindingMode`    | No       | `Immediate`, `WaitForFirstConsumer` | When to bind volume to node.                                      | `volumeBindingMode: WaitForFirstConsumer`                 |

---

## 6. Policy & Security

### 6.1 NetworkPolicy (`networking.k8s.io/v1`)

| Field                          | Required | Allowed Values                                       | Description                                                      | Example Usage                                              |
|--------------------------------|----------|------------------------------------------------------|------------------------------------------------------------------|------------------------------------------------------------|
| `spec.podSelector`             | Yes      | label selector object                                | Targets pods this policy applies to.                             | `podSelector:\n  matchLabels:\n    role: db`              |
| `spec.policyTypes[]`           | No       | `Ingress`, `Egress`                                  | Types of traffic the policy controls. Defaults to `Ingress`.     | `policyTypes: [\"Ingress\",\"Egress\"]`                   |
| `spec.ingress[]`               | No       | list of ingress rule objects                         | Ingress traffic rules.                                           | `ingress:\n  - from:\n      - podSelector:\n          matchLabels:\n            role: web` |
| `spec.egress[]`                | No       | list of egress rule objects                          | Egress traffic rules.                                            | `egress:\n  - to:\n      - ipBlock:\n          cidr: 10.0.0.0/24` |

### 6.2 PodDisruptionBudget (`policy/v1`)

| Field                       | Required | Allowed Values                    | Description                                                    | Example Usage                             |
|-----------------------------|----------|-----------------------------------|----------------------------------------------------------------|-------------------------------------------|
| `spec.minAvailable`         | Either   | integer or percentage string      | Min Pods that must remain available.                           | `minAvailable: 1`                         |
| `spec.maxUnavailable`       | Either   | integer or percentage string      | Max Pods that can be down simultaneously.                      | `maxUnavailable: 20%`                     |
| `spec.selector`             | Yes      | label selector object             | Selects Pods the PDB applies to.                               | `selector:\n  matchLabels:\n    app: web` |

### 6.3 PriorityClass (`scheduling.k8s.io/v1`)

| Field                        | Required | Allowed Values       | Description                                                 | Example Usage                        |
|------------------------------|----------|----------------------|-------------------------------------------------------------|--------------------------------------|
| `value`                      | Yes      | integer              | Priority value; higher means more important.                | `value: 1000`                        |
| `globalDefault`              | No       | boolean              | If this is the default priority class.                      | `globalDefault: true`                |
| `preemptionPolicy`           | No       | `PreemptLowerPriority`, `Never` | Preemption behavior.                                        | `preemptionPolicy: PreemptLowerPriority` |

### 6.4 LimitRange (`v1`)

| Field                                         | Required | Allowed Values                         | Description                                                         | Example Usage                                             |
|-----------------------------------------------|----------|----------------------------------------|---------------------------------------------------------------------|-----------------------------------------------------------|
| `spec.limits[] {type}`                        | Yes      | `Pod`, `Container`, `PersistentVolumeClaim` | Resource or object scope the limit applies to.                      | `limits:\n  - type: Container`                            |
| `spec.limits[].max`                           | No¹     | map of resource name to quantity       | Maximum allowed resource usage.                                     | `max:\n      cpu: \"2\"\n      memory: \"4Gi\"`           |
| `spec.limits[].min`                           | No       | map of resource name to quantity       | Minimum required resource usage.                                    | `min:\n      cpu: \"200m\"\n      memory: \"256Mi\"`      |
| `spec.limits[].default`                       | No²     | map of resource name to quantity       | Default resource requests/limits when none specified.               | `default:\n      memory: \"512Mi\"`                       |
| `spec.limits[].defaultRequest`                | No       | map of resource name to quantity       | Defaults for requests when none provided.                           | `defaultRequest:\n      cpu: \"100m\"`                    |
| `spec.limits[].maxLimitRequestRatio`          | No       | map of resource name to ratio string   | Max ratio between limit and request.                                | `maxLimitRequestRatio:\n      cpu: \"2\"`                 |

¹ `max` or `min` must be specified.  ² `default` or `defaultRequest` may be used to inject defaults.

### 6.5 ResourceQuota (`v1`)

| Field                        | Required | Allowed Values                   | Description                                                      | Example Usage                              |
|------------------------------|----------|----------------------------------|------------------------------------------------------------------|--------------------------------------------|
| `spec.hard`                  | Yes      | map of resource name to quantity | Maximum resource usage allowed in the namespace.                 | `hard:\n  pods: \"10\"\n  requests.cpu: \"4\"` |

---

## 7. RBAC

### 7.1 Role / ClusterRole (`rbac.authorization.k8s.io/v1`)

| Field                          | Required | Allowed Values                                  | Description                                                   | Example Usage                                              |
|--------------------------------|----------|-------------------------------------------------|---------------------------------------------------------------|------------------------------------------------------------|
| `rules[].apiGroups[]`          | No       | list of API group strings (e.g. `""`, `apps`)   | API groups the rule applies to. `""` denotes core group.     | `apiGroups: [\"\", \"apps\"]`                             |
| `rules[].resources[]`          | Yes      | list of resource kinds (e.g. `pods`, `deployments`) | Resources the rule covers.                                    | `resources: [\"pods\", \"deployments\"]`                   |
| `rules[].verbs[]`              | Yes      | list of verbs (`get`, `list`, `watch`, `create`, etc.) | Operations permitted by this rule.                           | `verbs: [\"get\", \"list\", \"watch\"]`                    |

### 7.2 RoleBinding / ClusterRoleBinding

| Field                         | Required | Allowed Values                                    | Description                                                         | Example Usage                                          |
|-------------------------------|----------|---------------------------------------------------|---------------------------------------------------------------------|--------------------------------------------------------|
| `subjects[] {kind}`           | Yes      | `User`, `Group`, `ServiceAccount`                 | Type of subject granted permissions.                                | `subjects:\n  - kind: ServiceAccount\n    name: default\n    namespace: prod` |
| `roleRef {apiGroup, kind, name}` | Yes   | apiGroup: `rbac.authorization.k8s.io`, kind: `Role`/`ClusterRole`, name: string | Reference to Role or ClusterRole to bind.                         | `roleRef:\n  apiGroup: rbac.authorization.k8s.io\n  kind: ClusterRole\n  name: admin` |

---

## 8. Observability

### 8.1 Event (`events.k8s.io/v1`)

| Field                              | Required | Allowed Values                      | Description                                                      | Example Usage                                         |
|------------------------------------|----------|-------------------------------------|------------------------------------------------------------------|-------------------------------------------------------|
| `regarding.kind`                   | Yes      | string                              | Kind of object the event refers to.                              | `regarding:\n  kind: Pod\n  name: my-pod`            |
| `reason`                           | No       | string                              | Short, machine-understandable event reason.                      | `reason: FailedScheduling`                            |
| `note`                             | No       | string                              | Human-readable description.                                      | `note: \"Insufficient CPU\"`                         |
| `type`                             | No       | `Normal`, `Warning`, `Error`        | Event severity type.                                             | `type: Warning`                                       |

### 8.2 Lease (`coordination.k8s.io/v1`)

| Field                                  | Required | Allowed Values           | Description                                             | Example Usage                                     |
|----------------------------------------|----------|--------------------------|---------------------------------------------------------|---------------------------------------------------|
| `spec.holderIdentity`                  | No       | string                   | Identity of the holder of the lease.                    | `holderIdentity: leader-election`                |
| `spec.leaseDurationSeconds`            | No       | integer                  | Duration that the lease is valid for.                   | `leaseDurationSeconds: 15`                        |

---

## 9. Misc. Cluster Resources

### 9.1 Namespace (`v1`)

| Field               | Required | Allowed Values                | Description                                          | Example Usage                        |
|---------------------|----------|-------------------------------|------------------------------------------------------|--------------------------------------|
| `metadata.name`     | Yes      | DNS-compliant name            | Name of the namespace.                               | `metadata:\n  name: staging`         |

### 9.2 APIService (`apiregistration.k8s.io/v1`)

| Field                              | Required | Allowed Values                               | Description                                               | Example Usage                                           |
|------------------------------------|----------|----------------------------------------------|-----------------------------------------------------------|---------------------------------------------------------|
| `spec.service.name`               | Yes      | string                                       | Name of the service hosting the API.                      | `service:\n  name: my-aggregator\n  namespace: kube-system` |
| `spec.group`                      | Yes      | API group (e.g., `metrics.k8s.io`)           | The API group being registered.                           | `group: metrics.k8s.io`                                 |
| `spec.version`                    | Yes      | string (e.g., `v1beta1`)                     | Version of the API being served.                          | `version: v1beta1`                                      |

### 9.3 CustomResourceDefinition (`apiextensions.k8s.io/v1`)

| Field                                  | Required | Allowed Values                     | Description                                               | Example Usage                                               |
|----------------------------------------|----------|------------------------------------|-----------------------------------------------------------|-------------------------------------------------------------|
| `spec.group`                           | Yes      | string                             | API group for the custom resource.                        | `group: myorg.io`                                           |
| `spec.names.kind`                      | Yes      | string                             | Kind name of the custom resource.                         | `names:\n  kind: MyResource`                               |
| `spec.names.plural`                    | Yes      | string                             | Plural name for the resource in the API.                  | `names:\n  plural: myresources`                            |
| `spec.scope`                           | Yes      | `Namespaced`, `Cluster`            | Whether the resource is namespaced or cluster-wide.       | `scope: Namespaced`                                        |

---

## 10. Quick Reference Tables

### 10.1 Access Modes vs. Volume Types

| Access Mode      | Required | Allowed Values    | Description                                                                   | Example Usage                        |
|------------------|----------|-------------------|-------------------------------------------------------------------------------|--------------------------------------|
| `ReadWriteOnce`  | Yes      | –                 | Mounted as read-write by a single node.                                       | `accessModes: [\"ReadWriteOnce\"]`  |
| `ReadOnlyMany`   | Yes      | –                 | Mounted read-only by many nodes.                                              | `accessModes: [\"ReadOnlyMany\"]`   |
| `ReadWriteMany`  | Yes      | –                 | Mounted read-write by many nodes.                                             | `accessModes: [\"ReadWriteMany\"]`  |
| `ReadWriteOncePod` | Yes    | –                 | Mounted as read-write by a single Pod (K8s 1.22+).                            | `accessModes: [\"ReadWriteOncePod\"]` |

### 10.2 Service Type Matrix

| Service Type     | Required | Allowed Values                                   | Description                                                 | Example Usage                        |
|------------------|----------|--------------------------------------------------|-------------------------------------------------------------|--------------------------------------|
| `ClusterIP`      | No       | –                                                | Internal-only service; default type.                        | `type: ClusterIP`                   |
| `NodePort`       | No       | integer (30000–32767)                            | Exposes Service on each Node’s IP at the specified port.   | `type: NodePort\nnodePort: 30080`   |
| `LoadBalancer`   | No       | –                                                | Provisions external load balancer (cloud integration).      | `type: LoadBalancer`                |
| `ExternalName`   | Yes¹     | DNS name                                         | Maps the Service to the specified external DNS name.        | `type: ExternalName\nexternalName: db.example.com` |

¹ `externalName` is required when `type: ExternalName`.

---

## 11. Authoring Tips

Begin with only the required fields and rely on Kubernetes defaults for the rest. Always ensure that your selector labels match your Pod template labels exactly to avoid orphaned Pods. Use `kubectl explain <kind>.<field>` or `kubectl explain <kind> --recursive` to explore available fields and their required status. Group related resources in a single YAML file separated by `---` to apply them atomically. Finally, validate your manifests with `kubectl apply --dry-run=client -f file.yaml` before applying to your cluster.
