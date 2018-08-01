DGS = exports.dgs
local wdwbg = ":vero/res/images/gui/dxHeadBG.png"
local btnbg = ":vero/res/images/gui/dxButton.png"
local wdbg = ":vero/res/images/gui/dxBG.png"
local editbg = ":vero/res/images/gui/dxEditBG.png"
local register = {
  window = {},
  button = {},
  label = {},
  edit = {},
  txt = {
    [1] = "Herzlich Wilkommen auf iV\n (ehem. VeRo) Reallife!\nBitte registriere dich um das voll-\nständige iV erlebnis zu genießen!",
    [2] = "Deine Passwörter stimmen nicht überein!",
    [3] = "Dein Passwort muss mindesten\n6 Zeichen lang sein!",
  }
}
local login = {
  window = {},
  button = {},
  label = {},
  edit = {},
  txt = {
    [1] = "Herzlich Wilkommen\nauf iV (ehem. VeRo)\nReallife!\nBitte logge dich ein,\num das\nvollständige iV\nerlebnis zu genießen!",
    [2] = "Deine Passwort ist falsch!",
    [3] = "Nicht dein Account?\nWähle einen anderen Namen!\n\nPasswort vergessen?\nMelde dich bei einem Admin!",
  }
}
--Events--
addEvent("showRegister", true)
addEvent("showLogin", true)
addEvent("login_pw_wrong",true)
addEvent("closeLogin",true)
--Events--

function register_gui_show()
  DGS:dgsSetSystemFont("default-bold")
  register.window[1] = DGS:dgsCreateWindow( 0.4113, 0.2389, 0.1762, 0.4111, "iV-Registration", true, nil,15,wdwbg, tocolor(255,255,255,220), wdbg, tocolor(255,255,255,250),nil,true)
  register.label[1] = DGS:dgsCreateLabel(0,0,1,0.2, register.txt[1], true, register.window[1],nil,nil,nil,nil,nil,nil,"center","center",1,1,1,1)
  register.button[1] = DGS:dgsCreateButton(0.54,0.85,0.4,0.1,"Registrieren", true, register.window[1], nil,nil,nil,btnbg,btnbg,btnbg,tocolor(180,180,255,255),tocolor(150,150,225,255),tocolor(140,140,215,255),true)
  register.button[2] = DGS:dgsCreateButton(0.065,0.85,0.4,0.1,"Passwort anzeigen", true, register.window[1], nil,nil,nil,btnbg,btnbg,btnbg,tocolor(180,180,255,255),tocolor(150,150,225,255),tocolor(140,140,215,255),true)
  register.edit[1] = DGS:dgsCreateEdit(0.1,0.475,0.8,0.1,"",true,register.window[1],tocolor(255,255,255,255),nil,nil,editbg,tocolor(180,180,255,200))
  register.label[2] = DGS:dgsCreateLabel(0.1,0.425,0.8,0.05,"Passwort:", true, register.window[1],nil,nil,nil,nil,nil,nil,"left","center")
  register.edit[2] = DGS:dgsCreateEdit(0.1,0.65,0.8,0.1,"",true,register.window[1],tocolor(255,255,255,255),nil,nil,editbg,tocolor(180,180,255,200))
  register.label[3] = DGS:dgsCreateLabel(0.1,0.6,0.8,0.05,"Passwort wiederholen:", true, register.window[1],nil,nil,nil,nil,nil,nil,"left","center")
  register.edit[3] = DGS:dgsCreateEdit(0.1,0.3,0.8,0.1,getPlayerName(getLocalPlayer()),true,register.window[1],tocolor(255,255,255,255),nil,nil,editbg,tocolor(180,180,255,200))
  register.label[4] = DGS:dgsCreateLabel(0.1,0.25,0.8,0.05,"Username: (kann nicht geändert werden!)", true, register.window[1],nil,nil,nil,nil,nil,nil,"left","center")
  DGS:dgsSetProperty(register.edit[1], "masked",true)
  DGS:dgsSetProperty(register.edit[2], "masked",true)
  addEventHandler("onDgsMouseClick", register.button[1], function(iButton, iState)
    if iState == "down" then
      if DGS:dgsGetText(register.edit[1]) == DGS:dgsGetText(register.edit[2]) then
        if #DGS:dgsGetText(register.edit[1]) < 6 then
          DGS:dgsSetText(register.label[1], register.txt[3])
        else
          triggerServerEvent("registerpl", getLocalPlayer(), getLocalPlayer(), passwordHash(DGS:dgsGetText(register.edit[2]),"bcrypt",{}))
          DGS:dgsCloseWindow(register.window[1])
          showCursor(false)
          ivSetData(getLocalPlayer(), "loggedin", true)
        end
      else
        DGS:dgsSetText(register.label[1], register.txt[2])
      end
    end
  end)
  addEventHandler("onDgsMouseClick", register.button[2], function(iBtn, iSt)
    if iBtn == "left" then
      if iSt == "down" then
        DGS:dgsSetProperty(register.edit[1], "masked",false)
        DGS:dgsSetProperty(register.edit[2], "masked",false)
      else
        DGS:dgsSetProperty(register.edit[1], "masked",true)
        DGS:dgsSetProperty(register.edit[2], "masked",true)
      end
    end
  end)
  DGS:dgsSetEnabled(register.edit[3],false)
  showCursor(true)
