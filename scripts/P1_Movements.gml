#define P1_Movements
{
  if (x < 25 && hspeed < 0)
  {
    x = 25;
  }
  if (x > room_width - 25 && hspeed > 0)
  {
    x = room_width - 25;
  }
  if (y < 25 && vspeed < 0)
  {
    y = 25;
  }
  if (y > room_height - 25 && vspeed > 0)
  {
    y = room_height - 25;
  }
}
#define Movement
if (speed > 10)
    {
    speed = 10
    }
if (keyboard_check(global.move_up))
    {
    motion_add(90,0.5)
    }
if (keyboard_check(global.move_down))
    {
    motion_add(270,0.5)
    }
if (keyboard_check(global.move_left))
    {
    motion_add(180,0.5)
    }
if (keyboard_check(global.move_right))
    {
    motion_add(0,0.5)
    }
if (keyboard_check(vk_nokey))
    {
    friction = 0.2
    }
