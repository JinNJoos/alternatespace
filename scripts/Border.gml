#define Border
if (point_distance(x,y,1000,1000) > 480)
{
    x = 1000+lengthdir_x(480,point_direction(1000,1000,x,y));
    y = 1000+lengthdir_y(480,point_direction(1000,1000,x,y));
    if (mode = "slam")
    {
        with (new_camera)
        {
            shake = other.speed*3;
        }
        emit = audio_emitter_create();
        audio_emitter_position(emit,x,y,100);
        audio_emitter_gain(emit,(global.master/100)*(global.effect/100));
        c = audio_play_sound_on(emit,f_slam,false,10);
        motion_set(point_direction(x,y,1000,1000),speed);
        mode = "bounce"
        alarm[0] *= 1.9;
    }
}

#define P1_Movement
if (mode = "lose")
{
    global.p1tp = 0;
    o_ui.alarm[0] = -1;
    friction = 0.3;
    sprite_index = pslam;
    image_alpha -= 0.005;
    if (global.particles = "On")
    {
    a = instance_create(x,y,o_testspark);
    with (a)
    {
        motion_set(random(360),random(3));
        aura = global.p1aura;
    }
    }
}

if (mode = "stand")
or (mode = "pause")
{
    if (overdrive = 1)
    {
        sprite_index = pstand;
    }
    if (overdrive = 2)
    {
        sprite_index = pcharge;
    }
    image_angle = 0
    image_speed = 0.1;
    image_yscale = 1;
    if (x < o_p2.x)
    {
        image_xscale = 1;
    }
    if (x > o_p2.x)
    {
        image_xscale = -1;
    }
}

if (mode = "guard")
{
    sprite_index = pguard;
    image_xscale = 1;
    image_angle = point_direction(x,y,o_p2.x,o_p2.y);
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "burst")
{
    speed = 0;
    sprite_index = pburst;
    image_angle = 0;
    image_yscale = 1;
    if (x < o_p2.x)
    {
        image_xscale = 1;
    }
    if (x > o_p2.x)
    {
        image_xscale = -1;
    }
}

if (mode = "charge")
{
    sprite_index = pcharge;
    image_angle = 0
    image_speed = (global.p1tp/600);
    image_yscale = 1;
    if (x < o_p2.x)
    {
        image_xscale = 1;
    }
    if (x > o_p2.x)
    {
        image_xscale = -1;
    }
}

if (mode = "dash")
{
    sprite_index = pdash;
    image_speed = 0.25;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "hurt")
or (mode = "slam")
{
    sprite_index = phurt;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "bounce")
{
    sprite_index = pslam;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "break")
{
    sprite_index = pslam;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

////////////////////////////////////////////

if (mode = "stand")
or (mode = "pause")
or (mode = "guard")
{
    if (speed > 8*overdrive)
    {
        speed = 8*overdrive;
    }
}
if (mode = "blast2")
{
    if (speed > 3*overdrive)
    {
        speed = 3*overdrive;
    }
}
if (mode = "dash")
{
    speed = 15*overdrive;
}
if (mode = "attack")
or (mode = "hurt")
or (mode = "blast1")
or (mode = "blast1quick")
or (mode = "blast1big")
or (mode = "blast1shot")
or (mode = "meleeheavy1")
or (mode = "meleeheavy2")
or (mode = "meleeheavy3")
{
    friction = 0.2;
}

////////////////////////////////////////////

if (mode = "stand")
or (mode = "pause")
or (mode = "blast2")
or (mode = "blastshot2")
{
    if (keyboard_check(global.p1_move_up))
    or (keyboard_check(global.p1_move_down))
    or (keyboard_check(global.p1_move_left))
    or (keyboard_check(global.p1_move_right))
    or (gamepad_button_check(0,global.p1p_move_up))
    or (gamepad_button_check(0,global.p1p_move_down))
    or (gamepad_button_check(0,global.p1p_move_left))
    or (gamepad_button_check(0,global.p1p_move_right))
    {
        motion_add(point_direction(x,y,mover.x,mover.y),0.4*overdrive);
    }
    if not (keyboard_check(global.p1_move_up))
    and not (keyboard_check(global.p1_move_down))
    and not (keyboard_check(global.p1_move_left))
    and not (keyboard_check(global.p1_move_right))
    and not (gamepad_button_check(0,global.p1p_move_up))
    and not (gamepad_button_check(0,global.p1p_move_down))
    and not (gamepad_button_check(0,global.p1p_move_left))
    and not (gamepad_button_check(0,global.p1p_move_right))
    {
        friction = 0.2
    }
}

if (mode = "dash")
{
    if (keyboard_check(global.p1_move_up))
    or (keyboard_check(global.p1_move_down))
    or (keyboard_check(global.p1_move_left))
    or (keyboard_check(global.p1_move_right))
    or (gamepad_button_check(0,global.p1p_move_up))
    or (gamepad_button_check(0,global.p1p_move_down))
    or (gamepad_button_check(0,global.p1p_move_left))
    or (gamepad_button_check(0,global.p1p_move_right))
    {
        if (global.p1tp > 0)
        {
            motion_add(point_direction(x,y,mover.x,mover.y),2*overdrive);
        }
    }
}

if (global.p1tp <= 300)
{
    if (mode = "stand")
    or (mode = "hurt")
    {
        global.p1tp += 0.05;
    }
    if (mode = "dash")
    {
        global.p1tp -= 0.3;
    }
    if (mode = "guard")
    {
        global.p1tp -= 0.2;
        if (keyboard_check_released(global.p1_guard))
        or (gamepad_button_check_released(0,global.p1p_guard))
        {
            with (b)
            {
                instance_destroy();
            }
            mode = "stand";
        }
    }
    if (mode = "charge")
    {
        speed = 0;
        global.p1tp += 1.5;
        if (maxaura = false)
        {
            repeat (global.p1tp/15)
            {
                a = instance_create(x,y,o_auraemit);
                a.player = 1;
                a.dir = random(360);
                with (a)
                {
                    aura = global.p1aura;
                    image_angle = dir;
                    image_xscale = random(global.p1tp/60);
                    motion_set(dir,((global.p1tp/100)*random(4))+1);
                }
            }
        }
    }
}
if (global.p1tp > 300)
{
    global.p1tp = 300;
    if (maxaura = false)
    {
        a = instance_create(x,y,o_auramax);
        with (a)
        {
            player = 1;
        }
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        if (mode = "charge")
        {
            mode = "stand";
        }
        maxaura = true;
    }
}
if (global.p1tp < 300)
{
    if (maxaura = true)
    {
        maxaura = false;
    }
}
if (global.p1tp < 0)
{
    global.p1tp = 0;
    if (mode = "dash")
    or (mode = "guard")
    {
        if (instance_exists(o_guard))
        {
            with (b)
            {
                instance_destroy();
            }
        }
        mode = "stand";
    }
}

////////////////////////////////////////////////////

if (keyboard_check_pressed(global.p1_dash))
or (gamepad_button_check_pressed(0,global.p1p_dash))
{
    if (keyboard_check(global.p1_shift))
    or (gamepad_button_check(0,global.p1p_shift))
    {
        if (global.p1tp < 300)
        or (maxaura = false)
        {
            if (mode = "stand")
            or (mode = "dash")
            {
                audio_emitter_position(p1emit,x,y,150);
                audio_emitter_gain(p1emit,(global.master/100)*(global.effect/100));
                c = audio_play_sound_on(p1emit,f_charge,false,10);
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,vcharge,false,10);
                mode = "charge";
            }
        }
    }
    if not(keyboard_check(global.p1_shift))
    and not(gamepad_button_check(0,global.p1p_shift))
    {
        if (global.p1tp > 5)
        {
            if (mode = "stand")
            or (mode = "charge")
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p1tp -= 5;
                audio_emitter_position(p1emit,x,y,150);
                audio_emitter_gain(p1emit,(global.master/100)*(global.effect/100));
                f = audio_play_sound_on(p1emit,f_dash,false,10);
                mode = "dash"
            }
        }
    }
}
if (keyboard_check_released(global.p1_dash))
or (gamepad_button_check_released(0,global.p1p_dash))
{
    if (mode = "charge")
    or (mode = "dash")
    {
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        mode = "stand";
    }
}


