local composer = require("composer")
local widget = require("widget")
local sceneAvtor = composer.newScene();

function sceneAvtor:show(event)
    local sceneGroup = self.view;
    local background = display.newImageRect(sceneGroup,AVTOR,400,600);
    background.x = _W/2
    background.y = _H/2
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
   sceneGroup:insert(boxforButtonEsc)
end

function sceneAvtor:destroy(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        
    elseif (phase == "did") then
        composer.removeScene("lvl1");
    end
end

sceneAvtor:addEventListener("show", sceneAvtor)
sceneAvtor:addEventListener("destroy", sceneAvtor)
return sceneAvtor;