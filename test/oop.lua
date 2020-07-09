--[[
 @package
 @filename  oop.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      16.06.2020 00:55:30 -04
]]--

-- Creamos nuestra clase
local Person = {}

-- Definimos nuestro método constructor
function Person:new(name, age)
  self.name = name or "None"
  self.age  = age or 0
  return self
end

-- Creamos otro método adicional
function Person:greetings()
  print(("Hola, mi nombre es %s! Tengo %d años."):format(self.name, self.age))
end

local me = Person:new("Víctor", 17)
me:greetings()
