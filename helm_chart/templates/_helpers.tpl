{{/* vim: set filetype=mustache: */}}
{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "appchart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "applabels" -}}
helm.sh/chart: {{ include "appchart" . }}
{{- if .Chart.AppVersion }}
appkubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
appkubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
