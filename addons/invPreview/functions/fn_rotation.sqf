// KIV_fnc_rotation
// Rotates the camera around the preview unit

if (isNil "KIV_unit") exitWith {};

private _radius = 7;
private _maxLeft = -45;
private _maxRight = 90;
private _speed = 15; // Degrees per second

KIV_rotationHandle = [_radius, _speed, _maxLeft, _maxRight] spawn {
    params ["_radius", "_speed", "_maxLeft", "_maxRight"];
    
    private _startTime = diag_tickTime;
    private _direction = 1; // 1 = moving right, -1 = moving left
    private _angle = 0;
    private _lastTime = _startTime;

    while {!isNil "KIV_unit"} do {
        private _currentTime = diag_tickTime;
        private _delta = _currentTime - _lastTime;
        _lastTime = _currentTime;
        
        // Update angle based on direction
        _angle = _angle + (_direction * _speed * _delta);
        
        // Clamp and reverse direction at limits
        if (_angle >= _maxRight) then {
            _angle = _maxRight;
            _direction = -1;
        };
        if (_angle <= _maxLeft) then {
            _angle = _maxLeft;
            _direction = 1;
        };
        
        private _relX = _radius * sin _angle;
        private _relY = _radius * cos _angle;
        
        KIV_cam camPrepareRelPos [_relX, _relY, 0];
        KIV_cam camCommitPrepared 0.033;

        waitUntil {isNil "KIV_cam" || {camCommitted KIV_cam}};
    };
};
