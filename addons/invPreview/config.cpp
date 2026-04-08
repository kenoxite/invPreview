class CfgPatches {
    class invPreview {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.20;
        requiredAddons[] = {};
        author = "kenoxite";
        authors[] = {"kenoxite"};
        url = "";
        version = "1.4.4";
        versionStr = "1.4.4";
        versionAr[] = {1,4,4};
    };
};

#include "\z\kiv\addons\invPreview\gui.hpp"

class CfgFunctions {
    class KIV {
        class Init {
            file = "\z\kiv\addons\invPreview\functions";
            class postInit {
                postInit = 1;
                file = "\z\kiv\addons\invPreview\initClient.sqf";
            };
        };
        class Main {
            file = "\z\kiv\addons\invPreview\functions";
            class cleanup {};
            class create {};
            class inventoryClosed {};
            class inventoryOpened {};
            class put {};
            class reposition {};
            class resetPosition {};
            class rotation {};
            class stance {};
            class syncDamage {};
            class take {};
            class updateCloneLoadout {};
            class addEventHandlers {};
            class removeEventHandlers {};
        };
    };
};
