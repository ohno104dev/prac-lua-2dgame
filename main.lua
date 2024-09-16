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

	ufos = {}
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

	for i, u in ipairs(ufos) do
		u.x = u.x + math.cos(ufoPlayerAngle(u)) * u.speed * dt
		u.y = u.y + math.sin(ufoPlayerAngle(u)) * u.speed * dt
	end
end

function love.draw()
	love.graphics.draw(sprites.space, 0, 0, 0, love.graphics.getWidth() / sprites.space:getWidth(), love.graphics.getHeight() / sprites.space:getHeight())
	love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), 1.5, 1.5
	, sprites.player:getWidth()/2,sprites.player:getHeight()/2)

	for i, u in ipairs(ufos) do 
		if u.kind == 1 then
			love.graphics.draw(sprites.ufo1, u.x, u.y, ufoPlayerAngle(u), 1.5, 1.5, sprites.ufo1:getWidth()/2,sprites.ufo1:getHeight()/2)
		end

		if u.kind == 2 then
			love.graphics.draw(sprites.ufo2, u.x, u.y, ufoPlayerAngle(u), 1.5, 1.5, sprites.ufo2:getWidth()/2,sprites.ufo2:getHeight()/2)
		end

		if u.kind == 3 then
			love.graphics.draw(sprites.ufo3, u.x, u.y, ufoPlayerAngle(u), 1.5, 1.5, sprites.ufo3:getWidth()/2,sprites.ufo3:getHeight()/2)
		end
	end
end

function love.keypressed(key)
	if key == "space" then
		swapnUfo()
	end
end

function playerMouseAngle()
	return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) - (math.pi / 2)
end

function ufoPlayerAngle(ufo)
	-- return math.atan2(player.y - ufo.y, player.x - ufo.x) - math.pi
	return math.atan2(player.y - ufo.y, player.x - ufo.x) + (2 * math.pi )
end

function swapnUfo()
	local ufo = {}
	ufo.x = math.random(0,love.graphics.getWidth())
	ufo.y = math.random(0,love.graphics.getHeight())
	ufo.kind = (math.random(0,3) % 3) + 1
	ufo.speed = 100 + math.random(10) * 20

	table.insert(ufos, ufo)
end