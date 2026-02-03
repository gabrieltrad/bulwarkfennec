RESPAWN_TIME = 0;
publicVariable "RESPAWN_TIME";
[RESPAWN_TIME] remoteExec ["setPlayerRespawnTime", 0];

{
	// Revive players that died at the end of the round.
	if (lifeState _x == "DEAD") then {
		forceRespawn _x;
	};
} foreach allPlayers;

{
	// Revive players that are INCAPACITATED.
	if (lifeState _x == "INCAPACITATED") then {
		["#rev", 1, _x] remoteExecCall ["BIS_fnc_reviveOnState",_x];
	};
} foreach allPlayers;
["Terminate"] remoteExec ["BIS_fnc_EGSpectator", 0];
hint "boop!";