if not (mode = "hurt")
and not (mode = "break")
and not (mode = "slam")
and not (mode = "bounce")
and not (mode = "charge")
and not (mode = "guard")
and not (mode = "burst")
{
    if (keyboard_check(global.p1_tech_a))
    {
        if not (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_a,global.p1tp,o_p2,global.p1_tech_a);
        }
        if (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_d,global.p1tp,o_p2,global.p1_tech_a);
        }
    }
    if (keyboard_check_released(global.p1_tech_a))
    {
        script_execute(global.p1skill_a,global.p1tp,o_p2,global.p1_tech_a);
        script_execute(global.p1skill_d,global.p1tp,o_p2,global.p1_tech_a);
    }
    
    if (keyboard_check(global.p1_tech_b))
    {
        if not (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_b,global.p1tp,o_p2,global.p1_tech_b);
        }
        if (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_e,global.p1tp,o_p2,global.p1_tech_b);
        }
    }
    if (keyboard_check_released(global.p1_tech_b))
    {
        script_execute(global.p1skill_b,global.p1tp,o_p2,global.p1_tech_b);
        script_execute(global.p1skill_e,global.p1tp,o_p2,global.p1_tech_b);
    }
    
    if (keyboard_check(global.p1_tech_c))
    {
        if not (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_c,global.p1tp,o_p2,global.p1_tech_c);
        }
        if (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_f,global.p1tp,o_p2,global.p1_tech_c);
        }
    }
    if (keyboard_check_released(global.p1_tech_c))
    {
        script_execute(global.p1skill_c,global.p1tp,o_p2,global.p1_tech_c);
        script_execute(global.p1skill_f,global.p1tp,o_p2,global.p1_tech_c);
    }
    
    if (gamepad_button_check(0,global.p1p_tech_a))
    {
        if not (gamepad_button_check(0,global.p1p_shift))
        {
            script_execute(global.p1skill_a,global.p1tp,o_p2,global.p1p_tech_a);
        }
        if (gamepad_button_check(0,global.p1p_shift))
        {
            script_execute(global.p1skill_d,global.p1tp,o_p2,global.p1p_tech_a);
        }
    }
    if (gamepad_button_check_released(0,global.p1p_tech_a))
    {
        script_execute(global.p1skill_a,global.p1tp,o_p2,global.p1p_tech_a);
        script_execute(global.p1skill_d,global.p1tp,o_p2,global.p1p_tech_a);
    }
    
    if (gamepad_button_check(0,global.p1p_tech_b))
    {
        if not (gamepad_button_check(0,global.p1p_shift))
        {
            script_execute(global.p1skill_b,global.p1tp,o_p2,global.p1p_tech_b);
        }
        if (gamepad_button_check(0,global.p1p_shift))
        {
            script_execute(global.p1skill_e,global.p1tp,o_p2,global.p1p_tech_b);
        }
    }
    if (gamepad_button_check_released(0,global.p1p_tech_b))
    {
        script_execute(global.p1skill_b,global.p1tp,o_p2,global.p1p_tech_b);
        script_execute(global.p1skill_e,global.p1tp,o_p2,global.p1p_tech_b);
    }
    
    if (gamepad_button_check(0,global.p1p_tech_c))
    {
        if not (gamepad_button_check(0,global.p1p_shift))
        {
            script_execute(global.p1skill_c,global.p1tp,o_p2,global.p1p_tech_c);
        }
        if (gamepad_button_check(0,global.p1p_shift))
        {
            script_execute(global.p1skill_f,global.p1tp,o_p2,global.p1p_tech_c);
        }
    }
    if (gamepad_button_check_released(0,global.p1p_tech_c))
    {
        script_execute(global.p1skill_c,global.p1tp,o_p2,global.p1p_tech_c);
        script_execute(global.p1skill_f,global.p1tp,o_p2,global.p1p_tech_c);
    }
}

