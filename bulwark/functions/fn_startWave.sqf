/**
*  fn_startWave
*
*  starts a new Wave
*
*  Domain: Server
**/


["Terminate"] remoteExec ["BIS_fnc_EGSpectator", 0];
/** comment
**/
for ("_i") from 0 to 30 do {
	if(_i > 20 ) then {["beep_target"] remoteExec ["playsound", 0];};
	if(_i == 15) then {["count15"] remoteExec ["playsound", 0];};
	[format ["<t>%1</t>", 30-_i], 0, 0, 1, 0] remoteExec ["BIS_fnc_dynamicText", 0];
	sleep 1;};

// Delete
_final = waveUnits select ("BODY_CLEANUP" call BIS_fnc_getParamValue);
{deleteVehicle _x} foreach _final;
// Shuffle
waveUnits set [2, waveUnits select 1];
waveUnits set [1, waveUnits select 0];
waveUnits set [0, []];

playersInWave = [];
_allHCs = entities "HeadlessClient_F";
_allHPs = allPlayers - _allHCs;
{ playersInWave pushBack getPlayerUID _x; } foreach _allHPs;
publicVariable "playersInWave";

attkWave = (attkWave + 1);
publicVariable "attkWave";

waveSpawned = false;

//If last wave was a night time wave then skip back to the time it was previously
if(!isNil "nightWave") then {
	if (nightWave) then {
		skipTime currentTime;
	};
};

15 setFog 0;

_respawnTickets = [west] call BIS_fnc_respawnTickets;
if (_respawnTickets <= 0) then {
	RESPAWN_TIME = 99999;
	publicVariable "RESPAWN_TIME";
};
[RESPAWN_TIME] remoteExec ["setPlayerRespawnTime", 0];

missionNamespace setVariable ["buildPhase", false, true];

//determine if Special wave

if (attkWave < 10) then {
	randSpecChance = 4;
	maxSinceSpecial = 4;
	maxSpecialLimit = 1;
};

if (attkWave >= 10 && attkWave < 15) then {
	randSpecChance = 3;
	maxSinceSpecial = 3;
	maxSpecialLimit = 1;
};

if (attkWave >= 15) then {
	randSpecChance = 2;
	maxSinceSpecial = 2;
	maxSpecialLimit = 0;
};

if ((floor random randSpecChance == 1 || wavesSinceSpecial >= maxSinceSpecial) && attkWave >= 5 && wavesSinceSpecial >= maxSpecialLimit) then {
	specialWave = true;
}else{
	wavesSinceSpecial = wavesSinceSpecial + 1;
	specialWave = false;
};

SpecialWaveType = "";
droneCount = 0;

if (specialWave && attkWave >= 5 and attkWave < 10) then {
	_randWave = floor random 3;
	switch (_randWave) do
	{
		case 0:
		{
			SpecialWaveType = "specCivs";
		};
		case 1:
		{
			SpecialWaveType = "fogWave";
		};
		case 2:
		{
			SpecialWaveType = "swticharooWave";
		};
	};
	wavesSinceSpecial = 0;
};

if (specialWave && attkWave >= 10) then {
	_randWave = floor random 8;
	switch (_randWave) do
	{
		case 0:
		{
			SpecialWaveType = "specCivs";
		};
		case 1:
		{
			SpecialWaveType = "fogWave";
		};
		case 2:
		{
			SpecialWaveType = "swticharooWave";
		};
		case 3:
		{
			SpecialWaveType = "suicideWave";
		};
		case 4:
		{
			SpecialWaveType = "specMortarWave";
		};
		case 5:
		{
			SpecialWaveType = "nightWave";
		};
		case 6:
		{
			SpecialWaveType = "demineWave";
		};
		case 7:
		{
			SpecialWaveType = "defectorWave";
		};
	};
	wavesSinceSpecial = 0;
//}else{
	//SpecialWaveType = "swticharooWave"; //else for testing new special waves: do not remove
};

if (SpecialWaveType == "suicideWave") then {
	suicideWave = true;
	execVM "hostiles\suicideWave.sqf";
	execVM "hostiles\suicideAudio.sqf";
} else {
	suicideWave = false;
};

if (SpecialWaveType == "specMortarWave") then {
	specMortarWave = true;
	[] execVM "hostiles\specMortar.sqf";
}else{
	specMortarWave = false;
};

if (SpecialWaveType == "specCivs") then {
	specCivs = true;
	[] execVM "hostiles\civWave.sqf";
}else{
	specCivs = false;
};

if (SpecialWaveType == "nightWave") then {
	nightWave = true;
	currentTime = daytime;
	skipTime (24 - currentTime);
}else{
	nightWave = false;
};

