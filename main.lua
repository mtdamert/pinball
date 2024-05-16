pi = 3.14159
l_flipper_pos = 0
r_flipper_pos = 0

function love.load()
  flipper_image = love.graphics.newImage("graphics/flipper.png")
  love.graphics.setNewFont(12)
  love.graphics.setColor(0,0,0)
  love.graphics.setBackgroundColor(255,255,255)
end

function love.update(dt)
  if love.keyboard.isDown("left") then
     l_flipper_pos = l_flipper_pos + 100 * dt -- this would increment num by 100 per second
  elseif love.keyboard.isDown("right") then
    r_flipper_pos = r_flipper_pos + 100 * dt
  end
end

function love.keypressed(key)
  -- quit the program when the player presses ESC
  if key == 'escape' then
    love.event.push('quit')
  end
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(flipper_image, 500, 500)
  love.graphics.draw(flipper_image, 300, 545, pi * 1.05)
  love.graphics.setColor(0, 0, 0)

  love.graphics.circle("fill", 400, 300, 10)

  love.graphics.print("Hello", 10, 10)
end
