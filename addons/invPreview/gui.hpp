// gui.hpp
// Dialog definition for inventory preview HUD
// Forward declares all required Rsc base classes and defines the preview layout

class RscText;
class RscPictureKeepAspect;
class RscControlsGroupNoScrollbars;

#include "\z\kiv\addons\invPreview\idc.hpp"

#define ST_PICTURE 0x30
#define ST_MULTI 16

class RscTitles
{
    class KIV_PreviewHUD
    {
        idd = -1;
        duration = 1e+6;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = "uiNamespace setVariable ['KIV_preview_display', _this select 0];";
        class controls
        {
            class PreviewBackground: RscText
            {
                idc = IDC_PREVIEW_BCKG;
                x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
                y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
                w = "12 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorBackground[] = {0.050000001,0.050000001,0.050000001,0};
            };

            class PreviewBackground_BetterInv: RscText
            {
                idc = IDC_PREVIEW_BCKG_BETTERINV;
                x = "safeZoneX + safeZoneW * 0.15364584";
                y = "safeZoneY + safeZoneH * 0.15462963";
                w = "safeZoneW * 0.69166667";
                h = "safeZoneH * 0.68888889";
                colorBackground[] = {0.0,0.0,0.0,0};
            };

            class PreviewGroup: RscControlsGroupNoScrollbars
            {
                idc = IDC_PREVIEW_GROUP;
                x = 0.5 - 1.05;
                y = 0.5 - 0.46;
                w = 0.46;
                h = 0.92;
                style = ST_MULTI;
                fade = 1;
                
                class controls
                {
                    class PreviewControl: RscPictureKeepAspect
                    {
                        idc = IDC_PREVIEW;
                        style = ST_PICTURE;
                        x = "0 * pixelGrid * pixelW";
                        y = "0 * pixelGrid * pixelH";
                        w = "33 * pixelGrid * pixelW";
                        h = "33 * pixelGrid * pixelH";
                        colorBackground[] = {0,0,0,0};
                        text = "";
                    };
                };
            };
        };
    };
};
