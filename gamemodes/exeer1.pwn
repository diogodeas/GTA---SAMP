// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>
#include <sscanf2>
#define COR_VERMELHO 0xFF0000FF
#define DIALOG_REGISTRO 0
#define DIALOG_LOGIN

new variavel = 5;

main()
{
	print(" Hello World!\n ");
	return 1;
}


public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0,292.4463,-123.4898,1.5781,230.3929,0,0,0,0,0,0);
	return 1;
}

public OnPlayerConnect(playerid)
{
	new nivel, str[128], nick[24];
	GetPlayerName (playerid, nick, sizeof(nick));
	nivel = GetPlayerScore(playerid);
	format(str, sizeof(str), "Nick: %s Nivel: %d", nick, nivel);
    SendClientMessage(playerid, -1, str);
	SendClientMessage(playerid, -1, "Foi conectado ao server");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
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
CMD:veiculo(playerid, params[]){
	new modelo;
	new Float:x, Float:y,  Float:z;
	sscanf(params, "d", modelo);
	GetPlayerPos(playerid, x, y, z);
	new veiculo = CreateVehicle(modelo, x, y, z, 82.2873);
	PutPlayerInVehicle(playerid, veiculo, 0);
	return 1;
}