if (mode = "stand")
or (mode = "dash")
{
    if (keyboard_check(global.p1_guard))
    or (gamepad_button_check(0,global.p1p_guard))
    {
        if not (keyboard_check(global.p1_shift))
        and not (gamepad_button_check(0,global.p1p_shift))
        {
            if (global.p1tp > 1)
            {
                b = instance_create(x,y,o_guard);
                b.player = 1;
                b.aura = global.p1aura;
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,vguard,false,10);
                mode = "guard";
            }
        }
        if (keyboard_check(global.p1_shift))
        or (gamepad_button_check(0,global.p1p_shift))
        {
            if (global.p1tp > 25)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p1tp -= 25;
                burst = instance_create(x,y,o_burst);
                burst.player = 1;
                burst.aura = global.p1aura;
                if (global.particles = "On")
                {
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p1aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                }
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

if (mode = "hurt")
or (mode = "break")
or (mode = "slam")
or (mode = "bounce")
or (mode = "stuck")
{
    if (keyboard_check(global.p1_guard))
    or (gamepad_button_check(0,global.p1p_guard))
    {
        if (keyboard_check(global.p1_shift))
        or (gamepad_button_check(0,global.p1p_shift))
        {
            if (global.p1tp > 75)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p1tp -= 75;
                burst = instance_create(x,y,o_burst);
                burst.player = 1;
                burst.aura = global.p1aura;
                if (global.particles = "On")
                {
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p1aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                }
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

#define P2_Movement
if (mode = "lose")
{
    global.p2tp = 0;
    o_ui.alarm[0] = -1;
    friction = 0.3;
    sprite_index = pslam;
    image_alpha -= 0.005;
    if (global.particles = "On")
    {
    a = instance_create(x,y,o_testspark);
    with (a)
    {
        motion_set(random(360),random(3));
        aura = global.p2aura;
    }
    }
}

if (mode = "stand")
or (mode = "pause")
{
    if (overdrive = 1)
    {
        sprite_index = pstand;
    }
    if (overdrive = 2)
    {
        sprite_index = pcharge;
    }
    image_angle = 0
    image_speed = 0.1;
    image_yscale = 1;
    if (x < o_p1.x)
    {
        image_xscale = 1;
    }
    if (x > o_p1.x)
    {
        image_xscale = -1;
    }
}

if (mode = "guard")
{
    sprite_index = pguard;
    image_xscale = 1;
    image_angle = point_direction(x,y,o_p1.x,o_p1.y);
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "burst")
{
    speed = 0;
    sprite_index = pburst;
    image_angle = 0;
    image_yscale = 1;
    if (x < o_p1.x)
    {
        image_xscale = 1;
    }
    if (x > o_p1.x)
    {
        image_xscale = -1;
    }
}

if (mode = "charge")
{
    sprite_index = pcharge;
    image_angle = 0
    image_speed = (global.p2tp/600);
    image_yscale = 1;
    if (x < o_p1.x)
    {
        image_xscale = 1;
    }
    if (x > o_p1.x)
    {
        image_xscale = -1;
    }
}

if (mode = "dash")
{
    sprite_index = pdash;
    image_speed = 0.25;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "hurt")
or (mode = "slam")
{
    sprite_index = phurt;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "bounce")
{
    sprite_index = pslam;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "break")
{
    sprite_index = pslam;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

////////////////////////////////////////////

if (mode = "stand")
or (mode = "pause")
or (mode = "guard")
{
    if (speed > 8*overdrive)
    {
        speed = 8*overdrive;
    }
}
if (mode = "blast2")
{
    if (speed > 3*overdrive)
    {
        speed = 3*overdrive;
    }
}
if (mode = "dash")
{
    speed = 15*overdrive;
}
if (mode = "attack")
or (mode = "hurt")
or (mode = "blast1")
or (mode = "blast1quick")
or (mode = "blast1big")
or (mode = "blast1shot")
or (mode = "meleeheavy1")
or (mode = "meleeheavy2")
or (mode = "meleeheavy3")
{
    friction = 0.2;
}

////////////////////////////////////////////

if (mode = "stand")
or (mode = "pause")
or (mode = "blast2")
or (mode = "blastshot2")
{
    if (keyboard_check(global.p2_move_up))
    or (keyboard_check(global.p2_move_down))
    or (keyboard_check(global.p2_move_left))
    or (keyboard_check(global.p2_move_right))
    or (gamepad_button_check(1,global.p2p_move_up))
    or (gamepad_button_check(1,global.p2p_move_down))
    or (gamepad_button_check(1,global.p2p_move_left))
    or (gamepad_button_check(1,global.p2p_move_right))
    {
        motion_add(point_direction(x,y,mover.x,mover.y),0.4*overdrive);
    }
    if not (keyboard_check(global.p2_move_up))
    and not (keyboard_check(global.p2_move_down))
    and not (keyboard_check(global.p2_move_left))
    and not (keyboard_check(global.p2_move_right))
    and not (gamepad_button_check(1,global.p2p_move_up))
    and not (gamepad_button_check(1,global.p2p_move_down))
    and not (gamepad_button_check(1,global.p2p_move_left))
    and not (gamepad_button_check(1,global.p2p_move_right))
    {
        friction = 0.2
    }
}

if (mode = "dash")
{
    if (keyboard_check(global.p2_move_up))
    or (keyboard_check(global.p2_move_down))
    or (keyboard_check(global.p2_move_left))
    or (keyboard_check(global.p2_move_right))
    or (gamepad_button_check(1,global.p2p_move_up))
    or (gamepad_button_check(1,global.p2p_move_down))
    or (gamepad_button_check(1,global.p2p_move_left))
    or (gamepad_button_check(1,global.p2p_move_right))
    {
        if (global.p2tp > 0)
        {
            motion_add(point_direction(x,y,mover.x,mover.y),2*overdrive);
        }
    }
}

if (global.p2tp <= 300)
{
    if (mode = "stand")
    or (mode = "hurt")
    {
        global.p2tp += 0.05;
    }
    if (mode = "dash")
    {
        global.p2tp -= 0.3;
    }
    if (mode = "guard")
    {
        global.p2tp -= 0.2;
        if (keyboard_check_released(global.p2_guard))
        or (gamepad_button_check_released(1,global.p2p_guard))
        {
            with (b)
            {
                instance_destroy();
            }
            mode = "stand";
        }
    }
    if (mode = "charge")
    {
        speed = 0;
        global.p2tp += 1.5;
        if (maxaura = false)
        {
            repeat (global.p2tp/15)
            {
                a = instance_create(x,y,o_auraemit);
                a.player = 2;
                a.dir = random(360);
                with (a)
                {
                    aura = global.p2aura;
                    image_angle = dir;
                    image_xscale = random(global.p2tp/60);
                    motion_set(dir,((global.p2tp/100)*random(4))+1);
                }
            }
        }
    }
}
if (global.p2tp > 300)
{
    global.p2tp = 300;
    if (maxaura = false)
    {
        a = instance_create(x,y,o_auramax);
        with (a)
        {
            player = 2;
        }
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        if (mode = "charge")
        {
            mode = "stand";
        }
        maxaura = true;
    }
}
if (global.p2tp < 300)
{
    if (maxaura = true)
    {
        maxaura = false;
    }
}
if (global.p2tp < 0)
{
    global.p2tp = 0;
    if (mode = "dash")
    or (mode = "guard")
    {
        if (instance_exists(o_guard))
        {
            with (b)
            {
                instance_destroy();
            }
        }
        mode = "stand";
    }
}

////////////////////////////////////////////////////

if (keyboard_check_pressed(global.p2_dash))
or (gamepad_button_check_pressed(1,global.p2p_dash))
{
    if (keyboard_check(global.p2_shift))
    or (gamepad_button_check(1,global.p2p_shift))
    {
        if (global.p2tp < 300)
        or (maxaura = false)
        {
            if (mode = "stand")
            or (mode = "dash")
            {
                audio_emitter_position(p2emit,x,y,150);
                audio_emitter_gain(p2emit,(global.master/100)*(global.effect/100));
                c = audio_play_sound_on(p2emit,f_charge,false,10);
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,vcharge,false,10);
                mode = "charge";
            }
        }
    }
    if not(keyboard_check(global.p2_shift))
    and not(gamepad_button_check(1,global.p2p_shift))
    {
        if (global.p2tp > 5)
        {
            if (mode = "stand")
            or (mode = "charge")
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p2tp -= 5;
                audio_emitter_position(p2emit,x,y,150);
                audio_emitter_gain(p2emit,(global.master/100)*(global.effect/100));
                f = audio_play_sound_on(p2emit,f_dash,false,10);
                mode = "dash"
            }
        }
    }
}
if (keyboard_check_released(global.p2_dash))
or (gamepad_button_check_released(1,global.p2p_dash))
{
    if (mode = "charge")
    or (mode = "dash")
    {
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        mode = "stand";
    }
}


if not (mode = "hurt")
and not (mode = "break")
and not (mode = "slam")
and not (mode = "bounce")
and not (mode = "charge")
and not (mode = "guard")
and not (mode = "burst")
{
    if (keyboard_check(global.p2_tech_a))
    {
        if not (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_a,global.p2tp,o_p1,global.p2_tech_a);
        }
        if (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_d,global.p2tp,o_p1,global.p2_tech_a);
        }
    }
    if (keyboard_check_released(global.p2_tech_a))
    {
        script_execute(global.p2skill_a,global.p2tp,o_p1,global.p2_tech_a);
        script_execute(global.p2skill_d,global.p2tp,o_p1,global.p2_tech_a);
    }
    
    if (keyboard_check(global.p2_tech_b))
    {
        if not (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_b,global.p2tp,o_p1,global.p2_tech_b);
        }
        if (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_e,global.p2tp,o_p1,global.p2_tech_b);
        }
    }
    if (keyboard_check_released(global.p2_tech_b))
    {
        script_execute(global.p2skill_b,global.p2tp,o_p1,global.p2_tech_b);
        script_execute(global.p2skill_e,global.p2tp,o_p1,global.p2_tech_b);
    }
    
    if (keyboard_check(global.p2_tech_c))
    {
        if not (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_c,global.p2tp,o_p1,global.p2_tech_c);
        }
        if (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_f,global.p2tp,o_p1,global.p2_tech_c);
        }
    }
    if (keyboard_check_released(global.p2_tech_c))
    {
        script_execute(global.p2skill_c,global.p2tp,o_p1,global.p2_tech_c);
        script_execute(global.p2skill_f,global.p2tp,o_p1,global.p2_tech_c);
    }
    
    if (gamepad_button_check(1,global.p2p_tech_a))
    {
        if not (gamepad_button_check(1,global.p2p_shift))
        {
            script_execute(global.p2skill_a,global.p2tp,o_p1,global.p2p_tech_a);
        }
        if (gamepad_button_check(1,global.p2p_shift))
        {
            script_execute(global.p2skill_d,global.p2tp,o_p1,global.p2p_tech_a);
        }
    }
    if (gamepad_button_check_released(1,global.p2p_tech_a))
    {
        script_execute(global.p2skill_a,global.p2tp,o_p1,global.p2p_tech_a);
        script_execute(global.p2skill_d,global.p2tp,o_p1,global.p2p_tech_a);
    }
    
    if (gamepad_button_check(1,global.p2p_tech_b))
    {
        if not (gamepad_button_check(1,global.p2p_shift))
        {
            script_execute(global.p2skill_b,global.p2tp,o_p1,global.p2p_tech_b);
        }
        if (gamepad_button_check(1,global.p2p_shift))
        {
            script_execute(global.p2skill_e,global.p2tp,o_p1,global.p2p_tech_b);
        }
    }
    if (gamepad_button_check_released(1,global.p2p_tech_b))
    {
        script_execute(global.p2skill_b,global.p2tp,o_p1,global.p2p_tech_b);
        script_execute(global.p2skill_e,global.p2tp,o_p1,global.p2p_tech_b);
    }
    
    if (gamepad_button_check(1,global.p2p_tech_c))
    {
        if not (gamepad_button_check(1,global.p2p_shift))
        {
            script_execute(global.p2skill_c,global.p2tp,o_p1,global.p2p_tech_c);
        }
        if (gamepad_button_check(1,global.p2p_shift))
        {
            script_execute(global.p2skill_f,global.p2tp,o_p1,global.p2p_tech_c);
        }
    }
    if (gamepad_button_check_released(1,global.p2p_tech_c))
    {
        script_execute(global.p2skill_c,global.p2tp,o_p1,global.p2p_tech_c);
        script_execute(global.p2skill_f,global.p2tp,o_p1,global.p2p_tech_c);
    }
}

