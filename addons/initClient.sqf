// initClient
// Initializes global variables, default position, and event handlers for the inventory preview system

// Detect Better Inventory mod
private _cfgPatches = configFile >> "CfgPatches";
KNX_betterInventory = isClass(_cfgPatches >> "bettinv_main");
_cfgPatches = nil;

// Include GUI grid macros
#include "\a3\ui_f\hpp\definecommongrids.inc"

// Set default position based on mod detection
if (isNil "KIV_preview_defaultPos") then {
    KIV_preview_defaultPos = call {
        if (KNX_betterInventory) exitWith {
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

// Remove existing event handlers if they exist
if (!isNil "KIV_EH_preview_invOpened") then {
    player removeEventHandler ["InventoryOpened", KIV_EH_preview_invOpened];
};
if (!isNil "KIV_EH_preview_invClosed") then {
    player removeEventHandler ["InventoryClosed", KIV_EH_preview_invClosed];
};
if (!isNil "KIV_EH_preview_take") then {
    player removeEventHandler ["Take", KIV_EH_preview_take];
};
if (!isNil "KIV_EH_preview_put") then {
    player removeEventHandler ["Put", KIV_EH_preview_put];
};

// Add new event handlers
KIV_EH_preview_invOpened = player addEventHandler ["InventoryOpened", KIV_fnc_inventoryOpened];
KIV_EH_preview_invClosed = player addEventHandler ["InventoryClosed", KIV_fnc_inventoryClosed];
KIV_EH_preview_take = player addEventHandler ["Take", KIV_fnc_take];
KIV_EH_preview_put = player addEventHandler ["Put", KIV_fnc_put];
