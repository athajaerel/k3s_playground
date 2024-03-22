#!/bin/bash
set -euo pipefail

export SA_SECRET_TOKEN=$(/usr/local/bin/kubectl -n kube-system get secret/devops-cluster-admin-secret -o=go-template='{{.data.token}}' | base64 --decode)

export CLUSTER_NAME=$(/usr/local/bin/kubectl config current-context)

export CURRENT_CLUSTER=$(/usr/local/bin/kubectl config view --raw -o=go-template='{{range .contexts}}{{if eq .name "'''${CLUSTER_NAME}'''"}}{{ index .context "cluster" }}{{end}}{{end}}')

export CLUSTER_CA_CERT=$(/usr/local/bin/kubectl config view --raw -o=go-template='{{range .clusters}}{{if eq .name "'''${CURRENT_CLUSTER}'''"}}"{{with index .cluster "certificate-authority-data" }}{{.}}{{end}}"{{ end }}{{ end }}')

export CLUSTER_ENDPOINT=$(/usr/local/bin/kubectl config view --raw -o=go-template='{{range .clusters}}{{if eq .name "'''${CURRENT_CLUSTER}'''"}}{{ .cluster.server }}{{end}}{{ end }}')

echo "{'cluster_name':'${CLUSTER_NAME}','cluster_ca_cert':${CLUSTER_CA_CERT},'cluster_endpoint':'${CLUSTER_ENDPOINT}','sa_secret_token':'${SA_SECRET_TOKEN}'}"
