-- FULL: Voks Exploit — tanpa Key System

-- === Load Rayfield ===
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- === Key System ===
local KeySystem = false
local KeySettings = {
    Title = "Fyy Key System",
    Subtitle = "Masukkan Key untuk akses",
    Note = "Ini Free Sc , Nak key? join discord.gg/94SaPbxn",
    FileName = "Fyy",  -- file key tetap sama tiap run
    SaveKey = true,           -- simpan key otomatis
    GrabKeyFromSite = false,
    Key = {"ATMINLGISAD","FYY-PREMIUM"},
    Callback = function(Key)
        return true
    end
}

-- === Configuration Saving Settings ===
local ConfigurationSaving = {
    Enabled = true,
    FolderName = "FyyConfigs",
    FileName = "FyyExploitConfig"
}

local Window = Rayfield:CreateWindow({
   Name = "Voks Exploit Menu",
   Icon = 0,
   LoadingTitle = "Voks Exploit Loader",
   LoadingSubtitle = "by Voks",
   ShowText = "Voks Exploit",
   Theme = "Ocean",
   ToggleUIKeybind = Enum.KeyCode.K,

   DisableRayfieldPrompts = true,

   KeySystem = KeySystem,
   KeySettings = KeySettings,

   ConfigurationSaving = ConfigurationSaving
})

-- === Services & player ===
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

-- === Access control: username premium, basic/premium menu lists ===
local allowedUsers = {

}

local basicMenus = {
    ["Fly"] = true,
    ["MT Ravika"] = true,
    ["MT Atin"] = true,
    ["Respawn"] = true,
    ["Rejoin"] = true,
    ["WalkSpeed Toggle"] = true,
    ["WalkSpeed Value"] = true,
    ["Noclip"] = true,
    ["MT Sibuatan"] = true,
    ["MT Sibayak"] = true,
    ["MT Lauser"] = true,
    ["MT Yhahyuk"] = true,
    ["MT Lawak"] = true,
    ["CheckPoint 1"] = true,
    ["CheckPoint 2"] = true,
    ["CheckPoint 3"] = true,
    ["CheckPoint 4"] = true,
    ["CheckPoint 5"] = true,
    ["Summit"] = true,
    ["Infinity Jump"] = true,
    ["ESP Players (bug)"] = true,
    ["Freeze Object (Time Stop)"] = true,
    ["Freeze Radius"] = true,
    ["Teleport Tool"] = true,
    ["Full Bright Loop"] = true,
    ["Adjust Brightness"] = true,
    ["SavePos And BackPos"] = true,
    ["Reset"] = true,
    ["MT Ckptw"] = true,
    ["Fix Lag"] = true,
    ["Teleport to Player GUI"] = true,
    ["Fling Player"] = true,
    ["MT Yagataw"] = true,
    ["God Mode"] = true,
    ["MT Konoha"] = true,
    ["Auto Walk Arunika V2"] = true,
    ["MT Hanami"] = true,
    ["Auto Walk Daun V2"] = true,
    ["Expedition Antartika⚡"] = true,
    ["MT Daun"] = true,
    ["MT Batu"] = true,
    ["MT Arunika"] = true,
    ["Hell Expedition"] = true,

   

}

local accessLevel = "premium"
if allowedUsers[player.Name] then accessLevel = "premium" end

-- === UI helper wrappers (respect basic/premium access) ===
local function CreateMenuToggle(tab, name, default, callback)
    if basicMenus[name] or (premiumMenus[name] and accessLevel == "premium") then
        tab:CreateToggle({
            Name = name,
            CurrentValue = default,
            Callback = callback
        })
    else
        tab:CreateLabel("🔒 "..name)
    end
end

local function CreateMenuButton(tab, name, callback)
    if basicMenus[name] or (premiumMenus[name] and accessLevel == "premium") then
        tab:CreateButton({ Name = name, Callback = callback })
    else
        tab:CreateLabel("🔒 "..name)
    end
end

local function CreateMenuInput(tab, name, placeholder, callback)
    if basicMenus[name] or (premiumMenus[name] and accessLevel == "premium") then
        tab:CreateInput({
            Name = name,
            PlaceholderText = placeholder,
            RemoveTextAfterFocusLost = true,
            Callback = callback
        })
    else
        tab:CreateLabel("🔒 "..name)
    end
end

local function CreateMenuSlider(tab, name, range, increment, default, suffix, callback)
    if basicMenus[name] or (premiumMenus[name] and accessLevel == "premium") then
        tab:CreateSlider({
            Name = name,
            Range = range,
            Increment = increment,
            CurrentValue = default,
            Suffix = suffix,
            Callback = callback
        })
    else
        tab:CreateLabel("🔒 "..name)
    end
end

-- === Positions & data (from your original script) ===
-- Antartika
local positions = {
    Vector3.new(-3719, 225, 234),
    Vector3.new(1790, 105, -138),
    Vector3.new(5892, 321, -20),
    Vector3.new(8992, 596, 103),
    Vector3.new(11002, 549, 128),
}
local refillMap = {
    [1] = "WaterRefill_Camp1",
    [2] = "WaterRefill_Camp2",
    [3] = "WaterRefill_Camp3",
    [4] = "WaterRefill_Camp4",
}

-- Ravika
local TeleportsRavika = {
    Vector3.new(-785, 87, -652),
    Vector3.new(-986, 184, -79),
    Vector3.new(-955, 178, 807),
    Vector3.new(796, 186, 876),
    Vector3.new(971, 98, 136),
    Vector3.new(982, 144, -535),
    Vector3.new(401, 122, -230),
    Vector3.new(3, 435, 95), -- SUMMIT
}

-- Atin
local ATIN_SUMMIT = {
    Vector3.new(625, 1799, 3433),
    Vector3.new(777, 2184, 3934)
}

-- Sibuatan
local SIBUATAN_SUMMIT = Vector3.new(5394, 8109, 2207)

-- Sibayak
local TeleportsSibayak = {
    Vector3.new(-3348, 59, -4741),
    Vector3.new(-2163, 241, -4849),
    Vector3.new(-1994, 496, -4824),
    Vector3.new(-1584, 578, -4579),
    Vector3.new(-1521, 555, -5000),
    Vector3.new(-801, 545, -5374),
    Vector3.new(319, 856, -4444),
    Vector3.new(1091, 987, -5308),
    Vector3.new(1576, 1279, -5595), -- Summit
}
local FallPos = Vector3.new(1637, 1412, -5588)

-- Lauser
local TeleportsLauser = {
    Vector3.new(992, 207, 1042),
    Vector3.new(57, 397, 732),
    Vector3.new(421, 873, 195),
    Vector3.new(400, 1094, -127),
    Vector3.new(512, 1251, -779),
    Vector3.new(871, 1144, -1003), -- Summit
}
local FallPosLauser = Vector3.new(900, 1300, -1000)

-- Ckptw

local CkptwPositions = {
    Vector3.new(388, 309, -186),
    Vector3.new(101, 411, 617),
    Vector3.new(11, 600, 998),
    Vector3.new(873, 864, 581),
    Vector3.new(1618, 1079, 158),
    Vector3.new(2970, 1527, 709),
    Vector3.new(1802, 1981, 2159),
}

-- Daun
local DaunPositions = {
    Vector3.new(-622, 250, -384),
    Vector3.new(-1203, 261, -487),
    Vector3.new(-1399, 578, -950),
    Vector3.new(-1701, 816, -1400),
    Vector3.new(-3209, 1721, -2608),
}

