class CfgPatches {
    class invPreview {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.10;
        requiredAddons[] = {};
        author = "kenoxite";
        authors[] = {"kenoxite"};
        url = "";
        version = 1.0;
        versionStr = "1.0";
        versionAr[] = {1,0,0};
    };
};

class RscTitles {
    #include "gui.hpp"
};

class CfgFunctions {
    class KIV {
        class Init {
            file = "\z\KIV\addons\functions";
            class postInit {
                postInit = 1;
                file = "\z\KIV\addons\initClient.sqf";
            };
        };
        class Main {
            file = "\z\KIV\addons\functions";
            class cleanup {};
            class create {};
            class inventoryClosed {};
            class inventoryOpened {};
            class put {};
            class reposition {};
            class resetPosition {};
            class rotation {};
            class stance {};
            class take {};
            class updateCloneLoadout {};
        };
    };
};
