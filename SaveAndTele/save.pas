var
	xPos : array[1..32] of Single;
	yPos : array[1..32] of Single;
procedure TeleportPlayer(PlayerId: Byte);
var
	aimX: SmallInt;
	aimy: SmallInt;
begin
	Players.Player[PlayerId].Setvelocity(0,0);
	aimX:=  Players.Player[PlayerId].MouseAimX;
	aimy:=  Players.Player[PlayerId].MouseAimY;
	Players.Player[PlayerId].move(aimX,aimY);
end;
procedure OnClockTickHandler(Ticks: Integer);
var
i: Byte;
 begin
   for i:= 1 to 32 do
	begin
		if Players.Player[i].KeyReload then //key can be easily changed, example: KeyGrenade, KeyThrow, KeyFlagThrow
			TeleportPlayer(i);

	end;
 end;
function OnBeforeRespawn(Player: TActivePlayer): TVector;
begin
  Result.X := xPos[Player.ID];
  Result.Y := yPos[Player.ID];
end;
procedure Save(Player: TActivePlayer);
begin
	xPos[Player.ID]:=Player.X;
	yPos[Player.ID]:=Player.Y-5;//shift to avoid spawning inside poly
	Players.WriteConsole( 'Position Saved' , $001111);
end;
function OnCommand( Player: TActivePlayer; Text: string):Boolean;
begin
	//WriteLn(Text);
	if Text = '/s' then begin;
		Save(Player);
	end;	
	Result:= FALSE;
end;
procedure OnSpeak( Player: TActivePlayer; Text: string);
begin
	//WriteLn(Text);
	if Text = '!s' then begin;
		Save(Player);
	end;
	
end;

var
	i: Byte;
begin

	Game.OnClockTick := @OnClockTickHandler;
	for i:= 1 to 32 do
	begin
		Players[i].OnSpeak := @OnSpeak;
		Players[i].OnCommand :=@OnCommand;
		Players[i].OnBeforeRespawn :=@OnBeforeRespawn;

	end;
end.
