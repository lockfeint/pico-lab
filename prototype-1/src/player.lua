player = {
  spr = 1,
  x = 0,
  y = 0,
  facing = 'right',
  action = 'idle',

  init = function(self) 
    self.spr = 1
    self.x = 0
    self.y = 0
  end,

  move = function(self, action, direction)
    local speed = 1

    self.action = action

    if action == 'run' then
      speed = 2
    end

    if direction == 'left' then
      self.x -= speed
      self.facing = direction
    elseif direction == 'right' then
      self.x += speed
      self.facing = direction
    elseif direction == 'up' then
      self.y -= speed
    elseif direction == 'down' then
      self.y += speed
    end
  end,

  control = function(self)
    local move_action = 'walk'

    self.action = 'idle'

    if btn(5) then
      move_action = 'run'
    end

    if btn(0) then
      self:move(move_action, 'left')
    elseif btn(1) then
      self:move(move_action, 'right')
    end
    if btn(2) then
      self:move(move_action, 'up')
    elseif btn(3) then
      self:move(move_action, 'down')
    end
  end,

  animate = function(self)
    self.spr += 0.25
    if self.action == 'walk' then
      if self.spr >= 4 then
        self.spr = 2
      end
    elseif self.action == 'run' then
      if self.spr >= 10 then
        self.spr = 5
      end
    else
      self.spr = 1
    end
  end,

  draw = function(self)
    palt(0, false)
    palt(3, true)
    local flip_x = self.facing == 'left'
    spr(self.spr, self.x, self.y, 1, 1, flip_x)
  end
}
