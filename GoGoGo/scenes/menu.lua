local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene();


function scene:show(event)
    local sceneGroup = self.view;
   
    --Группа для кнопок
    
    local buttonGroup = display.newGroup()
    
    ----

    --Задний фон
    
    local background = display.newImageRect(sceneGroup,BGMenu,800,1100);
    
    ----

    --Название игры
    
    local Logo = display.newText(sceneGroup, "GoGoGo", _W/2, _H/6, "AmericanTypewriter-Bold", 24 )
    Logo:setFillColor( 141, 255, 118 )
    
    ----

    --Музыка в Меню
    local playSound = audio.play(MenuMusic, {channel = 1, loops = -1});
    audio.setVolume(vol,{channel = 1});
    --audio.stop(1)

    ----


    --Кнопки навигации
        
        --Первый уровень
    local boxforButtonLvl1 = widget.newButton 
    {
        shape = 'roundedRect',
        radius = 12,
        width = 200, height = 50,
        left = 60, top = 200,
        fontSize = 16,
        fillColor = { default = {76 / 255}, over = {150 / 255} },
        labelColor ={ default = {1}, over = {0} },
        label = 'EASY',
        onEvent = function (event)
            if event.phase =="ended" then
                audio.stop(1)
                composer.gotoScene("scenes.lvl1")
            end
        end
    }
        --Второй уровень
    local boxforButtonLvl2 = widget.newButton 
    {
        shape = 'roundedRect',
        radius = 12,
        width = 200, height = 50,
        left = 60, top = 260,
        fontSize = 16,
        fillColor = { default = {76 / 255}, over = {150 / 255} },
        labelColor ={ default = {1}, over = {0} },
        label = 'MEDIUM',
        onEvent = function (event)
            if event.phase =="ended" then
                audio.stop(1)
                composer.gotoScene("scenes.lvl2")
            end
        end
    }
        --Третий уровень
    local boxforButtonLvl3 = widget.newButton 
    {
        shape = 'roundedRect',
        radius = 12,
        width = 200, height = 50,
        left = 60, top = 320,
        fontSize = 16,
        fillColor = { default = {76 / 255}, over = {150 / 255} },
        labelColor ={ default = {1}, over = {0} },
        label = 'HARD',
        onEvent = function (event)
            if event.phase =="ended" then
                audio.stop(1)
                composer.gotoScene("scenes.lvl3")
            end
        end
    }
        --Настройки
    local boxforButtonSettings = widget.newButton 
    {
        shape = 'roundedRect',
        radius = 12,
        width = 200, height = 50,
        left = 60, top = 380,
        fontSize = 16,
        fillColor = { default = {76 / 255}, over = {150 / 255} },
        labelColor ={ default = {1}, over = {0} },
        label = 'SETTINGS',
        onEvent = function (event)
            if event.phase =="ended" then
                composer.gotoScene("scenes.settings")
            end
        end
    }
        --Я
    local boxforButtonAvtor = widget.newButton 
    {
        shape = 'roundedRect',
        radius = 12,
        width = 200, height = 50,
        left = 60, top = 440,
        fontSize = 16,
        fillColor = { default = {76 / 255}, over = {150 / 255} },
        labelColor ={ default = {1}, over = {0} },
        label = 'Avtor',
        onEvent = function (event)
            if event.phase =="ended" then
                composer.gotoScene("scenes.avtor")
            end
        end
    
    }

    --

    --Добавление кнопок в сцену
    
    sceneGroup:insert(boxforButtonLvl1)
    sceneGroup:insert(boxforButtonLvl2)
    sceneGroup:insert(boxforButtonLvl3)
    sceneGroup:insert(boxforButtonAvtor)
    sceneGroup:insert(boxforButtonSettings)
    
    ----

end

function scene:destroy(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        
    elseif (phase == "did") then
        composer.removeScene("menu");
    end
end

scene:addEventListener("show", scene)
scene:addEventListener("destroy", scene)
return scene;