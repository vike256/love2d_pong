globals = {
    screenW = 640,
    screenH = 480,
}

function globals.draw_score(pLeft, pRight)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(pLeft.score .. ' ' .. pRight.score)
end