-- Lawak
local LawakPositions = {
    Vector3.new(-251, 30, 18),
    Vector3.new(-191, 177, 247),
    Vector3.new(285, 321, -190),
    Vector3.new(409, 406, 161),
    Vector3.new(450, 391, -69),
    Vector3.new(530, 568, -314),
    Vector3.new(1441, 1129, -1300),
    Vector3.new(1794, 1478, -1961),
    Vector3.new(2872, 2625, -1882),
}
local LawakEnd = Vector3.new(2870, 2626, -1819)

-- Misc initial values
local _G = _G
_G.FyyInfJump = false
_G.FyyNoclip = false
_G.FyyESP = false

-- === Loop flags & other state ===
local running = false
local currentPos = 1
local lastDrink = tick()
local lastRefill = tick()
local ravikaLoop = false
local atinLoop = false
local sibuatanLoop = false
local SibayakLoop = false
local LauserLoop = false
local XYZLoop = false
local DaunLoop = false
local LawakLoop = false
local CkptwLoop = false


local savedPosition = nil
local posGUI = nil

-- === Helper functions (teleport, waitForHRP, countdown, steploop, autodrink, etc) ===
local function waitForHRP(character, timeout)
    timeout = timeout or 5
    local t0 = tick()
    while tick() - t0 < timeout do
        if character and character:FindFirstChild("HumanoidRootPart") then
            return character:FindFirstChild("HumanoidRootPart")
        end
        task.wait(0.1)
    end
    return nil
end

local function TeleportTo(pos)
    -- safe teleport: buat part sementara supaya player gak jatuh
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if typeof(pos) == "Vector3" then
        local tempPart = Instance.new("Part")
        tempPart.Anchored = true
        tempPart.CanCollide = true
        tempPart.Transparency = 1
        tempPart.Size = Vector3.new(10,1,10)
        tempPart.CFrame = CFrame.new(pos)
        tempPart.Parent = Workspace
        hrp.CFrame = CFrame.new(pos + Vector3.new(0,5,0))
        task.wait(1.2)
        if tempPart and tempPart.Parent then tempPart:Destroy() end
    elseif typeof(pos) == "CFrame" then
        hrp.CFrame = pos
    end
end

local function showCountdown(sec, title)
    title = title or "Auto Summit"
    for i = sec,1,-1 do
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = title,
                Text = "Teleport dalam " .. i .. " detik",
                Duration = 1,
            })
        end)
        task.wait(1)
    end
end

local function StepLoop(times, stopFlag)
    local character = player.Character
    if not character then return end
    local hrp = waitForHRP(character, 5)
    if not hrp then return end
    for i = 1, times do
        if not stopFlag() then break end
        local forward = hrp.CFrame * CFrame.new(0, 0, -10)
        TweenService:Create(hrp, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = forward}):Play()
        task.wait(1.2)
        if not stopFlag() then break end
        task.wait(3)
        local back = hrp.CFrame * CFrame.new(0, 0, 10)
        TweenService:Create(hrp, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = back}):Play()
        task.wait(1.2)
        if not stopFlag() then break end
        task.wait(3)
    end
end

local function AutoDrink()
    -- trigger klik untuk minum (jika tersedia)
    pcall(function()
        local vu = game:GetService("VirtualUser")
        vu:ClickButton1(Vector2.new(0,0))
    end)
    -- additional attempt: if drink is remote
    pcall(function()
        local data = player:FindFirstChild("Expedition Data")
        if data then
            local hum = player.Character and player.Character:FindFirstChild("Humanoid")
            if hum and hum:FindFirstChild("Drink") then
                pcall(function() hum.Drink:Invoke() end)
            end
        end
    end)
end

-- RunSummit (Antartika) — adapted from original script
local function RunSummit()
    local data = player:WaitForChild("Expedition Data", 10)
    if not data then
        warn("Expedition Data not found")
    end
    local coins = data and data:FindFirstChild("Coins")
    local lastCoin = coins and coins.Value or 0

    -- teleport to starting pos
    TeleportTo(positions[currentPos])

    while running do
        local now = tick()

        -- auto minum setiap 30 detik
        if now - lastDrink >= 30 then
            AutoDrink()
            lastDrink = now
        end

        -- auto refill setiap 3 menit
        if now - lastRefill >= 180 then
            local refillFolder = Workspace:FindFirstChild("Locally_Imported_Parts")
            if refillFolder then
                local targetRefillName = refillMap[currentPos]
                if targetRefillName and refillFolder:FindFirstChild(targetRefillName) then
                    local prevPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
                    -- teleport ke refill
                    TeleportTo(refillFolder[targetRefillName].Position)
                    task.wait(0.5)
                    -- mundur 5 langkah → maju 5 langkah untuk trigger refill
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-5)
                        task.wait(0.5)
                        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                        task.wait(0.5)
                    end
                    -- kembali ke posisi semula
                    if prevPos then TeleportTo(prevPos) end
                end
            end
            lastRefill = now
        end

        -- cek coin
        if coins and coins.Value > lastCoin then
            lastCoin = coins.Value
            if currentPos >= #positions then
                TeleportTo(Vector3.new(10952, 313, 122))
                pcall(function() if player.Character then player.Character:BreakJoints() end end)
                -- tunggu respawn
                player.CharacterAdded:Wait()
                task.wait(1)
                currentPos = 1
                TeleportTo(positions[currentPos])
            else
                currentPos = currentPos + 1
                TeleportTo(positions[currentPos])
            end
        end

        -- pola maju-mundur (adapted)
        local charHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if charHRP then
            charHRP.CFrame = charHRP.CFrame * CFrame.new(0,0,10)
            task.wait(5)
            TeleportTo(positions[currentPos])
            task.wait(5)
            charHRP.CFrame = charHRP.CFrame * CFrame.new(0,0,10)
            task.wait(5)
            TeleportTo(positions[currentPos])
            task.wait(5)
        else
            task.wait(1)
        end
    end
end

-- === Other helpers used by toggles already in original script ===

local function showCountdownAtin(sec) showCountdown(sec, "MT Atin") end
local function showCountdownSibuatan(sec) showCountdown(sec, "MT Sibuatan") end

-- === FullBright manager variables ===
local FullBrightEnabled = false
local FullBrightLoopConn = nil
local currentBrightness = 2
local savedLighting = nil

-- === Freeze (Time Stop) vars ===
local FreezeToggle = false
local OriginalStates = {}
local FreezeDistance = 100

-- === ESP helper that adds Highlight & Billboards ===
local function enableESPForPlayer(plr)
    local char = plr.Character
    if not char then return end
    if not char:FindFirstChild("FyyESP") then
        local hl = Instance.new("Highlight")
        hl.Name = "FyyESP"
        hl.FillColor = Color3.fromRGB(255,0,0)
        hl.OutlineColor = Color3.fromRGB(255,255,255)
        hl.FillTransparency = 0.5
        hl.Parent = char
    end
    if not char:FindFirstChild("FyyNameBill") and char:FindFirstChild("Head") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "FyyNameBill"
        billboard.Size = UDim2.new(0,100,0,20)
        billboard.StudsOffset = Vector3.new(0,3,0)
        billboard.AlwaysOnTop = true
        local tl = Instance.new("TextLabel", billboard)
        tl.Size = UDim2.new(1,0,1,0)
        tl.BackgroundTransparency = 1
        tl.Text = plr.Name
        tl.TextColor3 = Color3.new(1,1,1)
        tl.TextTransparency = 0.3
        tl.TextScaled = true
        billboard.Parent = char:FindFirstChild("Head")
    end
end

