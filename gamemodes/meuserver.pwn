#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <FCNPC>
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

new carros[212][30] = {
    "Landstalker","Bravura","Buffalo","Linerunner","Perennial","Sentinel","Dumper","Firetruck",
    "Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance",
    "Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr. Whoopee","BF Injection",
    "Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks",
    "Hotknife","Article Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RC Bandit",
    "Romero","Packer","Monster","Admiral","Squallo","Seasparrow","Pizzaboy","Tram",
    "Article Trailer 2","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair",
    "Topfun Van (Berkley's RC)","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
    "Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes",
    "Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis",
    "Baggage","Dozer","Maverick","SAN News Maverick","Rancher","FBI Rancher","Virgo","Greenwood",
    "Jetmax","Hotring Racer","Sandking","Blista Compact","Police Maverick","Boxville","Benson",
    "Mesa","RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher Lure",
    "Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropduster","Stuntplane",
    "Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500",
    "HPV1000","Cement Truck","Towtruck","Fortune","Cadrona","FBI Truck","Willard","Forklift",
    "Tractor","Combine Harvester","Feltzer","Remington","Slamvan","Blade","Freight (Train)",
    "Brownstreak (Train)","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck LA","Hustler",
    "Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility Van","Nevada","Yosemite"
    ,"Windsor","Monster \"A\"","Monster \"B\"","Uranus","Jester","Sultan","Stratum","Elegy",
    "Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight Flat Trailer (Train)",
    "Streak Trailer (Train)","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT400","DFT-30",
    "Huntley","Stafford","BF-400","Newsvan","Tug","Petrol Trailer","Emperor","Wayfarer","Euros",
    "Hotdog","Club","Freight Box Trailer (Train)","Article Trailer 3","Andromada","Dodo","RC Cam",
    "Launch","Police Car (LSPD)","Police Car (SFPD)","Police Car (LVPD)","Police Ranger","Picador"
    ,"S.W.A.T.","Alpha","Phoenix","Glendale Shit","Sadler Shit","Baggage Trailer \"A\"",
    "Baggage Trailer \"B\"","Tug Stairs Trailer","Boxville","Farm Trailer","Utility Trailer"
};
new Text3D: texto[201];
new driver_id = 200;
new bool:flyativado[200] = {false};
//new idveiculo [200];

main(){
	print(" Hello World!\n ");
	return 1;
}


public OnGameModeInit(){
	SetGameModeText("Blank Script");
	AddPlayerClass(0,292.4463,-123.4898,1.5781,230.3929,0,0,0,0,0,0);
	return 1;
}

public OnPlayerConnect(playerid) {
	new nivel, str[128], nick[24];
	GetPlayerName (playerid, nick, sizeof(nick));
	nivel = GetPlayerScore(playerid);
	format(str, sizeof(str), "Nick: %s Nivel: %d", nick, nivel);
    SendClientMessage(playerid, -1, str);
	SendClientMessage(playerid, -1, "Foi conectado ao server");
	return 1;
}

public OnPlayerDisconnect(playerid, reason) {
	new nivel, str[128], nick[24];
	GetPlayerName (playerid, nick, sizeof(nick));
	nivel = GetPlayerScore(playerid);
	format(str, sizeof(str), "Nick: %s Nivel: %d", nick, nivel);
    SendClientMessage(playerid, -1, str);
	SendClientMessage(playerid, -1, "Foi desconectado do server");
	return 1;
}

CMD:grove(playerid, params[]) {
	SetPlayerPos(playerid, 2501.5645,-1674.8260,13.3544);
 	return 1;
}

CMD:veiculo(playerid, params[]) {
	new modelo; 
	new Float:x, Float:y,  Float:z;
	new Float:xx, Float:yy,  Float:zz;
	sscanf(params, "d", modelo);
	GetPlayerPos(playerid, x, y, z);
	GetPlayerCameraFrontVector (playerid, xx, yy, zz);
	new veiculo = CreateVehicle(modelo, x, y, z, zz, -1,-1,-1);
	PutPlayerInVehicle(playerid, veiculo, 0);
	return 1;
}

CMD:veiculo2(playerid, params[]) {
	new modelo[30]; 
	new idcarros[212];
	new Float:x, Float:y,  Float:z;
	new Float:xx, Float:yy,  Float:zz;
	for(new i = 400; i < 612; i++){
		idcarros[i-400] = i;
	}
	sscanf(params, "s", modelo);
	GetPlayerPos(playerid, x, y, z);
	for (new i = 0; i < 212; i++) {
		if (strcmp(modelo, carros[i], true) == 0) {
			new idmodelo = idcarros[i];
			GetPlayerCameraFrontVector (playerid, xx, yy, zz);
			new veiculo = CreateVehicle(idmodelo, x, y, z, zz, -1,-1,-1);
			PutPlayerInVehicle(playerid, veiculo, 0);
			break;
		}
	}
	return 1;
}

CMD:driver_create(playerid, params[]) {
	new modelo;
	new nikid[201], newdriver[201]; 
	format(newdriver, sizeof(newdriver), "Driver_%d", driver_id);
	new Float:x, Float:y,  Float:z;
	sscanf(params, "d", modelo);
	GetPlayerPos(playerid, x, y, z);
	new fcnpc = FCNPC_Create(newdriver); 
	FCNPC_Spawn(fcnpc, 0, x+1, y+1, z);
	new veiculo = CreateVehicle(modelo, x+1, y+1, z, 82.2873, -1,-1,-1);
	FCNPC_PutInVehicle(fcnpc, veiculo, 0);
	format(nikid, sizeof(nikid), "Driver_%d", fcnpc);
	texto[veiculo] = Create3DTextLabel ( nikid, 0x008080FF, 0, 0 , 0 , 10 , 0 , 0 );
	Attach3DTextLabelToVehicle ( texto[veiculo] , veiculo, 0 , 0 , 0) ;
	//idveiculo[driver_id] = veiculo;
	--driver_id;
	return 1;
}

CMD:driver_goto(playerid, params[]){
	new Float:x, Float:y, Float:z;
	new driverid;
	sscanf(params, "dfff", driverid, x, y, z)
	FCNPC_GoTo(driver_id, x, y, z, 3, 1);
	return 1;
}

CMD:driver_destroy(playerid, params[], veiculo){
	new driverid;
	sscanf(params, "d", driverid);
	new idveiculo = GetPlayerVehicleID(driverid);
	FCNPC_Destroy(driverid);
	DestroyVehicle (idveiculo);
	++driver_id;
	return 1;
}
    
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {	
		if(flyativado[playerid] == true) {
			
			if (PRESSED(KEY_FIRE)) {
				new Float:x, Float:y,  Float:z;
				new idveiculo = GetPlayerVehicleID(playerid);
				GetPlayerCameraFrontVector (playerid, x, y, z);
				if (IsPlayerInVehicle (playerid, idveiculo)) {
					SetVehicleVelocity(idveiculo, x*2, y*2, z+1);
				}else {
					SetPlayerVelocity(playerid, x, y, z+1);
				}	
			}
		}
	return 1;
}

CMD:fly(playerid, params[], reason) {
	if(flyativado[playerid] == true) {
		SendClientMessage(playerid, -1, "Ativou o comando Fly");
	}
	else {
			SendClientMessage(playerid, -1, "Desativou o comando Fly");
	}
	return 1;
}