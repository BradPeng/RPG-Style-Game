var circleRadius = 70; // Adjust this value to set the radius of the circle
var numObjects = 8; // Adjust this value to set the number of objects

for (var i = 0; i < numObjects; i++) {
    var angle = i * 360 / numObjects; // Calculate angle in degrees
    var radians = degtorad(angle); // Convert angle to radians
    
    // Calculate the position offsets based on the angle and radius
    var xOffset = circleRadius * cos(radians);
    var yOffset = circleRadius * sin(radians);
    
    // Create the object at the calculated position
    var _proj = instance_create_layer(x + xOffset, y + yOffset - levitationHeight - 20, "Instances", o_mage_nebula_projectile);
	_proj.sprite_index = s_nebula_effect;
	_proj.alarm[1] = 30 * (i + 1);
	_proj.spd = 7;
	
}