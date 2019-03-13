-- Author:kevin
-- Name:Set Item Default
-- Description:
-- Icon:
-- Hide: no

local node = getSelection(0);
setUserAttribute(node, "className", "String", "");
setUserAttribute(node, "modName", "String", "");
setUserAttribute(node, "xmlFilename", "String", "");
setUserAttribute(node, "defaultFarmProperty", "Boolean", false);
setUserAttribute(node, "farmId", "Integer", 0);