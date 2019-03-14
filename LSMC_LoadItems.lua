-- Author:kevin
-- Name:Load Items
-- Description:
-- Icon:
-- Hide: no

local installPath = "C:/Program Files (x86)/Farming Simulator 2019/"
local modPath = "C:/Users/kevin/Documents/My Games/FarmingSimulator2019/mods/"

local node = getSelection(0);
if node ~= 0 then
    for i=1, getNumOfChildren(node) do
        local child = getChildAt(node, i-1);
        if getVisibility(child) then            
            local modName = getUserAttribute(child, "modName");
            local xmlFilename = getUserAttribute(child, "xmlFilename");            
            if getNumOfChildren(child) == 0 then        
                local path = installPath;
                if modName ~= nil then
                    path = string.format("%s%s/",modPath, modName);
                end;
                local xmlFile = loadXMLFile("placeable", path .. xmlFilename);	
                local i3dPath = getXMLString(xmlFile, "placeable.filename"):gsub("$data", "data");
                local objectNode = loadI3DFile(path .. i3dPath);
                link(child, objectNode);
                delete(xmlFile);
            end;
        end;
    end;
end
