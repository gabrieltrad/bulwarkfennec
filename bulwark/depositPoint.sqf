/*
	For point deposit.

	DOMAIN: Client
	
	AUTHOR: SMITH
*/
_ctrl = (findDisplay 9998) displayCtrl 1400;
_depositAmount = round parseNumber ctrlText _ctrl;
_ctrl ctrlSetText "Enter Amount";

if(_depositAmount < 0) then { hint "Invalid Number!"; } 
else 
{
	if(_depositAmount > player getVariable "killPoints") then { hint "Not enough kill points!"; }
	else 
	{		
		if(_depositAmount == 0) then { hint "No kill points have been deposited!"; }
		else
		{
			if(_depositAmount > MAX_POINT_BANK_DEPOSIT_AMOUNT) then {
				_msg = "Max deposit amount is set at: " + str MAX_POINT_BANK_DEPOSIT_AMOUNT + " per deposit";
				hint _msg;
			}
			else
			{
				[bulwarkBox, "depositPoint"] remoteExec ["sound_fnc_say3DGlobal", 0];
				[player, _depositAmount]remoteExec ["killPoints_fnc_depositPointsToPointBank", 2];		
			};
		};
	};
};