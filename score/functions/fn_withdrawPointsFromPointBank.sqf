/*
	Server execution for points withdrawal called by the clients.

	DOMAIN: Server
	
	AUTHOR: SMITH
*/
if(isServer) then {	
	_player = _this select 0;
	_withdrawAmount = _this select 1;
	_playerName = name _player;
	_msg  = "'" + _playerName + "' withdrawn " + str _withdrawAmount + " from the point bank.";
	_msg remoteExec ["hint", 0];	
	
	_currentPoint = bulwarkBox getVariable "pointBankAmount";
	_newPointBankAmount = _currentPoint - _withdrawAmount;		
	bulwarkBox setVariable ["pointBankAmount", _newPointBankAmount, true];
	
	[_player, _withdrawAmount] remoteExec ["killPoints_fnc_add", 2];
	[] remoteExec ["killPoints_fnc_updatePointBankAmount", -2];
};