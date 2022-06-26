local composer = require("composer")
local widget = require("widget")
local sceneShop = composer.newScene();

function sceneShop:show(event)
    local sceneGroup = self.view;
    local background = display.newImageRect(sceneGroup,BGMenu,800,1100);

    local Logo = display.newText(sceneGroup, "Volume", 60, 45, "AmericanTypewriter-Bold", 24 )
    uwu = vol
    local Logo2 = display.newText(sceneGroup, uwu, 215, 45, "AmericanTypewriter-Bold", 19 )

    local buttonVolLeft = widget.newButton
    {
        shape = 'roundedRect',
        radius = 12,
        width = 40, height = 40,
        left = 150, top = 25,
        fontSize = 16,
        fillColor = { default = {76 / 255}, over = {150 / 255} },
        labelColor ={ default = {1}, over = {0} },
        label = '<',
        onEvent = function (event)
            if (event.phase == "ended") then
                if vol - 0.01 > -1 then 
                    vol = (vol - 0.01);
                    print(vol)
                    Logo2.text = vol
                elseif vol - 0.01 < -0.01 then
                    vol = 0
                end
            end
        end
    }

    local buttonVolRight = widget.newButton
    {
        shape = 'roundedRect',
        radius = 12,
        width = 40, height = 40,
        left = 240, top = 25,
        fontSize = 16,
        fillColor = { default = {76 / 255}, over = {150 / 255} },
        labelColor ={ default = {1}, over = {0} },
        label = '>',
        onEvent = function (event)
            if (event.phase == "ended") then
                vol = (vol + 0.01);
                print(vol)
                Logo2.text = vol
            end
        end
    }

    -- Кнопка возврата в меню
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
       onPress = function (event)
           composer.gotoScene("scenes.menu");
       end
   }
   ----
   sceneGroup:insert(boxforButtonEsc)
   sceneGroup:insert(buttonVolLeft)
   sceneGroup:insert(buttonVolRight)
end

function sceneShop:destroy(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        
    elseif (phase == "did") then
        composer.removeScene("lvl1");
    end
end

sceneShop:addEventListener("show", sceneShop)
sceneShop:addEventListener("destroy", sceneShop)
return sceneShop;