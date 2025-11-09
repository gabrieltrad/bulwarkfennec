_object = _this select 0;
_objDir = (getdir _object) + 30;
[_object, _objDir] remoteExec ["setDir", 0];
