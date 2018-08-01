DGS = exports.dgs
local wdwbg = ":vero/res/images/gui/dxHeadBG.png"
local btnbg = ":vero/res/images/gui/dxButton.png"
local wdbg = ":vero/res/images/gui/dxBG.png"
local editbg = ":vero/res/images/gui/dxEditBG.png"
local self = {
  window = {},
  button = {},
  label = {},
  edit = {},
  txt = {},
}

function self_gui_show()
  if ivGetData(getLocalPlayer(), "loggedin") then
    if not ivGetData(getLocalPlayer(), "self_active") then
      ivSetData(getLocalPlayer(), "self_active", true)
      self.window[1] = DGS:dgsCreateWindow(0.3837, 0.0111,0.2313,0.0744, "Eigenmenü", true, nil,15,wdwbg, tocolor(255,255,255,220), wdbg, tocolor(255,255,255,250),nil,true)
      self.button[1] = DGS:dgsCreateButton(0.0725,0.05,0.2,0.85,"Spieler-\ninfo", true, self.window[1],nil,nil,nil,btnbg,btnbg,btnbg,tocolor(180,180,255,255),tocolor(150,150,225,255),tocolor(140,140,215,255),true)
      self.button[2] = DGS:dgsCreateButton(0.285,0.05,0.2,0.85,"Einstell-\nungen", true, self.window[1],nil,nil,nil,btnbg,btnbg,btnbg,tocolor(180,180,255,255),tocolor(150,150,225,255),tocolor(140,140,215,255),true)
      self.button[3] = DGS:dgsCreateButton(0.4975,0.05,0.2,0.85,"Inventar", true, self.window[1],nil,nil,nil,btnbg,btnbg,btnbg,tocolor(180,180,255,255),tocolor(150,150,225,255),tocolor(140,140,215,255),true)
      self.button[4] = DGS:dgsCreateButton(0.71,0.05,0.2,0.85,"Schließen", true, self.window[1],nil,nil,nil,btnbg,btnbg,btnbg,tocolor(180,180,255,255),tocolor(150,150,225,255),tocolor(140,140,215,255),true)
      showCursor(true)
      addEventHandler("onDgsMouseClick", self.button[4], function(ibtn, ist)
        if ist == "down" then
          if isElement(self.window[1]) then
            ivSetData(getLocalPlayer(), "self_active", false)
            DGS:dgsCloseWindow(self.window[1])
            self.window[1] = nil
            showCursor(false)
          end
        end
      end)
    else
      if isElement(self.window[1]) then
        ivSetData(getLocalPlayer(), "self_active", false)
        DGS:dgsCloseWindow(self.window[1])
        self.window[1] = nil
        showCursor(false)
      else
        outputChatBox("Es ist ein Fehler aufgetreten, bitte neu verbinden!", 255,0,0)
      end
    end
  end
end

addCommandHandler("self", self_gui_show)
bindKey("i", "down", self_gui_show)
