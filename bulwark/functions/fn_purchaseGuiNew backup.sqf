/**
*  fn_purchaseGuiNew
*
*  Displays new GUI for purchases from the bullwark box.
*
*  Domain: Client
*	
*  CREATED BY: SMITH
**/

disableSerialization;

_listFormat = "%1 - %2";


createDialog "startBox_DialogNew";
waitUntil {!isNull (findDisplay 9998);};

execVM "bulwark\functions\fn_showBuildItemGui.sqf";
remoteExec ["killPoints_fnc_updatePointBankAmount", player];