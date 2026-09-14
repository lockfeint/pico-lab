function _init()
  player:init()
end

function _update()
  player:control()
  player:animate()
end

function _draw()
  cls(3)
  player:draw()
end
