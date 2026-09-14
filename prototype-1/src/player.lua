player = {
  spr = 1,
  x = 0,
  y = 0,
  init = function(self) 
    self.spr = 1
    self.x = 0
    self.y = 0
  end,
  control = function(self)
    if btn(0) then
      self.x -= 1
    elseif btn(1) then
      self.x += 1
    end
    if btn(2) then
      self.y -= 1
    elseif btn(3) then
      self.y += 1
    end
  end,
  animate = function(self) 
    spr(self.spr, self.x, self.y)
  end
}
