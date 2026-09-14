function _init()
  player:init()
end

function _update()
  player:control()
end

function _draw()
  cls()
  player:animate()
end