-- Keep freeze loop running in background
task.spawn(function()
    while task.wait(0.3) do
        if FreezeToggle and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local charPos = player.Character.HumanoidRootPart.Position
            local nearbyParts = workspace:GetPartBoundsInRadius(charPos, FreezeDistance)
            local stillNear = {}
            for _, part in ipairs(nearbyParts) do
                if part and part:IsA("BasePart") then
                    local model = part:FindFirstAncestorOfClass("Model")
                    if model and Players:GetPlayerFromCharacter(model) then
                        -- skip player characters
                    else
                        stillNear[part] = true
                        if OriginalStates[part] == nil then OriginalStates[part] = part.Anchored end
                        pcall(function()
                            part.Anchored = true
                            part.Velocity = Vector3.zero
                            part.RotVelocity = Vector3.zero
                        end)
                    end
                end
            end
            for part, anchoredState in pairs(OriginalStates) do
                if not stillNear[part] then
                    if part and part.Parent then pcall(function() part.Anchored = anchoredState end) end
                    OriginalStates[part] = nil
                end
            end
        end
    end
end)

-- ESP players handler when new player joins
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        if _G.FyyESP then
            task.wait(0.5)
            pcall(enableESPForPlayer, plr)
        end
    end)
end)

-- Noclip running on stepped
RunService.Stepped:Connect(function()
    if _G.FyyNoclip then
        local char = player.Character
        if char then
            for _, v in ipairs(char:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end
end)

-- FullBright handler: toggle and slider will control these variables below in UI section

-- === UI Creation: Tabs + All menu callbacks (full logic) ===

-- Tab: Auto Summit
local mountTab = Window:CreateTab("Auto Summit🔥", 4483362458)
mountTab:CreateSection("Auto Summit")

-- Expedition Antartika toggle (uses RunSummit)
CreateMenuToggle(mountTab, "Expedition Antartika⚡", false, function(Value)
    running = Value
    if Value then task.spawn(RunSummit) end
end)

-- MT Ravika
CreateMenuToggle(mountTab, "MT Ravika", false, function(Value)
    ravikaLoop = Value
    task.spawn(function()
        while ravikaLoop do
            if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                player.CharacterAdded:Wait()
                task.wait(1)
            end
            for _, pos in ipairs(TeleportsRavika) do
                if not ravikaLoop then break end
                TeleportTo(pos)
                task.wait(1)
            end
            if ravikaLoop and player.Character then
                pcall(function() player.Character:BreakJoints() end)
                player.CharacterAdded:Wait()
                hrp = player.Character:WaitForChild("HumanoidRootPart")
                task.wait(2)
            end
        end
    end)
end)

---------- ATIN

local AtinToggle = mountTab:CreateToggle({
    Name = "MT Atin",
    CurrentValue = false,
    Flag = "mt_atin_flag", -- <--- flag untuk save config
    Callback = function(Value)
        atinLoop = Value
        task.spawn(function()
            while atinLoop do
                -- Hitungan mundur sekali di awal
                showCountdown(5, "MT Atin")

                -- Teleport ke posisi 1
                TeleportTo(ATIN_SUMMIT[1])
                task.wait(5)

                if not atinLoop then break end

                -- Teleport ke posisi 2
                TeleportTo(ATIN_SUMMIT[2])
                task.wait(5)

                if not atinLoop then break end

                -- Rejoin server
                TeleportService:Teleport(game.PlaceId, player)
                task.wait(15)
            end
        end)
    end
})




-- MT Sibuatan
local SibuatanToggle = mountTab:CreateToggle({
    Name = "MT Sibuatan",
    CurrentValue = false,
    Flag = "mt_sibuatan_flag", -- <--- flag untuk save config
    Callback = function(Value)
        sibuatanLoop = Value
        task.spawn(function()
            while sibuatanLoop do
                showCountdown(10, "MT Sibuatan")
                TeleportTo(SIBUATAN_SUMMIT)
                task.wait(2)
                TeleportService:Teleport(game.PlaceId, player)
                task.wait(15)
            end
        end)
    end
})


-- MT Sibayak
CreateMenuToggle(mountTab, "MT Sibayak", false, function(Value)
    SibayakLoop = Value
    if SibayakLoop then
        task.spawn(function()
            while SibayakLoop do
                for i, pos in ipairs(TeleportsSibayak) do
                    if not SibayakLoop then break end
                    local character = player.Character or player.CharacterAdded:Wait()
                    local hrp = waitForHRP(character, 5)
                    if not hrp then break end
                    hrp.CFrame = CFrame.new(pos)
                    task.wait(0.5)
                    StepLoop(3, function() return SibayakLoop end)
                    if i == #TeleportsSibayak and SibayakLoop then
                        hrp.CFrame = CFrame.new(FallPos.X, FallPos.Y + 300, FallPos.Z)
                        player.CharacterAdded:Wait()
                        task.wait(1)
                    end
                end
            end
        end)
    end
end)

-- MT Lauser
CreateMenuToggle(mountTab, "MT Lauser", false, function(Value)
    LauserLoop = Value
    if LauserLoop then
        task.spawn(function()
            while LauserLoop do
                for i, pos in ipairs(TeleportsLauser) do
                    if not LauserLoop then break end
                    local character = player.Character or player.CharacterAdded:Wait()
                    local hrp = waitForHRP(character, 5)
                    if not hrp then break end
                    hrp.CFrame = CFrame.new(pos)
                    task.wait(0.5)
                    StepLoop(3, function() return LauserLoop end)
                    if i == #TeleportsLauser and LauserLoop then
                        hrp.CFrame = CFrame.new(FallPosLauser.X, FallPosLauser.Y + 300, FallPosLauser.Z)
                        player.CharacterAdded:Wait()
                        task.wait(1)
                    end
                end
            end
        end)
    end
end)

-- MT Yhahyuk
local player = game.Players.LocalPlayer

-- Fungsi bikin Timer GUI ala Arunika
local function createTimerGui()
    local existing = player.PlayerGui:FindFirstChild("ArunikaTimerGui")
    if existing then existing:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ArunikaTimerGui"
    screenGui.Parent = player.PlayerGui

    local timerLabel = Instance.new("TextLabel")
    timerLabel.Size = UDim2.new(0, 200, 0, 40)
    timerLabel.Position = UDim2.new(0.5, 0, 0.12, 0)
    timerLabel.AnchorPoint = Vector2.new(0.5, 0)
    timerLabel.BackgroundTransparency = 1
    timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    timerLabel.Font = Enum.Font.GothamBold
    timerLabel.TextScaled = true
    timerLabel.Visible = false
    timerLabel.TextStrokeTransparency = 0
    timerLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    timerLabel.Parent = screenGui

    return timerLabel
end

-- Fungsi timer blocking
local function showTimer(seconds, label)
    local TimerLabel = createTimerGui()
    TimerLabel.Visible = true
    for i = seconds,1,-1 do
        TimerLabel.Text = label .. "\nTunggu: " .. i
        task.wait(1)
    end
    TimerLabel.Visible = false
end

-- Fungsi HRP checker
local function waitForHRP(char, timeout)
    local t = 0
    repeat
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp end
        task.wait(0.1)
        t = t + 0.1
    until t >= timeout
    return nil
end

-- Daftar checkpoint
local XYZPositions = {
    Vector3.new(-430, 249, 789),
    Vector3.new(-348, 388, 524),
    Vector3.new(288, 429, 504),
    Vector3.new(334, 490, 348),
    Vector3.new(223, 314, -147),
    Vector3.new(-602, 905, -515),
}

local XYZLoop = false

-- Toggle MT Yhahyuk
CreateMenuToggle(mountTab, "MT Yhahyuk", false, function(Value)
    XYZLoop = Value
    if not Value then return end

    task.spawn(function()
        while XYZLoop do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = waitForHRP(character, 5)
            if not hrp then warn("HRP tidak ditemukan"); break end

            for i, pos in ipairs(XYZPositions) do
                if not XYZLoop then break end

                character = player.Character or player.CharacterAdded:Wait()
                hrp = waitForHRP(character, 5)
                if not hrp then warn("HRP hilang di CP " .. i); break end

                hrp.CFrame = CFrame.new(pos)

                local delayTime = 3
                local label = "CP " .. i
                if i == 5 then
                    delayTime = math.random(50, 60)
                    label = label .. " (Random 50-60)"
                elseif i == 6 then
                    label = "Summit"
                end

                showTimer(delayTime, label)
            end

            -- Respawn karakter
            if XYZLoop and player.Character then
                local oldChar = player.Character
                pcall(function() oldChar:BreakJoints() end)

                -- Tunggu karakter baru spawn
                repeat task.wait(0.1) until player.Character ~= oldChar and player.Character:FindFirstChild("HumanoidRootPart")

                -- Tampilkan timer respawn
                showTimer(2, "Respawn")
            end
        end
    end)
end)



-- MT Daun
-- GUI Timer (sekali buat, bisa dipakai global)
local function setupTimerGui()
    local coreGui = game:GetService("CoreGui")
    local existing = coreGui:FindFirstChild("DaunTimerGui")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DaunTimerGui"
    ScreenGui.Parent = coreGui

    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Parent = ScreenGui
    TimerLabel.AnchorPoint = Vector2.new(0.5, 0)
    TimerLabel.Size = UDim2.new(0, 240, 0, 60)
    TimerLabel.Position = UDim2.new(0.5, 0, 0, 50)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimerLabel.Font = Enum.Font.SourceSansBold
    TimerLabel.TextScaled = true
    TimerLabel.Visible = false

    local stroke = Instance.new("UIStroke")
    stroke.Parent = TimerLabel
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0,0,0)

    return TimerLabel
