require('globals')
require('ball')

player = {
    x = 0,
    y = 0,
    width = 16,
    height = 64,
    up = 'w',
    down = 's',
    speed = 320,
    score = 0,
}

function player.new(x, y, up, down)
    local o = {}
    setmetatable(o, player)
    player.__index = player
    o.x = x
    o.y = y
    o.up = up
    o.down = down
    return o
end

function player.draw(p)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', p.x, p.y, player.width, player.height)
end

function player.move(dt, p)
    if love.keyboard.isDown(p.up) then
        p.y = p.y - p.speed * dt
    end

    if love.keyboard.isDown(p.down) then
        p.y = p.y + p.speed * dt
    end

    if p.y < 0 then
        p.y = 0
    elseif p.y + p.height > globals.screenH then
        p.y = globals.screenH - p.height
    end
end

function player.bounce_ball(p, b)
    local collision = false
    if p.x < globals.screenW/2 then     -- Player on the left
        if p.x + p.width >= b.x
        and p.y + p.height >= b.y
        and p.y <= b.y + b.height then
            b.speedX = 1
            collision = true
        end
    else                        -- Player on the right
        if p.x <= b.x + b.width
        and p.y + p.height >= b.y
        and p.y <= b.y + b.height then
            b.speedX = -1
            collision = true
        end
    end

    if collision then
        if b.y < p.y + p.height/2 then
            b.speedY = -1
        else
            b.speedY = 1
        end
    end
end