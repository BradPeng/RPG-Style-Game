if (instance_exists(follow)) {
	x_to = follow.x;
	y_to = follow.y;
	
}

// update obj position
x += (x_to - x)
y += (y_to - y)
// keep camera cenetered in room
x = clamp(x, view_width_half, room_width - view_width_half);
y = clamp(y, view_height_half, room_height - view_height_half);

// screen_shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

camera_set_view_pos(cam, x - view_width_half, y - view_height_half);