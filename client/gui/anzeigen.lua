
local sx,sy = guiGetScreenSize()
local px,py = 1600,900
local x,y = (sx/px), (sy/py)
local dxfont0_eurostile = dxCreateFont("eurostile.ttf", 10)
local dxfont1_eurostile = dxCreateFont("eurostile.ttf", 14)
local dxfont2_eurostile = dxCreateFont("eurostile.ttf", 12)
local hud_state = false
function timestampOpticalZeitDatum ()
    local regtime = getRealTime()
    local year = regtime.year + 1900
    local month = regtime.month+1
    local day = regtime.monthday
    local hour = regtime.hour
    local minute = regtime.minute
    if hour < 10 then
        hour = "0"..hour
    end
    if minute < 10 then
        minute = "0"..minute
    end
    return tostring(day.."."..month.."."..year), tostring(hour..":"..minute)
end
addEventHandler("onClientRender", root, function()
        if ivGetData(getLocalPlayer(), "hud") then
        local datum, time = timestampOpticalZeitDatum ()
        local health = math.floor(tonumber(getElementHealth(getLocalPlayer())))
        local money = ivGetData(getLocalPlayer(), "geld")
        local armor = math.floor(tonumber(getPedArmor ( getLocalPlayer() )))
        local hunger = ivGetData(getLocalPlayer(),"hunger")
        dxDrawRectangle(x*1281, y*64, x*305, y*32, tocolor(44, 43, 44, 117), false)
        dxDrawRectangle((x*1281), y*80, x*305/100*health, y*16, tocolor(187, 75, 72, 255), false)
        dxDrawRectangle((x*1281), y*64, x*305/100*health, y*16, tocolor(220, 87, 82, 255), false)
        dxDrawText(health.."%", x*1281, y*64, x*1586, y*96, tocolor(255, 255, 255, 255), 1.00, dxfont0_eurostile, "center", "center", false, false, false, false, false)
        dxDrawRectangle(x*1241, y*10, x*349, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawText(datum, x*1251, y*10, x*1406, y*50, tocolor(227, 226, 227, 117), 1.00, dxfont0_eurostile, "left", "center", false, false, false, false, false)
        dxDrawText(time.." Uhr", x*1483, y*10, x*1590, y*50, tocolor(227, 226, 227, 117), 1.00, dxfont0_eurostile, "center", "center", false, false, false, false, false)
        dxDrawRectangle(x*1241, y*60, x*40, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*60, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*96, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1586, y*60, x*4, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1241, y*110, x*40, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1241, y*160, x*40, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1241, y*210, x*40, y*45, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*146, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*210, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*251, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*196, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*160, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*110, x*309, y*4, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1586, y*110, x*4, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1586, y*160, x*4, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1586, y*214, x*4, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1281, y*114, x*305, y*32, tocolor(44, 43, 44, 117), false)
        dxDrawRectangle(x*1281, y*164, x*305, y*32, tocolor(44, 43, 44, 117), false)
        dxDrawRectangle(x*1281, y*214, x*305, y*37, tocolor(44, 43, 44, 117), false)
        dxDrawImage(x*1251, y*120, x*20, y*20, "res/images/hud/hunger.png", 0, 0, 0, tocolor(52, 122, 49, 255), false)
        dxDrawRectangle(x*1281, y*130, x*305/100*hunger, y*16, tocolor(52, 122, 49, 255), false)
        dxDrawRectangle(x*1281, y*114, x*305/100*hunger, y*16, tocolor(59, 139, 55, 255), false)
        dxDrawImage(x*1251, y*170, x*20, y*20, "res/images/hud/armor.png", 0, 0, 0, tocolor(187, 254, 254, 255), false)
        dxDrawRectangle(x*1281, y*180, x*305/100*armor, y*16, tocolor(1, 169, 169, 255), false)
        dxDrawRectangle(x*1281, y*164, x*305/100*armor, y*16, tocolor(2, 200, 200, 255), false)
        dxDrawImage(x*1245, y*64, x*32, y*32, "res/images/hud/health.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*1245, y*214, x*32, y*35, "res/images/hud/money.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(hunger.."%", x*1281, y*114, x*1586, y*146, tocolor(255, 255, 255, 255), 1.00, dxfont0_eurostile, "center", "center", false, false, false, false, false)
        dxDrawText("0%", x*1281, y*164, x*1586, y*196, tocolor(255, 255, 255, 255), 1.00, dxfont0_eurostile, "center", "center", false, false, false, false, false)
        dxDrawText("$"..money,x*1281, y*214, x*1586, y*251, tocolor(53, 128, 3, 255), 1.00, dxfont1_eurostile, "right", "center", false, false, false, false, false)
        dxDrawRectangle(x*1091, y*140, x*140, y*40, tocolor(44, 43, 44, 255), false)
        dxDrawText("Melee", x*1091, y*140, x*1231, y*180, tocolor(155, 153, 155, 255), 1.00, dxfont2_eurostile, "center", "center", false, false, false, false, false)
        dxDrawRectangle(x*1101, y*20, x*120, y*120, tocolor(44, 43, 44, 105), false)
        dxDrawRectangle(x*1091, y*20, x*10, y*120, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1221, y*20, x*10, y*120, tocolor(44, 43, 44, 255), false)
        dxDrawRectangle(x*1091, y*10, x*140, y*10, tocolor(44, 43, 44, 255), false)
        dxDrawImage(x*1101, y*20, x*120, y*120, "res/images/hud/0.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
end)
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
     if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
          local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
          if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
               for i, v in ipairs( aAttachedFunctions ) do
                    if v == func then
        	         return true
        	    end
	       end
	  end
     end
     return false
end
--[[
Project: VitaOnline
File: notify-client.lua
Author(s):	Sebihunter
]]--
local screenWidth, screenHeight = guiGetScreenSize()
local movingSpace = 0
gNotifications = {}
screenWidth = (screenWidth/2+64)
function addNotification(cmd,id, r, g, b, text)
	local number = 1
	for i = 1, #gNotifications+1 do
		if gNotifications[number] then
			number = number +1
		else
			gNotifications[number] = {}
			gNotifications[number].alpha = 0
			gNotifications[number].id = id
			gNotifications[number].r = r
			gNotifications[number].g = g
			gNotifications[number].b = b
			gNotifications[number].text = text
			gNotifications[number].starttick = getTickCount ()
			playSound("sounds/notify.mp3")
			if isEventHandlerAdded( "onClientRender", getRootElement(), renderNotifications ) == false then
				movingSpace = 0
				addEventHandler("onClientRender", getRootElement(), renderNotifications, true, "low-2")
			end
			outputConsole("Notification: "..text)
			break
		end
	end
end
addEvent("addNotification", true)
addEventHandler("addNotification", getRootElement(), addNotification)
addCommandHandler("testnot", addNotification)

function renderNotifications()
	if #gNotifications == 0 then removeEventHandler("onClientRender", getRootElement(), renderNotifications) end
	if movingSpace > 0 then movingSpace = movingSpace-5 end
	local startMoving = movingSpace
	for i,v in pairs(gNotifications) do
		iDraw = i-1
		if (getTickCount() - v.starttick) <= 8000 then
			if v.alpha < 255 then
				v.alpha = v.alpha+15
			end


			local width = dxGetTextWidth ( v.text, 1, "default-bold")
			local doubleLined = split(v.text, "\n")
			if doubleLined[2] ~= nil then
				local lineOne = dxGetTextWidth ( doubleLined[1], 1, "default-bold")
				local lineTwo = dxGetTextWidth ( doubleLined[2], 1, "default-bold")
				if lineOne > lineTwo then width = lineOne else width = lineTwo end
			end


			dxDrawImage(screenWidth-width-64,10+60*iDraw+movingSpace, width+64,49, "res/images/notify/notification.png",0,0,0, tocolor(v.r, v.g, v.b, v.alpha), true)
			dxDrawImage(screenWidth-width-54,10+8+60*iDraw+movingSpace, 32,32, "res/images/notify/notify"..v.id..".png",0,0,0, tocolor(255,255,255,v.alpha), true)

			if doubleLined[2] ~= nil then
				dxDrawText ( doubleLined[1], screenWidth-width-14, 10+16+60*iDraw-6+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
				dxDrawText ( doubleLined[2], screenWidth-width-14, 10+16+60*iDraw+7+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
			else
				dxDrawText ( v.text, screenWidth-width-14, 10+16+60*iDraw+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
			end
		else
			if v.alpha > 0 then
				v.alpha = v.alpha-15
				local width = dxGetTextWidth ( v.text, 1, "default-bold")

				local doubleLined = split(v.text, "\n")
				if doubleLined[2] ~= nil then
					local lineOne = dxGetTextWidth ( doubleLined[1], 1, "default-bold")
					local lineTwo = dxGetTextWidth ( doubleLined[2], 1, "default-bold")
					if lineOne > lineTwo then width = lineOne else width = lineTwo end
				end

				dxDrawImage(screenWidth-width-64,10+60*iDraw+movingSpace, width+64,49, "res/images/notify/notification.png",0,0,0, tocolor(v.r, v.g, v.b, v.alpha), true)
				dxDrawImage(screenWidth-width-54,10+8+60*iDraw+movingSpace, 32,32, "res/images/notify/notify"..v.id..".png",0,0,0, tocolor(255,255,255,v.alpha), true)

				if doubleLined[2] ~= nil then
					dxDrawText ( doubleLined[1], screenWidth-width-14, 10+16+60*iDraw-6+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
					dxDrawText ( doubleLined[2], screenWidth-width-14, 10+16+60*iDraw+7+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
				else
					dxDrawText ( v.text, screenWidth-width-14, 10+16+60*iDraw+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
				end
			else
				table.remove (gNotifications, i)
				movingSpace = movingSpace+60

				--Draw the one with this id again (otherwise its not drawn as the notification after this notification has now the same id as the one before)
				v = gNotifications[i]
				if v then
					v.alpha = v.alpha-15
					local width = dxGetTextWidth ( v.text, 1, "default-bold")

					local doubleLined = split(v.text, "\n")
					if doubleLined[2] ~= nil then
						local lineOne = dxGetTextWidth ( doubleLined[1], 1, "default-bold")
						local lineTwo = dxGetTextWidth ( doubleLined[2], 1, "default-bold")
						if lineOne > lineTwo then width = lineOne else width = lineTwo end
					end

					dxDrawImage(screenWidth-width-64,10+60*iDraw+movingSpace, width+64,49, "res/images/notify/notification.png",0,0,0, tocolor(v.r, v.g, v.b, v.alpha), true)
					dxDrawImage(screenWidth-width-54,10+8+60*iDraw+movingSpace, 32,32, "res/images/notify/notify"..v.id..".png",0,0,0, tocolor(255,255,255,v.alpha), true)

					if doubleLined[2] ~= nil then
						dxDrawText ( doubleLined[1], screenWidth-width-14, 10+16+60*iDraw-6+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
						dxDrawText ( doubleLined[2], screenWidth-width-14, 10+16+60*iDraw+7+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
					else
						dxDrawText ( v.text, screenWidth-width-14, 10+16+60*iDraw+movingSpace, screenWidth, screenHeight, tocolor ( 255, 255, 255, v.alpha ), 1, "default-bold", "left", "top", false, false, true )
					end
				end

			end
		end
	end
end

--[[
Tutorial Messages
]]--


local tutorialMessages = {}

function showTutorialMessage(id, text, override, still)

	local buffer = ""
	if fileExists("tutorialMessages.vita") then
		local file = fileOpen("tutorialMessages.vita", true)
		buffer = fileRead(file, fileGetSize ( file ))
		fileClose(file)
	end
	local data = fromJSON(buffer) or {}

	if data[id] and still ~= true then return end
	data[id] = true

	fileDelete("tutorialMessages.vita")
	local file = fileCreate("tutorialMessages.vita")
	fileWrite(file, toJSON(data))
	fileClose(file)

	tutorialMessages[#tutorialMessages+1] = {}
	tutorialMessages[#tutorialMessages].text = text
	tutorialMessages[#tutorialMessages].soundPlayed = false
	tutorialMessages[#tutorialMessages].animStage = 1
	tutorialMessages[#tutorialMessages].alpha = 0
	tutorialMessages[#tutorialMessages].offsetY = 0



	if override and #tutorialMessages > 1 then
		table.remove(tutorialMessages, 1)
	end
end

addEvent("showTutorialMessage", true)
addEventHandler("showTutorialMessage", getRootElement(), showTutorialMessage)


local tick = 0
local function renderTutorialMessages()
	if #tutorialMessages >= 1 then
		tick = tick + 1
		if tick > 30 then
			tick = 0
		end

		local message = tutorialMessages[1]

		if message.soundPlayed == false then
			playSound("sounds/tut_sound.mp3")
			message.soundPlayed = true
		end


		if message.animStage == 1 then
			if message.alpha + 0.1 >= 1 then
				message.alpha = 1
			else
				message.alpha = message.alpha + 0.1
			end

			if message.offsetY + 20 >= 250 then
				message.offsetY = 250
			else
				message.offsetY = message.offsetY + 20
			end
		else
			if (message.alpha - 0.1) <= 0 then
				message.alpha = 0
				table.remove(tutorialMessages, 1)
				return
			else
				message.alpha = message.alpha - 0.1
			end
		end

		dxDrawRectangle ( screenWidth/2-200, screenHeight-message.offsetY , 400, 100, tocolor ( 255,255,255,150*message.alpha ))
		dxDrawLine (  screenWidth/2-200, screenHeight-message.offsetY, screenWidth/2-200, screenHeight-message.offsetY+100, tocolor(255,255,255,255*message.alpha))
		dxDrawLine (  screenWidth/2+200, screenHeight-message.offsetY, screenWidth/2+200, screenHeight-message.offsetY+100, tocolor(255,255,255,255*message.alpha))
		dxDrawLine (  screenWidth/2-200, screenHeight-message.offsetY+100, screenWidth/2+200, screenHeight-message.offsetY+100, tocolor(255,255,255,255*message.alpha))
		dxDrawLine (  screenWidth/2-200, screenHeight-message.offsetY, screenWidth/2+200, screenHeight-message.offsetY, tocolor(255,255,255,255*message.alpha))


		dxDrawText( message.text,screenWidth/2-195, screenHeight-message.offsetY, screenWidth/2+195, screenHeight-message.offsetY+100,tocolor(30,30,30, 255*message.alpha), 1, "default", "center", "center", true, true, false, false, true)
		dxDrawText("Drücke #A8FF12F9 #1E1E1Eum fortzufahren" .. string.rep(".", math.ceil(tick / 10)), screenWidth/2-195, screenHeight-message.offsetY+85,screenWidth,screenHeight,tocolor(30,30,30, 255*message.alpha), 1, "default-bold", "left", "top", false, false, false, true, true)
	end
end
addEventHandler("onClientRender", getRootElement(), renderTutorialMessages, false, "low-9999")


bindKey("F9", "down",
function()
	if #tutorialMessages >= 1 then
		tutorialMessages[1].animStage = 2
	end
end)

--Blips--
 exports.customblips:createCustomBlip(-1969,137,16,16,"res/images/hud/hbf.png")