if (mode = "stand")
or (mode = "dash")
{
    if (keyboard_check(global.p2_guard))
    or (gamepad_button_check(1,global.p2p_guard))
    {
        if not (keyboard_check(global.p2_shift))
        and not (gamepad_button_check(1,global.p2p_shift))
        {
            if (global.p2tp > 1)
            {
                b = instance_create(x,y,o_guard);
                b.player = 2;
                b.aura = global.p2aura;
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,vguard,false,10);
                mode = "guard";
            }
        }
        if (keyboard_check(global.p2_shift))
        or (gamepad_button_check(1,global.p2p_shift))
        {
            if (global.p2tp > 25)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p2tp -= 25;
                burst = instance_create(x,y,o_burst);
                burst.player = 2;
                burst.aura = global.p2aura;
                if (global.particles = "On")
                {
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p2aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                }
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

if (mode = "hurt")
or (mode = "break")
or (mode = "slam")
or (mode = "bounce")
or (mode = "stuck")
{
    if (keyboard_check(global.p2_guard))
    or (gamepad_button_check(1,global.p2p_guard))
    {
        if (keyboard_check(global.p2_shift))
        or (gamepad_button_check(1,global.p2p_shift))
        {
            if (global.p2tp > 75)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p2tp -= 75;
                burst = instance_create(x,y,o_burst);
                burst.player = 2;
                burst.aura = global.p2aura;
                if (global.particles = "On")
                {
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p2aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                }
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

#define P1_training
if (mode = "lose")
{
    global.p1tp = 0;
    friction = 0.3;
    sprite_index = pslam;
    image_alpha -= 0.005;
    if (image_alpha <= 0)
    {
        global.winner = "player 2";
        audio_stop_all();
        room_goto(r_victory);
    }
    a = instance_create(x,y,o_testspark);
    with (a)
    {
        motion_set(random(360),random(3));
        aura = global.p1aura;
    }
}

if (mode = "stand")
{
    sprite_index = pstand;
    image_angle = 0
    image_speed = 0.1;
    image_yscale = 1;
    if (x < o_p2tutorial.x)
    {
        image_xscale = 1;
    }
    if (x > o_p2tutorial.x)
    {
        image_xscale = -1;
    }
}

if (mode = "guard")
{
    sprite_index = pguard;
    image_xscale = 1;
    image_angle = point_direction(x,y,o_p2tutorial.x,o_p2tutorial.y);
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "burst")
{
    speed = 0;
    sprite_index = pburst;
    image_angle = 0;
    image_yscale = 1;
    if (x < o_p2tutorial.x)
    {
        image_xscale = 1;
    }
    if (x > o_p2tutorial.x)
    {
        image_xscale = -1;
    }
}

if (mode = "charge")
{
    sprite_index = pcharge;
    image_angle = 0
    image_speed = (global.p1tp/600);
    image_yscale = 1;
    if (x < o_p2tutorial.x)
    {
        image_xscale = 1;
    }
    if (x > o_p2tutorial.x)
    {
        image_xscale = -1;
    }
}

if (mode = "dash")
{
    sprite_index = pdash;
    image_speed = 0.25;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "hurt")
or (mode = "slam")
{
    sprite_index = phurt;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "bounce")
{
    sprite_index = pslam;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "break")
{
    sprite_index = pslam;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

////////////////////////////////////////////

if (mode = "stand")
or (mode = "guard")
{
    if (speed > 8)
    {
        speed = 8;
    }
}
if (mode = "dash")
{
    speed = 15;
}
if (mode = "attack")
or (mode = "hurt")
or (mode = "blast1")
or (mode = "blast1quick")
or (mode = "blast1big")
or (mode = "blast1shot")
or (mode = "meleeheavy1")
or (mode = "meleeheavy2")
or (mode = "meleeheavy3")
{
    friction = 0.2;
}

////////////////////////////////////////////

if (mode = "stand")
{
if (keyboard_check(global.p1_move_up))
{
    if (mode = "stand")
    {
        motion_add(90,0.5)
    }
}
if (keyboard_check(global.p1_move_down))
{
    if (mode = "stand")
    {
        motion_add(270,0.5)
    }
}
if (keyboard_check(global.p1_move_left))
{
    if (mode = "stand")
    {
        motion_add(180,0.5)
    }
}
if (keyboard_check(global.p1_move_right))
{
    if (mode = "stand")
    {
        motion_add(0,0.5)
    }
}
if not (keyboard_check(global.p1_move_up))
and not (keyboard_check(global.p1_move_down))
and not (keyboard_check(global.p1_move_left))
and not (keyboard_check(global.p1_move_right))
{
    friction = 0.2
}
}

if (mode = "dash")
{
    if (keyboard_check(global.p1_move_up))
    {
        if (global.p1tp > 0)
        {
            motion_add(90,2)
        }
    }
    if (keyboard_check(global.p1_move_down))
    {
        if (global.p1tp > 0)
        {
            motion_add(270,2)
        }
    }
    if (keyboard_check(global.p1_move_left))
    {
        if (global.p1tp > 0)
        {
            motion_add(180,2)
        }
    }
    if (keyboard_check(global.p1_move_right))
    {
        if (global.p1tp > 0)
        {
            motion_add(0,2)
        }
    }
}

if (global.p1tp <= 300)
{
    if (mode = "stand")
    or (mode = "hurt")
    {
        global.p1tp += 0.05;
    }
    if (mode = "dash")
    {
        global.p1tp -= 0.3;
    }
    if (mode = "guard")
    {
        global.p1tp -= 0.2;
        if (keyboard_check_released(global.p1_guard))
        {
            with (b)
            {
                instance_destroy();
            }
            mode = "stand";
        }
    }
    if (mode = "charge")
    {
        speed = 0;
        global.p1tp += 1;
        if (maxaura = false)
        {
            repeat (global.p1tp/15)
            {
                a = instance_create(x,y,o_auraemit);
                a.player = 1;
                a.dir = random(360);
                with (a)
                {
                    aura = global.p1aura;
                    image_angle = dir;
                    image_xscale = random(global.p1tp/60);
                    motion_set(dir,((global.p1tp/100)*random(4))+1);
                }
            }
        }
    }
}
if (global.p1tp >= 300)
{
    global.p1tp = 300;
    if (maxaura = false)
    {
        a = instance_create(x,y,o_auramax);
        with (a)
        {
            player = 3;
        }
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        if (mode = "charge")
        {
            mode = "stand";
        }
        maxaura = true;
    }
}
if (global.p1tp < 300)
{
    if (maxaura = true)
    {
        maxaura = false;
    }
}
if (global.p1tp < 0)
{
    global.p1tp = 0;
    if (mode = "dash")
    or (mode = "guard")
    {
        if (instance_exists(o_guard))
        {
            with (b)
            {
                instance_destroy();
            }
        }
        mode = "stand";
    }
}

////////////////////////////////////////////////////

if (keyboard_check_pressed(global.p1_dash))
{
    if (keyboard_check(global.p1_shift))
    {
        if (global.p1tp < 300)
        or (maxaura = false)
        {
            if (mode = "stand")
            or (mode = "dash")
            {
                audio_emitter_position(p1emit,x,y,150);
                audio_emitter_gain(p1emit,(global.master/100)*(global.effect/100));
                c = audio_play_sound_on(p1emit,f_charge,false,10);
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,vcharge,false,10);
                mode = "charge";
            }
        }
    }
    if not(keyboard_check(global.p1_shift))
    {
        if (global.p1tp > 5)
        and (global.p1tp <= 300)
        {
            if (mode = "stand")
            or (mode = "charge")
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p1tp -= 5;
                audio_emitter_position(p1emit,x,y,150);
                audio_emitter_gain(p1emit,(global.master/100)*(global.effect/100));
                f = audio_play_sound_on(p1emit,f_dash,false,10);
                mode = "dash"
            }
        }
    }
}
if (keyboard_check_released(global.p1_dash))
{
    if (mode = "charge")
    or (mode = "dash")
    {
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        mode = "stand";
    }
}


if not (mode = "hurt")
and not (mode = "break")
and not (mode = "slam")
and not (mode = "bounce")
and not (mode = "charge")
and not (mode = "guard")
and not (mode = "burst")
{
    if (keyboard_check(global.p1_tech_a))
    {
        if not (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_a,global.p1tp,o_p2tutorial,global.p1_tech_a);
        }
        if (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_d,global.p1tp,o_p2tutorial,global.p1_tech_a);
        }
    }
    if (keyboard_check_released(global.p1_tech_a))
    {
        script_execute(global.p1skill_a,global.p1tp,o_p2tutorial,global.p1_tech_a);
        script_execute(global.p1skill_d,global.p1tp,o_p2tutorial,global.p1_tech_a);
    }
    
    if (keyboard_check(global.p1_tech_b))
    {
        if not (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_b,global.p1tp,o_p2tutorial,global.p1_tech_b);
        }
        if (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_e,global.p1tp,o_p2tutorial,global.p1_tech_b);
        }
    }
    if (keyboard_check_released(global.p1_tech_b))
    {
        script_execute(global.p1skill_b,global.p1tp,o_p2tutorial,global.p1_tech_b);
        script_execute(global.p1skill_e,global.p1tp,o_p2tutorial,global.p1_tech_b);
    }
    
    if (keyboard_check(global.p1_tech_c))
    {
        if not (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_c,global.p1tp,o_p2tutorial,global.p1_tech_c);
        }
        if (keyboard_check(global.p1_shift))
        {
            script_execute(global.p1skill_f,global.p1tp,o_p2tutorial,global.p1_tech_c);
        }
    }
    if (keyboard_check_released(global.p1_tech_c))
    {
        script_execute(global.p1skill_c,global.p1tp,o_p2tutorial,global.p1_tech_c);
        script_execute(global.p1skill_f,global.p1tp,o_p2tutorial,global.p1_tech_c);
    }
    
    else if (keyboard_check(global.p1_guard))
    {
        if not (keyboard_check(global.p1_shift))
        {
            if (global.p1tp > 1)
            {
                b = instance_create(x,y,o_guard);
                b.player = 1;
                b.aura = global.p1aura;
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,vguard,false,10);
                mode = "guard";
            }
        }
        if (keyboard_check(global.p1_shift))
        {
            if (global.p1tp > 50)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p1tp -= 50;
                burst = instance_create(x,y,o_burst);
                burst.player = 1;
                burst.aura = global.p1aura;
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p1aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

if (mode = "hurt")
or (mode = "break")
or (mode = "slam")
or (mode = "bounce")
{
    if (keyboard_check(global.p1_guard))
    {
        if (keyboard_check(global.p1_shift))
        {
            if (global.p1tp > 100)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p1tp -= 100;
                burst = instance_create(x,y,o_burst);
                burst.player = 1;
                burst.aura = global.p1aura;
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p1aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                audio_emitter_position(p1voice,x,y,150);
                audio_emitter_gain(p1voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p1voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

#define P2_training
if (mode = "lose")
{
    global.p2tp = 0;
    friction = 0.3;
    sprite_index = pslam;
    image_alpha -= 0.005;
    if (image_alpha <= 0)
    {
        global.winner = "player 1";
        audio_stop_all();
        room_goto(r_victory);
    }
    a = instance_create(x,y,o_testspark);
    with (a)
    {
        motion_set(random(360),random(3));
        aura = global.p2aura;
    }
}

if (mode = "stand")
{
    sprite_index = pstand;
    image_angle = 0
    image_speed = 0.1;
    image_yscale = 1;
    if (x < o_p1tutorial.x)
    {
        image_xscale = 1;
    }
    if (x > o_p1tutorial.x)
    {
        image_xscale = -1;
    }
}

if (mode = "guard")
{
    sprite_index = pguard;
    image_xscale = 1;
    image_angle = point_direction(x,y,o_p1tutorial.x,o_p1tutorial.y);
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "burst")
{
    speed = 0;
    sprite_index = pburst;
    image_angle = 0;
    image_yscale = 1;
    if (x < o_p1tutorial.x)
    {
        image_xscale = 1;
    }
    if (x > o_p1tutorial.x)
    {
        image_xscale = -1;
    }
}

if (mode = "charge")
{
    sprite_index = pcharge;
    image_angle = 0
    image_speed = (global.p2tp/600);
    image_yscale = 1;
    if (x < o_p1tutorial.x)
    {
        image_xscale = 1;
    }
    if (x > o_p1tutorial.x)
    {
        image_xscale = -1;
    }
}

if (mode = "dash")
{
    sprite_index = pdash;
    image_speed = 0.25;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "hurt")
or (mode = "slam")
{
    sprite_index = phurt;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "bounce")
{
    sprite_index = pslam;
    image_xscale = 1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

if (mode = "break")
{
    sprite_index = pslam;
    image_xscale = -1;
    image_angle = direction;
    if (image_angle <= 90)
    or (image_angle > 270)
    {
        image_yscale = 1;
    }
    if (image_angle > 90)
    and (image_angle <= 270)
    {
        image_yscale = -1;
    }
}

////////////////////////////////////////////

if (mode = "stand")
or (mode = "guard")
{
    if (speed > 8)
    {
        speed = 8;
    }
}
if (mode = "dash")
{
    speed = 15;
}
if (mode = "attack")
or (mode = "hurt")
or (mode = "blast1")
or (mode = "blast1quick")
or (mode = "blast1big")
or (mode = "blast1shot")
or (mode = "meleeheavy1")
or (mode = "meleeheavy2")
or (mode = "meleeheavy3")
{
    friction = 0.2;
}

////////////////////////////////////////////

if (mode = "stand")
{
if (keyboard_check(global.p2_move_up))
{
    if (mode = "stand")
    {
        motion_add(90,0.5)
    }
}
if (keyboard_check(global.p2_move_down))
{
    if (mode = "stand")
    {
        motion_add(270,0.5)
    }
}
if (keyboard_check(global.p2_move_left))
{
    if (mode = "stand")
    {
        motion_add(180,0.5)
    }
}
if (keyboard_check(global.p2_move_right))
{
    if (mode = "stand")
    {
        motion_add(0,0.5)
    }
}
if not (keyboard_check(global.p2_move_up))
and not (keyboard_check(global.p2_move_down))
and not (keyboard_check(global.p2_move_left))
and not (keyboard_check(global.p2_move_right))
{
    friction = 0.2
}
}

if (mode = "dash")
{
    if (keyboard_check(global.p2_move_up))
    {
        if (global.p2tp > 0)
        {
            motion_add(90,2)
        }
    }
    if (keyboard_check(global.p2_move_down))
    {
        if (global.p2tp > 0)
        {
            motion_add(270,2)
        }
    }
    if (keyboard_check(global.p2_move_left))
    {
        if (global.p2tp > 0)
        {
            motion_add(180,2)
        }
    }
    if (keyboard_check(global.p2_move_right))
    {
        if (global.p2tp > 0)
        {
            motion_add(0,2)
        }
    }
}

if (global.p2tp <= 300)
{
    if (mode = "stand")
    or (mode = "hurt")
    {
        global.p2tp += 0.05;
    }
    if (mode = "dash")
    {
        global.p2tp -= 0.3;
    }
    if (mode = "guard")
    {
        global.p2tp -= 0.2;
        if (keyboard_check_released(global.p2_guard))
        {
            with (b)
            {
                instance_destroy();
            }
            mode = "stand";
        }
    }
    if (mode = "charge")
    {
        speed = 0;
        global.p2tp += 1;
        if (maxaura = false)
        {
            repeat (global.p2tp/15)
            {
                a = instance_create(x,y,o_auraemit);
                a.player = 2;
                a.dir = random(360);
                with (a)
                {
                    aura = global.p2aura;
                    image_angle = dir;
                    image_xscale = random(global.p2tp/60);
                    motion_set(dir,((global.p2tp/100)*random(4))+1);
                }
            }
        }
    }
}
if (global.p2tp >= 300)
{
    global.p2tp = 300;
    if (maxaura = false)
    {
        a = instance_create(x,y,o_auramax);
        with (a)
        {
            player = 4;
        }
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        if (mode = "charge")
        {
            mode = "stand";
        }
        maxaura = true;
    }
}
if (global.p2tp < 300)
{
    if (maxaura = true)
    {
        maxaura = false;
    }
}
if (global.p2tp < 0)
{
    global.p2tp = 0;
    if (mode = "dash")
    or (mode = "guard")
    {
        if (instance_exists(o_guard))
        {
            with (b)
            {
                instance_destroy();
            }
        }
        mode = "stand";
    }
}

////////////////////////////////////////////////////

if (keyboard_check_pressed(global.p2_dash))
{
    if (keyboard_check(global.p2_shift))
    {
        if (global.p2tp < 300)
        or (maxaura = false)
        {
            if (mode = "stand")
            or (mode = "dash")
            {
                audio_emitter_position(p2emit,x,y,150);
                audio_emitter_gain(p2emit,(global.master/100)*(global.effect/100));
                c = audio_play_sound_on(p2emit,f_charge,false,10);
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,vcharge,false,10);
                mode = "charge";
            }
        }
    }
    if not(keyboard_check(global.p2_shift))
    {
        if (global.p2tp > 5)
        and (global.p2tp <= 300)
        {
            if (mode = "stand")
            or (mode = "charge")
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p2tp -= 5;
                audio_emitter_position(p2emit,x,y,150);
                audio_emitter_gain(p2emit,(global.master/100)*(global.effect/100));
                f = audio_play_sound_on(p2emit,f_dash,false,10);
                mode = "dash"
            }
        }
    }
}
if (keyboard_check_released(global.p2_dash))
{
    if (mode = "charge")
    or (mode = "dash")
    {
        if (audio_is_playing(c))
        {
            audio_stop_sound(c);
        }
        if (audio_is_playing(e))
        {
            audio_stop_sound(e);
        }
        mode = "stand";
    }
}


if not (mode = "hurt")
and not (mode = "break")
and not (mode = "slam")
and not (mode = "bounce")
and not (mode = "charge")
and not (mode = "guard")
and not (mode = "burst")
{
    if (keyboard_check(global.p2_tech_a))
    {
        if not (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_a,global.p2tp,o_p1tutorial,global.p2_tech_a);
        }
        if (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_d,global.p2tp,o_p1tutorial,global.p2_tech_a);
        }
    }
    if (keyboard_check_released(global.p2_tech_a))
    {
        script_execute(global.p2skill_a,global.p2tp,o_p1tutorial,global.p2_tech_a);
        script_execute(global.p2skill_d,global.p2tp,o_p1tutorial,global.p2_tech_a);
    }
    
    if (keyboard_check(global.p2_tech_b))
    {
        if not (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_b,global.p2tp,o_p1tutorial,global.p2_tech_b);
        }
        if (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_e,global.p2tp,o_p1tutorial,global.p2_tech_b);
        }
    }
    if (keyboard_check_released(global.p2_tech_b))
    {
        script_execute(global.p2skill_b,global.p2tp,o_p1tutorial,global.p2_tech_b);
        script_execute(global.p2skill_e,global.p2tp,o_p1tutorial,global.p2_tech_b);
    }
    
    if (keyboard_check(global.p2_tech_c))
    {
        if not (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_c,global.p2tp,o_p1tutorial,global.p2_tech_c);
        }
        if (keyboard_check(global.p2_shift))
        {
            script_execute(global.p2skill_f,global.p2tp,o_p1tutorial,global.p2_tech_c);
        }
    }
    if (keyboard_check_released(global.p2_tech_c))
    {
        script_execute(global.p2skill_c,global.p2tp,o_p1tutorial,global.p2_tech_c);
        script_execute(global.p2skill_f,global.p2tp,o_p1tutorial,global.p2_tech_c);
    }
    
    else if (keyboard_check(global.p2_guard))
    {
        if not (keyboard_check(global.p2_shift))
        {
            if (global.p2tp > 1)
            {
                b = instance_create(x,y,o_guard);
                b.player = 2;
                b.aura = global.p2aura;
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,vguard,false,10);
                mode = "guard";
            }
        }
        if (keyboard_check(global.p2_shift))
        {
            if (global.p2tp > 50)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p2tp -= 50;
                burst = instance_create(x,y,o_burst);
                burst.player = 2;
                burst.aura = global.p2aura;
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p2aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

if (mode = "hurt")
or (mode = "break")
or (mode = "slam")
or (mode = "bounce")
{
    if (keyboard_check(global.p2_guard))
    {
        if (keyboard_check(global.p2_shift))
        {
            if (global.p2tp > 100)
            {
                if (audio_is_playing(c))
                {
                    audio_stop_sound(c);
                }
                if (audio_is_playing(d))
                {
                    audio_stop_sound(d);
                }
                if (audio_is_playing(e))
                {
                    audio_stop_sound(e);
                }
                global.p2tp -= 100;
                burst = instance_create(x,y,o_burst);
                burst.player = 2;
                burst.aura = global.p2aura;
                repeat(200)
                {
                    a = instance_create(x,y,o_testspark);
                    a.player = 1;
                    a.dir = random(360);
                    with (a)
                    {
                        image_alpha = random(1);
                        aura = global.p2aura;
                        image_angle = dir;
                        image_xscale = 1+random(5);
                        motion_set(dir,1+random(4));
                    }
                }
                audio_emitter_position(p2voice,x,y,150);
                audio_emitter_gain(p2voice,(global.master/100)*(global.voice/100));
                e = audio_play_sound_on(p2voice,choose(vatk3,vatk4),false,10);
                mode = "burst";
                alarm[0] = 30;
            }
        }
    }
}

#define tech_testblast
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_released(argument2))
or (gamepad_button_check_released(0,argument2))
or (gamepad_button_check_released(1,argument2))
{
    if (mode = "blast1")
    {
        mode = "blast1quick";
        image_xscale = 1;
        image_angle = point_direction(x,y,argument1.x,argument1.y);
        if (image_angle <= 90)
        or (image_angle > 270)
        {
            image_yscale = 1;
        }
        if (image_angle > 90)
        and (image_angle <= 270)
        {
            image_yscale = -1;
        }
        alarm[0] = -1;
        alarm[1] = 7;
        if (audio_is_playing(d))
        {
            audio_stop_sound(d);
        }
    }
}

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 15)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 15;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 15;
            }
            mode = "blast1";
            sprite_index = paim;
            image_index = 0;
            image_speed = 0.25;
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 28;
            emit = audio_emitter_create();
            audio_emitter_position(emit,x,y,150);
            audio_emitter_gain(emit,(global.master/100)*(global.effect/100));
            d = audio_play_sound_on(emit,f_atkcharge,false,10);
        }
    }
}

