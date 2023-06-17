require('globals')

ball = {
    x = 0,
    y = 0,
    width = 16,
    height = 16,
    speed = 320,
    speedX = -1,
    speedY = 0,
}

ball.x = globals.screenW/2 - ball.width/2
ball.y = globals.screenH/2 - ball.height/2

function ball.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', ball.x, ball.y, ball.width, ball.height)
end

function ball.move(dt)
    if ball.speedX == -1 then
        ball.x = ball.x - ball.speed * dt
    elseif ball.speedX == 1 then
        ball.x = ball.x + ball.speed * dt
    end

    if ball.speedY == -1 then
        ball.y = ball.y - ball.speed * dt
    elseif ball.speedY == 1 then
        ball.y = ball.y + ball.speed * dt
    end

    -- Check collisions
    if ball.y <= 0 then
        ball.y = 0
        ball.speedY = 1
    elseif ball.y + ball.height >= globals.screenH then
        ball.y = globals.screenH - ball.height
        ball.speedY = -1
    end
end

function ball.check_goal(pLeft, pRight)
    if ball.x <= 0 then
        ball.reset()
        pRight.score = pRight.score + 1
    elseif ball.x + ball.width >= globals.screenW then
        ball.reset()
        pLeft.score = pLeft.score + 1
    end
end

function ball.reset()
    ball.x = globals.screenW/2 - ball.width/2
    ball.y = globals.screenH/2 - ball.height/2

    if math.random(0, 1) == 0 then
        ball.speedX = -1
    else
        ball.speedX = 1
    end

    ball.speedY = 0
end