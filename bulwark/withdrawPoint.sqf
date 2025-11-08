/*
	For point withdrawal.
	
	DOMAIN: Client
	
	AUTHOR: SMITH
*/
_ctrl = (findDisplay 9998) displayCtrl 1400;
_withdrawAmount = round parseNumber ctrlText _ctrl;
_ctrl ctrlSetText "Enter Amount";
_pointBankAmount = bulwarkBox getVariable "pointBankAmount";
if(_withdrawAmount < 0) then { hint "Invalid Number!"; } 
else
{
	if(_withdrawAmount > _pointBankAmount) then { hint "Not enough points in the point bank!"; }
	else
	{
		if(_withdrawAmount == 0) then { hint "No points have been withdrawn from the point bank!"; }
		else
		{
			if(_withdrawAmount > MAX_POINT_BANK_WITHDRAW_AMOUNT) then {
				_msg = "Max withdraw amount is set at: " + str MAX_POINT_BANK_WITHDRAW_AMOUNT + " per withdrawal";
				hint _msg;
			}
			else
			{	
				[bulwarkBox, "withDrawPoint"] remoteExec ["sound_fnc_say3DGlobal", 0];					
				[player, _withdrawAmount] remoteExec ["killPoints_fnc_withdrawPointsFromPointBank", 2];		
			};
		};
	};
};