CAT_OPEN = 0;

_listFormat = "%1 - %2";
_ctrl = (findDisplay 9998) displayCtrl 1501;
_ctrl lbSetCurSel -1;
_ctrl ctrlEnable false;
_ctrl = (findDisplay 9998) displayCtrl 1500;
_ctrl lbSetCurSel -1;
_ctrl ctrlEnable true;
lbClear _ctrl;
/*- 0 objetos menores
- 1 barricadas
- 2 muros
- 3 predios e bunkeres
- 4 torres e armazem
- 5 veiculos
 */
_ctrl lbAdd format [_listFormat, "1 ", "Objetos menores"];
_ctrl lbAdd format [_listFormat, "2 ", "Muros"];
_ctrl lbAdd format [_listFormat, "3 ", "Prédios e bunkeres"];
_ctrl lbAdd format [_listFormat, "4 ", "Torres"];
_ctrl lbAdd format [_listFormat, "5 ", "Veículos"];
_ctrl lbAdd format [_listFormat, "6 ", "debug"];
((findDisplay 9998) displayCtrl 1500) ctrlAddEventHandler ['LBSelChanged', {
	_catIndex  = lbCurSel 1500;
	_ctrl = (findDisplay 9998) displayCtrl 1501;	
	lbClear _ctrl;	
	if(CAT_OPEN == 0) then 
	{
		_ctrl ctrlEnable true;
		_itemIndex = 0;
		{
			if(_x select 6 == _catIndex) then {
			_ctrl lbAdd format ["%1 - %2", _x select 0, _x select 1];
			_ctrl lbSetValue [_itemIndex, _x select 7];
			_itemIndex = _itemIndex + 1;
			}
		} forEach BULWARK_BUILDITEMS;	
		_userSel = _ctrl lbValue _itemIndex;
	};
	if(CAT_OPEN == 1) then
	{
		_itemIndex = 0;
		{				
			if(_x select 4 == _catIndex) then
			{
			_ctrl lbAdd format ["%1 - %2", _x select 0, _x select 1];
			_ctrl lbSetValue [_itemIndex, _x select 3];
			_itemIndex = _itemIndex + 1;					
			};
		} forEach BULWARK_SUPPORTITEMS;		
	};	
}];

((findDisplay 9998) displayCtrl 1501) ctrlAddEventHandler ['LBSelChanged', {
	if(CAT_OPEN == 0) then 
	{
		_ctrl = (findDisplay 9998) displayCtrl 1501;
		if(lbCurSel _ctrl != -1) then {
		_index = lbCurSel 1501;
		_itemIndex = lbValue [1501, _index];
		_itemIndex = _itemIndex - 1;
		_picture = getText (configFile >> "CfgVehicles" >> ((BULWARK_BUILDITEMS select _itemIndex) select 2) >> "editorPreview");
		/**   getText ((BULWARK_BUILDITEMS select _index) select 2)    editorPreview = "EFM_modular_base\data\preview\EFM_beam_wood_v_1_5m.jpg";**/
		ctrlSetText [1200, _picture];
		}
	}
	else
	{
		ctrlSetText [1200, "#(argb,8,8,3)color(0,0,0,0.5)"];
	};
}];	



_ctrl = (findDisplay 9998) displayCtrl 1501;
lbClear _ctrl;
_ctrl lbAdd " ";
_ctrl lbAdd "";
_ctrl lbAdd "  Selecione uma das categorias";
_ctrl lbAdd "  a esquerda";