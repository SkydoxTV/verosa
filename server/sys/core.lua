--
-- Copyright (c) 2018 by iV(VeRo) Reallife(Skydox). All Rights Reserved.
--
local scriptstart = getTickCount()
dbCon = dbConnect( "mysql", "dbname="..config.mysql["db"]..";host="..config.mysql["host"]..";charset=utf8",config.mysql["un"],config.mysql["pw"], "share=1" )

if dbCon then
  outputDebugString("["..config.general["sname"].." [Version: "..config.general["ver"].."]-Database-Handler] Connected successfull")
  outputDebugString("["..config.general["sname"].." [Version: "..config.general["ver"].."]-Database-Handler] Database Connected in "..getTickCount()-scriptstart.." ms")
else
  outputDebugString("["..config.general["sname"].." [Version: "..config.general["ver"].."]-Database-Handler] There was a error with the database Connection.(server/sys/core.lua)")
end

function reglogcheck(player)
  local player = source
  local sr = getPlayerSerial(player)
  local qh = dbQuery( dbCon, "SELECT * FROM playerdata WHERE Serial = ?", sr )
  local result = dbPoll( qh, -1 )
  local rows = result[1]
  if result[1] then
    if rows["Username"] == getPlayerName(player) then
      triggerClientEvent(player, "showLogin", player)
    else
      kickPlayer(player, "iV-Management", "Du hast berreits einen Account! "..rows["Username"])
    end
  else
      dbFree( qh )
      local qh = dbQuery( dbCon, "SELECT * FROM playerdata WHERE Username = ?", getPlayerName(player) )
      local result = dbPoll( qh, -1 )
      local rows = result[1]
      if result[1] then
        triggerClientEvent(player, "showLogin", player)
        dbFree(qh)
      else
        triggerClientEvent(player, "showRegister", player)
        dbFree(qh)
      end
  end
end
addEvent("checkrlog", true)
addEventHandler("checkrlog",getRootElement(), reglogcheck)

local x,y,z, rt, sk, int, dm = -1963.58765,138.57565,30.69405,0,0,0,0
--local telepos = {-1963.58765,138.57565,30.69405}
function registerPlayer(player, password)
  local regqh = dbQuery(dbCon, "INSERT INTO playerdata(Serial,Username,Passwort,x,y,z,skin,handynr) VALUES(?,?,?,?,?,?,?,?)",getPlayerSerial(player), getPlayerName(player), password,x,y,z,sk,"0176"..tostring(math.random(11111111,99999999)))
  dbFree(regqh)
  spawnPlayer(player,x,y,z,rt,sk,int,dim)
  fadeCamera(player,true,2)
  setCameraTarget(player,player)
end
addEvent("registerpl", true)
addEventHandler("registerpl",getRootElement(), registerPlayer)

function checkLoginPl(player, pswd)
  local qh = dbQuery( dbCon, "SELECT * FROM playerdata WHERE Username = ?", getPlayerName(player) )
  local result = dbPoll( qh, -1 )
  local rows = result[1]
  if passwordVerify(pswd, rows["Passwort"]) then
    triggerClientEvent(player,"closeLogin", player)
    local x = rows["x"]
    local y = rows["y"]
    local z = rows["z"]
    local ski = rows["skin"]
    spawnPlayer(player,x,y,z,0,ski,0,0)
    fadeCamera(player,true,2)
    setCameraTarget(player,player)
    dbFree(qh)
    ivSetData(player, "self_active", false)
    ivSetData(player, "hunger",rows["hunger"])
    ivSetData(player, "adminlvl",rows["adminlvl"])
    ivSetData(player, "wanteds", rows["wanteds"])
    ivSetData(player, "stvo",rows["stvo"])
    ivSetData(player, "geld",rows["geld"])
    ivSetData(player, "bankgeld",rows["bankgeld"])
    ivSetData(player, "status",rows["status"])
    ivSetData(player, "hud", true)
    ivSetData(player, "loggedin", true)
    ivSetData(player, "UID", rows["UID"])
    setElementHealth(player, rows["leben"])
    print(ivGetData(player,"hunger"))
  else
    triggerClientEvent(player, "login_pw_wrong", player)
    dbFree(qh)
  end
end

addEvent("checkLogin", true)
addEventHandler("checkLogin",getRootElement(), checkLoginPl)

addEventHandler("onPlayerQuit", getRootElement(), function()
  local player = source
  if ivGetData(player, "loggedin") then
    dbExec(dbCon,"UPDATE playerdata SET `hunger` = ?,`geld` = ?,`bankgeld` = ?,`status` = ?,`stvo` = ?,`wanteds` = ?,`leben` = ? WHERE `Username` = ?" ,tonumber(ivGetData(player,"hunger")), tonumber(ivGetData(player,"geld")), tonumber(ivGetData(player, "bankgeld")), tostring(ivGetData(player,"status")),tonumber(ivGetData(player,"stvo")),tonumber(ivGetData(player,"wanteds")),getElementHealth(player),getPlayerName(player))
  end
end)

addEventHandler("onResourceStop", root, function()
    for k, v in pairs(getElementsByType("player")) do
      if ivGetData(v,"loggedin") == true then
      local player = v
        dbExec(dbCon,"UPDATE playerdata SET `hunger` = ?,`geld` = ?,`bankgeld` = ?,`status` = ?,`stvo` = ?,`wanteds` = ?,`leben` = ? WHERE `Username` = ?" ,tonumber(ivGetData(player,"hunger")), tonumber(ivGetData(player,"geld")), tonumber(ivGetData(player, "bankgeld")), tostring(ivGetData(player,"status")),tonumber(ivGetData(player,"stvo")),tonumber(ivGetData(player,"wanteds")),getElementHealth(player),getPlayerName(v))
      end
    end
end)
