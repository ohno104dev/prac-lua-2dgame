function love.load()
	sprites = {}
	sprites.space = love.graphics.newImage('sprites/space.jpeg')
	sprites.player = love.graphics.newImage('sprites/player.png')
	sprites.bullet = love.graphics.newImage('sprites/bullet.png')
	sprites.ufo1 = love.graphics.newImage('sprites/ufo1.png')
	sprites.ufo2 = love.graphics.newImage('sprites/ufo2.png')
	sprites.ufo3 = love.graphics.newImage('sprites/ufo3.png')

	player = {}
	player.x = love.graphics.getWidth() / 2
	player.y = love.graphics.getHeight() / 2
	player.speed = 180
end

function love.update(dt)
	if love.keyboard.isDown("d") then
		player.x = player.x + player.speed * dt
	end
	if love.keyboard.isDown("a") then
		player.x = player.x - player.speed * dt
	end
	if love.keyboard.isDown("w") then
		player.y = player.y - player.speed * dt
	end
	if love.keyboard.isDown("s") then
		player.y = player.y + player.speed * dt
	end
end

function love.draw()
	love.graphics.draw(sprites.space, 0, 0, 0, love.graphics.getWidth() / sprites.space:getWidth(), love.graphics.getHeight() / sprites.space:getHeight())
	love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), nil, nil, sprites.player:getWidth()/2,sprites.player:getHeight()/2)
end

function playerMouseAngle()
	return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) - (math.pi / 2)
end