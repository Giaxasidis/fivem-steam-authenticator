AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    if not src or src == -1 then
        deferrals.done("Connection denied. Unexpected connection error.")
        return
    end

    deferrals.defer()
    Wait(0)
    deferrals.update("Verifying Steam session...")

    local steamIdentifier = nil
    local identifiers = GetPlayerIdentifiers(src) or {}

    for _, identifier in ipairs(identifiers) do
        if string.sub(identifier, 1, 6) == "steam:" then
            steamIdentifier = identifier
            break
        end
    end

    Wait(200)

    if not steamIdentifier then
        deferrals.done("Connection denied. Steam must be running to join this server.")
        return
    end

    deferrals.done()
end)
