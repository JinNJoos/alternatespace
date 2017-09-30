#define Inputcheckkey
switch(key)
{
    case vk_up:
        key = string("Up");
    break;
    
    case vk_down:
        key = string("Down");
    break;
    
    case vk_left:
        key = string("Left");
    break;
    
    case vk_right:
        key = string("Right");
    break;
    
    case vk_space:
        key = string("Space");
    break;
    
    case vk_numpad0:
        key = string("Num0");
    break;
    
    case vk_numpad1:
        key = string("Num1");
    break;
    
    case vk_numpad2:
        key = string("Num2");
    break;
    
    case vk_numpad3:
        key = string("Num3");
    break;
    
    case vk_numpad4:
        key = string("Num4");
    break;
    
    case vk_numpad5:
        key = string("Num5");
    break;
    
    case vk_numpad6:
        key = string("Num6");
    break;
    
    case vk_numpad7:
        key = string("Num7");
    break;
    
    case vk_numpad8:
        key = string("Num8");
    break;
    
    case vk_numpad9:
        key = string("Num9");
    break;
    
    default:
        key = string(chr(key))
}

#define Inputcheckpad
switch(pad)
{
    case gp_face1:
        pad = string("A");
    break;
    
    case gp_face2:
        pad = string("B");
    break;
    
    case gp_face3:
        pad = string("X");
    break;
    
    case gp_face4:
        pad = string("Y");
    break;
    
    case gp_shoulderl:
        pad = string("LB");
    break;
    
    case gp_shoulderlb:
        pad = string("LT");
    break;
    
    case gp_shoulderr:
        pad = string("RB");
    break;
    
    case gp_shoulderrb:
        pad = string("RT");
    break;
    
    case gp_select:
        pad = string("Select");
    break;
    
    case gp_start:
        pad = string("Start");
    break;
    
    case gp_stickl:
        pad = string("L3");
    break;
    
    case gp_stickr:
        pad = string("R3");
    break;
    
    case gp_padu:
        pad = string("D up");
    break;
    
    case gp_padd:
        pad = string("D down");
    break;
    
    case gp_padl:
        pad = string("D left");
    break;
    
    case gp_padr:
        pad = string("D right");
    break;
    
    default:
        pad = string(chr(pad))
}

#define Inputcheckkeyshift
switch(keyshift)
{
    case vk_up:
        keyshift = string("Up");
    break;
    
    case vk_down:
        keyshift = string("Down");
    break;
    
    case vk_left:
        keyshift = string("Left");
    break;
    
    case vk_right:
        keyshift = string("Right");
    break;
    
    case vk_space:
        keyshift = string("Space");
    break;
    
    case vk_numpad0:
        keyshift = string("Num0");
    break;
    
    case vk_numpad1:
        keyshift = string("Num1");
    break;
    
    case vk_numpad2:
        keyshift = string("Num2");
    break;
    
    case vk_numpad3:
        keyshift = string("Num3");
    break;
    
    case vk_numpad4:
        keyshift = string("Num4");
    break;
    
    case vk_numpad5:
        keyshift = string("Num5");
    break;
    
    case vk_numpad6:
        keyshift = string("Num6");
    break;
    
    case vk_numpad7:
        keyshift = string("Num7");
    break;
    
    case vk_numpad8:
        keyshift = string("Num8");
    break;
    
    case vk_numpad9:
        keyshift = string("Num9");
    break;
    
    default:
        keyshift = string(chr(keyshift))
}

#define Inputcheckpadshift
switch(padshift)
{
    case gp_face1:
        padshift = string("A");
    break;
    
    case gp_face2:
        padshift = string("B");
    break;
    
    case gp_face3:
        padshift = string("X");
    break;
    
    case gp_face4:
        padshift = string("Y");
    break;
    
    case gp_shoulderl:
        padshift = string("LB");
    break;
    
    case gp_shoulderlb:
        padshift = string("LT");
    break;
    
    case gp_shoulderr:
        padshift = string("RB");
    break;
    
    case gp_shoulderrb:
        padshift = string("RT");
    break;
    
    case gp_select:
        padshift = string("Select");
    break;
    
    case gp_start:
        padshift = string("Start");
    break;
    
    case gp_stickl:
        padshift = string("L3");
    break;
    
    case gp_stickr:
        padshift = string("R3");
    break;
    
    case gp_padshiftu:
        padshift = string("D up");
    break;
    
    case gp_padshiftd:
        padshift = string("D down");
    break;
    
    case gp_padshiftl:
        padshift = string("D left");
    break;
    
    case gp_padshiftr:
        padshift = string("D right");
    break;
    
    default:
        padshift = string(chr(padshift))
}