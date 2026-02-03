_object = _this select 0;
_caller = _this select 1;
_action = _this select 2;

_objectPos = getPosATL (_object);
detach _object;
[_object, false] remoteExec ["enableSimulation", 0];
[_object, _objectPos] remoteExec ["setPosATL", 0];
[_object, true] remoteExec ["enableSimulation", 0];
{
	[_object, _x] remoteExec ['enableCollisionWith', 0];
} forEach playableUnits;

[_caller] remoteExec ["removeAllActions", 0];

_object setVehiclePosition [_object, [], 0, 'CAN_COLLIDE'],
// retirar algumas funções desnecessárias para veículos
if (_object isKindOf "AllVehicles") then { 
	[_object,
	[	'<t color="#ffa07a">Vender veículo</t>',
		'[_this select 0, _this select 1] call build_fnc_sell;',
		'', 1, false, false, 'true', 'true', 5
	]
	] remoteExec ['addAction', 0];
	[
	_object,
	[
		'<t color="#ffffff">Mover Veículo</t>',
		'[_this select 0, _this select 1] call build_fnc_pickup;',
		[0,0,0.5],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];
if (typeof _object == 'CUP_B_TowingTractor_CZ') then{
	[
	_object,
		[
			'<t color="#FFFF00">Pepare Tow</t>',
			'[_this select 0, _this select 1] call CUP_fnc_prepareTow;',
			'', 1, false, false, 'true', 'true', 2.5
		]
	] remoteExec ['addAction', 0];
	[
	_object,
		[
			'<t color="#FFFF00">Release Tow</t>',
			'[_this select 0, _this select 1] call CUP_fnc_releaseTow;',
			'', 1, false, false, 'true', 'true', 2.5
		]
	] remoteExec ['addAction', 0];};
	}else{
if (typeof _object == 'Land_RepairDepot_01_green_F')then{
[_object,["<t color='#00ff00'>" + "Shopee", 
"[] spawn bulwark_fnc_purchaseGuiNew; ShopCaller = _this select 1", 
"",1.5, false,false, "true", "true", 2.5
]
]remoteExec ["addAction", 0, true];	
};
[_object,[
		'<t color="#ff0000">Remover Objeto</t>',
		'[_this select 0, _this select 1] call build_fnc_sell;',
		'', 1, false, false, 'true', 'true', 5
	]
] remoteExec ['addAction', 0];
[
	_object,
	[
		'<t color="#00ffff">Move Up</t>',
		'[_this select 0, _this select 3, _this select 1] call build_fnc_move;',
		[0,0,1],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#00ff00">Move Down</t>',
		'[_this select 0, _this select 3, _this select 1] call build_fnc_move;',
		[0,0,-0.5],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];
[
	_object,
	[
		'<t color="#ffffff">Pegar</t>',
		'[_this select 0, _this select 1] call build_fnc_pickup;',
		[0,0,0.5],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];
[
	_object,
	[
		'<t color="#00ff00">Rotacionar (30º)</t>',
		'[_this select 0] call build_fnc_rotate;',
		[0,0,0.5],2,false,false,'true','true',5		
	]
] remoteExec ['addAction', 0];
[
	_object,
	[
		'<t color="#ffff00">Corrigir inclinação</t>',
		'[_this select 0] call build_fnc_reset;',
		[0,0,0.5],2,false,false,'true','true',5
	]

] remoteExec ['addAction', 0];
};
_caller setVariable ["buildItemHeld", false, true];
_object setVariable ["buildItemHeld", false, true];
[mainZeus, [[_object], true]] remoteExec ["addCuratorEditableObjects", 0, true];
PLAYER_OBJECT_LIST pushBack _object;
sleep 0.1;
[[_object], 'bulwark\solidObject.sqf'] remoteExec ['execVM', 2];
