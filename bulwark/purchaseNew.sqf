/**
*  bulwark/purchaseNew
*
*  Actor for the "Purchase building" dialog button
*
*  Edited By: SMITH
*
*  Domain: Client
**/

_index     = lbCurSel 1501;
if(_index > -1) then {
_itemIndex = lbValue [1501, _index];
_itemIndex = _itemIndex - 1;
if(_itemIndex < 8000) then {
	//Purchase build items...
	shopVehic  = objNull;

	_shopPrice = (BULWARK_BUILDITEMS select _itemIndex) select 0;
	_shopName  = (BULWARK_BUILDITEMS select _itemIndex) select 1;
	_shopClass = (BULWARK_BUILDITEMS select _itemIndex) select 2;
	_shopDir   = (BULWARK_BUILDITEMS select _itemIndex) select 3;
	_VecRadius = (BULWARK_BUILDITEMS select _itemIndex) select 4;
	_vechAi    = (BULWARK_BUILDITEMS select _itemIndex) select 5;
	_vechcat   = (BULWARK_BUILDITEMS select _itemIndex) select 6;

	// Script was passed an invalid number
	if(_shopClass == "") exitWith {};

	if(player getVariable "killPoints" >= _shopPrice && !(player getVariable "buildItemHeld")) then {
		[player, _shopPrice] remoteExec ["killPoints_fnc_spend", 2];
		if (_vechAi) then {
			_vechWithAi = [[0,0,300], 0, _shopClass, west] call BIS_fnc_spawnVehicle;
			shopVehic = _vechWithAi select 0;
		}else{
			shopVehic = _shopClass createVehicle [0,0,0];
		};
		shopVehic setVariable ["shopPrice", _shopPrice, true];
		shopVehic setVariable ["Radius", _VecRadius, true];
		objPurchase = true;
	} else {
		if(player getVariable "killPoints" < _shopPrice) then {
			[format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
			objPurchase = false;
		}else{
			[format ["<t size='0.6' color='#ff3300'>You're already carrying an object!</t>", _shopName], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
			objPurchase = false;
		};
	};

	sleep 0.1;

	if (objPurchase) then 
	{
		closeDialog 0;
	// evitar que veiculos clipem no chao
	if (_vechcat == 4) then { 
		clearItemCargoGlobal shopVehic;
		clearWeaponCargoGlobal shopVehic;
		clearMagazineCargoGlobal shopVehic;
		clearBackpackCargoGlobal shopVehic;
		[shopVehic, ShopCaller, [0,_VecRadius + 1.5,2.5], _shopDir] call build_fnc_pickup;
		hint 'veiculo';
	}else{

		// If it's a container, make sure it's empty
		clearItemCargoGlobal shopVehic;
		clearWeaponCargoGlobal shopVehic;
		clearMagazineCargoGlobal shopVehic;
		clearBackpackCargoGlobal shopVehic;
		[shopVehic, ShopCaller, [0,_VecRadius + 1.5,0.02], _shopDir] call build_fnc_pickup;
		hint 'nao ser veiculo'};
	};
} else {
	//Purchase support item
	if  (SUPPORTMENU) then {
		  _index = _itemIndex - 8000;
		  shopVehic = objNull;

		  _shopItem = BULWARK_SUPPORTITEMS select _index;
		  _shopPrice = (_shopItem) select 0;
		  _shopName  = (_shopItem) select 1;
		  _shopClass = (_shopItem) select 2;
		  _shopCategory = (_shopItem) select 4;

		  // Script was passed an invalid number
		  if(_shopClass == "") exitWith {};

		if(_shopCategory == 0) then
		{
			// For lives support items		
			if(_shopClass == "+1") then  {[bulwarkBox, "addOneLives"]    remoteExec ["sound_fnc_say3DGlobal", 0];};	
			if(_shopClass == "+2") then  {[bulwarkBox, "addTwoLives"]    remoteExec ["sound_fnc_say3DGlobal", 0];};	
			if(_shopClass == "+3") then  {[bulwarkBox, "addThreeLives"]  remoteExec ["sound_fnc_say3DGlobal", 0];};	
			if(_shopClass == "+5") then  {[bulwarkBox, "addFiveLives"]   remoteExec ["sound_fnc_say3DGlobal", 0];};	
			if(_shopClass == "+10") then {[bulwarkBox, "addTenLives"]    remoteExec ["sound_fnc_say3DGlobal", 0];};	
			if(_shopClass == "+20") then {[bulwarkBox, "addTwentyLives"] remoteExec ["sound_fnc_say3DGlobal", 0];};	
			[player, _shopClass, _shopPrice] remoteExec ["supports_fnc_livesTicket", 2];		
		};		
		
		if(_shopCategory == 1) then
		{
			if(player getVariable "killPoints" >= _shopPrice) then {
				[player, _shopPrice] remoteExec ["killPoints_fnc_spend", 2];
				[player, _shopClass] call BIS_fnc_addCommMenuItem;
			} else {
				[format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
				objPurchase = false;
			};
		};
	};
};
} else{
	hint "Please select item from the bulwark shop!";
};