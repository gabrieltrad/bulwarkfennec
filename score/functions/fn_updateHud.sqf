/**
*  fn_updateHud
*
*  Hud values have changed, update Hud
*
*  Domain: Client
**/

if (!isDedicated) then {
    disableSerialization;
    _player = player;

    _killPoints = _player getVariable "killPoints";
    if(isNil "_killPoints") then {
        _killPoints = 0;
    };

    _attackWave = 0;
    if(!isNil "attkWave") then {
        _attackWave = attkWave;
    };
	ENABLE_TICKETS = "ENABLE_TICKETS" call BIS_fnc_getParamValue;
	_respawnTickets = format["<t></br></t>"];
	if(ENABLE_TICKETS != 0) then {
		tickets = [west] call BIS_fnc_respawnTickets;
		if(isNil "tickets" || tickets < 0) then {_respawnTickets = format ["<t Tickets: &1<br/></t>", tickets];}
		else{_respawnTickets = format ["<t Tickets: 0<br/></t>"]};};
	_enemies = EAST countSide allUnits;
	if(isNil "_enemies" || _enemies == 0) then {
		inimigos = "<t size='1' color='#FFFF00'>Onda Concluída</t>";
    }else {
		inimigos = format ["<t size='1' color='#FF0000'>Bandidos: %1 </t>", _enemies];
	};
	_hudText = format ["<t size='1.2' color='#ffffff'>%1</t><br/><t size='1.5' color='#dddddd'>%2</t><br/><t size='1' color='#cee5d0'>Onda: %3</t><br/><t size='1' color='#cee5d0'>%4%5",
	(name _player), _killPoints, _attackWave, _respawnTickets, inimigos];
	1000 cutRsc ["KillPointsHud","PLAIN"];
	_ui = uiNameSpace getVariable "KillPointsHud";
	_KillPointsHud = _ui displayCtrl 99999;
	_KillPointsHud ctrlSetStructuredText parseText _hudText;
	_KillPointsHud ctrlCommit 0;
};
