if (instance_exists(follow)) {
	x_to = follow.x;
	y_to = follow.y;
	
}

// update obj position
x += (x_to - x)
y += (y_to - y)
// keep camera cenetered in room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

// screen_shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);