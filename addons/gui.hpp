class RscObject;
class RscText;
class RscFrame;
class RscLine;
class RscProgress;
class RscPicture;
class RscPictureKeepAspect;
class RscVideo;
class RscHTML;
class RscButton;
class RscShortcutButton;
class RscEdit;
class RscCombo;
class RscListBox;
class RscListNBox;
class RscXListBox;
class RscTree;
class RscSlider;
class RscXSliderH;
class RscActiveText;
class RscActivePicture;
class RscActivePictureKeepAspect;
class RscStructuredText;
class RscToolbox;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoVScrollbars;
class RscButtonTextOnly;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenuSteam;
class RscMapControl;
class RscMapControlEmpty;
class RscCheckBox;

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
            class PreviewGroup: RscControlsGroup
            {
                idc = 222220;
                x = 0.5 - 1.05;
                y = 0.5 - 0.46;
                w = 0.46;
                h = 0.92;
                style = ST_MULTI; // no scrollbars
                fade = 1; // Start invisible
                
                class controls
                {
                    class PreviewControl_Top: RscPicture
                    {
                        idc = 222221;
                        style = 0x30 + 0x100;   // ST_PICTURE + ST_KEEP_ASPECT
                        x = 0 * pixelGrid * pixelW;
                        y = 0 * pixelGrid * pixelH;
                        w = 33 * pixelGrid * pixelW;
                        h = 33 * pixelGrid * pixelH;
                        colorBackground[] = {0,0,0,0};
                        text = "";
                    };

                    class PreviewControl_Bottom: RscPicture
                    {
                        idc = 222222;
                        style = 0x30 + 0x100;   // ST_PICTURE + ST_KEEP_ASPECT
                        x = 0 * pixelGrid * pixelW;
                        y = 0 * pixelGrid * pixelH;
                        w = 33 * pixelGrid * pixelW;
                        h = 33 * pixelGrid * pixelH;
                        colorBackground[] = {0,0,0,0};
                        text = "";
                    };
                };
            };
        };
    };
};