#define tech_testblast2
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 9)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 9;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 9 ;
            }
            mode = "blast2";
            sprite_index = paim;
            image_index = 0;
            image_speed = 0.25;
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 20;
        }
    }
    if (mode = "blastshot2")
    {
        if (argument0 > 5)
        and (alarm[0] <= 10)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 5;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 5;
            }
            mode = "blast2";
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 7;
        }
    }
}

#define tech_testlaser
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 18)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 18;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 18;
            }
            mode = "laser";
            if (argument1 = o_p1)
            {
                target = instance_create(argument1.x,argument1.y,o_targetter);
                target.player = 2;
                target.dir = image_angle;
                with (target)
                {
                    aura = global.p2aura;
                }
            }
            if (argument1 = o_p2)
            {
                target = instance_create(argument1.x,argument1.y,o_targetter);
                target.player = 1;
                target.dir = image_angle;
                with (target)
                {
                    aura = global.p1aura;
                }
            }
            sprite_index = paim;
            image_index = 0;
            image_speed = 0.25;
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 35;
        }
    }
}

#define tech_testblast3
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 9)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 9;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 9;
            }
            mode = "blast3";
            sprite_index = paim;
            image_index = 0;
            image_speed = 0.25;
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 16;
        }
    }
}

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "blast3hit")
    {
        if (argument0 > 9)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 9;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 9;
            }
            mode = "blast4";
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 12;
        }
    }
}

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "blast4hit")
    {
        if (argument0 > 9)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 9;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 9;
            }
            mode = "blast5";
            sprite_index = pfire;
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 12;
        }
    }
}