if (SpecialWaveType == "fogWave") then {
	fogWave = true;
	15 setFog 1;
}else{
	fogWave = false;
};

if (SpecialWaveType == "swticharooWave") then {
	swticharooWave = true;
	execVM "hostiles\specSwticharooWave.sqf";
}else{
	swticharooWave = false;
};

if (SpecialWaveType == "demineWave") then {
	demineWave = true;
	droneSquad = [];
	execVM "hostiles\droneFire.sqf";
}else{
	demineWave = false;
};

if (SpecialWaveType == "defectorWave") then {
	defectorWave = true;
}else{
	defectorWave = false;
};
if(SpecialWaveType == "Helicopter") then {
	HelicopterWave = true;
	execVM "hostiles\HeliWave.sqf";
} else {
	HelicopterWave = false;
};
	
//Notify start of wave and type of wave
if (suicideWave) then {
	["SpecialWarning",["Homens-bomba na região!"]] remoteExec ["BIS_fnc_showNotification", 0];
	["Alarm"] remoteExec ["playSound", 0];
};

if (specMortarWave) then {
	["SpecialWarning",["Morteiro! Ache-o o quanto antes!"]] remoteExec ["BIS_fnc_showNotification", 0];
	["Alarm"] remoteExec ["playSound", 0];
};

if (specCivs) then {
	["SpecialWarning",["Civis estão na área! Cuidado com a mira!"]] remoteExec ["BIS_fnc_showNotification", 0];
	["civkillSound"] remoteExec ["playSound", 0];
};

if (nightWave) then {
	["SpecialWarning",["Bravo Six, going dark."]] remoteExec ["BIS_fnc_showNotification", 0];
	["Alarm"] remoteExec ["playSound", 0];
};

if (fogWave) then {
	["SpecialWarning",["Uma névoa fudida tá vindo!"]] remoteExec ["BIS_fnc_showNotification", 0];
	["Alarm"] remoteExec ["playSound", 0];
};

if (swticharooWave) then {
	["SpecialWarning",["Te jogaram pra fora do Bulwark! Volte lá agora!"]] remoteExec ["BIS_fnc_showNotification", 0];
	["Alarm"] remoteExec ["playSound", 0];
	_secCount = 0;
	_deadUnconscious = [];
	sleep 1;
	while {EAST countSide allUnits > 0} do {
		_allHCs = entities "HeadlessClient_F";
		_allHPs = allPlayers - _allHCs;
		{
			if ((!alive _x) || ((lifeState _x) == "INCAPACITATED")) then {
				_deadUnconscious pushBack _x;
			};
		} foreach _allHPs;
		_respawnTickets = [west] call BIS_fnc_respawnTickets;
		if (count (_allHPs - _deadUnconscious) <= 0 && _respawnTickets <= 0) then {
			sleep 1;

			//Check that Players have not been revived
			_deadUnconscious = [];
			{
				if ((!alive _x) || ((lifeState _x) == "INCAPACITATED")) then {
					_deadUnconscious pushBack _x;
				};
			} foreach _allHPs;
			if (count (_allHPs - _deadUnconscious) <= 0 && _respawnTickets <= 0) then {
				sleep 1;
				if (count (_allHPs - _deadUnconscious) <= 0 && _respawnTickets <= 0) then {
					missionFailure = true;
				};
			};
		};
	};
};

if (!specialWave) then {
	["TaskAssigned",["\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\defend_ca.paa ","Onda " + str attkWave]] remoteExec ["BIS_fnc_showNotification", 0];
};

if (demineWave) then {
	["SpecialWarning",["DRONES TÃO VINDO!!!!!!"]] remoteExec ["BIS_fnc_showNotification", 0];
	["Alarm"] remoteExec ["playSound", 0];
	["porfavor"] remoteExec ["playSound", 0];
};

if (defectorWave) then {
	["SpecialWarning",["NATO Defectors Are Attacking Us!"]] remoteExec ["BIS_fnc_showNotification", 0];
	["Alarm"] remoteExec ["playSound", 0];
};

{
	if (!alive _x) then {
		deleteVehicle _x;
	};
} foreach allMissionObjects "LandVehicle";

{
	if (!alive _x) then {
		deleteVehicle _x;
	};
} foreach allMissionObjects "Air";

// Spawn
_createHostiles = execVM "hostiles\createWave.sqf";
waitUntil {scriptDone _createHostiles};
[] remoteExec ["killPoints_fnc_updateHud", 0];
if (attkWave > 1) then { //if first wave give player extra time before spawning enemies
	{deleteMarker _x} foreach lootDebugMarkers;
	[] call loot_fnc_cleanup;
	_spawnLoot = execVM "loot\spawnLoot.sqf";
	waitUntil { scriptDone _spawnLoot};
};


