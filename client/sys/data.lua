addEvent("updatetbl_datas",true)

local elementtbl = {}

addEventHandler("updatetbl_datas", getRootElement(), function(source_ele,element,etbl)
	if not elementtbl[element] then
		elementtbl[element] = {}
	end
	for k,v in pairs(etbl[element]) do
		elementtbl[element][k] = v
	end
end)

function ivSetData(element, tbl, val)
	if element and tbl and val ~= nil then
		if not elementtbl[element] then
			elementtbl[element] = {}
		end
		elementt = element
		elementtbl[element][tbl] = val
		setTimer(function()
			triggerServerEvent("updatetbl_datass",getLocalPlayer(), elementt, elementtbl)
		end, 500, 1)
	else
		return nil
	end
end

function ivGetData(element, tbl)


	return elementtbl[element][tbl]
end
