# Werf

## Редактирование секретных значений

`WERF_SECRET_KEY=` берется из переменных CI/CD в проекте [gitlab].

https://ru.werf.io/documentation/v1.2/reference/cli/werf_helm_secret_values_edit.html

`werf helm secret values edit FILE_PATH [options]`

## Генерация конфига

```
> cd .helm

> cat Chart.yaml

name: example
version: 0.1

> cat values-override.yaml

global:  
  env: production

> cat templates/99-werf-dummy.yaml 

{{- define "werf_container_image" }}
{{- end }}
{{- define "werf_container_env" }}
{{- end }}

> helm template . --debug -f values-override.yaml