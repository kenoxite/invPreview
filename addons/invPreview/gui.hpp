// gui.hpp
// Dialog definition for inventory preview HUD
// Forward declares all required Rsc base classes and defines the preview layout

class RscPictureKeepAspect;
class RscControlsGroupNoScrollbars;

#include "\z\kiv\addons\invPreview\idc.hpp"

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
            class PreviewGroup: RscControlsGroupNoScrollbars
            {
                idc = IDC_PREVIEW_GROUP;
                x = 0.5 - 1.05;
                y = 0.5 - 0.46;
                w = 0.46;
                h = 0.92;
                fade = 1; // Start invisible
                
                class controls
                {
                    class PreviewControl_Top: RscPictureKeepAspect
                    {
                        idc = IDC_PREVIEW_TOP;
                        style = 0x30;   // ST_PICTURE
                        x = "0 * pixelGrid * pixelW";
                        y = "0 * pixelGrid * pixelH";
                        w = "33 * pixelGrid * pixelW";
                        h = "33 * pixelGrid * pixelH";
                        colorBackground[] = {0,0,0,0};
                        text = "";
                    };

                    class PreviewControl_Bottom: RscPictureKeepAspect
                    {
                        idc = IDC_PREVIEW_BOTTOM;
                        style = 0x30;   // ST_PICTURE
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
