# Lua recipes

## Python data structures

http://lua-users.org/wiki/PythonDictionaries
http://lua-users.org/wiki/PythonLists

## Code style guide

http://dev.minetest.net/Lua_code_style_guidelines
http://lua-users.org/wiki/LuaStyleGuide

## `continue` emulation

```

function count_sum_till_zero(t)
  local sum = 0

  local process_element = function(element)
    local process_next = true
    local stop_processing = false

    if element == 0 then
      return stop_processing
    end

    sum = sum + element

    return process_next
  end

  for key, element in ipairs(t) do
    if not process_element(element) then
      break
    end
  end

  return sum
end -- count sum

print(count_sum_till_zero({1, 3, 2, 0, 6, 5}))
```
