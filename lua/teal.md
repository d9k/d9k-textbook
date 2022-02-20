# wu lang: strongly typed lua

https://github.com/wu-lang/wu

from  https://github.com/hengestone/lua-languages


# Teal language: basics

https://www.youtube.com/watch?v=HfnjUCRzRKU

13:40: You should use types by name, no structural check like in typescript,

14:00 no inheritance, no interfaces or traits

14:50 generics added

## generics

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#generics

```
local function keys<K,V>(xs: {K:V}):{K}
   local ks = {}
   for k, v in pairs(xs) do
      table.insert(ks, k)
   end
   return ks
end

local s = keys({ a = 1, b = 2 }) -- s is {string}
```
