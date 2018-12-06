/// @description Move
// If we press a button, we move the player

input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);

input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);

// alter speed
if (input_walk or input_run) {
	player_speed = abs((input_walk * speed_walking) - (input_run * speed_running));
}

moveX = 0;
moveY = 0;
moveX = (input_right - input_left) * player_speed;
// only move one way at a time (no diagonals)
if (moveX == 0) {
	moveY = (input_down - input_up) * player_speed;
}

if (input_left or input_right or input_up or input_down) {
	// the player is moving
} else {
	// the player is not moving
}

// collision checks
// horizontal
if (moveX != 0) {
	if (place_meeting(x + moveX, y, obj_collision)) {
		repeat (abs(moveX)) {
			if (! place_meeting(x + sign(moveX), y, obj_collision)) {
				x += sign(moveX);
			} else {
				break;
			}
		}
		moveX = 0;
	}
}
// vertical
if (moveY != 0) {
	if (place_meeting(x, y + moveY, obj_collision)) {
		repeat (abs(moveY)) {
			if (! place_meeting(x, y + sign(moveY), obj_collision)) {
				y += sign(moveY);
			} else {
				break;
			}
		}
		moveY = 0;
	}
}

// apply movement
x += moveX
y += moveY