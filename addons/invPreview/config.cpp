class CfgPatches {
    class invPreview {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.20;
        requiredAddons[] = {};
        author = "kenoxite";
        authors[] = {"kenoxite"};
        url = "";
        version = "2.0.2";
        versionStr = "2.0.2";
        versionAr[] = {2,0,2};
    };
};

#include "\z\kiv\addons\invPreview\gui.hpp"

class CfgFunctions {
    class KIV {
        class Init {
            file = "\z\kiv\addons\invPreview\functions";
            class postInit {
                postInit = 1;
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
