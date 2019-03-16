-- Author:kevin
-- Name:Export Items
-- Description:
-- Icon:
-- Hide: no

local installPath = "C:/Program Files (x86)/Farming Simulator 2019/"
local savePath = "C:/Users/kevin/Documents/My Games/FarmingSimulator2019/mods/FS19_Vogelsbach/xml/items.xml"

function getNoNil(v1, v2)
    if v1 ~= nil then
        return v1;
    else
        return v2;
    end;
end;

local node = getSelection(0);
if node ~= 0 then
    local usedMapBoundIds = {};
    local xmlFile = createXMLFile("xmlFile", savePath, "items");
    if xmlFile ~= 0 then        
        local keyId = 0;
        for i=1, getNumOfChildren(node) do
            local child = getChildAt(node, i-1);
            if getVisibility(child) then
                local mapBoundId = getName(child);
                if usedMapBoundIds[mapBoundId] == nil then       
                    local xmlKey = string.format("items.item(%d)", keyId);

                    local modName = getUserAttribute(child, "modName");
                    local className = getUserAttribute(child, "className");
                    local xmlFilename = getUserAttribute(child, "xmlFilename");
                    local defaultFarmProperty = getNoNil(getUserAttribute(child, "defaultFarmProperty"), false);
                    local farmId = getUserAttribute(child, "farmId");

                    local canAdd = true;
                    if className == nil then
                        print(string.format("Userattribute 'className' at %s is nil.", mapBoundId));
                        canAdd = false;
                    end;
                    if xmlFilename == nil then
                        print(string.format("Userattribute 'xmlFilename' at %s is nil.", mapBoundId));
                        canAdd = false;
                    end;

                    if canAdd then
                        local x,y,z = getWorldTranslation(child);
                        local rx,ry,rz = getRotation(child);         
                        local pos = string.format("%s %s %s",x,y,z);
                        local rot = string.format("%s %s %s",math.deg(rx),math.deg(ry),math.deg(rz));  
                        
                        setXMLString(xmlFile, xmlKey .. "#mapBoundId", mapBoundId);
                        setXMLString(xmlFile, xmlKey .. "#className", className);
                        
                        local addPath = "";
                        if modName ~= nil or modName == "" then
                            setXMLString(xmlFile, xmlKey .. "#modName", modName);
                            addPath = string.format("$moddir$%s/", modName);
                        end;

                        setXMLString(xmlFile, xmlKey .. "#filename", addPath .. xmlFilename);
                        setXMLString(xmlFile, xmlKey .. "#position", pos);
                        setXMLString(xmlFile, xmlKey .. "#rotation", rot);
                        setXMLBool(xmlFile, xmlKey .. "#defaultFarmProperty", defaultFarmProperty);
                        if farmId ~= nil then                    
                            setXMLInt(xmlFile, xmlKey .. "#farmId", farmId);
                        end;
                        
                        keyId = keyId + 1;
                    end;
                    usedMapBoundIds[mapBoundId] = true;
                else
                    print(string.format("%s already exist!", mapBoundId));
                end;
            end;
        end;
        saveXMLFile(xmlFile);
    end;
end