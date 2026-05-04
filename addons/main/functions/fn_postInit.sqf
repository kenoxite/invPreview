// initClient
// Initializes global variables, default position, and event handlers for the inventory preview system

#include "\z\invpreview\addons\main\ace.hpp"

// Detect mods
private _cfgPatches = configFile >> "cfgPatches";
KIV_betterInventory = isClass (_cfgPatches >> "bettinv_main");
KIV_aceInventory = isClass (_cfgPatches >> "ace_inventory");
KIV_ktweak = isClass (_cfgPatches >> "ktweak");
_cfgPatches = nil;

// Player reference
if (!KIV_ktweak) then {
    KTWK_player = [] call KIV_fnc_getPlayer;
    KTWK_lastPlayer = KTWK_player;
};

// Set default position based on mod detection
KIV_defaultPos = call {
    if (KIV_betterInventory) exitWith {
        [
            safeZoneX + safeZoneW * 0.15729167,
            safeZoneY + safeZoneH * 0.39351852,
            safeZoneW * 0.1625,
            safeZoneH * 0.425
        ]
    };
    if (KIV_aceInventory) exitWith {
        [
            X_PART(1),
            Y_PART(1),
            W_PART(12),
            H_PART(22.5)
        ]
    };
    // Vanilla
    [
        1 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2)) / 2),
        1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2)) / 2),
        12 * (((safeZoneW / safeZoneH) min 1.2) / 40),
        23 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)
    ]
};

// Add handlers to current player
[KTWK_player] call KIV_fnc_addEventHandlers;

if (isNil "KIV_EH_playerViewChanged") then {
    KIV_EH_playerViewChanged = addMissionEventHandler ["PlayerViewChanged", {
        params ["_previousUnit", "_newUnit", "_vehicleIn","_oldCameraOn", "_newCameraOn", "_uav"];
        if (!KIV_ktweak) then {
            KTWK_player = [] call KIV_fnc_getPlayer;
            KTWK_lastPlayer = KTWK_player;
        };
        [_oldCameraOn] call KIV_fnc_removeEventHandlers;
        [_newCameraOn] call KIV_fnc_addEventHandlers;
    }];
};

// Continuous player monitoring
[] spawn {
    private _oldDamage = damage KTWK_player;

    while {true} do {

        if (!isNil "KIV_unit") then {
            // Have to sync damage here so it properly updates when healed by someone else (HandleHeal EH is too messy with locality)
            if (_oldDamage != damage KTWK_player) then {
                call KIV_fnc_syncDamage;
                _oldDamage = damage KTWK_player;
            };
        };
        
        sleep 1;
    };
};
