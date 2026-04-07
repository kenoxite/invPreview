// KIV_fnc_create
// Creates the preview environment: background sphere, cloned unit, cameras, render targets, and HUD

if (!isPiPEnabled) exitWith {
    systemChat "WARNING: Enable Picture-in-Picture (PIP) in video settings for character preview";
};

#include "\z\kiv\addons\invPreview\idc.hpp"

call KIV_fnc_cleanup;

// Create background sphere at random far location
private _centerPos = [random [0, 15000, 30000], 0, random [500, 750, 1000]];
private _background = createVehicleLocal ["Sphere_3DEN", _centerPos, [], 0, "none"];
_background setPosATL _centerPos;
_background setDir 0;
private _backgroundTexture = call {
    if (KIV_betterInventory) exitWith {
        "#(argb,8,8,3)color(0.3,0.3,0.3,0.05)"
    };
    "#(argb,8,8,3)color(1,1,1,0)"
};
_background setObjectTexture [0, _backgroundTexture];
_background setObjectTexture [1, _backgroundTexture];
KIV_preview_background = _background;

// Clone player unit
private _unit = createVehicleLocal [typeOf player, [0,0,0], [], 0, "CAN_COLLIDE"];
private _unitPos = [_centerPos # 0, _centerPos # 1, (_centerPos # 2) - 4];
_unit setPosATL _unitPos;
_unit setDir 0;
_unit allowDamage false;
_unit setUnitLoadout getUnitLoadout player;
_unit setFace (face player);
_unit enableSimulation false;
KIV_preview_unit = _unit;

// Apply stance based on equipped weapons
call KIV_fnc_stance;

// Setup top camera (upper body)
private _camPos = _unit modelToWorld [0, 7, 1.3];
private _camFov = 0.1;
private _camTop = "camera" camCreate [0, 0, 0];
_camTop camSetPos _camPos;
_camTop camSetTarget (_unit modelToWorld [0, 0, 1.45]);
_camTop camSetFov _camFov;
_camTop camCommit 0;
KIV_preview_camTop = _camTop;

// Setup bottom camera (lower body)
private _camBottom = "camera" camCreate [0, 0, 0];
_camBottom camSetPos _camPos;
_camBottom camSetTarget (_unit modelToWorld [0, 0, 0.4]);
_camBottom camSetFov _camFov;
_camBottom camCommit 0;
KIV_preview_camBottom = _camBottom;

// Start camera rotation
call KIV_fnc_rotation;

// Create render targets
private _renderTarget_Top = "rendertarget_KIV_preview_top";
_camTop cameraEffect ["INTERNAL", "BACK", _renderTarget_Top];
KIV_preview_renderTarget_Top = _renderTarget_Top;

private _renderTarget_Bottom = "rendertarget_KIV_preview_bottom";
_camBottom cameraEffect ["INTERNAL", "BACK", _renderTarget_Bottom];
KIV_preview_renderTarget_Bottom = _renderTarget_Bottom;

// Add lighting
private _light = "#lightpoint" createVehicle (_unit modelToWorld [0, 2, 1.3]);
_light setLightAmbient [1,1,1]; 
_light setLightColor [0,0,0]; 
_light setLightDayLight true; 
_light setLightAttenuation [0, 0.5, 1, 3, 0, 4, 5];
KIV_preview_light = _light;

private _luminance = apertureParams #3;
private _brightness = 3000;
// NVG effect at night
if (_luminance <= 5.5) then {
    _renderTarget_Top setPiPEffect [1];
    _renderTarget_Bottom setPiPEffect [1];
    _brightness = 20;
};
_light setLightIntensity _brightness;  // setLightIntensity 3000 = setlightBrightness 1

// Display HUD
private _layer = "KIV_preview_layer" call BIS_fnc_rscLayer;
uiNamespace setVariable ["KIV_preview_hudLayer", _layer];
_layer cutRsc ["KIV_PreviewHUD", "PLAIN", 0, true, true];

// Make Ground container background invisible
private _display = findDisplay 602;
private _control = _display displayCtrl 1001;
if (KIV_betterInventory) then {
    _control = _display displayCtrl 8800;
    _control ctrlSetBackgroundColor [0.0,0.0,0.0,0];
} else {
    _control ctrlSetBackgroundColor [0.050000001,0.050000001,0.050000001,0];
};
_control ctrlCommit 0;

// Display background and link render targets to controls
_display = uiNamespace getVariable "KIV_preview_display";
if (!isNull _display) then {
    // Background replacement
    _control = _display displayCtrl IDC_PREVIEW_BCKG;
    if (KIV_betterInventory) then {
        _control = _display displayCtrl IDC_PREVIEW_BCKG_BETTERINV;
        _control ctrlSetBackgroundColor [0.0,0.0,0.0,0.8];
    } else {
        _control ctrlSetBackgroundColor [0.050000001,0.050000001,0.050000001,0.69999999];
    };
    _control ctrlCommit 0;

    // Top display
    _control = _display displayCtrl IDC_PREVIEW_TOP;
    _control ctrlSetText format ["#(argb,512,512,1)r2t(%1,1.0)", _renderTarget_Top];
    _control ctrlCommit 0;

    // Bottom display
    _control = _display displayCtrl IDC_PREVIEW_BOTTOM;
    _control ctrlSetText format ["#(argb,512,512,1)r2t(%1,1.0)", _renderTarget_Bottom];
    _control ctrlCommit 0;
};

// Display replacement background, behind the preview


// Delay reposition until display is ready
0 spawn {
    sleep 0.1;
    call KIV_fnc_resetPosition;
};
