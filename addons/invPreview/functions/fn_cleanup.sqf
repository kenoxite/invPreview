// KIV_fnc_cleanup
// Terminates all camera effects, deletes preview objects, and clears render targets

private _layer = "KIV_preview_layer" call BIS_fnc_rscLayer;

if (!isNil "KIV_preview_renderTarget_Top") then {
    KIV_preview_camTop cameraEffect ["terminate", "back", KIV_preview_renderTarget_Top];
    KIV_preview_renderTarget_Top = nil;
};
if (!isNil "KIV_preview_renderTarget_Bottom") then {
    KIV_preview_camBottom cameraEffect ["terminate", "back", KIV_preview_renderTarget_Bottom];
    KIV_preview_renderTarget_Bottom = nil;
};
if (!isNil "KIV_preview_camTop") then {
    camDestroy KIV_preview_camTop;
    KIV_preview_camTop = nil;
};
if (!isNil "KIV_preview_camBottom") then {
    camDestroy KIV_preview_camBottom;
    KIV_preview_camBottom = nil;
};
if (!isNil "KIV_preview_unit") then {
    deleteVehicle KIV_preview_unit;
    KIV_preview_unit = nil;
};
if (!isNil "KIV_preview_background") then {
    deleteVehicle KIV_preview_background;
    KIV_preview_background = nil;
};
if (!isNil "KIV_preview_light") then {
    deleteVehicle KIV_preview_light;
    KIV_preview_light = nil;
};
if (!isNil "KIV_preview_rotationHandle") then {
    terminate KIV_preview_rotationHandle;
    KIV_preview_rotationHandle = nil;
};

_layer cutText ["", "PLAIN"];

true
