List_SpecificPoint = [getMarkerPos "specBulwarkLoc", ""];
deleteMarker "specBulwarkLoc";

_zoneMarkers = [];
{
    _currMarker = toArray _x;
    if(count _currMarker >= 4) then {
        _currMarker resize 8;
        _currMarker = toString _currMarker;
        if(_currMarker == "bulwark_") then{
            _zoneMarkers append [getMarkerPos _x];
            deleteMarker _x;
        };
    };
} foreach allMapMarkers;

_allLocations = [];
{
    _allLocations append [locationPosition _x];
} forEach nearestLocations [[worldSize * .5, worldSize * .5, 0], ["BorderCrossing", "CityCenter", "CivilDefense", "DangerousForces", "FlatAreaCity", "FlatAreaCitySmall", "Name", "NameCity", "NameCityCapital", "NameVillage", "Strategic", "StrongpointArea", "fakeTown", "Airport"], worldSize * .7071];

List_LocationMarkers = _zoneMarkers;
List_AllCities = _allLocations;
