local CRAFTER_PATTERN = ITEM_CREATED_BY:gsub("%%s", ".+")

local function OnTooltipSetItem(tooltip)
    local tooltipName = tooltip:GetName()
    if not tooltipName then return end

    for i = 1, tooltip:NumLines() do
        local line = _G[tooltipName .. "TextLeft" .. i]
        if line then
            local text = line:GetText()
            if text and text:find(CRAFTER_PATTERN) then
                line:SetText("")
                line:Hide()
                tooltip:Show()
                return
            end
        end
    end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)