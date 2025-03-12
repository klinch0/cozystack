{{- define "resources.preset" -}}
{{- $presetName := .type -}}
{{- $configMap := (lookup "v1" "ConfigMap" .Release.Namespace (printf "%s-resource-presets" .Release.Name)).data -}}
{{- if hasKey $configMap $presetName -}}
{{- $preset := get $configMap $presetName | fromYaml -}}
{{- toYaml $preset -}}
{{- else -}}
{}
{{- end -}}
{{- end -}}