end

local TimerLabel = setupTimerGui()

-- Fungsi countdown GUI
local function showTimer(seconds, label)
    TimerLabel.Visible = true
    for i = seconds, 1, -1 do
        if not DaunLoop then break end
        TimerLabel.Text = label .. "\nTunggu: " .. i .. " detik"
        task.wait(1)
    end
    TimerLabel.Visible = false
end

-- Fungsi HRP checker
local function waitForHRP(char, timeout)
    local t = 0
    repeat
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp end
        task.wait(0.1)
        t = t + 0.1
    until t >= timeout
    return nil
end

-- === TOGGLE ===
CreateMenuToggle(mountTab, "MT Daun", false, function(Value)
    DaunLoop = Value
    if not Value then return end
    task.spawn(function()
        while DaunLoop do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = waitForHRP(character, 5)
            if not hrp then break end
            task.wait(0.5)

            for i, pos in ipairs(DaunPositions) do
                if not DaunLoop then break end
                if hrp and hrp.Parent then
                    hrp.CFrame = CFrame.new(pos)

                    -- logika delay pakai GUI timer
                    if i == #DaunPositions then
                        -- CP terakhir
                        showTimer(2, "CP " .. i .. " (Terakhir)")
                    elseif i == 3 then
                        local delay = math.random(90, 120)
                        showTimer(delay, "CP " .. i .. " (Random)")
                    elseif i == 4 then
                        local delay = math.random(90, 120)
                        showTimer(delay, "CP " .. i .. " (Random)")
                    else
                        showTimer(60, "CP " .. i)
                    end
                end
            end

            -- selesai → respawn & loop lagi
            if DaunLoop and player.Character then
                local char = player.Character
                pcall(function() player.Character:BreakJoints() end)
                repeat task.wait(0.1) until player.Character ~= char and player.Character:FindFirstChild("HumanoidRootPart")
                task.wait(0.5)
            end
        end
    end)
end)



-- MT Lawak
CreateMenuToggle(mountTab, "MT Lawak", false, function(Value)
    LawakLoop = Value
    if not Value then return end
    task.spawn(function()
        while LawakLoop do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = waitForHRP(character, 5)
            local humanoid = character:FindFirstChild("Humanoid")
            if not hrp or not humanoid then break end
            task.wait(0.5)
            for i, pos in ipairs(LawakPositions) do
                if not LawakLoop then break end
                if hrp and hrp.Parent and humanoid then
                    hrp.CFrame = CFrame.new(pos)
                    if i == #LawakPositions then
                        task.wait(2)
                        local backward = -hrp.CFrame.LookVector * 30
                        humanoid:MoveTo(hrp.Position + backward)
                        humanoid.MoveToFinished:Wait()
                        task.wait(1)
                        hrp.CFrame = CFrame.new(LawakEnd)
                        task.wait(5)
                    else
                        task.wait(2)
                    end
                end
            end
        end
    end)
end)

------- MT CKPTW

-- === SETUP GUI TIMER ===
local function setupTimerGui()
    local coreGui = game:GetService("CoreGui")
    local existing = coreGui:FindFirstChild("CkptwTimerGui")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CkptwTimerGui"
    ScreenGui.Parent = coreGui

    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Parent = ScreenGui
    TimerLabel.AnchorPoint = Vector2.new(0.5, 0)
    TimerLabel.Size = UDim2.new(0, 240, 0, 60)
    TimerLabel.Position = UDim2.new(0.5, 0, 0, 50)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimerLabel.Font = Enum.Font.SourceSansBold
    TimerLabel.TextScaled = true
    TimerLabel.Visible = false

    local stroke = Instance.new("UIStroke")
    stroke.Parent = TimerLabel
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0,0,0)

    return TimerLabel
end

local TimerLabel = setupTimerGui()

-- Fungsi countdown GUI
local function showTimer(seconds, label)
    TimerLabel.Visible = true
    for i = seconds, 1, -1 do
        if not CkptwLoop then break end
        TimerLabel.Text = label .. "\nTunggu: " .. i .. " detik"
        task.wait(1)
    end
    TimerLabel.Visible = false
end

-- Fungsi HRP checker
local function waitForHRP(char, timeout)
    local t = 0
    repeat
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp end
        task.wait(0.1)
        t = t + 0.1
    until t >= timeout
    return nil
end

-- === TOGGLE ===
CreateMenuToggle(mountTab, "MT Ckptw", false, function(Value)
    CkptwLoop = Value
    if not Value then return end

    task.spawn(function()
        while CkptwLoop do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = waitForHRP(character, 5)
            if not hrp then break end
            task.wait(0.5)

            for i, pos in ipairs(CkptwPositions) do
                if not CkptwLoop then break end
                hrp.CFrame = CFrame.new(pos)

                -- delay antar checkpoint dengan GUI Timer
                if i == #CkptwPositions then
                    showTimer(3, "CP " .. i .. " (Terakhir)")
                else
                    showTimer(30, "CP " .. i)
                end
            end

            -- respawn karakter setelah checkpoint terakhir
            if CkptwLoop and player.Character then
                local oldChar = player.Character
                pcall(function() player.Character:BreakJoints() end)
                
                -- tunggu karakter baru spawn
                repeat task.wait(0.1) until player.Character ~= oldChar and player.Character:FindFirstChild("HumanoidRootPart")
                
                showTimer(2, "Respawn") -- ganti delay respawn jadi GUI Timer juga
            end
        end
    end)
end)




-- === Tab: MT Arunika (Teleport buttons) ===
local player = game.Players.LocalPlayer
local mountTab = mountTab
local MTArunikaLoop = false

-- Setup Timer GUI
local function setupTimerGui()
    local coreGui = game:GetService("CoreGui")
    local existing = coreGui:FindFirstChild("CkptwTimerGui")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CkptwTimerGui"
    ScreenGui.Parent = coreGui

    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Parent = ScreenGui
    TimerLabel.AnchorPoint = Vector2.new(0.5, 0)
    TimerLabel.Size = UDim2.new(0, 240, 0, 60)
    TimerLabel.Position = UDim2.new(0.5, 0, 0, 50)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimerLabel.Font = Enum.Font.SourceSansBold
    TimerLabel.TextScaled = true
    TimerLabel.Visible = false

    local stroke = Instance.new("UIStroke")
    stroke.Parent = TimerLabel
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0,0,0)

    return TimerLabel