#define tech_testblast4
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 11)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 11;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 11;
            }
            mode = "blast6";
            sprite_index = pcharge;
            image_speed = 0.5;
            image_yscale = 1;
            if (x <= argument1.x)
            {
                image_xscale = 1;
            }
            if (x > argument1.x)
            {
                image_xscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 18;
        }
    }
}

#define tech_testblast5
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_released(argument2))
or (gamepad_button_check_released(0,argument2))
or (gamepad_button_check_released(1,argument2))
{
    if (mode = "blast7")
    {
        mode = "blast7quick";
        image_xscale = 1;
        image_angle = point_direction(x,y,argument1.x,argument1.y);
        if (image_angle <= 90)
        or (image_angle > 270)
        {
            image_yscale = 1;
        }
        if (image_angle > 90)
        and (image_angle <= 270)
        {
            image_yscale = -1;
        }
        alarm[0] = -1;
        alarm[1] = 7;
        if (audio_is_playing(d))
        {
            audio_stop_sound(d);
        }
    }
}

if (keyboard_check_released(argument2))
or (gamepad_button_check_released(0,argument2))
or (gamepad_button_check_released(1,argument2))
{
    if (mode = "blast7charge")
    {
        mode = "blast7heavy";
        image_xscale = 1;
        image_angle = point_direction(x,y,argument1.x,argument1.y);
        if (image_angle <= 90)
        or (image_angle > 270)
        {
            image_yscale = 1;
        }
        if (image_angle > 90)
        and (image_angle <= 270)
        {
            image_yscale = -1;
        }
        alarm[0] = -1;
        alarm[1] = 7;
        if (audio_is_playing(d))
        {
            audio_stop_sound(d);
        }
    }
}

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 17)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 16;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 16;
            }
            mode = "blast7";
            sprite_index = paim;
            image_index = 0;
            image_speed = 0.25;
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 14;
        }
    }
}

