// KIV_fnc_resetPosition
// Resets the preview position to the stored default values

if (isNil "KIV_preview_defaultPos") exitWith {};
KIV_preview_defaultPos call KIV_fnc_reposition;
