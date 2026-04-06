// KIV_fnc_reposition
// Moves and resizes the preview group and its child controls

#include "\z\kiv\addons\invPreview\idc.hpp"

params [["_posX", ""], ["_posY", ""], ["_width", ""], ["_height", ""]];

private _display = uiNamespace getVariable "KIV_preview_display";
if (isNil "_display") exitWith {};
if (isNull _display) exitWith {};

private _group = _display displayCtrl IDC_PREVIEW_GROUP;
if (typeName _group != "CONTROL") exitWith {};

_group ctrlSetPosition [_posX, _posY, _width, _height];
_group ctrlSetFade ([0.25, 0.2] select KIV_betterInventory);
_group ctrlCommit 0;

private _topControl = _display displayCtrl IDC_PREVIEW_TOP;
private _bottomControl = _display displayCtrl IDC_PREVIEW_BOTTOM;

if (!isNull _topControl && !isNull _bottomControl) then {
    private _boxHeight = _height / 2;
    private _boxWidth = _boxHeight;
    
    _topControl ctrlSetPosition [0, 0, _boxWidth, _boxHeight];
    _topControl ctrlCommit 0;
    
    _bottomControl ctrlSetPosition [0, _boxHeight, _boxWidth, _boxHeight];
    _bottomControl ctrlCommit 0;
};