if (keyboard_check(argument2))
or (gamepad_button_check(0,argument2))
or (gamepad_button_check(1,argument2))
{
    if (mode = "blast7charge")
    {
        with (a)
        {
            if (argument0 > 0.3)
            {
                if (scale < 4)
                {
                    scale += 0.1;
                    if (object_index = o_p1)
                    {
                        global.p1tp -= 0.3;
                    }
                    if (object_index = o_p2)
                    {
                        global.p2tp -= 0.3;
                    }
                }
            }
            image_xscale = scale;
            image_yscale = scale;
        }
    }
}

#define tech_testpunch1
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_released(argument2))
or (gamepad_button_check_released(0,argument2))
or (gamepad_button_check_released(1,argument2))
{
    if (mode = "melee1")
    {
        motion_set(point_direction(x,y,argument1.x,argument1.y),1+distance_to_object(argument1)/6.4);
        if (speed > 15)
        {
            speed = 15;
        }
        mode = "meleequick1";
        sprite_index = pmeleecharge;
        image_speed = speed/30;
        image_angle = point_direction(x,y,argument1.x,argument1.y)
        image_xscale = 1;
        if (image_angle <= 90)
        or (image_angle > 270)
        {
            image_yscale = 1;
        }
        if (image_angle > 90)
        and (image_angle <= 270)
        {
            image_yscale = -1;
        }
        alarm[0] = -1;
        alarm[1] = 10;
        if (audio_is_playing(f_atkcharge))
        {
            audio_stop_sound(f_atkcharge);
        }
    }
    if (mode = "melee2")
    {
        motion_set(point_direction(x,y,argument1.x,argument1.y),1+distance_to_object(argument1)/6.4);
        if (speed > 15)
        {
            speed = 15;
        }
        mode = "meleequick2";
        image_angle = point_direction(x,y,argument1.x,argument1.y)
        image_xscale = 1;
        if (image_angle <= 90)
        or (image_angle > 270)
        {
            image_yscale = 1;
        }
        if (image_angle > 90)
        and (image_angle <= 270)
        {
            image_yscale = -1;
        }
        alarm[0] = -1;
        alarm[1] = 10;
        if (audio_is_playing(f_atkcharge))
        {
            audio_stop_sound(f_atkcharge);
        }
    }
    if (mode = "melee3")
    {
        motion_set(point_direction(x,y,argument1.x,argument1.y),1+distance_to_object(argument1)/6.4);
        if (speed > 15)
        {
            speed = 15;
        }
        mode = "meleequick3";
        image_angle = point_direction(x,y,argument1.x,argument1.y)
        image_xscale = 1;
        if (image_angle <= 90)
        or (image_angle > 270)
        {
            image_yscale = 1;
        }
        if (image_angle > 90)
        and (image_angle <= 270)
        {
            image_yscale = -1;
        }
        alarm[0] = -1;
        alarm[1] = 10;
        if (audio_is_playing(f_atkcharge))
        {
            audio_stop_sound(f_atkcharge);
        }
    }
}

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 12)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 12;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 12;
            }
            mode = "melee1";
            sprite_index = pmeleecharge;
            image_speed = 0;
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 30;
            emit = audio_emitter_create();
            audio_emitter_position(emit,x,y,150);
            audio_emitter_gain(emit,(global.master/100)*(global.effect/100));
            d = audio_play_sound_on(emit,f_atkcharge,false,10);
        }
    }
    if (mode = "meleequickhit1")
    or (mode = "meleeheavy1")
    {
        if (argument0 > 12)
        and (alarm[0] <= 13)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 12;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 12;
            }
            mode = "melee2";
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 30;
            emit = audio_emitter_create();
            audio_emitter_position(emit,x,y,150);
            audio_emitter_gain(emit,(global.master/100)*(global.effect/100));
            d = audio_play_sound_on(emit,f_atkcharge,false,10);
        }
    }
    if (mode = "meleequickhit2")
    or (mode = "meleeheavy2")
    {
        if (argument0 > 12)
        and (alarm[0] <= 13)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 12;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 12;
            }
            mode = "melee3";
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 30;
            emit = audio_emitter_create();
            audio_emitter_position(emit,x,y,150);
            audio_emitter_gain(emit,(global.master/100)*(global.effect/100));
            d = audio_play_sound_on(emit,f_atkcharge,false,10);
        }
    }
}

#define tech_testpunch2
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 5)
        {
            motion_set(point_direction(x,y,argument1.x,argument1.y),1+distance_to_object(argument1)/6.3);
            if (speed > 12)
            {
                speed = 12;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 5;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 5;
            }
            mode = "melee4";
            sprite_index = pmeleecharge;
            image_speed = speed/24;
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 12;
        }
    }
    if (mode = "meleehit4")
    {
        if (argument0 > 4)
        and (alarm[0] <= 13)
        {
            motion_set(point_direction(x,y,argument1.x,argument1.y),1+distance_to_object(argument1)/6.3);
            if (speed > 2)
            {
                speed = 2;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 4;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 4;
            }
            mode = "melee4";
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 7;
        }
    }
}

#define tech_testpunch3
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 14)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 14;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 14;
            }
            mode = "melee5";
            sprite_index = pmeleecharge;
            image_speed = 0;
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 12;
        }
    }
}

#define tech_testpunch4
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 10)
        {
            motion_set(point_direction(x,y,argument1.x,argument1.y),1+distance_to_object(argument1)/6.4);
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 10;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 10;
            }
            mode = "melee6";
            sprite_index = pmeleecharge;
            image_speed = speed/8;
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 16;
        }
    }
}

#define tech_testgrapple
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_released(argument2))
or (gamepad_button_check_released(0,argument2))
or (gamepad_button_check_released(1,argument2))
{
    if (mode = "grab")
    {
        motion_set(point_direction(x,y,argument1.x,argument1.y),1+distance_to_object(argument1)/6.4);
        if (speed > 15)
        {
            speed = 15;
        }
        mode = "grabdash";
        sprite_index = pmeleecharge;
        image_index = 0;
        image_speed = 0.25;
        image_xscale = 1;
        image_angle = point_direction(x,y,argument1.x,argument1.y);
        if (image_angle <= 90)
        or (image_angle > 270)
        {
            image_yscale = 1;
        }
        if (image_angle > 90)
        and (image_angle <= 270)
        {
            image_yscale = -1;
        }
        alarm[0] = -1;
        alarm[1] = 7;
        if (audio_is_playing(d))
        {
            audio_stop_sound(d);
        }
    }
}

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 16)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 16;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 16;
            }
            mode = "grab";
            sprite_index = paim;
            image_index = 0;
            image_speed = 0.25;
            image_xscale = 1;
            image_angle = point_direction(x,y,argument1.x,argument1.y);
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1;
            alarm[1] = 24;
            emit = audio_emitter_create();
            audio_emitter_position(emit,x,y,150);
            audio_emitter_gain(emit,(global.master/100)*(global.effect/100));
            d = audio_play_sound_on(emit,f_atkcharge,false,10);
        }
    }
}

#define tech_testcounter
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 15)
        {
            motion_set(point_direction(x,y,argument1.x,argument1.y),0);
            if (speed > 0)
            {
                speed = 0;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 15;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 15;
            }
            mode = "counter";
            a = instance_create(x,y,o_testcounter);
            with (a)
            {
                if (argument1 = o_p2)
                {
                    player = 1;
                    aura = global.p1aura;
                }
                if (argument1 = o_p1)
                {
                    player = 2;
                    aura = global.p2aura;
                }
            }
            sprite_index = pguard;
            image_speed = 0.5;
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = 50;
        }
    }
}

#define tech_testtrap
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 13)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 13;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 13;
            }
            mode = "trap";
            sprite_index = pcharge;
            image_speed = 0;
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1
            alarm[1] = 12;
        }
    }
}

