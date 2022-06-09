 function love.load()
    imageloader = require 'src/native/engine/loader/imageloader'

    
    --=[: API Stuff :]=--
    litgraphics         =       require 'API/sprite/litgraphics'
    litsound            =       require 'API/sound/litsound'
    litgame             =       require 'API/game/litgame'
    litsystem           =       require 'API/system/litsystem'
    litfilesystem       =       require 'API/filesystem/litfilesystem'
    switch              =       require 'src/native/sources/switch'

    initLogoTimer = 0

    imageloader.init()
    imagedata = imageloader.getImage()
    pcall(imagedata(), start())
end

function love.draw()
    litgraphics.clearScreen()
    pcall(imagedata(), render())
end

function love.update(dt)
    pcall(imagedata(), update())
end

function love.keypressed(k)
    pcall(imagedata(), keydown(k))
end

function love.keyrelease(k)
    pcall(imagedata(), keyup(k))
end