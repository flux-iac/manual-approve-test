# How to use

```yaml
cat <<EOF | kubectl apply -f -
---
apiVersion: source.toolkit.fluxcd.io/v1
kind: GitRepository
metadata:
  name: manual-approve-test
  namespace: flux-system
spec:
  interval: 30s
  url: https://github.com/tf-controller/manual-approve-test
  ref:
    branch: main
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: manual-approve-test
  namespace: flux-system
spec:
  timeout: 30s
  path: ./hello
  interval: 5m
  prune: true
  force: false
  sourceRef:
    kind: GitRepository  	
    name: manual-approve-test
EOF
```