end

local TimerLabel = setupTimerGui()

-- Countdown GUI
local function showTimer(seconds, label)
    TimerLabel.Visible = true
    for i = seconds,1,-1 do
        if not MTArunikaLoop then break end
        TimerLabel.Text = label .. "\nTunggu: " .. i .. " detik"
        task.wait(1)
    end
    TimerLabel.Visible = false
end

-- HRP checker
local function waitForHRP(char, timeout)
    local t = 0
    repeat
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp end
        task.wait(0.1)
        t = t + 0.1
    until t >= timeout
    return nil
end

-- Toggle MT Arunika
local player = game.Players.LocalPlayer
local mountTab = mountTab
local MTArunikaLoop = false

-- Setup Timer GUI
local function setupTimerGui()
    local coreGui = game:GetService("CoreGui")
    local existing = coreGui:FindFirstChild("CkptwTimerGui")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CkptwTimerGui"
    ScreenGui.Parent = coreGui

    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Parent = ScreenGui
    TimerLabel.AnchorPoint = Vector2.new(0.5, 0)
    TimerLabel.Size = UDim2.new(0, 240, 0, 60)
    TimerLabel.Position = UDim2.new(0.5, 0, 0, 50)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimerLabel.Font = Enum.Font.SourceSansBold
    TimerLabel.TextScaled = true
    TimerLabel.Visible = false

    local stroke = Instance.new("UIStroke")
    stroke.Parent = TimerLabel
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0,0,0)

    return TimerLabel
end

local TimerLabel = setupTimerGui()

-- Countdown GUI
local function showTimer(seconds, label)
    TimerLabel.Visible = true
    for i = seconds,1,-1 do
        if not MTArunikaLoop then break end
        TimerLabel.Text = label .. "\nTunggu: " .. i .. " detik"
        task.wait(1)
    end
    TimerLabel.Visible = false
end

-- HRP checker
local function waitForHRP(char, timeout)
    local t = 0
    repeat
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp end
        task.wait(0.1)
        t = t + 0.1
    until t >= timeout
    return nil
end

-- Toggle MT Arunika
CreateMenuToggle(mountTab, "MT Arunika", false, function(Value)
    MTArunikaLoop = Value
    if not Value then return end

    task.spawn(function()
        while MTArunikaLoop do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = waitForHRP(character, 5)
            if not hrp then break end
            task.wait(5)

            -- CP1
            hrp.CFrame = CFrame.new(136,142,-175)
            showTimer(3, "CP 1")

            -- CP2
            hrp.CFrame = CFrame.new(326,90,-434)
            showTimer(4, "CP 2")

            -- CP3
            hrp.CFrame = CFrame.new(477,170,-940)
            showTimer(5, "CP 3")

            -- CP4
            hrp.CFrame = CFrame.new(930,133,-626)
            showTimer(6, "CP 4")
            -- CP tambahan setelah delay
            hrp.CFrame = CFrame.new(-18,5,-422)
            showTimer(150, "NGUMPET CIK")

            -- CP5
            hrp.CFrame = CFrame.new(924,101,279)
            showTimer(2, "CP 5")
            -- CP tambahan setelah delay
            hrp.CFrame = CFrame.new(-18,5,-422)
            showTimer(150, "NGUMPET CIK MAU SUMMIT")

            -- Summit
            hrp.CFrame = CFrame.new(257, 325, 708)
            showTimer(3, "Summit (Terakhir)")

            -- Respawn
            if player.Character then
                player.Character:BreakJoints()
                repeat task.wait(0.1) until player.Character ~= character and player.Character:FindFirstChild("HumanoidRootPart")
                task.wait(2)
            end
        end
    end)
end)


------------

-- Bikin Tab Baru
local arunikaTab = Window:CreateTab("Auto Walk Mount", 4483362458)

-- Optional: Section di dalam Tab
arunikaTab:CreateSection("Auto Script")

-- Bikin Button di dalam Tab Arunika V2
-- Variable lock per button
-- Variable lock per button
local RunArunikaButtonEnabled = true

CreateMenuButton(arunikaTab, "Auto Walk Arunika V2", function()
   
            Title = "Run Auto Arunika",
            Content = "⚠️ Hanya Premium yang bisa menjalankan fitur ini!",
            Duration = 4
        })
        return
    end

    -- Lock button jika sudah dijalankan
    if not RunArunikaButtonEnabled then
        Rayfield:Notify({
            Title = "Run Auto Arunika",
            Content = "⚠️ Fitur ini sudah dijalankan / dikunci!",
            Duration = 4
        })
        return
    end

    -- Jalankan script
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lovllo/howtoforgetyou/main/nka.lua"))()

    -- Notif sukses
    Rayfield:Notify({
        Title = "Run Auto Arunika",
        Content = "✅ Script berhasil dijalankan!",
        Duration = 4
    })

    -- Lock button supaya tidak bisa dijalankan lagi
    RunArunikaButtonEnabled = false
end)


-- === Tab: Misc ===
local miscTab = Window:CreateTab("Misc", 4483362458)
miscTab:CreateSection("Movement & Misc")

-- WalkSpeed
local previousWalk = 16
local FyyWalkValue = 20
CreateMenuInput(miscTab, "WalkSpeed Value", "20 enak", function(Text)
    local num = tonumber(Text)
    if num and num > 0 then
        FyyWalkValue = num
        if _G.FyyWalkEnabled then
            local hum = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
            if hum then pcall(function() hum.WalkSpeed = FyyWalkValue end) end
        end
    end
end)

-- WalkSpeed Toggle dengan Flag
local WalkSpeedToggle = miscTab:CreateToggle({
    Name = "WalkSpeed Toggle",
    CurrentValue = false,
    Flag = "walkspeed_flag",
    Callback = function(Value)
        _G.FyyWalkEnabled = Value
        local hum = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
        if hum then
            if Value then
                previousWalk = hum.WalkSpeed or 16
                pcall(function() hum.WalkSpeed = FyyWalkValue end)
            else
                pcall(function() hum.WalkSpeed = previousWalk end)
            end
        end
    end
})

-- Infinity Jump Toggle dengan Flag
local UIS = game:GetService("UserInputService")
local infJumpConn
local InfinityJumpToggle = miscTab:CreateToggle({
    Name = "Infinity Jump",
    CurrentValue = false,
    Flag = "infinityjump_flag",
    Callback = function(Value)
        _G.FyyInfJump = Value

        if Value then
            if not infJumpConn then
                infJumpConn = UIS.JumpRequest:Connect(function()
                    if _G.FyyInfJump then
                        local char = player.Character
                        local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
                        if humanoid then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end
                end)
            end
        else
            if infJumpConn then
                infJumpConn:Disconnect()
                infJumpConn = nil
            end
        end
    end
})

-- Noclip Toggle dengan Flag
local NoclipToggle = miscTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "noclip_flag",
    Callback = function(Value)
        _G.FyyNoclip = Value
    end
})


CreateMenuToggle(miscTab, "ESP Players (bug)", false, function(Value)
    _G.FyyESP = Value
    if Value then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then pcall(enableESPForPlayer, plr) end
        end
    else
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Character then
                local hl = plr.Character:FindFirstChild("FyyESP"); if hl then hl:Destroy() end
                local bb = plr.Character:FindFirstChild("FyyNameBill"); if bb then bb:Destroy() end
            end
        end
    end
end)

