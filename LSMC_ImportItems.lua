-- Author:kevin
-- Name:Import Items
-- Description:
-- Icon:
-- Hide: no

local loadPath = "C:/Users/kevin/Documents/My Games/FarmingSimulator2019/mods/FS19_Vogelsbach/xml/items.xml"

--from FS17
function splitString(splitPattern, text)
    local results = {};
    if text ~= nil then
        local start = 1;
        local splitStart, splitEnd = string.find(text, splitPattern, start, true);
        while splitStart ~= nil do
            table.insert(results, tonumber(string.sub(text, start, splitStart-1)));
            start = splitEnd + 1;
            splitStart, splitEnd = string.find(text, splitPattern, start, true);
        end
        table.insert(results, tonumber(string.sub(text, start)));
    end
    return results;
end;

local node = getSelection(0);
if node ~= 0 then
    local xmlFile = loadXMLFile("placeable", loadPath);	
    if xmlFile ~= nil then
    
        local i = 0;
        while true do
            local key = string.format("items.item(%d)", i);
            if not hasXMLProperty(xmlFile, key) then
                break;
            end;    
    
            local mapBoundId = getXMLString(xmlFile, key .. "#mapBoundId");
            local className = getXMLString(xmlFile, key .. "#className");
            local modName = getXMLString(xmlFile, key .. "#modName");
            local filename = getXMLString(xmlFile, key .. "#filename");
            local position = splitString(" ", getXMLString(xmlFile, key .. "#position"));
            local rotation = splitString(" ", getXMLString(xmlFile, key .. "#rotation"));
            local defaultFarmProperty = getXMLBool(xmlFile, key .. "#defaultFarmProperty");
            local farmId = getXMLInt(xmlFile, key .. "#farmId");

            local tg = createTransformGroup(mapBoundId);
            link(node, tg);

            setWorldTranslation(tg, position[1], position[2], position[3]);
            setRotation(tg, rotation[1], rotation[2], rotation[3]);

            setUserAttribute(tg, "className", "String", className);
            
            if modName ~= nil then
                setUserAttribute(tg, "modName", "String", modName);
                filename = string.gsub(filename, string.format("$moddir$%s/", modName), "");
            end;
            setUserAttribute(tg, "xmlFilename", "String", filename);

            if defaultFarmProperty ~= nil then
                setUserAttribute(tg, "defaultFarmProperty", "Boolean", defaultFarmProperty);
            end;
            if farmId ~= nil then
                setUserAttribute(tg, "farmId", "Integer", 100);
            end;

            i = i + 1;
        end;

    end;
end;


