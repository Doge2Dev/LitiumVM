
function love.load()
    nativelocks = require 'src/native/engine/core/nativelocks'
    imageloader = require 'src/native/engine/loader/imageloader'
    save = require 'src/native/engine/core/save_handler'
    pluginmanager = require 'src/native/engine/plugin/pluginmngr'
    language = require 'src/native/engine/resources/language'
    utils = require 'src/native/engine/resources/utils'


    btnPressedCount = 0
    love.keyboard.setKeyRepeat(true)

    nativelocks.lock()


    --=[: API Stuff :]=--
    litgraphics         =       require 'API/sprite/litgraphics'
    litsound            =       require 'API/sound/litsound'
    litgame             =       require 'API/game/litgame'
    litsystem           =       require 'API/system/litsystem'
	litinput			=		require 'API/input/litinput'
    litfilesystem       =       require 'API/filesystem/litfilesystem'
    litwindow           =       require 'API/window/litwindow'
    litsave             =       require 'API/savesystem/litsave'
    switch              =       require 'src/native/sources/switch'

    initLogoTimer = 0

    imageloader.init()
    imagedata = imageloader.getImage()

    pcall(imagedata(), start())
end

function love.draw()
    litgraphics.clearScreen()
    pcall(imagedata(), render())
    pluginmanager.loadPlugins()
end

function love.update(dt)
    pcall(imagedata(), update(dt))
end

function love.keypressed(k, scancode, isRepeat)
    pcall(imagedata(), keydown(k))

    -- callback if specific keys pressed
    if k == "home" then
        if isRepeat then
            print(btnPressedCount)
            btnPressedCount = btnPressedCount + 1
            if btnPressedCount > 20 then
                imageloader.changeImageName("native")
                love.event.quit("restart")
            end
        end
    end
end

function love.keyrelease(k)
    pcall(imagedata(), keyup(k))
end
