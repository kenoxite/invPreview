// KIV_fnc_reposition
// Moves and resizes the preview group and its child control

#include "\z\kiv\addons\invPreview\idc.hpp"

params [["_posX", ""], ["_posY", ""], ["_width", ""], ["_height", ""]];

private _display = uiNamespace getVariable "KIV_preview_display";
if (isNil "_display") exitWith {};
if (isNull _display) exitWith {};

private _group = _display displayCtrl IDC_PREVIEW_GROUP;
if (typeName _group != "CONTROL") exitWith {};

_group ctrlSetPosition [_posX, _posY, _width, _height];
_group ctrlSetFade 0.3;
_group ctrlCommit 0;

private _previewControl = _display displayCtrl IDC_PREVIEW;

if (!isNull _previewControl) then {
    private _scale = [0.8, 1] select KIV_betterInventory; 
    private _boxSize = _height * _scale; 
    private _centerOffsetX = (_width - _boxSize) / 2; 
    private _centerOffsetY = (_height - _boxSize) / ([1.7, 2] select KIV_betterInventory); 
     
    _previewControl ctrlSetPosition [_centerOffsetX, _centerOffsetY, _boxSize, _boxSize]; 
    _previewControl ctrlCommit 0;
};
