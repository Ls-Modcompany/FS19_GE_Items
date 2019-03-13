-- Author:kevin
-- Name:Delete Items
-- Description:
-- Icon:
-- Hide: no

local node = getSelection(0);
if node ~= 0 then
    for i=1, getNumOfChildren(node) do
        local child = getChildAt(node, i-1);
        for j=1, getNumOfChildren(child) do
            delete(getChildAt(child, 0));
        end;
    end;
end