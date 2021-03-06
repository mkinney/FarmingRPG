/// @description Draw

var anim_length = 9;
var frame_size = 64;
var anim_speed = 12;

if (moveX < 0) {
	y_frame = 9;
} else if (moveX  > 0) {
	y_frame = 11;
} else if (moveY < 0) {
	y_frame = 8;
} else if (moveY > 0) {
	y_frame = 10;
} else {
	x_frame = 0;
}

// increment frame for animation
if ((x_frame + (anim_speed / 60)) < anim_length) {
	x_frame += anim_speed / 60;
} else {
	x_frame = 1;
}


var xx = x - x_offset;
var yy = y - y_offset;

// draw character base
draw_sprite_part(spr_base, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// draw feet
draw_sprite_part(spr_feet, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// draw legs
draw_sprite_part(spr_legs, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// draw shirt
draw_sprite_part(spr_torso, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// draw hair
draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);