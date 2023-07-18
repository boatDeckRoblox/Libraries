local LibLoader = {}

LibLoader.LibNames = {
    ['lPlayer'] = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/LJdyTq8X",true))()
    end,
}



function LibLoader:LoadLib(lib)
    if lib then
        LibLoader[lib]()
        return
    end
end

function LibLoader:GetLibs()
    local said = {}
    for i,v in pairs(LibLoader.LibNames) do
        if v and not table.find(said, v) then
            table.insert(said,v)
        end
    end
    return said
end



function LibLoader:UninjectLib(libName: String)
    if libName == nil then
        for i,v in pairs(LibLoader) do
            if type(v) == 'function' and geit then
                
            end
        end
    end
    if libName and libName ~= '' and getgenv()[libName] then
        -- get rid of cons
        if libName == 'lPlayer' then
            if not lPlayer then return end
            for i,v in pairs(lPlayer.Connections) do
                if type(v) == 'userdata' then
                    v:Disconnect()
                end
            end
            --main lplr thingy
            lPlayer.LocalPlayer = nil
            for i,v in pairs(lPlayer) then
                if type(v) == 'function' then
                    lPlayer[i] = function() end
                    lPlayer[i] = nil
                else
                    lPlayer[i] = ""
                    lPlayer[i] = nil
                end
            end
        end
        lPlayer = nil
    end
end



function LibLoader:GetLibProperty(libName, propName)
    local toRturn = ""
    LibLoader:LoadLib(libName)
    local t = 0
    repeat task.wait(.1) t += .5 until getgenv()[libName] or t == 5
    toRturn = libName[propName]
    LibLoader:UninjectLib(libName)
    return toRturn
end



return LibLoader
