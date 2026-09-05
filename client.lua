local currentStreetText = ""
local currentZoneText = ""

local function GetStreetLabel(coords)
    local streetHash, crossingHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)

    if crossingHash ~= 0 then
        local crossingName = GetStreetNameFromHashKey(crossingHash)
        if crossingName ~= "" and crossingName ~= streetName then
            return streetName .. " / " .. crossingName
        end
    end

    return streetName
end

local function GetZoneLabel(coords)
    local zoneCode = GetNameOfZone(coords.x, coords.y, coords.z)
    return GetLabelText(zoneCode)
end

local function DrawScaledText(text, x, y, scale, color, outline)
    SetTextFont(Config.Font)
    SetTextScale(scale, scale)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextCentre(true)
    if outline then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        currentStreetText = GetStreetLabel(coords)

        if Config.ShowZone then
            currentZoneText = GetZoneLabel(coords)
        end

        Citizen.Wait(Config.UpdateInterval)
    end
end)

Citizen.CreateThread(function()
    while true do
        local shouldDraw = true

        if Config.HideWithMinimap then
            if IsPauseMenuActive() or not IsRadarEnabled() then
                shouldDraw = false
            end
        end

        if shouldDraw and currentStreetText ~= "" then
            DrawScaledText(
                currentStreetText,
                Config.Position.x,
                Config.Position.y,
                Config.Scale,
                Config.Color,
                Config.Outline
            )

            if Config.ShowZone and currentZoneText ~= "" then
                DrawScaledText(
                    currentZoneText,
                    Config.Position.x,
                    Config.Position.y + (Config.Scale * 0.045) + 0.005,
                    Config.ZoneScale,
                    Config.ZoneColor,
                    Config.Outline
                )
            end
        end

        Citizen.Wait(0)
    end
end)
