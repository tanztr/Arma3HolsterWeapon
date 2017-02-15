//Arma 3 - Holster Weapon Script - Edit by tanZ
//Steam: http://steamcommunity.com/id/sonoyunbukucutv
//Youtube Kanal: http://wwww.youtube.com/sonoyunbukucutv

if (isNull player) exitwith {} ;
if (vehicle player == player) then
{
fn_holsterAnimation =
{
    _unit = _this select 0;
    _anim = _this select 1;
    _unit switchMove _anim;
    //_unit playMovenow _anim;
};

holsterkeyDown=
{
     private ["_r"];
	_r = false ; 
   
     if ((_this select 1)  == 35) then {
		if  (player == vehicle player  and player getvariable ["holster",true]) then  {
   
		player setvariable["holsterkey",true];    
		player setvariable ["holster",false];

		if (currentWeapon player != "") then
		{
			curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
		}
		else
		{
			if (curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then
			{
				player selectWeapon curWep_h;
			};
		};
		player spawn {sleep 1;_this setvariable ["holster",true]};
   };
    _r=true;
      };
     _r;
} ;

waituntil {!(IsNull (findDisplay 46))};
(FindDisplay 46) displayAddEventHandler ["keydown","_this call holsterkeyDown"]; 
} else {

}; 
