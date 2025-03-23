# #Teal language

[teal-types](https://github.com/teal-language/teal-types/tree/master/types) by [teal-language](https://github.com/teal-language)
	- _Teal type definitions of Lua libraries!_

## wu lang: strongly typed lua

https://github.com/wu-lang/wu

from  https://github.com/hengestone/lua-languages


## Teal language: basics

- [tl](https://github.com/teal-language/tl) by [teal-language](https://github.com/teal-language)
	- _The compiler for Teal, a typed dialect of Lua_

https://www.youtube.com/watch?v=HfnjUCRzRKU
"Minimalistic typed Lua is here - FOSDEM 2020"

13:40: You should use types by name, no structural check like in typescript,

14:00 no inheritance, no interfaces or traits

14:50 generics added

### generics

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#generics

```lua
local function keys<K,V>(xs: {K:V}):{K}
   local ks = {}
   for k, v in pairs(xs) do
      table.insert(ks, k)
   end
   return ks
end

local s = keys({ a = 1, b = 2 }) -- s is {string}
```

### Union types

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#union-types

```lua
local c: number | {string:number}
```

### Interfaces

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#interfaces

```lua
local interface MyAbstractInterface
   a: string
   x: integer
   y: integer
   my_func: function(self, integer)
   another_func: function(self, integer, self)
end

local record MyRecord is MyAbstractInterface
   b: string
end

local record Square is Shape, SecondPoint, Colorful
   get_area: function(self): number
end
```

Records cannot inherit from other records.

### Metamethods

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#metamethods

```ts
local type Rec = record
   x: number
   metamethod __call: function(Rec, string, number): string
   metamethod __add: function(Rec, Rec): Rec
end
```

Then assign the metatable with `setmetatable` as you would normally do in Lua to get the dynamic metatable behavior.

### Enum

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#enums

```lua
local enum Direction
   "north"
   "south"
   "east"
   "west"
end
```

### Flow analysis

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#union-types

```lua
local a: string | number | MyRecord

if a is string then
   print("Hello, " .. a)
elseif a is number then
   print(a + 10)
else
   print(a.my_record_field)
end
```

```lua
local a: string | number

local x: number = a is number and a + 1 or 0
```

`where`:

```lua
local record MyRecord is Named
   where self.name == "MyRecord"
end
```

### Conversion

`as` - forced conversion

```lua
local record Vector
   x: number
   y: number
end

local record Point
   x: number
   y: number
end

local v1: Vector = { x = 100, y = 100 }
-- Error!
-- local p2: Point = v1
local p2 = v1 as Point
```

### `<total>`

https://github.com/teal-language/tl/blob/master/docs/tutorial.md#total-variables

All possible table keys need to be explicitly declared _\[more suitable word final?\]_:

```lua
local degrees <total>: {Direction:number} = {
   ["north"] = 0,
   ["west"] = 90,
   ["south"] = 180,
   ["east"] = 270,
}
```

 if you later update the `Direction` enum to add new directions such as `"northeast"` and `"southwest"`, the above declaration of `degrees` will issue a compile-time error, because the table above is no longer total!

```lua
local record Color
   red: integer
   green: integer
   blue: integer
end

-- error: missing "blue" key
local teal_color <total>: Color = {
   red = 0,
   green = 128,
}
```

Will still accept an assignment to nil as a valid declaration. The rationale is that programmer did consider that case, and chose to explicitly set it to `nil`.