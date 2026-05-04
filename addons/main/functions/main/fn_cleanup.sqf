// KIV_fnc_cleanup
// Terminates all camera effects, deletes preview objects, and clears render targets

private _layer = "KIV_layer" call BIS_fnc_rscLayer;

if (!isNil "KIV_renderTarget") then {
    KIV_cam cameraEffect ["terminate", "back", KIV_renderTarget];
    KIV_renderTarget = nil;
};
if (!isNil "KIV_cam") then {
    camDestroy KIV_cam;
    KIV_cam = nil;
};
if (!isNil "KIV_unit") then {
    deleteVehicle KIV_unit;
    KIV_unit = nil;
};
if (!isNil "KIV_background") then {
    deleteVehicle KIV_background;
    KIV_background = nil;
};
if (!isNil "KIV_light") then {
    deleteVehicle KIV_light;
    KIV_light = nil;
};
if (!isNil "KIV_rotationHandle") then {
    terminate KIV_rotationHandle;
    KIV_rotationHandle = nil;
};

_layer cutText ["", "PLAIN"];

true
