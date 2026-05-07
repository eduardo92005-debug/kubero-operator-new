{{- define "kuberobuild.deploymentKeysSecretName" -}}
{{- $secretName := default "" .Values.git.secretName -}}
{{- if $secretName -}}
{{- $secretName | trunc 63 | trimSuffix "-" -}}
{{- else if and .Values.git.keys .Values.git.keys.priv .Values.git.keys.pub -}}
{{- printf "%s-deployment-keys" .Values.app | trunc 63 | trimSuffix "-" -}}
{{- else -}}
deployment-keys
{{- end -}}
{{- end -}}
