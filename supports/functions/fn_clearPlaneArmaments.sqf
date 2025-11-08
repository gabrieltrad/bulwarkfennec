// clearPlaneArmaments.sqf
params ["_veh"];

if (owner _veh != player) then {
    // If you run this remotely, target the owner instead
    // e.g. [_veh] remoteExec ["clearPlaneArmaments", owner _veh];
    // but here we continue assuming it's running on the owner.
};

private _type = typeOf _veh;

// 1) clear cargo (weapons, mags, items, backpacks)
clearWeaponCargo _veh;
clearMagazineCargo _veh;
clearItemCargo _veh;
clearBackpackCargo _veh;

// 2) clear turret-mounted magazines (pylons/turrets)
private _turretCount = turretCount _veh;
for "_ti" from 0 to (_turretCount - 1) do {
    // get all magazine classnames currently on this turret index
    private _mags = magazinesTurret [_veh, _ti];

    // remove each magazine class until none remain
    {
        // removeMagazineTurret removes one instance, so loop until none left
        while { ((magazinesTurret [_veh, _ti]) find _x) != -1 } do {
            // silent: wrap in try/catch pattern using call
            // removeMagazineTurret returns nil/void - no need to check
            removeMagazineTurret [_veh, _ti, _x];
            // small sleep to let engine update
            uiSleep 0.01;
        };
    } forEach _mags;
};

// 3) sanity check: report remaining turret mags/weapons
private _remaining = [];
for "_ti" from 0 to (_turretCount - 1) do {
    _remaining pushBack [
        _ti,
        magazinesTurret [_veh, _ti],
        weaponsTurret [_veh, _ti]
    ];
};

// optional: clear common mod variables (ACE/CUP etc.)
_veh setVariable ["ace_loaded_weapons", []];
_veh setVariable ["ace_mounted_magazines", []];

// done
