/// @description Draw
var xrad = (image_angle mod 180) ? y_radius : x_radius;
var yrad = (image_angle mod 180) ? x_radius : y_radius;
draw_rectangle_color(
	x - xrad, y - yrad, x + xrad, y + yrad, 
	rect_color, rect_color, rect_color, rect_color, true
);
draw_primitive_begin(pr_linelist);
draw_vertex_colour(
	x + wall_vertical_x - wall_horizontal_x, 
	y + wall_vertical_y - wall_horizontal_y, 
	sensor_color, image_alpha
);
draw_vertex_colour(
	x + wall_vertical_x + wall_horizontal_x, 
	y + wall_vertical_y + wall_horizontal_y, 
	sensor_color, image_alpha
);
draw_vertex_colour(
	x + wall_vertical_x, y + wall_vertical_y, c_white, image_alpha
);
draw_vertex_colour(
	x + wall_vertical_x + vertical_x, 
	y + wall_vertical_y + vertical_y, 
	sensor_color, image_alpha
);
draw_primitive_end();

/*
if (image_angle mod 180)
{
    draw_rectangle_color(x - y_radius, y - x_radius, x + y_radius, y + x_radius, rect_color, rect_color, rect_color, rect_color, true);
}
else
{
    draw_rectangle_color(x - x_radius, y - y_radius, x + x_radius, y + y_radius, rect_color, rect_color, rect_color, rect_color, true);
}
var sine = dsin(image_angle);
var cosine = dcos(image_angle);
var hx = cosine * x_wall_radius;
var hy = -(sine * x_wall_radius);
var vx = sine * y_wall_radius;
var vy = cosine * y_wall_radius;
var px = x + vx;
var py = y + vy;
draw_primitive_begin(pr_linelist);
draw_vertex_colour(px - hx, py - hy, sensor_color, image_alpha);
draw_vertex_colour(px + hx, py + hy, sensor_color, image_alpha);
draw_vertex_colour(px, py, c_white, image_alpha);
draw_vertex_colour(px + sine * y_radius, py + cosine * y_radius, sensor_color, image_alpha);
draw_primitive_end();