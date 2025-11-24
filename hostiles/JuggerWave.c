

//Spawn AI Around Bulwark
for ("_i") from 1 to ((floor attkWave / 4) + (floor count allPlayers * 0.5)) do {
    _location = [bulwarkCity, BULWARK_RADIUS, BULWARK_RADIUS + 150,1,0] call BIS_fnc_findSafePos;
    _attGroupBand = createGroup [EAST, true];
    _unitClass = selectRandom HOSTILE_LEVEL_3;
    _unit = objNull;
    _unit = _attGroupBand createUnit [_unitClass, [0,0,0], [], 0.5, "FORM"];
    _unit setPosASL _location;
	sleep 0.3;
	waitUntil {!isNull _unit};

	[_unit] join _attGroupBand;
	_unit setSkill ["aimingAccuracy", 1];
	_unit setSkill ["aimingSpeed", 0.6];
	_unit setSkill ["aimingShake", 0.4];
	_unit setSkill ["spotTime", 0.5];
	_unit addEventHandler ["Hit", killPoints_fnc_hit];
	_unit addEventHandler ["Killed", killPoints_fnc_killed];
    _unit setVariable ["killPointMulti", HOSTILE_LEVEL_1_POINT_SCORE];
	removeAllAssignedItems _unit;
	mainZeus addCuratorEditableObjects [[_unit], true];
    unitArray = waveUnits select 0;
    unitArray append [_unit];
    	removeAllWeapons _unit;
		removeVest _unit;
		removeUniform _unit;
  		_unit forceAddUniform "TT_juggernaut_uniform";
   		_unit addVest "TT_juggernaut_Vest";
    	_unit addBackpack "TT_juggernaut_Backpack";
  		_unit addHeadgear "TT_juggernaut_HeadGear";
		_unit addMagazine "CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
		_unit addMagazine "CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
		_unit addWeapon "CUP_lmg_mg3";
		_unit addEventHandler ["Killed", CreateHostiles_fnc_suiExplode];


		//Spawn AI(not J) Around Bulwark
for ("_i") from 1 to ((floor attkWave / 2) + (floor count allPlayers * 1.5)) do {
    _location = [bulwarkCity, BULWARK_RADIUS, BULWARK_RADIUS + 150,1,0] call BIS_fnc_findSafePos;
    _attGroupBand = createGroup [EAST, true];
    _unitClass = selectRandom HOSTILE_JUGGER;
    _unit = objNull;
    _unit = _attGroupBand createUnit [_unitClass, [0,0,0], [], 0.5, "FORM"];
    _unit setPosASL _location;
	sleep 0.3;
	waitUntil {!isNull _unit};
		}
};