local FreezeToggle = miscTab:CreateToggle({
    Name = "Freeze Object (Time Stop)",
    CurrentValue = false,
    Flag = "freeze_object_flag", -- <--- ini flag untuk save config
    Callback = function(Value)
        FreezeToggle = Value
        if not Value then
            for part, anchoredState in pairs(OriginalStates) do
                if part and part.Parent then
                    pcall(function() part.Anchored = anchoredState end)
                end
            end
            OriginalStates = {}
        end
    end
})

local FreezeSlider = miscTab:CreateSlider({
    Name = "Freeze Radius",
    Range = {0,500},
    Increment = 10,
    CurrentValue = FreezeDistance,
    Suffix = "Studs",
    Callback = function(Value)
        FreezeDistance = Value
    end
})


-- === Tab: Tools ===
local toolsTab = Window:CreateTab("Tools", 4483362458)
toolsTab:CreateSection("Utility Tools")

CreateMenuButton(toolsTab, "Teleport Tool", function()
    local backpack = player:WaitForChild("Backpack")
    for _, v in ipairs(backpack:GetChildren()) do if v:IsA("Tool") and v.Name == "Click Teleport" then v:Destroy() end end
    if player.Character then for _, v in ipairs(player.Character:GetChildren()) do if v:IsA("Tool") and v.Name == "Click Teleport" then v:Destroy() end end end
    local tool = Instance.new("Tool")
    tool.Name = "Click Teleport"
    tool.RequiresHandle = false
    tool.CanBeDropped = false
    tool.Parent = backpack
    tool.Equipped:Connect(function(mouse)
        local m = mouse or player:GetMouse()
        local activatedConn
        activatedConn = tool.Activated:Connect(function()
            TeleportTo(m.Hit.p + Vector3.new(0,3,0))
        end)
        tool.Unequipped:Connect(function()
            if activatedConn then activatedConn:Disconnect() end
        end)
    end)
end)

CreateMenuButton(toolsTab, "Respawn", function()
    pcall(function() if player.Character then player.Character:BreakJoints() end end)
end)

CreateMenuButton(toolsTab, "Rejoin", function()
    TeleportService:Teleport(game.PlaceId, player)
end)

CreateMenuToggle(toolsTab, "Full Bright Loop", false, function(Value)
    FullBrightEnabled = Value
    if Value then
        if not savedLighting then
            savedLighting = {
                Brightness = Lighting.Brightness,
                ClockTime = Lighting.ClockTime,
                FogEnd = Lighting.FogEnd,
                GlobalShadows = Lighting.GlobalShadows,
                OutdoorAmbient = Lighting.OutdoorAmbient
            }
        end
        if not FullBrightLoopConn then
            FullBrightLoopConn = RunService.RenderStepped:Connect(function()
                Lighting.Brightness = currentBrightness
                Lighting.ClockTime = 12
                Lighting.FogEnd = 1e6
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.new(1,1,1)
            end)
        end
    else
        if FullBrightLoopConn then FullBrightLoopConn:Disconnect(); FullBrightLoopConn = nil end
        if savedLighting then
            Lighting.Brightness = savedLighting.Brightness
            Lighting.ClockTime = savedLighting.ClockTime
            Lighting.FogEnd = savedLighting.FogEnd
            Lighting.GlobalShadows = savedLighting.GlobalShadows
            Lighting.OutdoorAmbient = savedLighting.OutdoorAmbient
            savedLighting = nil
        end
    end
end)

CreateMenuSlider(toolsTab, "Adjust Brightness", {0,10}, 0.2, currentBrightness, "", function(Value)
    currentBrightness = Value
    if FullBrightEnabled then Lighting.Brightness = currentBrightness end
end)

CreateMenuToggle(toolsTab, "SavePos And BackPos", false, function(Value)
    if Value then
        if posGUI then posGUI:Destroy(); posGUI = nil end
        posGUI = Instance.new("ScreenGui")
        posGUI.Name = "PosGui"
        posGUI.ResetOnSpawn = false
        posGUI.Parent = player:WaitForChild("PlayerGui")
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0,220,0,100)
        frame.Position = UDim2.new(0,50,0,50)
        frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
        frame.BorderSizePixel = 0
        frame.Parent = posGUI
        local function createButton(name, callback, yOffset)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0,200,0,30)
            btn.Position = UDim2.new(0,10,0,yOffset)
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Text = name
            btn.Parent = frame
            btn.MouseButton1Click:Connect(callback)
        end
        createButton("Save Pos", function()
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                savedPosition = player.Character.HumanoidRootPart.Position
                Rayfield:Notify({Title="SavePos", Content="Posisi tersimpan", Duration = 2})
            end
        end, 10)
        createButton("Go to Pos", function()
            if savedPosition and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(savedPosition)
            else
                Rayfield:Notify({Title="SavePos", Content="Posisi belum disimpan", Duration = 2})
            end
        end, 50)
    else
        if posGUI then posGUI:Destroy(); posGUI = nil end
    end
end)

CreateMenuToggle(toolsTab, "Fix Lag", false, function(Value)
    if Value then
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Part") or obj:IsA("MeshPart") then
                local ok, mass = pcall(function() return obj:GetMass() end)
                if ok and mass and mass > 50 then pcall(function() obj:Destroy() end) end
            end
        end
    end
end)

CreateMenuButton(miscTab, "Fly", function()
    end)

-- === Done ===
Rayfield:Notify({Title="Voks Exploit", Content="Loaded. Tekan K untuk buka UI.", Duration=3})

-------------------

-- === MT Batu Toggle ===
local BatuPositions = {
    Vector3.new(-122, 9, 544),
    Vector3.new(-40, 393, 674),
    Vector3.new(-297, 485, 779),
    Vector3.new(17, 573, 664),
    Vector3.new(587, 917, 637),
    Vector3.new(284, 1197, 182),
    Vector3.new(552, 1529, -581),
    Vector3.new(332, 1737, -261),
    Vector3.new(290, 1980, -204),
    Vector3.new(616, 3261, -66),
    Vector3.new(335, 3245, -32),
}

local MTBatuLoop = false

-- Fungsi auto interact khusus di depan karakter
local function AutoInteract()
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local radius = 12 -- jarak sekitar 12 stud
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") and obj.Enabled then
            local part = obj.Parent
            if part and part:IsA("BasePart") then
                local distance = (part.Position - hrp.Position).Magnitude
                if distance <= radius then
                    fireproximityprompt(obj)
                    break
                end
            end
        end
    end
end

CreateMenuToggle(mountTab, "MT Batu", false, function(Value)
    MTBatuLoop = Value
    if not Value then return end

    task.spawn(function()
        local player = game:GetService("Players").LocalPlayer
        while MTBatuLoop do
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            task.wait(0.5)
            
            for i, pos in ipairs(BatuPositions) do
                if not MTBatuLoop then break end
                hrp.CFrame = CFrame.new(pos)
                task.wait(2)

                -- Kalau di posisi terakhir → auto interact (SUMMIT)
                if i == #BatuPositions then
                    task.wait(1) -- kasih delay biar prompt muncul
                    AutoInteract()
                    task.wait(1)
                    -- Balik ke basecamp (pos pertama)
                    hrp.CFrame = CFrame.new(BatuPositions[1])
                end
            end
        end
    end)
end)


-- Buat Tab Premium
local PremiumTab = Window:CreateTab("Troll/Helper", 4483362458)
PremiumTab:CreateSection("Jangan brutal kasian bg")