end
addEventHandler("showRegister", getRootElement(), register_gui_show)
local components = { "weapon", "ammo", "health", "clock", "money", "breath", "armour", "wanted" }
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
  triggerServerEvent("checkrlog", getLocalPlayer(),getLocalPlayer())
  ivSetData(getLocalPlayer(), "hud", false)
  ivSetData(getLocalPlayer(), "loggedin", false)
  for _, component in ipairs( components ) do
		setPlayerHudComponentVisible( component, false )
	end
end)

function login_gui_show()
  login.window[1] = DGS:dgsCreateWindow(0.3891,0.3756,0.2356,0.2100, "iV-Login", true, nil,15,wdwbg, tocolor(255,255,255,220), wdbg, tocolor(255,255,255,250),nil,true)
  login.button[1] = DGS:dgsCreateButton(0.66,0.725,0.3,0.2, "Einloggen", true, login.window[1],nil,nil,nil,btnbg,btnbg,btnbg,tocolor(180,180,255,255),tocolor(150,150,225,255),tocolor(140,140,215,255),true)
  login.label[1] = DGS:dgsCreateLabel(0.65,0.05,0.34,0.675, login.txt[1],true, login.window[1],nil,nil,nil,nil,nil,nil,"center","center")
  login.label[3] = DGS:dgsCreateLabel(0.1,0.1,0.55,0.525, login.txt[3], true, login.window[1],nil,nil,nil,nil,nil,nil,"center", "center")
  login.label[2] = DGS:dgsCreateLabel(0.1,0.625,0.4,0.1, "Passwort:", true, login.window[1])
  login.edit[1] = DGS:dgsCreateEdit(0.1,0.725,0.4,0.2,"",true, login.window[1],tocolor(255,255,255,255),nil,nil,editbg,tocolor(180,180,255,200))
  showCursor(true)
  addEventHandler("onDgsMouseClick", login.button[1], function(iBtn, iSt)
    if iSt == "down" then
      triggerServerEvent("checkLogin",getLocalPlayer(),getLocalPlayer(), DGS:dgsGetText(login.edit[1]))
    end
  end)
end
addEventHandler("showLogin", getRootElement(), login_gui_show)

function pwfalsch()
  DGS:dgsSetText(login.label[3], login.txt[2])
  DGS:dgsSetText(login.edit[1], "")
end
addEventHandler("login_pw_wrong",getRootElement(),pwfalsch)

function login_gui_destroy()
  DGS:dgsCloseWindow(login.window[1])
  showCursor(false)
  ivSetData(getLocalPlayer(), "loggedin", true)
end
addEventHandler("closeLogin", getRootElement(), login_gui_destroy)
addEventHandler("onClientResourceStart", getResourceRootElement(),
function()
	guiSetInputMode("no_binds_when_editing") --Calls guiSetInputMode once and for all to not have to handle binds state dynamically
end)
