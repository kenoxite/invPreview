// KIV_fnc_getPlayer
// Returns the actual unit controlled by the player, accounting for drones and Zeus remote control
//
// Parameters:
//   None
// Returns:
//   Object - The actual controlled unit

params [["_unit", player]];

[_unit, remoteControlled player] select (!isNull remoteControlled player)
