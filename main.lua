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
     l_flipper_pos = l_flipper_pos + 400 * dt -- this would increment num by 100 per second
  else
    l_flipper_pos = l_flipper_pos - 400 * dt
  end

  if l_flipper_pos < 0 then
    l_flipper_pos = 0
  end

  if love.keyboard.isDown("right") then
    r_flipper_pos = r_flipper_pos + 400 * dt
  else
    r_flipper_pos = r_flipper_pos - 400 * dt
  end

  if r_flipper_pos < 0 then
    r_flipper_pos = 0
  end
end

function love.keypressed(key)
  -- quit the program when the player presses ESC
  if key == 'escape' then
    love.event.push('quit')
  end
end

function get_flipper_y_pos(flipper_value)
  local sin_value = math.sin(flipper_value / 20)
  if flipper_value > (math.pi / 2) then
    sin_value = 1
  end

  return flipper_value * sin_value
end

function get_flipper_x_pos(flipper_value)
  local cos_value = math.cos(flipper_value / 100.0)
  if (flipper_value / 100.0) > (math.pi / 2) then
    cos_value = 0
  end

  return 100 * cos_value
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  --love.graphics.draw(flipper_image, 500, 500)
  --love.graphics.draw(flipper_image, 300, 545, math.pi * 1.05)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(tostring(get_flipper_x_pos(l_flipper_pos)), 10, 30)

  love.graphics.line(200, 500, 200 + get_flipper_x_pos(l_flipper_pos), 500 - get_flipper_y_pos(l_flipper_pos))
  love.graphics.line(600 - get_flipper_x_pos(r_flipper_pos), 500 - get_flipper_y_pos(r_flipper_pos), 600, 500)

  love.graphics.circle("fill", 400, 300, 10)

  love.graphics.print("Hello", 10, 10)
end
