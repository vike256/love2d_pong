require('ball')
require('globals')
require('player')

function love.load()
    math.randomseed(os.time())
    p1 = player.new(
        16,
        globals.screenH/2 - player.height/2,
        'w',
        's'
    )

    p2 = player.new(
        globals.screenW - player.width - 16,
        globals.screenH/2 - player.height/2,
        'up',
        'down'
    )
end

function love.update(dt)
    ball.move(dt)
    player.move(dt, p1)
    player.move(dt, p2)
    player.bounce_ball(p1, ball)
    player.bounce_ball(p2, ball)
    ball.check_goal(p1, p2)
end

function love.draw()
    ball.draw()
    player.draw(p1)
    player.draw(p2)
    globals.draw_score(p1, p2)
end