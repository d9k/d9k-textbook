# Методы операционной системы из lua

## exec

```
function exec(command)
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result
end
```
