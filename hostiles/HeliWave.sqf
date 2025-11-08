_targetPos = BulwarkCity;
_angle = round random 180;
_height = 130;
_offsX = 0;
_offsY = 500;
_pointX = _offsX*(cos _angle) - _offsY*(sin _angle);
_pointY = _offsX*(sin _angle) + _offsY*(cos _angle);
_dropStart  = _targetPos vectorAdd [_pointX, _pointY, _height];
_dropTarget = [(_targetPos select 0), (_targetPos select 1), 100];

_agSpawn = [_dropStart, 0, "CUP_I_Ka60_Digi_AAF",EAST] call bis_fnc_spawnvehicle;
_agVehicle = _agSpawn select 0;	//the aircraft
_agVehicle setVehicleAmmo 1;
_ag = _agSpawn select 2;	//the group
{_x allowFleeing 0} forEach units _ag;

_agVehicle flyInHeight 100;
_agVehicle setpos [getposATL _agVehicle select 0, getposATL _agVehicle select 1, _height];

_reldir = [_dropStart, _targetPos] call BIS_fnc_dirTo;
_agVehicle setdir _reldir;

_vel = [
    (_forwardWorld select 0) * 100,
    (_forwardWorld select 1) * 200];
_agVehicle setVelocity _vel;
_waypoint0 = _ag addwaypoint[_dropTarget,0];
_waypoint0 setwaypointtype "SAD";
_waypoint0 setWaypointLoiterRadius 100;
_waypoint0 setWaypointLoiterType "CIRCLE_L";
_waypoint0 setWaypointLoiterAltitude 200;
_waypoint0 setWaypointCompletionRadius 5;
_waypoint0 setWaypointSpeed "Normal";
_waypoint0 setWaypointCombatMode "RED";
_waypoint0 setWaypointBehaviour "COMBAT";

HeliCrew = fullCrew (_agSpawn select 0);
	{
		_x select 0 addEventHandler ["Hit", killPoints_fnc_hit];
		_x select 0 addEventHandler ["Killed", killPoints_fnc_killed];
		_x select 0 setVariable ["killPointMulti", HOSTILE_CAR_POINT_SCORE];
		unitArray = waveUnits select 0;
		unitArray append [_x select 0];
	} forEach HeliCrew;
