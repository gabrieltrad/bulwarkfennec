/*
	Called by clients use to update point bank amount
	
	DOMAIN: Client
	
	AUTHOR: SMITH

*/

if(!isDedicated) then
{
	disableSerialization;
	_ctrl = (findDisplay 9998) displayCtrl 1005;
	_pointAmount = bulwarkBox getVariable "pointBankAmount";
	_bulwarkPoints = str _pointAmount;
	_ctrl ctrlSetText _bulwarkPoints;
};