#define tech_testreflect
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 16)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 16;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 16;
            }
            mode = "reflect";
            sprite_index = pfire;
            image_speed = 0;
            image_angle = point_direction(x,y,argument1.x,argument1.y)
            image_xscale = 1;
            if (image_angle <= 90)
            or (image_angle > 270)
            {
                image_yscale = 1;
            }
            if (image_angle > 90)
            and (image_angle <= 270)
            {
                image_yscale = -1;
            }
            alarm[0] = -1
            alarm[1] = 15;
        }
    }
}

#define tech_testteleport
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (object_index = o_p1)
    or (object_index = o_p2)
    {
        if (mode = "stand")
        or (mode = "dash")
        {
            if (argument0 > 19)
            {
                if (object_index = o_p1)
                {
                    global.p1tp -= 19;
                }
                if (object_index = o_p2)
                {
                    global.p2tp -= 19;
                }
                warp = instance_create(x,y,o_testteleport);
                if (argument1 = o_p2)
                {
                    audio_emitter_position(p1emit,x,y,150);
                    audio_emitter_gain(p1emit,(global.master/100)*(global.effect/100));
                    g = audio_play_sound_on(p1emit,f_teleport,false,10);
                    fake = instance_create(x,y,o_testillusion);
                    with (fake)
                    {
                        sprite_index = o_p1.sprite_index;
                        image_index = o_p1.image_index;
                        image_xscale = o_p1.image_xscale;
                        image_yscale = o_p1.image_yscale;
                        image_angle = o_p1.image_angle;
                        image_speed = 0;
                        player = 1;
                    }
                    with (warp)
                    {
                        if (keyboard_check(global.p1_move_up))
                        or (gamepad_button_check(0,global.p1p_move_up))
                        {
                            y -= 200;
                        }
                        if (keyboard_check(global.p1_move_down))
                        or (gamepad_button_check(0,global.p1p_move_down))
                        {
                            y += 200;
                        }
                        if (keyboard_check(global.p1_move_left))
                        or (gamepad_button_check(0,global.p1p_move_left))
                        {
                            x -= 200;
                        }
                        if (keyboard_check(global.p1_move_right))
                        or (gamepad_button_check(0,global.p1p_move_right))
                        {
                            x += 200
                        }
                        if (distance_to_object(o_p1) > 200)
                        {
                            x = o_p1.x+lengthdir_x(200,point_direction(o_p1.x,o_p1.y,x,y));
                            y = o_p1.y+lengthdir_y(200,point_direction(o_p1.x,o_p1.y,x,y));
                        }
                    }
                    x = warp.x;
                    y = warp.y;
                }
                if (argument1 = o_p1)
                {
                    audio_emitter_position(p2emit,x,y,150);
                    audio_emitter_gain(p2emit,(global.master/100)*(global.effect/100));
                    g = audio_play_sound_on(p2emit,f_teleport,false,10);
                    fake = instance_create(x,y,o_testillusion);
                    with (fake)
                    {
                        sprite_index = o_p2.sprite_index;
                        image_index = o_p2.image_index;
                        image_xscale = o_p2.image_xscale;
                        image_yscale = o_p2.image_yscale;
                        image_angle = o_p2.image_angle;
                        image_speed = 0;
                        player = 2;
                    }
                    with (warp)
                    {
                        if (keyboard_check(global.p2_move_up))
                        or (gamepad_button_check(1,global.p2p_move_up))
                        {
                            y -= 200;
                        }
                        if (keyboard_check(global.p2_move_down))
                        or (gamepad_button_check(1,global.p2p_move_down))
                        {
                            y += 200;
                        }
                        if (keyboard_check(global.p2_move_left))
                        or (gamepad_button_check(1,global.p2p_move_left))
                        {
                            x -= 200;
                        }
                        if (keyboard_check(global.p2_move_right))
                        or (gamepad_button_check(1,global.p2p_move_right))
                        {
                            x += 200
                        }
                        if (distance_to_object(o_p2) > 200)
                        {
                            x = o_p2.x+lengthdir_x(200,point_direction(o_p2.x,o_p2.y,x,y));
                            y = o_p2.y+lengthdir_y(200,point_direction(o_p2.x,o_p2.y,x,y));
                        }
                    }
                    x = warp.x;
                    y = warp.y;
                }
                with (warp)
                {
                    instance_destroy();
                }
            }
        }
    }
}

#define tech_testrevector
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (mode = "stand")
    or (mode = "dash")
    {
        if (argument0 > 17)
        {
            if (speed > 8)
            {
                speed = 8;
            }
            if (object_index = o_p1)
            {
                global.p1tp -= 17;
            }
            if (object_index = o_p2)
            {
                global.p2tp -= 17;
            }
            mode = "revector";
            sprite_index = pcharge;
            image_speed = 0;
            image_angle = 0;
            image_yscale = 1;
            if (x <= argument1.x)
            {
                image_xscale = 1;
            }
            if (x > argument1.x)
            {
                image_xscale = -1;
            }
            alarm[0] = -1
            alarm[1] = 15;
        }
    }
}

#define tech_testduplicate
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (object_index = o_p1)
    or (object_index = o_p2)
    {
        if (mode = "stand")
        or (mode = "dash")
        {
            if (cloner = false)
            {
                if (argument0 > 14)
                {
                    if (speed > 8)
                    {
                        speed = 8;
                    }
                    if (object_index = o_p1)
                    {
                        global.p1tp -= 14;
                    }
                    if (object_index = o_p2)
                    {
                        global.p2tp -= 14;
                    }
                    mode = "duplicate";
                    sprite_index = pcharge;
                    image_speed = 0;
                    image_angle = 0;
                    image_yscale = 1;
                    if (x <= argument1.x)
                    {
                        image_xscale = 1;
                    }
                    if (x > argument1.x)
                    {
                        image_xscale = -1;
                    }
                    alarm[0] = -1
                    alarm[1] = 15;
                }
            }
            else if (cloner = true)
            {
                cloner = false;
                if (instance_exists(clone))
                {
                    with (clone)
                    {
                        instance_destroy();
                    }
                }
            }
        }
    }
}

#define tech_testoverdrive
//argument0 = player TP
//argument1 = opponent
//argument2 = last key pressed

if (keyboard_check_pressed(argument2))
or (gamepad_button_check_pressed(0,argument2))
or (gamepad_button_check_pressed(1,argument2))
{
    if (object_index = o_p1)
    or (object_index = o_p2)
    {
        if (mode = "stand")
        or (mode = "dash")
        {
            if (overdrive = 1)
            {
                if (argument0 > 20)
                {
                    if (speed > 8)
                    {
                        speed = 8;
                    }
                    if (object_index = o_p1)
                    {
                        global.p1tp -= 20;
                    }
                    if (object_index = o_p2)
                    {
                        global.p2tp -= 20;
                    }
                    mode = "overdrive";
                    sprite_index = pcharge;
                    image_speed = 0.5;
                    image_angle = 0;
                    image_yscale = 1;
                    if (x <= argument1.x)
                    {
                        image_xscale = 1;
                    }
                    if (x > argument1.x)
                    {
                        image_xscale = -1;
                    }
                    alarm[0] = -1
                    alarm[1] = 30;
                    emit = audio_emitter_create();
                    audio_emitter_position(emit,x,y,150);
                    audio_emitter_gain(emit,(global.master/100)*(global.effect/100));
                    d = audio_play_sound_on(emit,f_atkcharge,false,10);
                }
            }
            else if (overdrive = 2)
            {
                overdrive = 1;
                if (object_index = o_p1)
                {
                    audio_emitter_position(p1emit,x,y,150);
                    audio_emitter_gain(p1emit,(global.master/100)*(global.effect/100));
                    c = audio_play_sound_on(p1emit,f_overheat,false,10);
                    motion_set(point_direction(o_p2.x,o_p2.y,x,y),1);
                }
                if (object_index = o_p2)
                {
                    audio_emitter_position(p2emit,x,y,150);
                    audio_emitter_gain(p2emit,(global.master/100)*(global.effect/100));
                    c = audio_play_sound_on(p2emit,f_overheat,false,10);
                    motion_set(point_direction(o_p1.x,o_p1.y,x,y),1);
                }
                mode = "hurt"
                alarm[0] = 30;
                if (instance_exists(spark))
                {
                    with (spark)
                    {
                        instance_destroy();
                    }
                }
            }
        }
    }
}