elementData = {}

function ivSetData ( element, dataString, value )
	if element and dataString and value ~= nil then
		if not elementData[element] then
			elementData[element] = {}
		end
		elementt = element
		elementData[elementt][dataString] = value
		setTimer(function()
			triggerClientEvent("updatetbl_datas",resourceRoot, resourceRoot,elementt,elementData)
		end, 500, 1)
	else
		return nil
	end
end

function ivGetData(element, tbl)
		return elementData[element][tbl]
end
addEvent("updatetbl_datass",true)
addEventHandler("updatetbl_datass", getRootElement(), function(element,etbl)
	if not elementData[element] then
		elementData[element] = {}
	end
	for k,v in pairs(etbl[element]) do
		elementData[element][k] = v
	end
end)

addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), function()
	for k,v in pairs(getElementsByType("player")) do
    setTimer(function()
			elementData[v] = nil
  	end, 1500,1)
	end
end)
