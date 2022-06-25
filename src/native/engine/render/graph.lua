rendercore = {}

defaultColorPallete = {
    {0,0,0,0},
    {0,0,0},
    {255,255,255},
    {180,180,180},
    {80,80,80},
    {255,0,0},
    {180,0,0},
    {80,0,0},
    {0,255,0},
    {0,180,0},
    {0,80,0},
    {0,0,255},
    {0,0,180},
    {0,0,80},
}

rect                    =               love.graphics.rectangle
setColor                =               love.graphics.setColor
setBackgroundcolor      =               love.graphics.setBackgroundColor

fonts = require 'src/native/engine/resources/font'

pallete = defaultColorPallete

function rendercore.loadPallete(palleteTable)
    pallete = palleteTable
end


function rendercore.drawCall(tablespr, pixelSize, Xpos, Ypos, tblPallete)
    if tblPallete == nil then
        colors = pallete
    else
        colors = tblPallete
    end
    for y=1, #tablespr do
		for x=1, #tablespr[1] do
            color = colors[tablespr[y][x]]
            r, g, b, a = love.math.colorFromBytes(color[1], color[2], color[3], color[4])
            if y > 24 or x > 24 then
                error("Sprite size, higher than 24 pixels")
            else
                setColor(r, g, b, a)
                rect("fill", Xpos + (x * pixelSize), Ypos + (y * pixelSize), pixelSize, pixelSize)
            end
		end
	end
end

function rendercore.rect(x, y, w, h, colorid, fillType)
    RectColor = {
        {0,0,0,0},
        {0,0,0},        -- 1
        {0.5,0.5,0.5},
        {1,1,1},
        {1,0,0},
        {0,1,0},
        {0,0,1},
        {1,1,0},
        {0,1,1},
        {1,0,1},
        {0.5,0,0},
        {0,0.5,0},
        {0,0,0.5},
        {0.5,0.5,0},
        {0,0.5,0.5},
        {0.5,0,0.5},
        {0.8,0,0},
        {0,0.8,0},
        {0,0,0.8},
        {0.8,0.8,0},
        {0,0.8,0.8},
        {0.8,0,0.8},
        {0.8,0.8,0.8}
    }

    setColor(RectColor[colorid])
    rect(fillType, x, y, w, h)
end

return rendercore