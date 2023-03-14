#pragma newdecls required
#pragma semicolon 1

#include <sourcemod>
#include <retakes>
#include <fys.huds>

#define SITE_A "Retake site <font color='#FF0000'>A</font>!"
#define SITE_B "Retake site <font color='#FF0000'>B</font>!"

ConVar g_cvOverlayTime;

public Plugin myinfo =
{
	name = "[Retakes] Site Overlay",
	author = "koen",
	description = "",
	version = "",
	url = "https://github.com/notkoen"
};

public void OnPluginStart()
{
	g_cvOverlayTime = CreateConVar("retakes_overlay_timer", "5.0", "How long should site text be displayed for", _, true, 3.0, true, 10.0);
	AutoExecConfig();
}

public void Retakes_OnSitePicked(Bombsite& site)
{
	switch (site)
	{
		case BombsiteA:
		{
			for (int i = 1; i <= MaxClients; i++)
			{
				if (!IsClientInGame(i))
					continue;

				Huds_ShowHtmlHudAll(g_cvOverlayTime.FloatValue, SITE_A, true);
			}
		}
		case BombsiteB:
		{
			for (int i = 1; i <= MaxClients; i++)
			{
				if (!IsClientInGame(i))
					continue;

				Huds_ShowHtmlHudAll(g_cvOverlayTime.FloatValue, SITE_B, true);
			}
		}
	}
}
