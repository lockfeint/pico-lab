player = {
  spr = 1,
  x = 0,
  y = 0,
  speed = 1,
  facing = 'right',
  action = 'idle',
  init = function(self) 
    self.spr = 1
    self.x = 0
    self.y = 0
  end,
  control = function(self)
    self.action = 'idle'

    if btn(0) then
      self.x -= self.speed
      self.facing = 'left'
      self.action = 'walk'
    elseif btn(1) then
      self.x += self.speed
      self.facing = 'right'
      self.action = 'walk'
    end
    if btn(2) then
      self.y -= self.speed
      self.action = 'walk'
    elseif btn(3) then
      self.y += self.speed
      self.action = 'walk'
    end

    if btn(5) then
      self.speed = 2
      self.action = 'run'
    else
      self.speed = 1
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
