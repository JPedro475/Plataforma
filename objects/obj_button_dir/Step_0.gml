right = virtual_key_add(x, y, sprite_width, sprite_height, vk_right);
varx = (camera_get_view_x(view_camera[0]));
v_width = camera_get_view_width(view_camera[0]);
obj_width = sprite_width;
x_pos = varx + v_width - obj_width;

x = x_pos;