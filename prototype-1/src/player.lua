player = {
  spr = 1,
  x = 0,
  y = 0,
  facing = 'right',
  action = 'idle',
  animation_lock = false,
  action_combo = {},

  init = function(self) 
    self.spr = 1
    self.x = 0
    self.y = 0
    animation_lock = false
    action_combo = {}
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

  attack = function(self)
    if contains(self.action_combo, 'p2') then
      add(self.action_combo, 'p3')
    elseif contains(self.action_combo, 'p1') then
      add(self.action_combo, 'p2')
    else
      self.action = 'attack'
      add(self.action_combo, 'p1')
      self.animation_lock = true
    end
  end,

  control = function(self)
    local move_action = 'walk'

    if btnp(4) then
      self:attack()
    elseif btn(5) then
      move_action = 'run'
    end

    if self.animation_lock then
      return
    else
      self.action = 'idle'
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
    if self.action == 'walk' then
      self.spr += 0.25
      if self.spr >= 4 then
        self.spr = 2
      end
    elseif self.action == 'run' then
      self.spr += 0.25
      if self.spr >= 10 then
        self.spr = 5
      end
    elseif self.action == 'attack' then
      local end_spr = 13
      if contains(self.action_combo, 'p3') then
        end_spr = 24
      elseif contains(self.action_combo, 'p2') then
        end_spr = 15
      end
      if self.spr < 10 then
        self.spr = 10
      end
      self.spr += 0.40
      if self.spr >= end_spr then
        self.spr = 1
        self.action_combo = {}
        self.animation_lock = false
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
