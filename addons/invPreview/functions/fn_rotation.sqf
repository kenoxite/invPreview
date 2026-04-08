// KIV_fnc_rotation
// Rotates camera around the preview unit

if (isNil "KIV_preview_unit") exitWith {};

private _radius = 7;
private _speed = 15; // Degrees per second (peak to peak)
private _maxAngle = 45;

KIV_preview_rotationHandle = [_radius, _speed, _maxAngle] spawn {
    params ["_radius", "_speed", "_maxAngle"];
    
    private _unitPos = getPos KIV_preview_unit;
    private _unitDir = getDir KIV_preview_unit;
    private _startTime = diag_tickTime;

    while {!isNil "KIV_preview_unit"} do {
        private _elapsed = diag_tickTime - _startTime;
        private _angle = _maxAngle * sin (_elapsed * _speed);
        private _finalAngle = _unitDir + _angle;
        
        private _offsetX = _radius * sin _finalAngle;
        private _offsetY = _radius * cos _finalAngle;
        private _camPos = [
            (_unitPos # 0) + _offsetX,
            (_unitPos # 1) + _offsetY,
            (_unitPos # 2) + 1.3
        ];

        KIV_preview_cam camPreparePos _camPos;
        KIV_preview_cam camCommitPrepared 0;
        
        sleep 0.033;
    };
};
