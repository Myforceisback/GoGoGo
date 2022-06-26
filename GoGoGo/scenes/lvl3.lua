local composer = require("composer")
local widget = require("widget")
local scene3 = composer.newScene();

function scene3:show(event)
    local sceneGroup = self.view;

    --Музыка lvl1
    local playSound = audio.play(Lvl3Music, {channel = 1, loops = -1});
    audio.setVolume(vol,{channel = 1});
    ----

    -- Дорога 1
    local road1 = display.newImageRect(sceneGroup,BGlvl1, _W/0.95, _H/0.78);
    road1.x = 150
    road1.y = 220
    road1.speed = 12;

    -- Дорога 2
    local road2 = display.newImageRect(sceneGroup,BGlvl1, _W/0.95, _H/0.78);
    road2.x = 150
    road2.y = 440
    road2.speed = 12;
   
    --Обработка дороги
    
    function scrollRoad(self, event)
        if (self.y > 450) then
            self.y = 10
        else self.y = self.y + self.speed;
        end
    end

    road1.enterFrame = scrollRoad
    Runtime:addEventListener("enterFrame", road1)
    road2.enterFrame = scrollRoad
    Runtime:addEventListener("enterFrame", road2)

    ----

    --Спавн тачек
    physics.start();
    physics.setGravity(0,100);
    local function spawn(sceneGroup)
        local DropCars = display.newImageRect(DefaultCar, 75, 75)
    
        physics.addBody(DropCars, "dinamic", {radius = 10, bounce = 0}) 

        DropCars.x = math.random(60,250)
        DropCars.y = - 200
        sceneGroup:insert(DropCars)
        DropCars.surfaceType = "dada"
        self.spriteObject = DropCars
        return DropCars
    end
    local yes = function () return spawn(sceneGroup) end
    G = timer.performWithDelay(700,yes,-1);
    ----

    --Обработчик столкновений с машинами
    local function crash(self,event)
        local collideObject = event.other
        if (collideObject.surfaceType == "dada") then
            print("!!!CRASH!!!")
           timer.cancelAll()
           physics.stop()
           audio.stop(1)
           composer.gotoScene("scenes.menu")
        end
    end
    ----

    --Главная машина
    local temp = display.newGroup(); 
    mCX = _W/2.1
    mCY = _H/1.3
    local modelCar = display.newRect(sceneGroup,0,0,0.1,0.1);
    modelCar:setFillColor(1,0,0,1)

    local car = display.newImageRect(sceneGroup,DefaultCar, 75, 75)
    car.x = 0
    car.y = 0
    temp:insert(modelCar)
    temp:insert(car)
    temp.x = mCX
    temp.y = mCY
    physics.addBody(temp,"static", {bounce = 0, radius = 15});

    temp.ID = "mainCar"
    temp.collision = crash
    temp:addEventListener("collision")

    sceneGroup:insert(temp)
    ----

    --Кнопки движения
    local wid = 210
    local heg = 90
 
    local ButtonLeft = display.newRect(sceneGroup, _W/6.2, _H, wid, heg);
    ButtonLeft:setFillColor(224,224,224,0.3)

    local ButtonRight = display.newRect(sceneGroup, _W/1.2, _H, wid, heg);
    ButtonRight:setFillColor(224,224,224,0.3)
    ----

    --Обработка движения при помощи кнопок
    local buttonPress = 0
    local function moveLeft(event)
        if event.phase == "began" then
            buttonPress = 1
        elseif event.phase =="ended" then
            buttonPress = 0
        end
    end

    local function moveRight(event)
        if event.phase == "began" then
            buttonPress = -1
        elseif event.phase == "ended" then
            buttonPress = 0
        end
    end

    local function onUpdate()
        if buttonPress == 1 then
            if temp.x > 60 then
                temp.x = temp.x - 5
            end
        elseif buttonPress == -1 then
            if temp.x < 250 then
                temp.x = temp.x + 5
            end
        end
    end

    ButtonLeft:addEventListener("touch", moveLeft)
    ButtonRight:addEventListener("touch", moveRight)
    Runtime:addEventListener("enterFrame", onUpdate)
    --
   local boxforButtonEsc = widget.newButton 
   {
       shape = 'roundedRect',
       radius = 12,
       width = 30, height = 30,
       left = 285, top = -40,
       fontSize = 16,
       fillColor = { default = {76 / 255}, over = {150 / 255} },
       labelColor ={ default = {1}, over = {0} },
       label = '>',
       onEvent = function (event)
        if event.phase =="ended" then
            physics.stop();
            timer.cancelAll();
            audio.stop(1)
            composer.gotoScene("scenes.menu")
        end
       end
   }
    sceneGroup:insert(boxforButtonEsc)
    --sceneGroup:insert(temp)
end


function scene3:destroy(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        
    elseif (phase == "did") then
        composer.removeScene("lvl3");
    end
end

scene3:addEventListener("show", scene3)
scene3:addEventListener("destroy", scene3)
return scene3;