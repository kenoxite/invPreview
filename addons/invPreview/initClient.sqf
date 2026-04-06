// initClient
// Initializes global variables, default position, and event handlers for the inventory preview system

// Detect Better Inventory mod
private _cfgPatches = configFile >> "CfgPatches";
KIV_betterInventory = isClass(_cfgPatches >> "bettinv_main");
_cfgPatches = nil;

// Include GUI grid macros
#include "\a3\ui_f\hpp\definecommongrids.inc"

// Set default position based on mod detection
if (isNil "KIV_preview_defaultPos") then {
    KIV_preview_defaultPos = call {
        if (KIV_betterInventory) exitWith {
            [
                safeZoneX + safeZoneW * 0.15729167,
                safeZoneY + safeZoneH * 0.39351852,
                safeZoneW * 0.1625,
                safeZoneH * 0.425
            ]
        };
        // Vanilla
        [
            GUI_GRID_CENTER_X + (1 * GUI_GRID_CENTER_W),
            GUI_GRID_CENTER_Y + (4 * GUI_GRID_CENTER_H),
            18 * GUI_GRID_CENTER_W,
            18 * GUI_GRID_CENTER_H
        ]
    };
};

// Add handlers to current player
[player] call KIV_fnc_addEventHandlers;

// Continuous player monitoring
[] spawn {
    private _currentPlayer = player;
    private _lastPlayer = player;
    
    while {true} do {
        _currentPlayer = player;
        
        // Check if player changed
        if (!isNull _currentPlayer && {_currentPlayer != _lastPlayer}) then {
            // Remove handlers from old player
            if (!isNull _lastPlayer) then {
                [_lastPlayer] call KIV_fnc_removeEventHandlers;
            };
            // Add handlers to new player
            [_currentPlayer] call KIV_fnc_addEventHandlers;
            _lastPlayer = _currentPlayer;
        };
        
        sleep 1;
    };
};
