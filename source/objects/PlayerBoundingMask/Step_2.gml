/// @description Animate
event_inherited();
var sine = dsin(image_angle);
var cosine = dcos(image_angle);
wall_horizontal_x = cosine * x_wall_radius;
wall_horizontal_y = -(sine * x_wall_radius);
wall_vertical_x = sine * y_wall_radius;
wall_vertical_y = cosine * y_wall_radius;
vertical_x = sine * (y_radius - y_wall_radius);
vertical_y = cosine * (y_radius - y_wall_radius);