-- Toggle Fling Player khusus premium
CreateMenuToggle(PremiumTab, "Fling Player", false, function(Value)
    if Value then
        Rayfield:Notify({
            Title = "Fling Player By Fyy",
            Content = "Fling Player Dalam 3...",
            Duration = 2
        })
        task.wait(1)

        Rayfield:Notify({
            Title = "Fling Player By Fyy",
            Content = "Fling Player Dalam 2...",
            Duration = 2
        })
        task.wait(1)

        Rayfield:Notify({
            Title = "Fling Player By Fyy",
            Content = "Fling Player Dalam 1...",
            Duration = 2
        })
        task.wait(1)

        -- Eksekusi fling script
        loadstring(game:HttpGet("https://pastebin.com/raw/NSnmv8n1"))()
    end
end)
-- Asumsinya kamu sudah punya:
-- Window, PremiumTab, basicMenus, premiumMenus, helper functions

-- GUI kecil
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui
ScreenGui.Enabled = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true

local Scrolling = Instance.new("ScrollingFrame", Frame)
Scrolling.Size = UDim2.new(1, -10, 1, -40)
Scrolling.Position = UDim2.new(0, 5, 0, 5)
Scrolling.ScrollBarThickness = 6
Scrolling.CanvasSize = UDim2.new(0, 0, 0, 0)

local TeleportBtn = Instance.new("TextButton", Frame)
TeleportBtn.Size = UDim2.new(1, -10, 0, 30)
TeleportBtn.Position = UDim2.new(0, 5, 1, -35)
TeleportBtn.Text = "Teleport"
TeleportBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
TeleportBtn.TextColor3 = Color3.new(1, 1, 1)

-- Variabel target
local SelectedTarget = nil

-- Update list nama player
local function UpdateList()
    Scrolling:ClearAllChildren()
    local y = 0
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            local Btn = Instance.new("TextButton", Scrolling)
            Btn.Size = UDim2.new(1, -5, 0, 30)
            Btn.Position = UDim2.new(0, 0, 0, y)
            Btn.Text = plr.Name
            Btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Btn.TextColor3 = Color3.new(1, 1, 1)
            y = y + 35

            Btn.MouseButton1Click:Connect(function()
                SelectedTarget = plr
                for _, b in ipairs(Scrolling:GetChildren()) do
                    if b:IsA("TextButton") then
                        b.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                    end
                end
                Btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            end)
        end
    end
    Scrolling.CanvasSize = UDim2.new(0, 0, 0, y)
end

UpdateList()
Players.PlayerAdded:Connect(UpdateList)
Players.PlayerRemoving:Connect(UpdateList)

-- Tombol Teleport (PivotTo, Dex style)
TeleportBtn.MouseButton1Click:Connect(function()
    if SelectedTarget then
        local targetChar = SelectedTarget.Character or SelectedTarget.CharacterAdded:Wait()
        local hrpTarget = targetChar:WaitForChild("HumanoidRootPart", 5)
        local char = player.Character or player.CharacterAdded:Wait()

        if hrpTarget and char then
            char:PivotTo(hrpTarget.CFrame + Vector3.new(0, 5, 0))
        else
            Rayfield:Notify({
                Title = "Teleport Failed",
                Content = "Target belum siap atau Terlalu Jauh",
                Duration = 2
            })
        end
    else
        Rayfield:Notify({
            Title = "No Target",
            Content = "Pilih player dulu dari list!",
            Duration = 2
        })
    end
end)

-- Toggle di PremiumTab → ON = GUI muncul, OFF = hilang
CreateMenuToggle(PremiumTab, "Teleport to Player GUI", false, function(Value)
    ScreenGui.Enabled = Value
    if Value then
        UpdateList()
    end
end)

-- === Posisi Checkpoint ===
local YagatawPositions = {
    Vector3.new(-420, 191, 557),
    Vector3.new(-626, 579, 1136),
    Vector3.new(-900, 690, 1222),
    Vector3.new(-909, 819, 1760),
    Vector3.new(-476, 886, 1701),
    Vector3.new(-379, 1041, 2066),
    Vector3.new(-751, 1525, 2057),
    Vector3.new(-479, 1633, 2271),
    Vector3.new(2, 2493, 2044)
}

local player = game:GetService("Players").LocalPlayer

-- === Setup GUI Timer ===
local function setupTimerGui()
    local coreGui = game:GetService("CoreGui")
    local existing = coreGui:FindFirstChild("YagatawTimerGui")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "YagatawTimerGui"
    ScreenGui.Parent = coreGui

    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Parent = ScreenGui
    TimerLabel.AnchorPoint = Vector2.new(0.5, 0)
    TimerLabel.Size = UDim2.new(0, 240, 0, 60)
    TimerLabel.Position = UDim2.new(0.5, 0, 0, 50)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimerLabel.Font = Enum.Font.SourceSansBold
    TimerLabel.TextScaled = true
    TimerLabel.Visible = false

    local stroke = Instance.new("UIStroke")
    stroke.Parent = TimerLabel
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0,0,0)

    return TimerLabel
end

local TimerLabel = setupTimerGui()

-- Fungsi countdown GUI
local function showTimer(seconds, label)
    TimerLabel.Visible = true
    for i = seconds, 1, -1 do
        if not YagatawLoop then break end
        TimerLabel.Text = label .. "\nTunggu: " .. i .. " detik"
        task.wait(1)
    end
    TimerLabel.Visible = false
end

-- HRP Checker
local function waitForHRP(char, timeout)
    local t = 0
    repeat
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp end
        task.wait(0.1)
        t = t + 0.1
    until t >= timeout
    return nil
end

-- Jalan maju–mundur
local function walkForwardAndBack(hrp, studs, step, delay)
    local forward = hrp.CFrame.LookVector.Unit
    local origin = hrp.CFrame.Position
    -- maju
    for d = 1, studs, step do
        if not YagatawLoop then return end
        hrp.CFrame = CFrame.new(origin + forward * d, origin + forward * (d+1))
        task.wait(delay)
    end
    -- mundur
    for d = studs, 0, -step do
        if not YagatawLoop then return end
        hrp.CFrame = CFrame.new(origin + forward * d, origin + forward * (d+1))
        task.wait(delay)
    end
end

-- === TOGGLE MENU ===
CreateMenuToggle(mountTab, "MT Yagataw", false, function(Value)
    YagatawLoop = Value
    if not Value then return end

    task.spawn(function()
        while YagatawLoop do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = waitForHRP(character, 5)
            if not hrp then break end
            task.wait(0.5)

            for i, pos in ipairs(YagatawPositions) do
                if not YagatawLoop then break end
                if hrp and hrp.Parent then
                    -- teleport
                    hrp.CFrame = CFrame.new(pos + Vector3.new(0,3,0))
                    task.wait(3) -- delay render

                    -- jalan trigger
                    walkForwardAndBack(hrp, 15, 1, 0.05)

                    -- timer logic (semua 60 detik kecuali terakhir)
                    if i == #YagatawPositions then
                        showTimer(2, "CP " .. i .. " (Terakhir)")
                    else
                        showTimer(90, "CP " .. i)
                    end
                end
            end

            -- respawn kalau selesai
            if YagatawLoop and player.Character then
                local oldChar = player.Character
                pcall(function() oldChar:BreakJoints() end)
                repeat task.wait(0.1) until player.Character ~= oldChar and player.Character:FindFirstChild("HumanoidRootPart")
                task.wait(0.5)
            end
        end
    end)
end)

