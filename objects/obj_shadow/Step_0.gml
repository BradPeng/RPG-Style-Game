/// Step Event
// Get the instance ID of the object to follow (set this using the instance to follow variable)
var _parent = instance_find(obj_mage, 0);


if (_parent != noone) {
	image_xscale = 30/(_parent.z) + 0.9;
	image_yscale = 30/(_parent.z) + 0.9;
}