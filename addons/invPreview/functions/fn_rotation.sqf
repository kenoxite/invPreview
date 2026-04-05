// KIV_fnc_rotation
// Creates a rotating camera around the preview unit

if (isNil "KIV_preview_unit") exitWith {};

private _radius = 7;
private _angles = [0,15,30,45,30,15,0,-15,-30,-45,-30,-15];

KIV_preview_rotationHandle = [_angles, _radius] spawn {
    params ["_angles", "_radius"];
    private _index = 0;
    private _countAngles = count _angles;
    private _unitPos = getPos KIV_preview_unit;
    private _unitDir = getDir KIV_preview_unit;
    
    while {!isNil "KIV_preview_unit"} do {
        private _angle = (_angles # _index) + _unitDir;
        private _offsetX = _radius * sin _angle;
        private _offsetY = _radius * cos _angle;
        private _camPos = [
            (_unitPos # 0) + _offsetX,
            (_unitPos # 1) + _offsetY,
            (_unitPos # 2) + 1.3
        ];
        
        KIV_preview_camTop camSetPos _camPos;
        KIV_preview_camTop camCommit 2;
        KIV_preview_camBottom camSetPos _camPos;
        KIV_preview_camBottom camCommit 2;
        
        waitUntil {camCommitted KIV_preview_camTop};
        
        _index = _index + 1;
        if (_index >= _countAngles) then { _index = 0; };
        _unitPos = getPos KIV_preview_unit;
        _unitDir = getDir KIV_preview_unit;
    };
};