-- === GOD MODE EXTRA STRONG ===
CreateMenuToggle(PremiumTab, "God Mode", false, function(Value)
    GodMode = Value
    if not Value then return end

    task.spawn(function()
        while GodMode do
            local char = player.Character or player.CharacterAdded:Wait()
            local hum = char:FindFirstChildOfClass("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")

            if hum then
                -- Cegah state Dead
                pcall(function()
                    hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                    hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
                end)

                -- Reset Health
                if hum.Health < hum.MaxHealth then
                    hum.Health = hum.MaxHealth
                end

                -- Proteksi agar nggak di-kill pakai Destroy()
                hum.Died:Connect(function()
                    if GodMode then
                        task.defer(function()
                            if player.Character then
                                -- Respawn cepat
                                player.Character:BreakJoints()
                            end
                        end)
                    end
                end)
            end

            if hrp then
                -- Kalau ada game yg nge-delete HRP, kita respawn
                hrp:GetPropertyChangedSignal("Parent"):Connect(function()
                    if GodMode and not hrp.Parent then
                        player:LoadCharacter()
                    end
                end)
            end

            task.wait(0.3) -- cek cepat
        end
    end)
end)



-- === SETUP GUI TIMER UNTUK KONOHA ===


local function setupTimerGui()
    local coreGui = game:GetService("CoreGui")
    local existing = coreGui:FindFirstChild("KonohaTimerGui")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KonohaTimerGui"
    ScreenGui.Parent = coreGui

    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Parent = ScreenGui
    TimerLabel.AnchorPoint = Vector2.new(0.5, 0)
    TimerLabel.Size = UDim2.new(0, 240, 0, 60)
    TimerLabel.Position = UDim2.new(0.5, 0, 0, 50)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimerLabel.Font = Enum.Font.SourceSansBold
    TimerLabel.TextScaled = true
    TimerLabel.Visible = false

    local stroke = Instance.new("UIStroke")
    stroke.Parent = TimerLabel
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0,0,0)

    return TimerLabel
end

local KonohaTimerLabel = setupTimerGui()

-- Fungsi countdown GUI
local function showKonohaTimer(seconds, label)
    KonohaTimerLabel.Visible = true
    for i = seconds, 1, -1 do
        if not KonohaLoop then break end
        KonohaTimerLabel.Text = label .. "\nTunggu: " .. i .. " detik"
        task.wait(1)
    end
    KonohaTimerLabel.Visible = false
end

-- Fungsi HRP checker
local function waitForHRP(char, timeout)
    local t = 0
    repeat
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp end
        task.wait(0.1)
        t = t + 0.1
    until t >= timeout
    return nil
end

-- === POSISI KONOHA ===
local KonohaPositions = {
    Vector3.new(812, 285, -577),
    Vector3.new(772, 517, -379),
    Vector3.new(-78, 473, 387),
    Vector3.new(179, 581, 700),
    Vector3.new(350, 585, 820),
    Vector3.new(794, 809, 625),
    Vector3.new(929, 1001, 606)
}

-- === TOGGLE ===
CreateMenuToggle(mountTab, "MT Konoha", false, function(Value)
    KonohaLoop = Value
    if not Value then return end

    task.spawn(function()
        while KonohaLoop do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = waitForHRP(character, 5)
            if not hrp then break end
            task.wait(0.5)

            for i, pos in ipairs(KonohaPositions) do
                if not KonohaLoop then break end
                hrp.CFrame = CFrame.new(pos)

                -- delay antar checkpoint pakai GUI Timer
                if i == #KonohaPositions then
                    showKonohaTimer(3, "CP " .. i .. " (Terakhir)")
                else
                    showKonohaTimer(32, "CP " .. i)
                end
            end

            -- respawn karakter setelah checkpoint terakhir
            if KonohaLoop and player.Character then
                local oldChar = player.Character
                pcall(function() player.Character:BreakJoints() end)

                -- tunggu karakter baru spawn
                repeat task.wait(0.1) until player.Character ~= oldChar and player.Character:FindFirstChild("HumanoidRootPart")

                showKonohaTimer(2, "Respawn")
            end
        end
    end)
end)
------------


CreateMenuToggle(mountTab, "Hell Expedition", false, function(Value)
    HellExpeditionLoop = Value
    if not Value then return end

    -- Spawn satu loop saja
    task.spawn(function()
        local player = game.Players.LocalPlayer

        local summitPositions = {
            Vector3.new(-102, 201, 272),
            Vector3.new(155, 249, 424),
            Vector3.new(484, 353, 311),
            Vector3.new(526, 413, -315),
            Vector3.new(-227, 541, -757),
            Vector3.new(-654, 541, -651),
            Vector3.new(-817, 434, 442),
            Vector3.new(-320, 410, 660),
            Vector3.new(347, 331, 717),
            Vector3.new(807, 637, 864),
            Vector3.new(1253, 825, 395),
            Vector3.new(1509, 1193, 18),
            Vector3.new(1000, 1193, -58),
            Vector3.new(-1513, 1874, -72)
        }

        local interactPosition = Vector3.new(-1368, 1883, -185)

        -- Fungsi teleport
        local function teleportTo(pos)
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(pos)
            end
        end

        -- Fungsi auto interact
        local function autoInteract()
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local hrp = character.HumanoidRootPart
                for _, prompt in pairs(workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        local distance = (prompt.Parent.Position - hrp.Position).Magnitude
                        if distance <= prompt.MaxActivationDistance then
                            pcall(function()
                                fireproximityprompt(prompt)
                            end)
                        end
                    end
                end
            end
        end

        -- Loop utama
        while HellExpeditionLoop do
            -- Teleport ke semua posisi summit
            for _, pos in ipairs(summitPositions) do
                if not HellExpeditionLoop then break end
                teleportTo(pos)
                task.wait(3)
            end

            -- Teleport ke tempat interact dan auto interact
            if HellExpeditionLoop then
                teleportTo(interactPosition)
                task.wait(0.5)
                autoInteract()
                task.wait(0.5)
            end
        end
    end)
end)

---------- HANAMI

local HanamiPositions = {
    Vector3.new(515, 141, -124),
    Vector3.new(360, 196, -613),
    Vector3.new(-94, 170, -489),
    Vector3.new(-934, 345, -512),
    Vector3.new(-1278, 478, -330),
    Vector3.new(-1976, 610, 132),
    Vector3.new(-2766, 669, 44),
    Vector3.new(-2598, 849, -323), -- summit
}

local MTHanamiloop = false

CreateMenuToggle(mountTab, "MT Hanami", false, function(Value)
    MTHanamiloop = Value
    if not Value then return end

    task.spawn(function()
        local player = game:GetService("Players").LocalPlayer
        while MTHanamiloop do
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            task.wait(0.5)

            for i, pos in ipairs(HanamiPositions) do
                if not MTHanamiloop then break end
                hrp.CFrame = CFrame.new(pos)
                task.wait(3)

                -- Summit (pos terakhir)
                if i == #HanamiPositions then
                    task.wait(3) -- tunggu 5 detik di summit
                    -- Respawn balik ke awal
                    hrp.CFrame = CFrame.new(HanamiPositions[1])
                    break -- restart loop dari awal
                end
            end
        end
    end)
end)

------------- DAUN V2

local RunDaunV2ButtonEnabled = true

CreateMenuButton(arunikaTab, "Auto Walk Daun V2", function()
    
            Title = "Run Walk Daun",
            Content = "⚠️ Hanya Premium yang bisa menjalankan fitur ini!",
            Duration = 4
        })
        return
    end

    -- Lock button jika sudah dijalankan
    if not RunDaunV2ButtonEnabled then
        Rayfield:Notify({
            Title = "Run Walk Daun",
            Content = "⚠️ Fitur ini sudah dijalankan / dikunci!",
            Duration = 4
        })
        return
    end

    -- Jalankan script
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lovllo/howtoforgetyou/main/dan.lua"))()

    -- Notif sukses
    Rayfield:Notify({
        Title = "Run Walk Daun",
        Content = "✅ Script berhasil dijalankan!",
        Duration = 4
    })

    -- Lock button supaya tidak bisa dijalankan lagi
    RunArunikaButtonEnabled = false
end)



Rayfield:LoadConfiguration()
