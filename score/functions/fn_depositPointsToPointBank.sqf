/*
	Server execution for points deposit called by the clients.

	DOMAIN: Server
	
	AUTHOR: SMITH
*/
if(isServer) then {
	_player = _this select 0;
	_depositAmount = _this select 1;
	_playerName = name _player;
	_msg  = "'" + _playerName + "' deposited " + str _depositAmount + " to the point bank.";
	_msg remoteExec ["hint", 0];	

	_currentPoint = bulwarkBox getVariable "pointBankAmount";
	_newPointBankAmount = _currentPoint + _depositAmount;		
	bulwarkBox setVariable ["pointBankAmount", _newPointBankAmount, true];		
	
	[_player, _depositAmount] remoteExec ["killPoints_fnc_spend", 2];
	[] remoteExec ["killPoints_fnc_updatePointBankAmount", -2];
};