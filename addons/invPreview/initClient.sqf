// initClient
// Initializes global variables, default position, and event handlers for the inventory preview system

// Detect Better Inventory mod
KIV_betterInventory = isClass(configFile >> "CfgPatches" >> "bettinv_main");

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
    // Vanilla
    [
        1 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2)) / 2),
        1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2)) / 2),
        12 * (((safeZoneW / safeZoneH) min 1.2) / 40),
        23 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)
    ]
};

// Add handlers to current player
[player] call KIV_fnc_addEventHandlers;

// Continuous player monitoring
[] spawn {
    private _currentPlayer = player;
    private _lastPlayer = player;
    private _oldDamage = damage player;

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

        if (!isNil "KIV_unit") then {
            // Have to sync damage here so it properly updates when healed by someone else (HandleHeal EH is too messy with locality)
            if (_oldDamage != damage player) then {
                call KIV_fnc_syncDamage;
                _oldDamage = damage player;
            };
        };
        
        sleep 1;
    };
};
