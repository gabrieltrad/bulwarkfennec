while {true} do {
    private _allHCs = entities "HeadlessClient_F";
    private _allHPs = allPlayers - _allHCs;
    {
        private _unit = _x;
        private _veh  = vehicle _unit;
        private _dist = _unit distance2D bulwarkCity;
        if (!(_veh isKindOf "Air")) then {

            switch (true) do {

                case (_dist > BULWARK_RADIUS * 2): {
                    private _newLoc = [bulwarkBox] call bulwark_fnc_findPlaceAround;
                    _unit setPosASL _newLoc;
                };

                case (_dist > BULWARK_RADIUS * 1.1): {
                    private _dir = bulwarkCity getDir _unit;
                    private _newLoc = bulwarkCity getPos [(BULWARK_RADIUS * 1.1) - 8, _dir];
                    _unit setPosASL _newLoc;

                    [_unit, "teleportHit"] remoteExec ["sound_fnc_say3DGlobal", 0];
                    ["DynamicBlur", 200, [10]] remoteExec ["area_fnc_createBlur", _unit];
                };

                case (_dist > BULWARK_RADIUS * 0.99): {
                    ["<t color='#ff0000'>Volte imediatamente para a área do Bulwark!</t>", 0, 0.1, 2, 0]
                        remoteExec ["BIS_fnc_dynamicText", _unit];
                };

                case (_dist > BULWARK_RADIUS * 0.95): {
                    ["<t color='#ffff00'>Atenção: Saindo da região do Bulwark!</t>", 0, 0.1, 2, 0]
                        remoteExec ["BIS_fnc_dynamicText", _unit];
                };

                case (_dist > BULWARK_RADIUS * 0.9): {
                    ["<t color='#ffffff'>Atenção! Saindo da região do Bulwark!</t>", 0, 0.1, 2, 0]
                        remoteExec ["BIS_fnc_dynamicText", _unit];
                };

                default {};
            };

        }
        else {
            if (_dist > BULWARK_RADIUS * 0.99) then {
                ["<t color='#ff0000'>Saindo da região do Bulwark! Você voltará caso saia da aeronave!</t>", 0, 0.1, 2, 0]
                    remoteExec ["BIS_fnc_dynamicText", _unit];};
				};

    } forEach _allHPs;

    sleep 0.5;
};
