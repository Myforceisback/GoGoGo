-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local composer = require("composer")

--Размеры
_W = display.contentWidth
_H = display.contentHeight

--Глобальные 

BGMenu = "img/test.gif"
BGlvl1 = "img/lvl1.png"
DefaultCar = "img/car1.png"
--carsSpawn = "img/car1.png"
AVTOR = "img/me.jpg"
MenuMusic = audio.loadSound("sounds/mainmenu.mp3");
Lvl1Music = audio.loadSound("sounds/lvl1.mp3")
Lvl2Music = audio.loadSound("sounds/lvl2.mp3")
Lvl3Music = audio.loadSound("sounds/lvl3.mp3")
vol = 0
----
--Удаление бара сверху экрана

display.setStatusBar(display.HiddenStatusBar);

----

--Перемещение на Главную сцену

composer.gotoScene("scenes.menu");

----