/// Step Event
// Get the instance ID of the object to follow (set this using the instance to follow variable)
var parent = instance_find(instance_to_follow, 0);


if (parent != noone) {
	image_xscale = 30/(parent.z) + 0.9;
	image_yscale = 30/(parent.z) + 0.9;
}