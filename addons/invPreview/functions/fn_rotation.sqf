// KIV_fnc_rotation
// Rotates the camera around the preview unit

if (isNil "KIV_preview_unit") exitWith {};

private _radius = 7;
private _speed = 15; // Degrees per second
private _maxAngle = 45;

KIV_preview_rotationHandle = [_radius, _speed, _maxAngle] spawn {
    params ["_radius", "_speed", "_maxAngle"];
    
    private _startTime = diag_tickTime;

    while {!isNil "KIV_preview_unit"} do {
        private _elapsed = diag_tickTime - _startTime;
        private _angle = _maxAngle * sin (_elapsed * _speed);
        
        private _relX = _radius * sin _angle;
        private _relY = _radius * cos _angle;
        
        KIV_preview_cam camPrepareRelPos [_relX, _relY, 0];
        KIV_preview_cam camCommitPrepared 0;
        
        sleep 0.033;
    };
};
