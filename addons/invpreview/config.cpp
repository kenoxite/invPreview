#include "\z\kiv\addons\invpreview\version.hpp"

class CfgPatches {
    class invpreview {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.20;
        requiredAddons[] = {};
        author = "kenoxite";
        authors[] = {"kenoxite"};
        url = "";
        version = VERSION;
        versionStr = VERSION_STR;
        versionAr[] = {VERSION_AR};
    };
};

#include "\z\kiv\addons\invpreview\gui.hpp"

class CfgFunctions {
    class KIV {
        class Init {
            file = "\z\kiv\addons\invpreview\functions";
            class postInit {
                postInit = 1;
            };
        };
        class Main {
            file = "\z\kiv\addons\invpreview\functions";
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
