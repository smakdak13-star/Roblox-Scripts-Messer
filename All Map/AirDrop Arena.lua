if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if game.GameId ~= 10031505426 then
    LocalPlayer:Kick("Mario Hub: this script is for FPS AirDrop Arena only")
    return
end

if not LPH_OBFUSCATED then
    local function Passthrough(fn) return fn end
    LPH_JIT, LPH_JIT_MAX, LPH_NO_VIRTUALIZE = Passthrough, Passthrough, Passthrough
end

local MarioBanner = {
    Print = print,
    Started = os.clock(),
    Last = os.clock(),
    Done = 0,
    Total = 4,
}

do
    local ok, renv = pcall(getrenv)
    if ok and type(renv) == "table" and type(renv.print) == "function" then MarioBanner.Print = renv.print end
end

function MarioBanner.Show()
    local ok, executor = pcall(identifyexecutor)
    if not ok or type(executor) ~= "string" then executor = "Unknown" end
    local rule = string.rep("=", 54)
    MarioBanner.Print(table.concat({
        "",
        [[
                                                                     @%@
                                                                    @*-#@
                                          @@@@@@@@@@@@@          @@#+.:-*%@@      @@
                                   @@@@@%##***********##%@@@@@   @*--:-==+*@@@@#*+==+*%@@
                              @@@@#+=+==---==++++++++++++**+++#@@@@@%==+@@@@#:.......:::=%@@
                          @@%#+---::-=++++++++++************+***++#%@%+@@@#:..-+*****+-:::+%@
                      @@@#=-::.:-==++++++++++*************************#@@+::=*-:.:+-::-+:.:=#@
                    @@%-:...:-===+++++**#################****************%%*+::::+*++::-+..:=#@
                 @@%*-:...:--==++*########**+==--===+**#######************+#%+::-*==-:::=-::=+@@
               @@%+=-::---===+*###%#+-:...................:=+#####***********#@+++==----==:-+*@@
             @@%++=-======+*###%+:............................::+####**********#@*+=----=---**@@
            @%=++=++++++*####=:...................................:+###**********%@==--==--+**@@
          @@*+++++++++*###*:........................................:-*##**********%*==+--=**@@@
         @%+++++++++*##%+:............................................::*##*********%%+--=##%@+%@
       @@#+++++++++###*:.....-+==+*#-......................:**+**#+:....:=###********%%+*##%@*:+@@
      @@*++++++++*###:......-+:.:-=*#*-..................:+*--+**#%*:.....:+##********#@#%%+:.:--+#@
     @@+++++++++*##+:......-*::-=++++*##:...............=#=-++****#%*:.....:-##********#@@@%+=-++#@@
    @@+=-=+++++*##+.......:*-:==++++++*##+............-*+-=+*******#%+:.....:-##********#@  @#=#@@
    @*=:.=++++*##-.......:*=:=++++++++*+*##=........:**==+**********##=:.....::*#********%@  @#@
   @#+-.-++*+*##=........*+-++++++*********##-....:+*==+*************#%-:.....:-**********%@
  @@++-=++***##+........*+-++++++***********#%*::=#+-+****************#%-:.....:=**********@@
 @@*++=++***###........+*-+++++***************###+-=+*****************###-:.....:+*********%@
 @%++=+*****#%:.......=*-++++*******************==+********************#%*-:....:-#********#@@
@@**+++****##+.......=*=+++*********************************************#%+::....:+*********@@
@%**++*****##-......=#=++**********#%#********************%%*************#%+:....:-#********%@
@%**++*****#*:.....-*=++**********#%%%#*****************#%%%**************#%=:....-********##@@
@#**++*****#*:....:*++************%%%%%%#*************#%%%%%#**************##-:...-+*******#*@@
@#**+******#+:...:#++************#%%%@@%%##*********#%%%%%@%#**************#%#-:..:+*+*****#*@@
@#**+******#+:..:#+=************#%%%%%*%%%##*******%%%%%%#%%##**************#%#::.-+*+*****#*@@
@#*********#+:.:+*=*************%%%%%+==*%%###***#%%%%%#++*%##***************#%*::-+*+*****#*@@
@%*#*******#*:.+*=*************%%%%%*=----*%###%%%%%%#+====*###**************##%+--*++****###@@
@%*#********#-:####***********#%%%%#=-::.::=###%%%%#+==--:::####************#%%%#==*+*****###@@
@@##********#+:#%%%%#********#%%%%%=--:....::=%%%%+==--::..:-%###********#%%%%%%#=#++*****##%@
@@###********#-=#%%%%%%##****%%%%%*=-:.......::-==---::.....:+###*****##%%%%%%%#++#++****###@@
 @%###*******##::=+%%%%%%%##%%%%%#=-:...........:::::........:####*#%%%%%%%%%*+=+*+=*****##%@
 @@###********#+:.:-=*%%%%%%%%%%%+--:.........................=###%%%%%%%%*+====*=.=****###@@
  @@###********#+:..::-=*%%%%%%%*=-:..:::-------------::::...::*#%%%%%%*+==---=*+-=+***###%@
   @%###*******#%#*+-..::-=#%@@%#**++==----------------===+++**#%@@@#+===---+*#*++****####@@
    @%###**#%#=::-=+##*##+-:...:::-=+**---*###*=--++++=--=++++=--:::-=+#%**#-:..:=#%##%##@@
    @@%#%#+:...:-=++=:..::=*####+#=:..=@#%:....%@*....*%%#...:--=*##+------=+=:::::-=#%%@@
     @@%*=--::::-*::::::-%=...:%@#:...:@@#.....%@+....=@@=.........:*#=-----=+=:::-==++%@@
  @@%+--+==--:::-#=-::::-%+....+%%-....%@#....:@@+....+@@:...:%%....-@*---==+*+:::-=+++*=+#@@
 @%-:-==*+==-:::-+*--:::-*#:...........*@#....:@@+....+@%..........-%%+---==+*=::-=+++#*=-:-*@@
 @@#+===+*+==-::-=*=--::-=%-......:....+@%:....:-....:#@*....=+:...-%#=--==+**-:--=++#*+=-=*%@
   @@#*=++#+=-:::-+*------#+....+@%....-@@#:.......::*@@+....+#=.:::=%+-===+#+-:-=++***++*%@@
     @@#+++*==-::-=*=-----+%:...-@@-::-=@%%@#+=--==*%@%%=:::::::::::#%+===+**----=++#**#%@@
     @@*-=+*+=-::-=*+=----=%#+*#%@%@@@@@#+-=*%%@@@%#*==*@@%%%##*+*#@@*====+#+-:-=++***++%@
    @@*--=+++===++*#*=------#%%#+=-----===============----==+*#%%%#+=-===+*#*+++=++**+==*@@
    @%=:-==+***%%@@@#=-=====++*##%%%@@@@@@@@@@%%@@@@@@@@@%%%##**++=======+*@@@@%#*+#+=--=#@
    @*:---==+*###%@@@#*#%%@%%%%%%######*****++++++++***######%%%%%%%%%%#*#%@@@####**+=---+@@
   @@+--=**#%@@@@@  @@@%%%%%%%#*******************************####%%%%%%@@@  @@@@@%#**=--+%@
    @@%%@@@@@          @@@@%%%%%%###**********************####%%%%%%%@@@          @@@@@%%%@@
      @@                  @@@@@%%%%%%%%%###############%%%%%%%%%@@@@@                  @@@
                               @@@@@@%%%%%%%%%%%%%%%%%%%%%%@@@@@
                                    @@@@@@@@@@@@@@@@@@@@@@@
]],
        [[
  __  __    _    ____  ___ ___    _   _ _   _ ____
 |  \/  |  / \  |  _ \|_ _/ _ \  | | | | | | | __ )
 | |\/| | / _ \ | |_) || | | | | | |_| | | | |  _ \
 | |  | |/ ___ \|  _ < | | |_| | |  _  | |_| | |_) |
 |_|  |_/_/   \_\_| \_\___\___/  |_| |_|\___/|____/
]],
        rule,
        "   AIRDROP ARENA  //  by xDTaraZ  //  discord.gg/FHVfmeSceA",
        "   executor: " .. executor .. "   //   player: " .. game:GetService("Players").LocalPlayer.Name,
        rule,
    }, "\n"))
end

---@param label string  what just finished loading
function MarioBanner.Step(label)
    local now = os.clock()
    MarioBanner.Done = math.min(MarioBanner.Done + 1, MarioBanner.Total)
    local filled = math.floor(MarioBanner.Done / MarioBanner.Total * 20 + 0.5)
    MarioBanner.Print(string.format("[Mario Hub] [%s] %3d%%  %-24s +%dms",
        string.rep("#", filled) .. string.rep(".", 20 - filled),
        math.floor(MarioBanner.Done / MarioBanner.Total * 100), label, math.floor((now - MarioBanner.Last) * 1000)))
    MarioBanner.Last = now
end

function MarioBanner.Ready()
    local rule = string.rep("=", 54)
    MarioBanner.Print(table.concat({
        rule,
        string.format("   >> READY in %dms", math.floor((os.clock() - MarioBanner.Started) * 1000)),
        rule,
    }, "\n"))
end

pcall(MarioBanner.Show)
pcall(MarioBanner.Step, "Core")

local environment = getgenv and getgenv() or _G
if type(environment.AirDropArenaUnload) == "function" then
    pcall(environment.AirDropArenaUnload)
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")

local osClock = os.clock
local vector3New, cframeLookAt = Vector3.new, CFrame.lookAt

local xDTaraZ = setmetatable({}, {
    __newindex = function(self, key, value)
        rawset(self, key, type(value) == "function" and LPH_JIT(value) or value)
    end,
})

xDTaraZ.Config = {
    UiSource = "https://raw.githubusercontent.com/xDTaraZz/Roblox-Scripts/refs/heads/main/ui.lua",
    Discord = "https://discord.gg/FHVfmeSceA",
    UpdateLog = {
        { "2026-10-10", "Updated for Season 5\nAuto Lottery in Auto Claim\nTeleport to and spectate any player\nItem pictures in every item list\nHalloween menu" },
        { "2026-10-05", "Fixed shots not killing: ammo spam, knife in hand\nAuto reload between fights, Auto ammo\nHealth bars on ESP now go down\nNew Rewards tab and Triggerbot\nSilent Aim, Aimbot, Ragebot each have their own settings" },
    },
    SaveFolder = "AirDrop Arena",
    Intro = true,
    AlertTries = 20,
    AlertGap = 0.5,
    LoadTimeout = 10,
    RequireTimeout = 5,
    MaxFails = 5,
    FailWindow = 10,
    StatusInterval = 1,
    DefaultRange = 1000,
    RefireGap = 0.15,
    AimRenderPriority = Enum.RenderPriority.Camera.Value + 1,
    FovColor = Color3.fromRGB(232, 160, 76),
    SilentFovColor = Color3.fromRGB(255, 80, 80),
    CombatToggles = { "SilentAim", "Ragebot", "Aimbot", "Triggerbot", "ShowFov", "ShowSilentFov" },
    ConfigFeatures = { "AutoGear", "AutoAmmo", "AutoValuables", "AutoBuffs", "AutoAirDrop", "AutoHeal" },
    RemoteFeatures = { "SilentAim", "Ragebot", "AutoGear", "AutoAmmo", "AutoValuables", "AutoBuffs", "AutoAirDrop", "AutoHeal", "InstantRespawn", "AutoRejoin", "AutoClaim", "AutoOpenBoxes" },
    GcFeatures = { "AutoClaim", "AutoOpenBoxes" },
    GunToggles = { "NoSpread", "NoRecoil", "InstantAds" },
    LootEspToggles = { "LootEspAirDrop", "LootEspCrate", "LootEspItem" },
    GunScanInterval = 8,
    ModProps = { 72, 73, 82 },
    GunSlots = { 1, 2, 4 },
    AmmoBatch = 6,
    ReloadSlack = 0.3,
    MeleePart = 3,
    NoticeProto = 2005,
    HuntSyncPause = 1.5,
    SwitchGap = 1,
    HitForget = 8,
    KillSamples = 20,
    BaseHp = 100,
    AdsSpeed = 1000,
    RespawnGap = 0.5,
    LootRetry = 15,
    StatScanGap = 2,
    LobbyRejoin = 5,
    HealGap = 0.4,
    HealUrgent = 35,
    CurrencyType = 1,
    TriggerRange = 1000,
    GunTypes = { [4] = true, [5] = true },
    ClaimKinds = { "Tasks", "Season", "Online gifts", "Sign-in", "Update gift", "Lottery" },
    GoldId = 1,
    BuffType = 24,
    CodeGap = 0.6,
    ClaimGap = 60,
    BoxIds = { 2001, 2040 },
    BuyAmountMax = 100,
    ItemScan = 400,
    TeleportBehind = 4,
    OpenBatch = 20,
    OpenGap = 0.25,
    GearSlots = {
        [4] = { "Primary", { 1 } },
        [5] = { "Pistol", { 4 } },
        [8] = { "Helmet", { 5 } },
        [9] = { "Armor", { 6 } },
    },
    SlotLabels = {
        MainWeapon1 = "Primary", MainWeapon2 = "Primary", SecondaryWeapon = "Pistol", Melee = "Melee",
        Helmet = "Helmet", BodyArmor = "Armor", Shoe = "Shoes", Gloves = "Gloves",
    },
    LootColors = {
        AirDrop = Color3.fromRGB(255, 80, 80),
        Crate = Color3.fromRGB(80, 170, 255),
        Item = Color3.fromRGB(255, 196, 64),
    },
    FallbackProto = {
        Blaster_ShootReq = 27001,
        DropItem_PickWorldItemReq = 26002,
        Battlefield_DeployReq = 25001,
        Blaster_BulletHitNotify = 27505,
        Battlefield_S2CCustomSyncNotify = 25507,
        Battlefield_EntityDeathNotify = 25508,
    },
    BoneParts = {
        Head = { "Head", "Neck" },
        Torso = { "UpperTorso", "Torso", "HumanoidRootPart" },
        Auto = { "Head", "UpperTorso", "Torso", "HumanoidRootPart" }, -- УЛУЧШЕНО: Автоматический выбор кости
    },
}

xDTaraZ.State = {
    Alive = true,
    Connections = {},
    Halted = {},
    Notices = {},
    Target = nil,
    AimHead = nil,
    AimBody = nil,
    LockPart = nil,
    LockedTarget = nil, -- УЛУЧШЕНО: Для фиксации цели
    SoulSince = nil,
    AimEntity = nil,
    Firing = false,
    LastShot = 0,
    Kills = 0,
    LastRespawn = 0,
    Hits = 0,
    Tried = {},
    AirDrops = 0,
    AirDropAt = 0,
    Looted = 0,
    Valuables = 0,
    LastLoot = "-",
}

xDTaraZ.Options = {
    TargetPlayer = false,
    Spectate = false,
    Hunt = false,
    HuntMode = "Behind",
    HuntDistance = 15,
    HuntHeight = 10,
    HuntIdle = 0.6,
    HuntMaxWarp = 0,
    SilentAim = false,
    SilentHitChance = 100,
    SilentHeadChance = 100,
    SilentPriority = "Crosshair",
    SilentFov = 250,
    ShowSilentFov = false,
    SilentMaxDistance = 1000,
    SilentTargetLock = false, -- УЛУЧШЕНО: Фиксация цели
    Ragebot = false,
    RageMaxDistance = 1000,
    TargetBots = true,
    AimBone = "Auto", -- УЛУЧШЕНО: По умолчанию Auto
    AimPriority = "Crosshair",
    AimFov = 200,
    ShowFov = false,
    AimMaxDistance = 1000,
    Aimbot = false,
    AimSmooth = 1,
    AimSmoothType = "Exponential", -- УЛУЧШЕНО: Тип сглаживания
    AimSticky = false,
    AimPrediction = false, -- УЛУЧШЕНО: Предсказание движения
    AimPredictionScale = 0.15, -- УЛУЧШЕНО: Сила предсказания
    Triggerbot = false,
    TriggerDelay = 0,
    TriggerChance = 100,
    InstantRespawn = false,
    RespawnDelay = 0,
    AutoRejoin = false,
    AutoHeal = false,
    HealAt = 70,
    HealMeds = {},
    AutoAmmo = false,
    SmartReload = false,
    ReloadAt = 50,
    NoSpread = false,
    NoRecoil = false,
    InstantAds = false,
    AutoGear = false,
    LootGear = { Primary = true, Pistol = true, Helmet = true, Armor = true, Shoes = true, Gloves = true, Melee = true },
    AutoValuables = false,
    LootCurrency = {},
    LootBuffs = {},
    GearScore = "Damage per second",
    AutoAirDrop = false,
    LootEspAirDrop = false,
    LootEspCrate = false,
    LootEspItem = false,
    LootEspRange = 400,
    SuperSlide = false,
    SlideSpeed = 120,
    Speed = false,
    SpeedValue = 40,
    InfiniteJump = false,
    Noclip = false,
    Fly = false,
    FlySpeed = 60,
    Fullbright = false,
    CameraFov = false,
    CameraFovValue = 90,
    AntiAfk = false,
    AutoBuffs = false,
    AutoClaim = false,
    ClaimKinds = {},
    AutoOpenBoxes = false,
    OpenBoxList = {},
    BuyBox = "",
    BuyAmount = 1,
    KeepGold = 50000,
    AdminAlert = false,
    AdminHop = false,
}

xDTaraZ.Util = {}
local Util = xDTaraZ.Util

local function Resolve(...)
    for index = 1, select("#", ...) do
        local candidate = select(index, ...)
        if type(candidate) == "function" then return candidate end
    end
    return nil
end

Util.Request = Resolve(request, http_request, syn and syn.request, http and http.request)
Util.SetClipboard = Resolve(setclipboard, toclipboard)
Util.GetNamecall = Resolve(getnamecallmethod)
Util.GetGc = Resolve(getgc)

xDTaraZ.Caps = setmetatable({}, {
    __index = function(_, name)
        local lib = xDTaraZ.Library
        return lib ~= nil and lib.Compat.Caps[name] == true
    end,
})

function Util.HttpGet(url)
    local ok, body = pcall(function() return game:HttpGet(url) end)
    if ok and type(body) == "string" then return body end
    if not Util.Request then error("HttpGet failed: " .. url) end

    local sent, response = pcall(Util.Request, { Url = url, Method = "GET" })
    local code = sent and type(response) == "table" and tonumber(response.StatusCode)
    if code == 200 and type(response.Body) == "string" then return response.Body end
    error(("HttpGet %s: %s"):format(url, sent and ("status " .. tostring(code)) or tostring(response)))
end

function Util.Alert(text, detail)
    warn("[AirDropArena] menu:", detail or text)
    task.spawn(function()
        for _ = 1, xDTaraZ.Config.AlertTries do
            local shown = pcall(StarterGui.SetCore, StarterGui, "SendNotification", { Title = "Mario Hub", Text = text, Duration = 10 })
            if shown then return end
            task.wait(xDTaraZ.Config.AlertGap)
        end
    end)
end

function Util.LoadLibrary(url)
    local fetched, source = pcall(Util.HttpGet, url)
    if not (fetched and type(source) == "string" and source:sub(-64):find("return Library%s*$")) then
        Util.Alert("Could not download the menu. Check your connection and run it again.", fetched and ("bad body, " .. #tostring(source) .. " bytes") or source)
        return nil
    end

    local chunk, compileErr = loadstring(source)
    if type(chunk) ~= "function" then
        Util.Alert("The menu failed to load on this executor: " .. tostring(compileErr))
        return nil
    end
    local ran, lib = pcall(chunk)
    if not ran or type(lib) ~= "table" then
        Util.Alert("The menu failed to load on this executor: " .. tostring(lib))
        return nil
    end
    return lib
end

function Util.Try(label, fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then warn("[AirDropArena] " .. label .. ":", err) end
    return ok
end

function Util.Copy(text)
    if not Util.SetClipboard then return false end
    Util.SetClipboard(text)
    return true
end

function Util.Mount(gui)
    local ok, hui = pcall(gethui)
    if ok and typeof(hui) == "Instance" and pcall(function() gui.Parent = hui end) then return end
    if pcall(function() gui.Parent = game:GetService("CoreGui") end) then return end
    gui.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", xDTaraZ.Config.LoadTimeout)
end

function Util.Screen()
    if Util.Overlay and Util.Overlay.Parent then return Util.Overlay end
    local screen = Instance.new("ScreenGui")
    screen.Name, screen.ResetOnSpawn, screen.IgnoreGuiInset = "xDTaraZAirDrop", false, true
    Util.Mount(screen)
    Util.Overlay = screen
    return screen
end

function xDTaraZ:Connect(signal, handler)
    local conn = signal:Connect(handler)
    table.insert(self.State.Connections, conn)
    return conn
end

xDTaraZ.GameLib = { Missing = {} }
local GameLib = xDTaraZ.GameLib

function GameLib.RequireAsGame(module)
    local finished, ok, loaded = false, false, nil
    task.spawn(function()
        pcall(setthreadidentity, 2)
        local read, identity = pcall(getthreadidentity)
        if read and identity == 2 then ok, loaded = pcall(require, module) end
        finished = true
    end)
    local deadline = osClock() + xDTaraZ.Config.RequireTimeout
    repeat
        if finished then break end
        task.wait()
    until osClock() > deadline
    return ok, loaded
end

function GameLib.Require(module)
    if not (module and module:IsA("ModuleScript")) then return nil end
    local ok, loaded = pcall(require, module)
    if ok then return loaded end
    local again, retried = GameLib.RequireAsGame(module)
    if again then return retried end

    GameLib.Missing[module.Name] = true
    warn("[AirDropArena] require " .. module.Name .. ":", loaded)
    return nil
end

function GameLib.Find(root, name, class)
    local found = root and root:FindFirstChild(name, true)
    if not (found and found:IsA(class)) then found = ReplicatedStorage:FindFirstChild(name, true) end
    if found and found:IsA(class) then return found end
    GameLib.Missing[name] = "Absent"
    warn("[AirDropArena] " .. class .. " " .. name .. " not found, features that need it are blocked")
    return nil
end

do
    local timeout = xDTaraZ.Config.LoadTimeout
    local remotes = ReplicatedStorage:WaitForChild("RemoteEvent", timeout)
    local scripts = ReplicatedStorage:WaitForChild("Scripts", timeout)
    GameLib.Main = remotes and remotes:WaitForChild("Main", timeout) or GameLib.Find(remotes, "Main", "RemoteEvent")
    GameLib.ProtoId = GameLib.Require(GameLib.Find(scripts, "ProtoId", "ModuleScript")) or {}
    GameLib.Configs = GameLib.Require(GameLib.Find(scripts, "ConfigManager", "ModuleScript")) or {}
    GameLib.BagEnum = GameLib.Require(scripts and scripts:FindFirstChild("BagEnum", true))
    local enums = GameLib.Require(scripts and scripts:FindFirstChild("CustomEnum", true))
    GameLib.TaskState = type(enums) == "table" and type(enums.TaskState) == "table" and enums.TaskState or { done = 4 }
    GameLib.AdminIds = GameLib.Require(scripts and scripts:FindFirstChild("AdminConst", true))
end

xDTaraZ.Proto = setmetatable({}, {
    __index = function(self, name)
        local id = GameLib.ProtoId[name] or xDTaraZ.Config.FallbackProto[name]
        rawset(self, name, id)
        return id
    end,
})

xDTaraZ.ItemNames = setmetatable({}, {
    __index = function(self, itemId)
        local items = GameLib.Configs.ItemConfig
        local ok, cfg = pcall(function() return items:GetItemConfigById(itemId) end)
        local name = ok and type(cfg) == "table" and (cfg.name or cfg.Name) or tostring(itemId)
        rawset(self, itemId, tostring(name))
        return self[itemId]
    end,
})

xDTaraZ.Net = {}

function xDTaraZ.Net.Send(name, payload)
    local id = xDTaraZ.Proto[name]
    if not (id and GameLib.Main) then return false end
    GameLib.Main:FireServer({ id, payload })
    return true
end

xDTaraZ.Player = {}

function xDTaraZ.Player.Root()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

function xDTaraZ.Player.Humanoid()
    local char = LocalPlayer.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

function xDTaraZ.Player.EntityId()
    local char = LocalPlayer.Character
    return char and char:GetAttribute("EntityId") or LocalPlayer.UserId
end

function xDTaraZ.Player.InBattle()
    local char = LocalPlayer.Character
    return char ~= nil and char:GetAttribute("EntityState") == 1
end

function xDTaraZ.Player.IsSoul()
    local char = LocalPlayer.Character
    local state = char and char:GetAttribute("EntityState")
    return state == 2 or state == 4
end

-- =====================================================================
-- УЛУЧШЕННЫЙ МОДУЛЬ ЦЕЛЕУКАЗАНИЯ (TARGET)
-- =====================================================================
xDTaraZ.Target = {}

local losParams = RaycastParams.new()
losParams.FilterType = Enum.RaycastFilterType.Exclude
local losFilter = table.create(4)

function xDTaraZ.Target.Candidates(withBots)
    local list = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then table.insert(list, player.Character) end
    end
    local fx = (withBots or xDTaraZ.Options.TargetBots) and Workspace:FindFirstChild("Fx")
    if fx then
        for _, model in ipairs(fx:GetChildren()) do
            if model:IsA("Model") and model:GetAttribute("EntityId") then list[#list + 1] = model end
        end
    end
    return list
end

function xDTaraZ.Target.IsEnemy(model)
    if model == LocalPlayer.Character or not model:GetAttribute("EntityId") then return false end
    local hum = model:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    local state = model:GetAttribute("EntityState")
    if state ~= nil and state ~= 1 then return false end
    return not xDTaraZ.Target.SameTeam(model)
end

function xDTaraZ.Target.SameTeam(model)
    local mine = LocalPlayer.Character and LocalPlayer.Character:GetAttribute("TeamId")
    return mine ~= nil and mine ~= -1 and mine == model:GetAttribute("TeamId")
end

-- УЛУЧШЕНО: Умный выбор кости с поддержкой режима "Auto" и проверкой видимости
function xDTaraZ.Target.Part(model, bone, origin)
    local boneList = xDTaraZ.Config.BoneParts[bone] or xDTaraZ.Config.BoneParts.Head
    
    if bone == "Auto" then
        for _, name in ipairs(boneList) do
            local part = model:FindFirstChild(name)
            if part and part:IsA("BasePart") then
                if xDTaraZ.Target.Visible(origin, model, part.Position) then
                    return part
                end
            end
        end
    end
    
    for _, name in ipairs(boneList) do
        local part = model:FindFirstChild(name)
        if part and part:IsA("BasePart") then return part end
    end
    return model:FindFirstChild("HumanoidRootPart")
end

function xDTaraZ.Target.Visible(from, model, point)
    losFilter[1], losFilter[2], losFilter[3], losFilter[4] = LocalPlayer.Character, model, Workspace.CurrentCamera, Workspace.Terrain
    losParams.FilterDescendantsInstances = losFilter
    return Workspace:Raycast(from, point - from, losParams) == nil
end

-- УЛУЧШЕНО: Расчет позиции с предсказанием движения (Prediction)
function xDTaraZ.Target.GetAimPosition(part, origin)
    local pos = part.Position
    if xDTaraZ.Options.AimPrediction then
        local character = part.Parent
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 then
            local distance = (pos - origin).Magnitude
            local timeToTarget = distance / 1200 -- Примерная скорость пули
            pos = pos + (hum.MoveDirection * hum.WalkSpeed * timeToTarget * xDTaraZ.Options.AimPredictionScale)
        end
    end
    return pos
end

function xDTaraZ.Target.Check(model, profile, cam, origin, center)
    if not xDTaraZ.Target.IsEnemy(model) then return nil end
    
    local part = xDTaraZ.Target.Part(model, profile.Bone, origin)
    if not part then return nil end
    
    local aimPos = xDTaraZ.Target.GetAimPosition(part, origin)
    if (aimPos - origin).Magnitude > profile.Range then return nil end
    
    local screen, onScreen = cam:WorldToViewportPoint(aimPos)
    local screenDist = (Vector2.new(screen.X, screen.Y) - center).Magnitude
    
    if profile.Fov > 0 and (not onScreen or screenDist > profile.Fov) then return nil end
    
    -- Если не Auto, проверяем видимость конкретной точки
    if profile.Bone ~= "Auto" and not xDTaraZ.Target.Visible(origin, model, aimPos) then return nil end
    
    return part, aimPos, screenDist, onScreen
end

function xDTaraZ.Target.Pick(profile, lockTarget)
    local cam = Workspace.CurrentCamera
    local origin = cam.CFrame.Position
    local center = cam.ViewportSize / 2
    local best, bestPart, bestAimPos, bestScore

    for _, model in ipairs(xDTaraZ.Target.Candidates()) do
        if lockTarget and model ~= lockTarget then continue end
        
        local part, aimPos, screenDist, onScreen = xDTaraZ.Target.Check(model, profile, cam, origin, center)
        if not part then continue end
        
        local score = (aimPos - origin).Magnitude
        if profile.Priority == "Crosshair" then
            score = onScreen and screenDist or 1e6 + score
        elseif profile.Priority == "Health" then
            local hum = model:FindFirstChildOfClass("Humanoid")
            score = hum and hum.Health or score
        elseif profile.Priority == "Distance" then
            score = score
        end
        
        if not bestScore or score < bestScore then
            best, bestPart, bestAimPos, bestScore = model, part, aimPos, score
        end
    end
    return best, bestPart, bestAimPos
end

function xDTaraZ.Target.Lock(keep)
    local profile = xDTaraZ.Target.Profile("Aim")
    local opts = xDTaraZ.Options
    local targetToCheck = (opts.AimSticky and keep) or nil
    
    local model, part, aimPos = xDTaraZ.Target.Pick(profile, targetToCheck)
    
    if model and part and aimPos then
        xDTaraZ.State.LockPart = part
        return aimPos
    end
    
    xDTaraZ.State.LockPart = nil
    return nil
end

function xDTaraZ.Target.Label(model)
    local player = Players:GetPlayerFromCharacter(model)
    return player and player.DisplayName or ("[Bot] " .. model.Name)
end

-- =====================================================================
-- УЛУЧШЕННЫЙ БОЕВОЙ МОДУЛЬ (COMBAT)
-- =====================================================================
xDTaraZ.Combat = { Unhook = nil, PressedAt = 0, Want = false, Refire = false, Pumping = false, Circles = {}, Parts = {}, ReloadedAt = 0, SwitchedAt = 0, TriggerSeen = nil, TriggerSince = 0, TriggerRoll = false, LockedTarget = nil }

function xDTaraZ.Combat.Rewrite(shot)
    local state, opts = xDTaraZ.State, xDTaraZ.Options
    local entityId = state.AimEntity
    
    -- УЛУЧШЕНО: Фиксация цели для Silent Aim
    if opts.SilentTargetLock and state.LockedTarget then
        local model = state.LockedTarget
        if model and model:GetAttribute("EntityId") == entityId then
            local cam = Workspace.CurrentCamera
            local origin = cam.CFrame.Position
            local part = xDTaraZ.Target.Part(model, "Auto", origin)
            if part then
                state.AimHead = xDTaraZ.Target.Part(model, "Head", origin)
                state.AimBody = xDTaraZ.Target.Part(model, "Torso", origin)
            end
        else
            state.LockedTarget = nil
        end
    end

    if not entityId or math.random(100) > opts.SilentHitChance then return end
    
    local part = (math.random(100) <= opts.SilentHeadChance and state.AimHead) or state.AimBody or state.AimHead
    if not (part and part.Parent) then return end
    
    local dirs = shot.rayDirections
    if type(dirs) ~= "table" or #dirs == 0 then return end

    local cam = Workspace.CurrentCamera
    local origin = typeof(shot.origin) == "CFrame" and shot.origin.Position or cam.CFrame.Position
    local aimPos = xDTaraZ.Target.GetAimPosition(part, origin)
    
    local offset = aimPos - origin
    local dist = offset.Magnitude
    local range = typeof(dirs[1]) == "Vector3" and dirs[1].Magnitude or xDTaraZ.Config.DefaultRange
    if dist > range or dist < 1e-3 then return end

    local unit = offset.Unit
    local results = table.create(#dirs)
    for index, dir in ipairs(dirs) do
        dirs[index] = unit * (typeof(dir) == "Vector3" and dir.Magnitude or range)
        results[index] = { instance = part, normal = -unit, distance = dist, taggedEntityId = entityId, isTeammate = false }
    end
    shot.rayResults = results
    
    if opts.SilentTargetLock and xDTaraZ.State.Target then
        xDTaraZ.State.LockedTarget = xDTaraZ.State.Target
    end
end

function xDTaraZ.Combat.Aiming()
    local opts = xDTaraZ.Options
    return opts.SilentAim or opts.Ragebot
end

function xDTaraZ.Combat.InstallHook()
    local combat = xDTaraZ.Combat
    if combat.Unhook or not GameLib.Main or not xDTaraZ.Caps.Namecall then return end
    local main, getMethod = GameLib.Main, Util.GetNamecall
    local old
    local ok, original, unhook = pcall(xDTaraZ.Library.Compat.HookMeta, game, "__namecall", function(self, ...)
        if self == main and xDTaraZ.State.Alive and xDTaraZ.Combat.Aiming() and getMethod() == "FireServer" then
            local packet = ...
            if type(packet) == "table" and packet[1] == xDTaraZ.Proto.Blaster_ShootReq and type(packet[2]) == "table" then
                xDTaraZ.State.LastShot = osClock()
                local rewritten, err = pcall(xDTaraZ.Combat.Rewrite, packet[2])
                if not rewritten then warn("[AirDropArena] rewrite:", err) end
            end
        end
        return old(self, ...)
    end)
    if not (ok and type(original) == "function") then
        warn("[AirDropArena] shot hook:", ok and "executor refused the hook" or original)
        return
    end
    old, combat.Unhook = original, unhook
end

function xDTaraZ.Combat.RemoveHook()
    local unhook = xDTaraZ.Combat.Unhook
    if not unhook then return end
    xDTaraZ.Combat.Unhook = nil
    Util.Try("shot unhook", unhook)
end

function xDTaraZ.Combat.SyncHook()
    if xDTaraZ.Combat.Aiming() then
        xDTaraZ.Combat.InstallHook()
    else
        xDTaraZ.Combat.RemoveHook()
    end
end

function xDTaraZ.Combat.Behavior()
    local combat = xDTaraZ.Combat
    if combat.Input and rawget(combat.Input, "owner") then return combat.Input end
    combat.Input = nil
    if not xDTaraZ.Caps.Gc or osClock() - (combat.LastScan or 0) < xDTaraZ.Config.StatScanGap then return nil end
    combat.LastScan = osClock()
    for _, entry in ipairs(Util.GetGc(true)) do
        if type(entry) == "table" and rawget(entry, "owner") and type(entry.BeginFire) == "function" and type(entry.FastKnife) == "function" then
            combat.Input = entry
            return entry
        end
    end
    return nil
end

function xDTaraZ.Combat.Press(down)
    local input = xDTaraZ.Combat.Behavior()
    local sent, err = false, nil
    if input then
        sent, err = pcall(xDTaraZ.Library.Compat.Call, down and input.BeginFire or input.EndFire, input)
        sent = sent or tostring(err):find("timed out", 1, true) ~= nil
    end
    if not sent then
        local center = Workspace.CurrentCamera.ViewportSize / 2
        sent = pcall(VirtualInputManager.SendMouseButtonEvent, VirtualInputManager, center.X, center.Y, 0, down, game, 0)
    end
    if not sent then return false end

    xDTaraZ.State.Firing = down
    if down then xDTaraZ.Combat.PressedAt = osClock() end
    return true
end

function xDTaraZ.Combat.Pending()
    local combat, firing = xDTaraZ.Combat, xDTaraZ.State.Firing
    return combat.Want ~= firing or (combat.Refire and firing)
end

function xDTaraZ.Combat.PressNext()
    local combat, firing = xDTaraZ.Combat, xDTaraZ.State.Firing
    local refire = combat.Refire and firing
    combat.Refire = false
    local sent = false
    if refire or combat.Want ~= firing then sent = xDTaraZ.Combat.Press(not refire and combat.Want) end
    combat.Pumping = false

    if sent and not refire and xDTaraZ.Combat.Pending() then xDTaraZ.Combat.Pump() end
end

function xDTaraZ.Combat.Pump()
    local combat = xDTaraZ.Combat
    if combat.Pumping then return end
    combat.Pumping = true
    task.defer(xDTaraZ.Combat.PressNext)
end

function xDTaraZ.Combat.Fire(want)
    local combat, state = xDTaraZ.Combat, xDTaraZ.State
    combat.Want = want
    if want and state.Firing and not combat.Pumping then
        local now, gap = osClock(), xDTaraZ.Config.RefireGap
        combat.Refire = now - combat.PressedAt > gap and now - state.LastShot > gap
    end
    if xDTaraZ.Combat.Pending() then xDTaraZ.Combat.Pump() end
end

function xDTaraZ.Combat.NewCircle(color)
    if xDTaraZ.Caps.Drawing then
        local circle = Drawing.new("Circle")
        circle.Thickness, circle.NumSides, circle.Filled, circle.Color = 1.5, 64, false, color
        return { Drawing = circle }
    end

    local ring = Instance.new("Frame")
    ring.AnchorPoint, ring.BackgroundTransparency = Vector2.new(0.5, 0.5), 1
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = ring
    local stroke = Instance.new("UIStroke")
    stroke.Thickness, stroke.Color = 1.5, color
    stroke.Parent = ring
    ring.Parent = Util.Screen()
    return { Ring = ring }
end

function xDTaraZ.Combat.UpdateCircles()
    local opts, config = xDTaraZ.Options, xDTaraZ.Config
    xDTaraZ.Combat.UpdateCircle("Aim", opts.ShowFov, opts.AimFov, config.FovColor)
    xDTaraZ.Combat.UpdateCircle("Silent", opts.ShowSilentFov, opts.SilentFov, config.SilentFovColor)
end

function xDTaraZ.Combat.UpdateCircle(key, show, radius, color)
    local circles = xDTaraZ.Combat.Circles
    local circle = circles[key]
    if not circle then
        if not show then return end
        circle = xDTaraZ.Combat.NewCircle(color)
        circles[key] = circle
    end

    local center = Workspace.CurrentCamera.ViewportSize / 2
    if circle.Drawing then
        circle.Drawing.Visible, circle.Drawing.Position, circle.Drawing.Radius = show, center, radius
        return
    end
    circle.Ring.Visible = show
    circle.Ring.Position = UDim2.fromOffset(center.X, center.Y)
    circle.Ring.Size = UDim2.fromOffset(radius * 2, radius * 2)
end

local triggerParams = RaycastParams.new()
triggerParams.FilterType = Enum.RaycastFilterType.Exclude

function xDTaraZ.Combat.TriggerWant()
    local combat, opts = xDTaraZ.Combat, xDTaraZ.Options
    local cam = Workspace.CurrentCamera
    triggerParams.FilterDescendantsInstances = { LocalPlayer.Character, cam }
    local hit = Workspace:Raycast(cam.CFrame.Position, cam.CFrame.LookVector * xDTaraZ.Config.TriggerRange, triggerParams)
    local model = hit and hit.Instance:FindFirstAncestorOfClass("Model")
    while model and not model:GetAttribute("EntityId") do
        model = model.Parent and model.Parent:FindFirstAncestorOfClass("Model")
    end
    if not (model and xDTaraZ.Target.IsEnemy(model)) then
        combat.TriggerSeen = nil
        return false
    end
    if combat.TriggerSeen ~= model then
        combat.TriggerSeen, combat.TriggerSince = model, osClock()
        combat.TriggerRoll = math.random(100) <= opts.TriggerChance
    end
    return combat.TriggerRoll and osClock() - combat.TriggerSince >= opts.TriggerDelay / 1000
end

function xDTaraZ.Combat.ScanGuns()
    local combat = xDTaraZ.Combat
    for part, gun in pairs(combat.Parts) do
        if rawget(gun, "blaster") == nil then combat.Parts[part] = nil end
    end
    local char = LocalPlayer.Character
    local using = char and char:GetAttribute("UseEPos")
    if not using or combat.Parts[using] or not xDTaraZ.Caps.Gc then return combat.Parts end
    for _, entry in ipairs(Util.GetGc(true)) do
        local part = type(entry) == "table" and rawget(entry, "islocalplayer") == true and rawget(entry, "blaster") ~= nil and rawget(entry, "blasterPart")
        if part then combat.Parts[part] = entry end
    end
    return combat.Parts
end

function xDTaraZ.Combat.HeldGun()
    local char = LocalPlayer.Character
    local using = char and char:GetAttribute("UseEPos")
    local gun = using and xDTaraZ.Combat.Parts[using]
    return gun and rawget(gun, "blaster") ~= nil and gun or nil
end

function xDTaraZ.Combat.GunStep()
    local opts = xDTaraZ.Options
    if not (xDTaraZ.Combat.Aiming() or opts.Triggerbot or opts.SmartReload) then return end
    if not xDTaraZ.Player.InBattle() then return end
    xDTaraZ.Combat.ScanGuns()
    if xDTaraZ.Combat.Aiming() then xDTaraZ.Combat.DrawGun() end
    if opts.SmartReload then xDTaraZ.Combat.Reload() end
end

function xDTaraZ.Combat.DrawGun()
    local combat = xDTaraZ.Combat
    local char = LocalPlayer.Character
    if not char or char:GetAttribute("UseEPos") ~= xDTaraZ.Config.MeleePart then return false end
    if osClock() - combat.SwitchedAt < xDTaraZ.Config.SwitchGap then return false end
    local input = xDTaraZ.Combat.Behavior()
    if not (input and type(input.SwitchBlaster) == "function") then return false end
    for _, part in ipairs(xDTaraZ.Config.GunSlots) do
        local worn = char:GetAttribute("EPos_" .. part)
        if type(worn) ~= "string" or worn:match("^I_(%d+)") == "0" then continue end
        combat.SwitchedAt = osClock()
        local ok, err = pcall(xDTaraZ.Library.Compat.Call, input.SwitchBlaster, input, part)
        if not ok and not tostring(err):find("timed out", 1, true) then warn("[AirDropArena] switch:", err) end
        return true
    end
    return false
end

function xDTaraZ.Combat.Reload()
    local combat, opts = xDTaraZ.Combat, xDTaraZ.Options
    local gun = xDTaraZ.Combat.HeldGun()
    local map = gun and rawget(gun, "propMap")
    local ammo, size = gun and rawget(gun, "ammo"), map and tonumber(map[71])
    if not (type(ammo) == "number" and size and size > 1) then return false end
    if ammo >= size or ammo / size * 100 > opts.ReloadAt and ammo > 0 then return false end
    if xDTaraZ.State.Target and ammo > 0 then return false end
    if osClock() - combat.ReloadedAt < (tonumber(map[78]) or 2) + xDTaraZ.Config.ReloadSlack then return false end
    local input = xDTaraZ.Combat.Behavior()
    if not (input and type(input.BeginReload) == "function") then return false end
    combat.ReloadedAt = osClock()
    local ok, err = pcall(xDTaraZ.Library.Compat.Call, input.BeginReload, input)
    if not ok and not tostring(err):find("timed out", 1, true) then warn("[AirDropArena] reload:", err) end
    return true
end

function xDTaraZ.Combat.Clear()
    local state = xDTaraZ.State
    state.Target, state.AimHead, state.AimBody, state.AimEntity, state.LockPart, state.LockedTarget = nil, nil, nil, nil, nil, nil
end

function xDTaraZ.Combat.Step()
    local opts, state = xDTaraZ.State, xDTaraZ.Options
    xDTaraZ.Combat.UpdateCircles()

    local active = xDTaraZ.Combat.Aiming() or opts.Aimbot or opts.Triggerbot
    if not (active and xDTaraZ.Player.InBattle()) then
        xDTaraZ.Combat.Clear()
        xDTaraZ.Combat.Fire(false)
        return
    end

    local target, part, aimPos
    if opts.Ragebot then
        target, part, aimPos = xDTaraZ.Target.Pick(xDTaraZ.Target.Profile("Rage"), state.LockedTarget)
    elseif opts.SilentAim then
        target, part, aimPos = xDTaraZ.Target.Pick(xDTaraZ.Target.Profile("Silent"), state.LockedTarget)
    end
    
    state.AimHead = target and xDTaraZ.Target.Part(target, "Head", Workspace.CurrentCamera.CFrame.Position)
    state.AimBody = target and xDTaraZ.Target.Part(target, "Torso", Workspace.CurrentCamera.CFrame.Position)
    state.AimEntity = target and target:GetAttribute("EntityId")
    state.Target = target

    local locked = state.LockPart and state.LockPart.Parent
    local newAimPos = opts.Aimbot and xDTaraZ.Target.Lock(locked)
    if newAimPos then
        state.LockPart = xDTaraZ.Target.Part(state.Target, opts.AimBone, Workspace.CurrentCamera.CFrame.Position)
    else
        state.LockPart = nil
    end

    local trigger = opts.Triggerbot and xDTaraZ.Combat.TriggerWant()
    local held = xDTaraZ.Combat.HeldGun()
    local empty = held ~= nil and rawget(held, "ammo") == 0
    
    local shouldFire = not empty and ((target ~= nil and opts.Ragebot) or trigger == true)
    xDTaraZ.Combat.Fire(shouldFire)
end

function xDTaraZ.Combat.OnServer(packet)
    if type(packet) ~= "table" or type(packet[2]) ~= "table" then return end
    local id, body = packet[1], packet[2]
    if id == xDTaraZ.Proto.Blaster_BulletHitNotify then
        if body.killerEntityId ~= xDTaraZ.Player.EntityId() then return end
        xDTaraZ.State.Hits += 1
        xDTaraZ.Damage.OnHit(body.targetEntityId)
    elseif id == xDTaraZ.Proto.Battlefield_EntityDeathNotify then
        local mine = body.killerEntityId == xDTaraZ.Player.EntityId()
        if mine then xDTaraZ.State.Kills += 1 end
        xDTaraZ.Damage.OnDeath(body.entityId, mine)
    elseif id == xDTaraZ.Config.NoticeProto then
        xDTaraZ.Hunt.OnNotice(body.context)
    elseif id == xDTaraZ.Proto.Battlefield_S2CCustomSyncNotify then
        xDTaraZ.Loot.OnSync(body)
    end
end

-- УЛУЧШЕНО: Экспоненциальное сглаживание для Aimbot
function xDTaraZ.Combat.LockCamera()
    local aimPos = xDTaraZ.State.LockPart and xDTaraZ.Target.GetAimPosition(xDTaraZ.State.LockPart, Workspace.CurrentCamera.CFrame.Position)
    if not (xDTaraZ.Options.Aimbot and xDTaraZ.State.LockPart and xDTaraZ.State.LockPart.Parent and aimPos) then 
        xDTaraZ.State.LockedTarget = nil
        return 
    end
    
    local cam = Workspace.CurrentCamera
    local origin = cam.CFrame.Position
    local want = (aimPos - origin).Unit
    local current = cam.CFrame.LookVector
    
    local opts = xDTaraZ.Options
    local smooth = math.max(opts.AimSmooth, 1)
    local dt = task.wait() or 0.016
    
    local look
    if opts.AimSmoothType == "Exponential" then
        local alpha = 1 - math.exp(-smooth * dt * 15)
        look = current:Lerp(want, math.clamp(alpha, 0, 1)).Unit
    else
        look = current:Lerp(want, 1 / smooth).Unit
    end
    
    cam.CFrame = cframeLookAt(origin, origin + look)
    
    if opts.AimSticky and xDTaraZ.State.Target then
        xDTaraZ.State.LockedTarget = xDTaraZ.State.Target
    end
end

function xDTaraZ.Combat.Rest()
    xDTaraZ.Combat.Clear()
    xDTaraZ.Combat.Fire(false)
    xDTaraZ.Combat.UpdateCircles()
end

function xDTaraZ.Combat.Start()
    RunService:BindToRenderStep("xDTaraZAim", xDTaraZ.Config.AimRenderPriority, xDTaraZ.Combat.LockCamera)
    xDTaraZ:Connect(RunService.Heartbeat, function()
        local ok, err = pcall(xDTaraZ.Combat.Step)
        if ok then
            xDTaraZ.Faults.Clear("Combat")
        else
            xDTaraZ.Faults.Report("Combat", err, xDTaraZ.Config.CombatToggles, xDTaraZ.Combat.Rest)
        end
    end)
    if GameLib.Main then xDTaraZ:Connect(GameLib.Main.OnClientEvent, xDTaraZ.Combat.OnServer) end
end

function xDTaraZ.Combat.Unload()
    xDTaraZ.Combat.Fire(false)
    xDTaraZ.Combat.RemoveHook()
    pcall(RunService.UnbindFromRenderStep, RunService, "xDTaraZAim")
    for key, circle in pairs(xDTaraZ.Combat.Circles) do
        xDTaraZ.Combat.Circles[key] = nil
        if circle.Drawing then
            pcall(function() circle.Drawing:Remove() end)
        else
            circle.Ring:Destroy()
        end
    end
end

function xDTaraZ.Combat.GetStatus()
    local state = xDTaraZ.State
    local target = state.Target and xDTaraZ.Target.Label(state.Target) or "none"
    return string.format("Target: %s | Hits %d | Kills %d | Guns %d",
        target, state.Hits, state.Kills, xDTaraZ.Guns.Count)
end

xDTaraZ.Guns = {
    Known = setmetatable({}, { __mode = "k" }),
    Saved = setmetatable({}, { __mode = "k" }),
    Count = 0,
    LastScan = 0,
    Signature = "",
}

function xDTaraZ.Guns.Wanted()
    local opts = xDTaraZ.Options
    return opts.NoSpread or opts.NoRecoil or opts.InstantAds
end

function xDTaraZ.Guns.Scan()
    if not xDTaraZ.Caps.Gc then return end
    local known, count = xDTaraZ.Guns.Known, 0
    for _, entry in ipairs(Util.GetGc(true)) do
        if type(entry) == "table" and rawget(entry, "islocalplayer") == true and type(rawget(entry, "propMap")) == "table" then
            known[entry] = true
            count += 1
        end
    end
    xDTaraZ.Guns.Count = count
    xDTaraZ.Guns.LastScan = osClock()
end

function xDTaraZ.Guns.LoadoutSignature()
    local char = LocalPlayer.Character
    local folder = char and char:FindFirstChild("Blaster")
    if not folder then return "" end
    local names = {}
    for _, child in ipairs(folder:GetChildren()) do names[#names + 1] = child.Name end
    return table.concat(names, "|")
end

function xDTaraZ.Guns.Desired(id, base)
    local opts = xDTaraZ.Options
    if (id == 72 or id == 73) and opts.NoSpread then return 0 end
    if id == 82 and opts.InstantAds then return xDTaraZ.Config.AdsSpeed end
    return nil
end

local function NoRecoilRate() return 0 end
local function NoRecoil() end

function xDTaraZ.Guns.ApplyRecoil(blaster, saved)
    if xDTaraZ.Options.NoRecoil then
        if saved.Recoil then return end
        saved.Recoil = { rawget(blaster, "GetRecoilRate") or false, rawget(blaster, "Recoil") or false }
        rawset(blaster, "GetRecoilRate", NoRecoilRate)
        rawset(blaster, "Recoil", NoRecoil)
    elseif saved.Recoil then
        rawset(blaster, "GetRecoilRate", saved.Recoil[1] or nil)
        rawset(blaster, "Recoil", saved.Recoil[2] or nil)
        saved.Recoil = nil
    end
end

function xDTaraZ.Guns.Apply()
    local savedAll = xDTaraZ.Guns.Saved
    for blaster in pairs(xDTaraZ.Guns.Known) do
        local map = rawget(blaster, "propMap")
        if type(map) ~= "table" then continue end
        local saved = savedAll[blaster] or {}
        savedAll[blaster] = saved

        for _, id in ipairs(xDTaraZ.Config.ModProps) do
            local base = saved[id] or map[id]
            if type(base) ~= "number" then continue end
            local want = xDTaraZ.Guns.Desired(id, base)
            if want then
                saved[id], map[id] = base, want
            elseif saved[id] then
                map[id], saved[id] = saved[id], nil
            end
        end
        xDTaraZ.Guns.ApplyRecoil(blaster, saved)
    end
end

function xDTaraZ.Guns.Step()
    if not xDTaraZ.Guns.Wanted() and next(xDTaraZ.Guns.Saved) == nil then return end
    local signature = xDTaraZ.Guns.LoadoutSignature()
    if xDTaraZ.Guns.Wanted() and (signature ~= xDTaraZ.Guns.Signature or osClock() - xDTaraZ.Guns.LastScan > xDTaraZ.Config.GunScanInterval) then
        xDTaraZ.Guns.Signature = signature
        xDTaraZ.Guns.Scan()
    end
    xDTaraZ.Guns.Apply()
end

function xDTaraZ.Guns.Restore()
    for _, key in ipairs(xDTaraZ.Config.GunToggles) do
        xDTaraZ.Options[key] = false
    end
    xDTaraZ.Guns.Apply()
    table.clear(xDTaraZ.Guns.Saved)
end

xDTaraZ.Loot = { Marks = {} }

function xDTaraZ.Loot.Folder()
    return Workspace:FindFirstChild("DropItemFloder")
end

function xDTaraZ.Loot.Kind(model)
    if model.Name == "AirDrop" or model:GetAttribute("AirDropClientModel") then return "AirDrop" end
    local bagType = model:GetAttribute("BagType")
    if bagType == 20000 then return "Crate" end
    if bagType == 10000 or model:GetAttribute("ItemId") then return "Item" end
    return nil
end

function xDTaraZ.Loot.Label(model, kind)
    if kind == "Item" then
        local id = model:GetAttribute("ItemId")
        return id and xDTaraZ.ItemNames[id] or "Item"
    end
    return kind == "AirDrop" and "Air Drop" or "Crate"
end

function xDTaraZ.Loot.Manager()
    local cached = xDTaraZ.Loot.DropManager
    if cached or not xDTaraZ.Caps.Gc then return cached end
    for _, entry in ipairs(Util.GetGc(true)) do
        if type(entry) == "table" and rawget(entry, "dropItems") and type(rawget(entry, "BagController")) == "table" then
            xDTaraZ.Loot.DropManager = entry
            return entry
        end
    end
    return nil
end

function xDTaraZ.Loot.ItemConfig(configId)
    local items = GameLib.Configs.ItemConfig
    if not items then return nil end
    local ok, cfg = pcall(items.GetItemConfigById, items, configId)
    return ok and type(cfg) == "table" and cfg or nil
end

function xDTaraZ.Loot.Slots()
    if xDTaraZ.Loot.SlotMap then return xDTaraZ.Loot.SlotMap end
    local enum = GameLib.BagEnum
    local names, types = enum and enum.EquipMentPosMap, enum and enum.EquipMentPosToItemTypeMap
    if type(names) ~= "table" or type(types) ~= "table" then
        xDTaraZ.Loot.SlotMap = xDTaraZ.Config.GearSlots
        return xDTaraZ.Loot.SlotMap
    end
    local map = {}
    for name, pos in pairs(names) do
        local itemType = type(pos) == "number" and types[pos]
        if not itemType or name == "Min" or name == "Max" then continue end
        local entry = map[itemType] or { xDTaraZ.Config.SlotLabels[name] or name, {} }
        table.insert(entry[2], pos)
        map[itemType] = entry
    end
    xDTaraZ.Loot.SlotMap = map
    return map
end

function xDTaraZ.Loot.SlotLabels()
    local labels, seen = {}, {}
    for _, entry in pairs(xDTaraZ.Loot.Slots()) do
        if not seen[entry[1]] then
            seen[entry[1]] = true
            labels[#labels + 1] = entry[1]
        end
    end
    table.sort(labels)
    return labels
end

xDTaraZ.Loot.GunStats = {}

function xDTaraZ.Loot.Gun(itemId)
    local cache = xDTaraZ.Loot.GunStats
    if cache[itemId] ~= nil then return cache[itemId] or nil end
    local blasters = GameLib.Configs.BlasterConfig
    local ok, cfg = pcall(function() return blasters:GetBlasterConfigById(itemId) end)
    local att = ok and type(cfg) == "table" and cfg.attMap
    local ammo = ok and type(cfg) == "table" and type(cfg.bulletIds) == "table" and cfg.bulletIds or {}
    local stats = type(att) == "table" and tonumber(att[77]) and { tonumber(att[77]), tonumber(att[70]) or 60, tonumber(att[74]) or 1, ammo } or false
    cache[itemId] = stats
    return stats or nil
end

function xDTaraZ.Loot.Score(cfg)
    local mode = xDTaraZ.Options.GearScore
    local gun = mode ~= "Rarity" and xDTaraZ.Config.GunTypes[cfg.type] and xDTaraZ.Loot.Gun(cfg.id)
    if gun then
        local perShot = gun[1] * gun[3]
        return mode == "Damage per shot" and perShot or perShot * gun[2] / 60
    end
    return (cfg.quality or 0) * 1e7 + (cfg.value or 0)
end

function xDTaraZ.Loot.BuffKind(name)
    return type(name) == "string" and name:match("^([%a]+)%+") or nil
end

function xDTaraZ.Loot.Kinds()
    if xDTaraZ.Loot.KindLists then return table.unpack(xDTaraZ.Loot.KindLists) end
    local currencies, buffs, seen = {}, {}, {}
    for id = 1, xDTaraZ.Config.ItemScan do
        local cfg = xDTaraZ.Loot.ItemConfig(id)
        local name = cfg and cfg.name
        if type(name) ~= "string" or seen[name] or name:find("[\128-\255]") then continue end
        if cfg.type == xDTaraZ.Config.CurrencyType then
            seen[name] = true
            currencies[#currencies + 1] = name
        elseif cfg.type == xDTaraZ.Config.BuffType then
            local kind = xDTaraZ.Loot.BuffKind(name)
            if kind and not seen[kind] then
                seen[kind] = true
                buffs[#buffs + 1] = kind
            end
        end
    end
    xDTaraZ.Loot.KindLists = { currencies, buffs }
    return currencies, buffs
end

function xDTaraZ.Loot.WornScore(slots)
    local char = LocalPlayer.Character
    local weakest = math.huge
    for _, slot in ipairs(slots) do
        local worn = char and char:GetAttribute("EPos_" .. slot)
        if worn == nil then continue end
        local id = type(worn) == "string" and tonumber(worn:match("^I_(%d+)"))
        local cfg = id and id > 0 and xDTaraZ.Loot.ItemConfig(id)
        weakest = math.min(weakest, cfg and xDTaraZ.Loot.Score(cfg) or 0)
    end
    return weakest
end

function xDTaraZ.Loot.OnMap(bags)
    local present = {}
    for _, bag in pairs(bags) do
        for _, item in pairs(type(bag.itemMap) == "table" and bag.itemMap or {}) do present[item.configId] = true end
    end
    return present
end

function xDTaraZ.Loot.Feedable(cfg, present)
    local gun = xDTaraZ.Config.GunTypes[cfg.type] and xDTaraZ.Loot.Gun(cfg.id)
    if not gun or #gun[4] == 0 then return true end
    for _, ammo in ipairs(gun[4]) do
        if present[ammo] then return true end
    end
    return false
end

function xDTaraZ.Loot.Upgrades()
    local manager = xDTaraZ.Loot.Manager()
    local bags = manager and manager.BagController.bagMap
    if type(bags) ~= "table" then return {} end
    local wanted, slots = xDTaraZ.Options.LootGear, xDTaraZ.Loot.Slots()
    local present = xDTaraZ.Loot.OnMap(bags)
    local best = {}
    for bagUid, bag in pairs(bags) do
        for itemUid, item in pairs(type(bag.itemMap) == "table" and bag.itemMap or {}) do
            local cfg = xDTaraZ.Loot.ItemConfig(item.configId)
            local gear = cfg and slots[cfg.type]
            if not (gear and wanted[gear[1]] and xDTaraZ.Loot.Feedable(cfg, present)) then continue end
            local tried = xDTaraZ.State.Tried[itemUid]
            if tried and osClock() - tried < xDTaraZ.Config.LootRetry then continue end
            local score = xDTaraZ.Loot.Score(cfg)
            local top = best[cfg.type]
            if not top or score > top[4] then best[cfg.type] = { bagUid, itemUid, cfg.name, score } end
        end
    end

    local list = {}
    for itemType, pick in pairs(best) do
        if pick[4] > xDTaraZ.Loot.WornScore(slots[itemType][2]) then list[#list + 1] = pick end
    end
    return list
end

function xDTaraZ.Loot.TakeUpgrades()
    if not xDTaraZ.Player.InBattle() then return 0 end
    local got = 0
    for _, pick in ipairs(xDTaraZ.Loot.Upgrades()) do
        if xDTaraZ.Loot.Pick(pick[1], pick[2], pick[3]) then got += 1 end
    end
    xDTaraZ.State.Looted += got
    return got
end

function xDTaraZ.Loot.TakeValuables(types)
    local manager = xDTaraZ.Loot.Manager()
    local bags = manager and manager.BagController.bagMap
    if not (type(bags) == "table" and xDTaraZ.Player.InBattle()) then return 0 end
    local got = 0
    for bagUid, bag in pairs(bags) do
        for itemUid, item in pairs(type(bag.itemMap) == "table" and bag.itemMap or {}) do
            local cfg = xDTaraZ.Loot.ItemConfig(item.configId)
            if not cfg then continue end
            local opts = xDTaraZ.Options
            local wanted = (types.Currency and cfg.type == xDTaraZ.Config.CurrencyType and opts.LootCurrency[cfg.name])
                or (types.Buff and cfg.type == xDTaraZ.Config.BuffType and opts.LootBuffs[xDTaraZ.Loot.BuffKind(cfg.name) or ""])
            if not wanted then continue end
            if xDTaraZ.Loot.Pick(bagUid, itemUid, cfg.name) then got += 1 end
        end
    end
    xDTaraZ.State.Valuables += got
    return got
end

function xDTaraZ.Loot.AmmoWanted()
    local set, char = {}, LocalPlayer.Character
    for _, slot in ipairs(xDTaraZ.Config.GunSlots) do
        local worn = char and char:GetAttribute("EPos_" .. slot)
        local id = type(worn) == "string" and tonumber(worn:match("^I_(%d+)"))
        local gun = id and id > 0 and xDTaraZ.Loot.Gun(id)
        for _, ammo in ipairs(gun and gun[4] or {}) do set[ammo] = true end
    end
    return set
end

function xDTaraZ.Loot.TakeAmmo()
    local manager = xDTaraZ.Loot.Manager()
    local bags = manager and manager.BagController.bagMap
    if not (type(bags) == "table" and xDTaraZ.Player.InBattle()) then return 0 end
    local wanted, got = xDTaraZ.Loot.AmmoWanted(), 0
    for bagUid, bag in pairs(bags) do
        for itemUid, item in pairs(type(bag.itemMap) == "table" and bag.itemMap or {}) do
            if not wanted[item.configId] then continue end
            if xDTaraZ.Loot.Pick(bagUid, itemUid, xDTaraZ.ItemNames[item.configId]) then got += 1 end
            if got >= xDTaraZ.Config.AmmoBatch then return got end
        end
    end
    return got
end

function xDTaraZ.Loot.AmmoStep()
    if xDTaraZ.Options.AutoAmmo then xDTaraZ.Loot.TakeAmmo() end
end

function xDTaraZ.Loot.ValuablesStep()
    local opts = xDTaraZ.Options
    if not (opts.AutoValuables or opts.AutoBuffs) then return end
    xDTaraZ.Loot.TakeValuables({ Currency = opts.AutoValuables, Buff = opts.AutoBuffs })
end

function xDTaraZ.Loot.GearStep()
    if not xDTaraZ.Options.AutoGear then return end
    xDTaraZ.Loot.TakeUpgrades()
end

function xDTaraZ.Loot.Pick(bagUid, itemUid, name)
    local tried = xDTaraZ.State.Tried
    if tried[itemUid] and osClock() - tried[itemUid] < xDTaraZ.Config.LootRetry then return false end
    tried[itemUid] = osClock()
    if not xDTaraZ.Net.Send("DropItem_PickWorldItemReq", { bagUid = bagUid, itemUid = itemUid }) then return false end
    xDTaraZ.State.LastLoot = name or xDTaraZ.State.LastLoot
    return true
end

function xDTaraZ.Loot.EmptyAirDrops()
    local manager, folder = xDTaraZ.Loot.Manager(), xDTaraZ.Loot.Folder()
    local bags = manager and manager.BagController.bagMap
    if not (type(bags) == "table" and folder and GameLib.Configs.ItemConfig and xDTaraZ.Player.InBattle()) then return 0 end
    local got, taken = 0, {}
    for _, model in ipairs(folder:GetChildren()) do
        local bagUid = model:GetAttribute("BagUid")
        local bag = xDTaraZ.Loot.Kind(model) == "AirDrop" and bagUid and bags[bagUid]
        if not bag then continue end
        for itemUid, item in pairs(bag.itemMap) do
            local cfg = xDTaraZ.Loot.ItemConfig(item.configId)
            local gear = cfg and xDTaraZ.Loot.Slots()[cfg.type]
            if gear and (taken[cfg.type] or xDTaraZ.Loot.Score(cfg) <= xDTaraZ.Loot.WornScore(gear[2])) then continue end
            if xDTaraZ.Loot.Pick(bagUid, itemUid, cfg and cfg.name) then
                got += 1
                if gear then taken[cfg.type] = true end
            end
        end
    end
    xDTaraZ.State.AirDrops += got
    return got
end

function xDTaraZ.Loot.AirDropStep()
    if xDTaraZ.Options.AutoAirDrop then xDTaraZ.Loot.EmptyAirDrops() end
end

function xDTaraZ.Loot.OnSync(body)
    local timer = body.airdptime
    if type(timer) == "table" and type(timer.endstamp) == "number" then xDTaraZ.State.AirDropAt = timer.endstamp end
end

function xDTaraZ.Loot.Mark(model, kind)
    local gui = Instance.new("BillboardGui")
    gui.Name, gui.AlwaysOnTop, gui.Size, gui.StudsOffset = "xDTaraZLoot", true, UDim2.fromOffset(180, 20), vector3New(0, 2, 0)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency, label.Size, label.Font, label.TextSize = 1, UDim2.fromScale(1, 1), Enum.Font.GothamBold, 12
    label.TextColor3, label.TextStrokeTransparency = xDTaraZ.Config.LootColors[kind], 0.3
    label.Parent = gui
    gui.Adornee = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
    Util.Mount(gui)
    return { Gui = gui, Label = label }
end

function xDTaraZ.Loot.ClearMarks()
    for _, mark in pairs(xDTaraZ.Loot.Marks) do mark.Gui:Destroy() end
    table.clear(xDTaraZ.Loot.Marks)
end

function xDTaraZ.Loot.EspStep()
    local opts = xDTaraZ.Options
    local marks = xDTaraZ.Loot.Marks
    local show = { AirDrop = opts.LootEspAirDrop, Crate = opts.LootEspCrate, Item = opts.LootEspItem }
    if not (show.AirDrop or show.Crate or show.Item) then
        if next(marks) ~= nil then xDTaraZ.Loot.ClearMarks() end
        return
    end

    local folder, hrp = xDTaraZ.Loot.Folder(), xDTaraZ.Player.Root()
    local seen = {}
    if folder and hrp then
        for _, model in ipairs(folder:GetChildren()) do
            local kind = xDTaraZ.Loot.Kind(model)
            if not (kind and show[kind]) then continue end
            local dist = (model:GetPivot().Position - hrp.Position).Magnitude
            if dist > opts.LootEspRange and kind ~= "AirDrop" then continue end
            seen[model] = true
            marks[model] = marks[model] or xDTaraZ.Loot.Mark(model, kind)
            local opened = kind == "AirDrop" and model:GetAttribute("AirDropOpened") and " (opened)" or ""
            marks[model].Label.Text = string.format("%s%s [%dm]", xDTaraZ.Loot.Label(model, kind), opened, math.floor(dist))
        end
    end

    for model, mark in pairs(marks) do
        if not seen[model] then
            mark.Gui:Destroy()
            marks[model] = nil
        end
    end
end

xDTaraZ.Slide = { Skill = nil, LastScan = 0, Dir = nil }

function xDTaraZ.Slide.Find()
    local slide = xDTaraZ.Slide
    if slide.Skill then return slide.Skill end
    if not xDTaraZ.Caps.Gc or osClock() - slide.LastScan < xDTaraZ.Config.StatScanGap then return nil end
    slide.LastScan = osClock()
    for _, entry in ipairs(Util.GetGc(true)) do
        if type(entry) == "table" and rawget(entry, "slideRequestId") ~= nil and rawget(entry, "owner") and getmetatable(entry) then
            slide.Skill = entry
            return entry
        end
    end
    return nil
end

function xDTaraZ.Slide.OnHeartbeat()
    local slide = xDTaraZ.Slide
    local skill = xDTaraZ.Options.SuperSlide and xDTaraZ.Slide.Find()
    local hrp, hum = xDTaraZ.Player.Root(), xDTaraZ.Player.Humanoid()
    if not (skill and hrp and hum and rawget(skill, "slideActive")) then
        slide.Dir = nil
        return
    end
    if not slide.Dir then
        local move = hum.MoveDirection * vector3New(1, 0, 1)
        local look = Workspace.CurrentCamera.CFrame.LookVector * vector3New(1, 0, 1)
        slide.Dir = move.Magnitude > 0.1 and move.Unit or look.Unit
    end
    local vel, speed = hrp.AssemblyLinearVelocity, xDTaraZ.Options.SlideSpeed
    hrp.AssemblyLinearVelocity = vector3New(slide.Dir.X * speed, vel.Y, slide.Dir.Z * speed)
end

xDTaraZ.Movement = { Collided = {} }

function xDTaraZ.Movement.OnHeartbeat(dt)
    local opts = xDTaraZ.Options
    if not (opts.Speed or opts.Fly) then return end
    local hrp, hum = xDTaraZ.Player.Root(), xDTaraZ.Player.Humanoid()
    if not (hrp and hum) or hum.Health <= 0 then return end

    if opts.Fly then
        local vertical = 0
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vertical += 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vertical -= 1 end
        local dir = hum.MoveDirection + vector3New(0, vertical, 0)
        hrp.AssemblyLinearVelocity = dir.Magnitude > 0 and dir.Unit * opts.FlySpeed or Vector3.zero
        return
    end

    local extra = opts.SpeedValue - hum.WalkSpeed
    if extra > 0 and hum.MoveDirection.Magnitude > 0 then
        hrp.CFrame += hum.MoveDirection * extra * dt
    end
end

function xDTaraZ.Movement.OnStepped()
    local saved = xDTaraZ.Movement.Collided
    local char = LocalPlayer.Character
    if not xDTaraZ.Options.Noclip then
        if next(saved) == nil then return end
        for part in pairs(saved) do
            if part.Parent then part.CanCollide = true end
        end
        table.clear(saved)
        return
    end
    if not char then return end
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") and part.CanCollide then
            saved[part] = true
            part.CanCollide = false
        end
    end
end

function xDTaraZ.Movement.OnJumpRequest()
    if not xDTaraZ.Options.InfiniteJump then return end
    local hum = xDTaraZ.Player.Humanoid()
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end

function xDTaraZ.Movement.Start()
    xDTaraZ:Connect(RunService.Heartbeat, xDTaraZ.Movement.OnHeartbeat)
    xDTaraZ:Connect(RunService.Heartbeat, xDTaraZ.Slide.OnHeartbeat)
    xDTaraZ:Connect(RunService.Stepped, xDTaraZ.Movement.OnStepped)
    xDTaraZ:Connect(UserInputService.JumpRequest, xDTaraZ.Movement.OnJumpRequest)
end

function xDTaraZ.Movement.StopFly()
    local hrp = xDTaraZ.Player.Root()
    if hrp then hrp.AssemblyLinearVelocity = Vector3.zero end
end

xDTaraZ.World = { Saved = nil, FovSaved = nil }

function xDTaraZ.World.Step()
    local saved = xDTaraZ.World.Saved
    if xDTaraZ.Options.Fullbright then
        if not saved then
            xDTaraZ.World.Saved = { Lighting.Brightness, Lighting.ClockTime, Lighting.FogEnd, Lighting.GlobalShadows, Lighting.Ambient }
        end
        Lighting.Brightness, Lighting.ClockTime, Lighting.FogEnd = 2, 14, 1e6
        Lighting.GlobalShadows, Lighting.Ambient = false, Color3.fromRGB(178, 178, 178)
    elseif saved then
        Lighting.Brightness, Lighting.ClockTime, Lighting.FogEnd, Lighting.GlobalShadows, Lighting.Ambient = table.unpack(saved)
        xDTaraZ.World.Saved = nil
    end
end

function xDTaraZ.World.OnRender()
    local cam = Workspace.CurrentCamera
    if xDTaraZ.Options.CameraFov then
        xDTaraZ.World.FovSaved = xDTaraZ.World.FovSaved or cam.FieldOfView
        cam.FieldOfView = xDTaraZ.Options.CameraFovValue
    elseif xDTaraZ.World.FovSaved then
        cam.FieldOfView = xDTaraZ.World.FovSaved
        xDTaraZ.World.FovSaved = nil
    end
end

function xDTaraZ.World.OnIdled()
    if not xDTaraZ.Options.AntiAfk then return end
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.zero)
end

function xDTaraZ.World.Rejoin()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end

function xDTaraZ.World.Hop()
    local body = Util.HttpGet(("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100"):format(game.PlaceId))
    local ok, list = pcall(HttpService.JSONDecode, HttpService, body)
    for _, server in ipairs(ok and list.data or {}) do
        if server.id ~= game.JobId and server.playing < server.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
            return true
        end
    end
    return false
end

function xDTaraZ.World.Body(name)
    local plr = name and Players:FindFirstChild(name)
    local char = plr and plr.Character
    if not (char and char:FindFirstChild("HumanoidRootPart")) then return nil end
    return char
end

function xDTaraZ.World.TeleportTo(name)
    local char, root = xDTaraZ.World.Body(name), xDTaraZ.Player.Root()
    if not (char and root) then return false end
    root.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, xDTaraZ.Config.TeleportBehind)
    return true
end

function xDTaraZ.World.Spectate(name)
    local cam = Workspace.CurrentCamera
    local char = name and xDTaraZ.World.Body(name)
    local hum = char and char:FindFirstChildOfClass("Humanoid") or xDTaraZ.Player.Humanoid()
    if cam and hum then cam.CameraSubject = hum end
end

xDTaraZ.Respawn = {}

function xDTaraZ.Respawn.Now()
    local state = xDTaraZ.State
    if osClock() - state.LastRespawn < xDTaraZ.Config.RespawnGap then return false end
    state.LastRespawn = osClock()
    return xDTaraZ.Net.Send("Battlefield_DeployReq")
end

function xDTaraZ.Respawn.Step()
    local state = xDTaraZ.State
    if not xDTaraZ.Player.IsSoul() then
        state.SoulSince = nil
        return
    end
    state.SoulSince = state.SoulSince or osClock()
    if not xDTaraZ.Options.InstantRespawn or osClock() - state.SoulSince < xDTaraZ.Options.RespawnDelay then return end
    xDTaraZ.Respawn.Now()
end

function xDTaraZ.Respawn.Rejoin()
    local char = LocalPlayer.Character
    if not xDTaraZ.Options.AutoRejoin or not (char and char:GetAttribute("EntityState") == 0) then
        xDTaraZ.Farm.LobbySince = nil
        return
    end
    xDTaraZ.Farm.LobbySince = xDTaraZ.Farm.LobbySince or osClock()
    if osClock() - xDTaraZ.Farm.LobbySince > xDTaraZ.Config.LobbyRejoin then xDTaraZ.Respawn.Now() end
end

function xDTaraZ.Respawn.Watch(char)
    if xDTaraZ.Respawn.Conn then xDTaraZ.Respawn.Conn:Disconnect() end
    xDTaraZ.Respawn.Conn = char:GetAttributeChangedSignal("EntityState"):Connect(function()
        xDTaraZ.Heal.Stats, xDTaraZ.Slide.Skill, xDTaraZ.Combat.Input = nil, nil, nil
        xDTaraZ.Respawn.Step()
    end)
end

xDTaraZ.Heal = { Stats = nil, LastScan = 0, LastHeal = 0, Healed = 0 }

function xDTaraZ.Heal.Player()
    local heal = xDTaraZ.Heal
    if heal.Stats and type(rawget(heal.Stats, "curHp")) == "number" then return heal.Stats end
    if not xDTaraZ.Caps.Gc or osClock() - heal.LastScan < xDTaraZ.Config.StatScanGap then return nil end
    heal.LastScan = osClock()
    for _, entry in ipairs(Util.GetGc(true)) do
        if type(entry) == "table" and type(rawget(entry, "curHp")) == "number" and rawget(entry, "maxSp") ~= nil then
            heal.Stats = entry
            return entry
        end
    end
    return nil
end

function xDTaraZ.Heal.Health()
    local stats = xDTaraZ.Heal.Player()
    if not stats then return nil end
    return stats.curHp, stats.maxHp
end

function xDTaraZ.Heal.Values()
    local cached = xDTaraZ.Heal.Cache
    if cached then return cached end
    local medicine = GameLib.Configs.MedicineConfig
    local values = {}
    for id, entry in pairs(type(medicine) == "table" and type(medicine.datamap) == "table" and medicine.datamap or {}) do
        if type(entry) == "table" and type(entry.value) == "number" then values[id] = entry.value end
    end
    xDTaraZ.Heal.Cache = values
    return values
end

function xDTaraZ.Heal.Names()
    local names = {}
    for id in pairs(xDTaraZ.Heal.Values()) do
        if xDTaraZ.Loot.ItemConfig(id) then names[#names + 1] = xDTaraZ.ItemNames[id] end
    end
    table.sort(names)
    return names
end

function xDTaraZ.Heal.PickMed(missing, urgent)
    local manager = xDTaraZ.Loot.Manager()
    local bags = manager and manager.BagController.bagMap
    if type(bags) ~= "table" then return nil end
    local values, tried, allowed = xDTaraZ.Heal.Values(), xDTaraZ.State.Tried, xDTaraZ.Options.HealMeds
    local best, bestScore
    for bagUid, bag in pairs(bags) do
        for itemUid, item in pairs(type(bag.itemMap) == "table" and bag.itemMap or {}) do
            local heal = values[item.configId]
            if not heal or not allowed[xDTaraZ.ItemNames[item.configId]] or (tried[itemUid] and osClock() - tried[itemUid] < xDTaraZ.Config.LootRetry) then continue end
            local score = urgent and -heal or math.abs(missing - heal)
            if not bestScore or score < bestScore then best, bestScore = { bagUid, itemUid, item.configId }, score end
        end
    end
    if best then best[3] = xDTaraZ.ItemNames[best[3]] end
    return best
end

function xDTaraZ.Heal.Now()
    local hp, maxHp = xDTaraZ.Heal.Health()
    if not (hp and maxHp and hp < maxHp and xDTaraZ.Player.InBattle()) then return false end
    local urgent = hp / maxHp * 100 <= xDTaraZ.Config.HealUrgent
    local med = xDTaraZ.Heal.PickMed(maxHp - hp, urgent)
    if not (med and xDTaraZ.Loot.Pick(med[1], med[2], med[3])) then return false end
    xDTaraZ.Heal.LastHeal = osClock()
    xDTaraZ.Heal.Healed += 1
    return true
end

function xDTaraZ.Heal.Step()
    if not xDTaraZ.Options.AutoHeal then return end
    if osClock() - xDTaraZ.Heal.LastHeal < xDTaraZ.Config.HealGap then return end
    local hp, maxHp = xDTaraZ.Heal.Health()
    if not (hp and maxHp) or hp / maxHp * 100 > xDTaraZ.Options.HealAt then return end
    xDTaraZ.Heal.Now()
end

function xDTaraZ.Heal.GetStatus()
    local hp, maxHp = xDTaraZ.Heal.Health()
    if not hp then return "HP unknown" end
    return string.format("HP %d/%d | Meds used %d", math.floor(hp), math.floor(maxHp), xDTaraZ.Heal.Healed)
end

xDTaraZ.Hunt = { LastSeen = 0, Jumps = 0, PausedUntil = 0, Desyncs = 0 }

function xDTaraZ.Hunt.Nearest()
    local hrp = xDTaraZ.Player.Root()
    if not hrp then return nil end
    local best, bestDist
    for _, model in ipairs(xDTaraZ.Target.Candidates()) do
        local root = xDTaraZ.Target.IsEnemy(model) and model:FindFirstChild("HumanoidRootPart")
        if not root then continue end
        local dist = (root.Position - hrp.Position).Magnitude
        if not bestDist or dist < bestDist then best, bestDist = model, dist end
    end
    return best
end

function xDTaraZ.Hunt.Step()
    if not (xDTaraZ.Options.Hunt and xDTaraZ.Player.InBattle()) then return end
    if xDTaraZ.State.Target then
        xDTaraZ.Hunt.LastSeen = osClock()
        return
    end
    local opts, hunt = xDTaraZ.Options, xDTaraZ.Hunt
    if osClock() - hunt.LastSeen < opts.HuntIdle or osClock() < hunt.PausedUntil then return end
    local enemy, hrp = xDTaraZ.Hunt.Nearest(), xDTaraZ.Player.Root()
    if not (enemy and hrp) then return end
    local root = enemy.HumanoidRootPart
    local facing = root.CFrame.LookVector * vector3New(1, 0, 1)
    facing = facing.Magnitude > 0.1 and facing.Unit or vector3New(1, 0, 0)
    local offset = (opts.HuntMode == "Front" and facing or opts.HuntMode == "Above" and Vector3.zero or -facing) * opts.HuntDistance
    local goal = root.Position + offset + vector3New(0, opts.HuntHeight, 0)
    local delta = goal - hrp.Position
    local partial = opts.HuntMaxWarp > 0 and delta.Magnitude > opts.HuntMaxWarp
    if partial then goal = hrp.Position + delta.Unit * opts.HuntMaxWarp end
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.CFrame = cframeLookAt(goal, root.Position)
    if not partial then hunt.LastSeen = osClock() end
    hunt.Jumps += 1
end

function xDTaraZ.Hunt.OnNotice(text)
    if type(text) ~= "string" or not text:find("out of sync", 1, true) then return end
    xDTaraZ.Hunt.PausedUntil = osClock() + xDTaraZ.Config.HuntSyncPause
    xDTaraZ.Hunt.Desyncs += 1
end

xDTaraZ.Farm = { Bag = nil, Start = nil, Totals = {}, LobbySince = nil }

function xDTaraZ.Farm.CurrencyBag()
    local farm = xDTaraZ.Farm
    if farm.Bag and type(rawget(farm.Bag, "itemMap")) == "table" then return farm.Bag end
    if not xDTaraZ.Caps.Gc then return nil end
    for _, entry in ipairs(Util.GetGc(true)) do
        if type(entry) == "table" and rawget(entry, "bagType") == xDTaraZ.Config.CurrencyType and type(rawget(entry, "itemMap")) == "table" and rawget(entry, "controller") then
            farm.Bag = entry
            return entry
        end
    end
    return nil
end

function xDTaraZ.Farm.Sample()
    local bag = xDTaraZ.Farm.CurrencyBag()
    if not bag then return end
    local totals = {}
    for _, item in pairs(bag.itemMap) do totals[xDTaraZ.ItemNames[item.configId]] = item.num end
    xDTaraZ.Farm.Totals = totals
    if not xDTaraZ.Farm.Start then xDTaraZ.Farm.Start = { osClock(), table.clone(totals), xDTaraZ.State.Kills } end
end

function xDTaraZ.Farm.GetStatus()
    local start = xDTaraZ.Farm.Start
    if not start then return "-" end
    local hours = math.max(osClock() - start[1], 60) / 3600
    local seen, names, parts = {}, {}, {}
    for _, totals in ipairs({ xDTaraZ.Farm.Totals, start[2] }) do
        for name in pairs(totals) do
            if not seen[name] then seen[name] = true table.insert(names, name) end
        end
    end
    table.sort(names)
    for _, name in ipairs(names) do
        local gained = (xDTaraZ.Farm.Totals[name] or 0) - (start[2][name] or 0)
        parts[#parts + 1] = string.format("%s +%d (%d/h)", name, gained, math.floor(gained / hours))
    end
    local kills = xDTaraZ.State.Kills - start[3]
    parts[#parts + 1] = string.format("Kills %d (%d/h)", kills, math.floor(kills / hours))
    return table.concat(parts, " | ")
end

xDTaraZ.Rewards = { Owner = nil, Services = {}, Pending = {}, Claimed = 0, Last = "-" }

function xDTaraZ.Rewards.Data()
    local rewards = xDTaraZ.Rewards
    local cached = rewards.Owner
    if cached and type(rawget(cached, "Task")) == "table" then return cached end
    if not xDTaraZ.Caps.Gc then return nil end
    for _, entry in ipairs(Util.GetGc(true)) do
        local tasks = type(entry) == "table" and rawget(entry, "Task")
        if type(tasks) == "table" and rawget(tasks, "player") == entry and type(rawget(entry, "Season")) == "table" then
            rewards.Owner = entry
            return entry
        end
    end
    return nil
end

function xDTaraZ.Rewards.Service(method)
    local services = xDTaraZ.Rewards.Services
    if services[method] then return services[method] end
    if not xDTaraZ.Caps.Gc then return nil end
    for _, entry in ipairs(Util.GetGc(true)) do
        if type(entry) == "table" and type(rawget(entry, method)) == "function" then
            services[method] = entry
            return entry
        end
    end
    return nil
end

function xDTaraZ.Rewards.Count(itemId)
    local data = xDTaraZ.Rewards.Data()
    local ok, count = pcall(function() return data:GetItemNum(itemId) end)
    return ok and tonumber(count) or 0
end

function xDTaraZ.Rewards.Tasks(data)
    local tasks, sent = data.Task, 0
    local done = GameLib.TaskState.done
    local ok, newbie = pcall(tasks.GetCanRewardTaskId, tasks)
    if ok and type(newbie) == "table" and #newbie > 0 and xDTaraZ.Net.Send("Task_ReceiveNewbieTaskReq", newbie) then sent += 1 end

    for _, kind in pairs(type(tasks.taskList) == "table" and tasks.taskList or {}) do
        for taskId, info in pairs(kind) do
            if type(info) ~= "table" or info.state ~= done then continue end
            if xDTaraZ.Net.Send("Task_ReceiveTaskAwardReq", { taskId = taskId }) then sent += 1 end
        end
    end
    pcall(tasks.ReceiveWeekReward, tasks)
    return sent
end

function xDTaraZ.Rewards.Season(data)
    local season, sent = data.Season, 0
    local done = GameLib.TaskState.done
    local list = type(season.seasonTask) == "table" and season.seasonTask.taskList
    for _, kind in pairs(type(list) == "table" and list or {}) do
        for taskId, info in pairs(kind) do
            if type(info) == "table" and info.state == done and xDTaraZ.Net.Send("Season_ReceiveTask", taskId) then sent += 1 end
        end
    end

    local ok, can = pcall(season.GetCanReceivePassAward, season)
    if ok and can and xDTaraZ.Net.Send("Season_RequireReceiveAllAward", {}) then sent += 1 end

    local rank = xDTaraZ.Rewards.Service("ReceiveRankAward")
    local okLv, rankLv = pcall(season.GetRankLv, season)
    for lv = 1, okLv and tonumber(rankLv) or 0 do
        local open, state = pcall(season.CanReceiveRankLv, season, lv)
        if not (open and state and rank) then continue end
        if pcall(rank.ReceiveRankAward, rank, lv) then sent += 1 end
    end
    return sent
end

function xDTaraZ.Rewards.Daily(data, kinds)
    local sent, now = 0, Workspace:GetServerTimeNow()
    local online = data.Online
    local gifts = kinds["Online gifts"] and type(online.receiveStateList) == "table" and online.receiveStateList or {}
    for index, gift in ipairs(gifts) do
        if gift.receiveState or (gift.timeStamp or math.huge) > now then continue end
        if xDTaraZ.Net.Send("Online_ReceiveGiftReq", { receiveIdx = index }) then sent += 1 end
    end

    local sign = data.SignIn
    local okDay, day = pcall(sign.GetSignDay, sign)
    local info = type(sign.sign_day_info) == "table" and sign.sign_day_info
    if kinds["Sign-in"] and okDay and tonumber(day) and info and not info[day] and xDTaraZ.Net.Send("Sign_RequireSigned", { signDay = day }) then sent += 1 end

    local update = data.GameUpdate
    local okAward, award = pcall(update.GetUpdateVerAward, update)
    if kinds["Update gift"] and okAward and award and pcall(update.ReqReceiveCurVerAward, update) then sent += 1 end
    return sent
end

function xDTaraZ.Rewards.ClaimAll()
    local data = xDTaraZ.Rewards.Data()
    if not data then return 0 end
    local sent, kinds = 0, xDTaraZ.Options.ClaimKinds
    local steps = {
        { kinds.Tasks, xDTaraZ.Rewards.Tasks },
        { kinds.Season, xDTaraZ.Rewards.Season },
        { kinds["Online gifts"] or kinds["Sign-in"] or kinds["Update gift"], xDTaraZ.Rewards.Daily },
        { kinds.Lottery, xDTaraZ.Rewards.Lottery },
    }
    for _, entry in ipairs(steps) do
        if not entry[1] then continue end
        local ok, got = pcall(entry[2], data, kinds)
        if ok then sent += got else warn("[AirDropArena] claim:", got) end
    end
    xDTaraZ.Rewards.Claimed += sent
    if sent > 0 then xDTaraZ.Rewards.Last = os.date("%H:%M") .. " +" .. sent end
    return sent
end

function xDTaraZ.Rewards.RedeemCodes()
    local codes = GameLib.Configs.CodeConfig
    local ok, keys = pcall(function() return codes:GetListKey() end)
    if not (ok and type(keys) == "table") then return 0, 0 end
    local paid, gold = 0, 0
    for _, code in ipairs(keys) do
        local before = xDTaraZ.Rewards.Count(xDTaraZ.Config.GoldId)
        if not xDTaraZ.Net.Send("PlayerChat_C2SCode", code) then break end
        task.wait(xDTaraZ.Config.CodeGap)
        local gained = xDTaraZ.Rewards.Count(xDTaraZ.Config.GoldId) - before
        if gained > 0 then paid, gold = paid + 1, gold + gained end
    end
    return paid, gold
end

function xDTaraZ.Rewards.Boxes()
    if xDTaraZ.Rewards.BoxList then return xDTaraZ.Rewards.BoxList end
    local shop, list = GameLib.Configs.ShopConfig, {}
    for id = xDTaraZ.Config.BoxIds[1], xDTaraZ.Config.BoxIds[2] do
        local ok, cfg = pcall(function() return shop:GetSkinLotteryConfigById(id) end)
        if ok and type(cfg) == "table" then list[#list + 1] = { id, xDTaraZ.ItemNames[id], tonumber(cfg.coinVal) or 0 } end
    end
    xDTaraZ.Rewards.BoxList = list
    return list
end

function xDTaraZ.Rewards.OpenBoxes()
    local opened = 0
    local allowed = xDTaraZ.Options.OpenBoxList
    for _, box in ipairs(xDTaraZ.Rewards.Boxes()) do
        if not allowed[box[2]] then continue end
        local owned = xDTaraZ.Rewards.Count(box[1])
        for _ = 1, math.min(owned, xDTaraZ.Config.OpenBatch) do
            if not xDTaraZ.Net.Send("Bag_C2SOpenSkinBoxReq", { id = box[1], num = 1 }) then return opened end
            opened += 1
            task.wait(xDTaraZ.Config.OpenGap)
        end
    end
    return opened
end

function xDTaraZ.Rewards.BuyBoxes()
    local opts, bought = xDTaraZ.Options, 0
    local box
    for _, entry in ipairs(xDTaraZ.Rewards.Boxes()) do
        if entry[2] == opts.BuyBox and entry[3] > 0 then box = entry end
    end
    if not box then return 0 end
    local spare = xDTaraZ.Rewards.Count(xDTaraZ.Config.GoldId) - opts.KeepGold
    local amount = math.min(opts.BuyAmount, math.floor(spare / box[3]))
    for _ = 1, amount do
        if not xDTaraZ.Net.Send("Bag_C2SBuySkinBoxReq", { id = box[1], num = 1 }) then break end
        bought += 1
        task.wait(xDTaraZ.Config.OpenGap)
    end
    return bought
end

function xDTaraZ.Rewards.Lottery(data)
    local lottery = data and data.Lottery
    if type(lottery) ~= "table" then return 0 end
    local sent = 0
    local today = type(lottery.datamap) == "table" and lottery.datamap.listarray
    local picks = {}
    for pos, slot in ipairs(type(today) == "table" and today or {}) do
        if type(slot) == "table" and not slot.lock and slot.value == -1 then
            picks[#picks + 1] = { pos = pos, value = math.random(0, 9) }
        end
    end
    if #picks > 0 and xDTaraZ.Net.Send("Lottery_C2SCustom", { action = "SetTicket", data = picks }) then sent += #picks end

    for _, draw in ipairs(type(lottery.history) == "table" and lottery.history or {}) do
        if type(draw) ~= "table" or draw.isclaim or not draw.id then continue end
        if xDTaraZ.Net.Send("Lottery_C2SCustom", { action = "ClaimReward", data = { id = draw.id } }) then sent += 1 end
    end
    return sent
end

function xDTaraZ.Rewards.Request(action)
    xDTaraZ.Rewards.Pending[action] = true
end

function xDTaraZ.Rewards.Step()
    local rewards, opts = xDTaraZ.Rewards, xDTaraZ.Options
    local pending = rewards.Pending
    local now = osClock()
    if pending.Claim or (opts.AutoClaim and now - (rewards.LastClaim or 0) > xDTaraZ.Config.ClaimGap) then
        pending.Claim, rewards.LastClaim = nil, now
        xDTaraZ.UI.Queue("Rewards", ("Claimed %d rewards"):format(rewards.ClaimAll()))
    end
    if pending.Codes then
        pending.Codes = nil
        local paid, gold = rewards.RedeemCodes()
        xDTaraZ.UI.Queue("Codes", paid > 0 and ("%d codes worked, +%d gold"):format(paid, gold) or "No code paid out (all used or expired)")
    end
    if pending.Open or opts.AutoOpenBoxes then
        local manual = pending.Open
        pending.Open = nil
        local opened = rewards.OpenBoxes()
        if manual or opened > 0 then xDTaraZ.UI.Queue("Boxes", ("Opened %d boxes"):format(opened)) end
    end
    if pending.Buy then
        pending.Buy = nil
        xDTaraZ.UI.Queue("Boxes", ("Bought %d boxes"):format(rewards.BuyBoxes()))
    end
end

function xDTaraZ.Rewards.GetStatus()
    return ("Sent %d | Last %s"):format(xDTaraZ.Rewards.Claimed, xDTaraZ.Rewards.Last)
end

xDTaraZ.Admin = { Seen = {} }

function xDTaraZ.Admin.Find()
    local list = GameLib.AdminIds
    if type(list) ~= "table" then return nil end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and list[player.UserId] then return player.Name end
    end
    return nil
end

function xDTaraZ.Admin.Step()
    local opts = xDTaraZ.Options
    if not (opts.AdminAlert or opts.AdminHop) then return end
    local name = xDTaraZ.Admin.Find()
    if not name then return end
    if not xDTaraZ.Admin.Seen[name] then
        xDTaraZ.Admin.Seen[name] = true
        xDTaraZ.UI.Queue("Mario Hub", "Staff in server: " .. name)
    end
    if opts.AdminHop then xDTaraZ.World.Hop() end
end

xDTaraZ.Damage = { Hits = {}, Last = {}, Samples = {} }

function xDTaraZ.Damage.HitsToKill()
    local samples = xDTaraZ.Damage.Samples
    if #samples == 0 then
        local char = LocalPlayer.Character
        local worn = char and char:GetAttribute("EPos_1")
        local id = type(worn) == "string" and tonumber(worn:match("^I_(%d+)"))
        local gun = id and xDTaraZ.Loot.Gun(id)
        return gun and math.max(1, math.ceil(xDTaraZ.Config.BaseHp / gun[1])) or 5
    end
    local total = 0
    for _, n in ipairs(samples) do total += n end
    return total / #samples
end

function xDTaraZ.Damage.OnHit(entityId)
    local damage = xDTaraZ.Damage
    damage.Hits[entityId] = (damage.Hits[entityId] or 0) + 1
    damage.Last[entityId] = osClock()
end

function xDTaraZ.Damage.OnDeath(entityId, mine)
    local damage = xDTaraZ.Damage
    local hits = damage.Hits[entityId]
    damage.Hits[entityId], damage.Last[entityId] = nil, nil
    if not (mine and hits and hits > 0) then return end
    table.insert(damage.Samples, hits)
    if #damage.Samples > xDTaraZ.Config.KillSamples then table.remove(damage.Samples, 1) end
end

function xDTaraZ.Damage.Fraction(entityId)
    local damage = xDTaraZ.Damage
    local hits = entityId and damage.Hits[entityId]
    if not hits then return 1 end
    if osClock() - damage.Last[entityId] > xDTaraZ.Config.HitForget then
        damage.Hits[entityId], damage.Last[entityId] = nil, nil
        return 1
    end
    return math.clamp(1 - hits / xDTaraZ.Damage.HitsToKill(), 0.05, 1)
end

xDTaraZ.Esp = { Count = 0 }

function xDTaraZ.Esp.Targets()
    local list = {}
    for _, model in ipairs(xDTaraZ.Target.Candidates(true)) do
        local hum = model:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then continue end
        list[#list + 1] = {
            Model = model,
            Name = xDTaraZ.Target.Label(model),
            Health = math.floor(xDTaraZ.Damage.Fraction(model:GetAttribute("EntityId")) * xDTaraZ.Config.BaseHp),
            MaxHealth = xDTaraZ.Config.BaseHp,
            Friendly = xDTaraZ.Target.SameTeam(model),
            Root = model:FindFirstChild("HumanoidRootPart"),
        }
    end
    xDTaraZ.Esp.Count = #list
    return list
end

function xDTaraZ.Esp.GetStatus()
    local visuals = xDTaraZ.Library and xDTaraZ.Library.Visuals
    if not (visuals and visuals:Get("Enabled")) then return "Off" end
    return xDTaraZ.Esp.Count .. " targets"
end

xDTaraZ.Faults = { Streaks = {} }

function xDTaraZ.Faults.Clear(name)
    xDTaraZ.Faults.Streaks[name] = nil
end

function xDTaraZ.Faults.Wanted(toggles)
    for _, key in ipairs(toggles) do
        if xDTaraZ.Options[key] then return true end
    end
    return false
end

function xDTaraZ.Faults.Stop(name, err, toggles, restore)
    warn("[AirDropArena] " .. name .. " stopped:", err)
    for _, key in ipairs(toggles) do xDTaraZ.Options[key] = false end
    if restore then Util.Try(name .. " restore", restore) end
    table.insert(xDTaraZ.State.Halted, { name, tostring(err):match("^[^\n]*"), toggles })
end

function xDTaraZ.Faults.Report(name, err, toggles, restore)
    local now = osClock()
    local streak = xDTaraZ.Faults.Streaks[name]
    if not streak or (streak.Halted and xDTaraZ.Faults.Wanted(toggles)) then
        streak = { Count = 0, First = now, Warned = false, Halted = false }
        xDTaraZ.Faults.Streaks[name] = streak
    end
    streak.Count += 1
    if streak.Warned then return streak.Halted end
    if streak.Count < xDTaraZ.Config.MaxFails or now - streak.First < xDTaraZ.Config.FailWindow then return false end

    streak.Warned = true
    if #toggles == 0 then
        warn("[AirDropArena] " .. name .. " keeps failing:", err)
        return false
    end
    streak.Halted = true
    xDTaraZ.Faults.Stop(name, err, toggles, restore)
    return true
end

xDTaraZ.Scheduler = { Jobs = {}, Booted = false }

function xDTaraZ.Scheduler.Every(name, interval, fn, toggles, restore)
    xDTaraZ.Scheduler.Jobs[name] = { Interval = interval, Fn = fn, Last = 0, Running = false, Toggles = toggles or {}, Restore = restore }
end

function xDTaraZ.Scheduler.Settle(name, job)
    local err = job.Error
    job.Error = nil
    if err == false then
        xDTaraZ.Faults.Clear(name)
        return
    end
    job.Halted = xDTaraZ.Faults.Report(name, err, job.Toggles, job.Restore)
end

function xDTaraZ.Scheduler.Step()
    local now = osClock()
    for name, job in pairs(xDTaraZ.Scheduler.Jobs) do
        if job.Running then continue end
        if job.Error ~= nil then xDTaraZ.Scheduler.Settle(name, job) end
        if job.Halted then
            if not xDTaraZ.Faults.Wanted(job.Toggles) then continue end
            job.Halted = false
            xDTaraZ.Faults.Clear(name)
        end
        if now - job.Last < job.Interval then continue end

        job.Last, job.Running = now, true
        task.spawn(function()
            local ok, err = pcall(job.Fn)
            job.Error = not ok and tostring(err) or false
            job.Running = false
        end)
    end
end

function xDTaraZ.Scheduler.Boot()
    if xDTaraZ.Scheduler.Booted then return end
    xDTaraZ.Scheduler.Booted = true
    xDTaraZ:Connect(RunService.Heartbeat, xDTaraZ.Scheduler.Step)
end

xDTaraZ.Look = {}

function xDTaraZ.Look.Index()
    if xDTaraZ.Look.ByName then return xDTaraZ.Look.ByName end
    local byName = {}
    for id = 1, xDTaraZ.Config.ItemScan do
        local cfg = xDTaraZ.Loot.ItemConfig(id)
        if cfg and type(cfg.name) == "string" and not byName[cfg.name] then byName[cfg.name] = cfg end
    end
    for _, box in ipairs(xDTaraZ.Rewards.Boxes()) do
        byName[box[2]] = byName[box[2]] or xDTaraZ.Loot.ItemConfig(box[1])
    end
    xDTaraZ.Look.ByName = byName
    return byName
end

function xDTaraZ.Look.Color(quality)
    local helper = xDTaraZ.Look.Quality
    if helper == nil then
        local scripts = ReplicatedStorage:FindFirstChild("Scripts")
        helper = GameLib.Require(scripts and scripts:FindFirstChild("QualityHelper", true)) or false
        xDTaraZ.Look.Quality = helper
    end
    if not (helper and quality) then return nil end
    local ok, color = pcall(helper.GetQualityConfig, helper.TextQualityColor, quality, nil)
    return ok and typeof(color) == "Color3" and color or nil
end

function xDTaraZ.Look.Decorate(dropdown)
    if not (dropdown and dropdown.SetImages) then return end
    local index, images, colors = xDTaraZ.Look.Index(), {}, {}
    for _, label in ipairs(dropdown.Values or {}) do
        local cfg = index[label]
        if not cfg then continue end
        images[label] = cfg.tex or cfg.texhd
        colors[label] = xDTaraZ.Look.Color(cfg.quality)
    end
    dropdown:SetImages(images, colors)
end

xDTaraZ.UI = { Labels = {} }
local Library, T

function xDTaraZ.UI.Detach(fn)
    return function(...)
        local packed = table.pack(...)
        task.defer(function()
            local ok, err = pcall(fn, table.unpack(packed, 1, packed.n))
            if not ok then warn("[AirDropArena] ui:", err) end
        end)
    end
end

function xDTaraZ.UI.Bind(widget, key)
    local function Apply(value) xDTaraZ.Options[key] = value end
    Apply(widget.Value)
    widget:OnChanged(Apply)
end

function xDTaraZ.UI.Report(title, got, done, none)
    if got > 0 then
        Library:Notify(title, done:format(got), 4, "Success")
    else
        Library:Notify(title, none, 4, "Info")
    end
end

function xDTaraZ.UI.BuildMain(window)
    window:AddTabSection(T("Main", "Главная"))
    local tab = window:AddTab(T("Main", "Главная"), "mushroom", T("Status and links", "Статус и ссылки"))

    local status = tab:AddLeftGroupbox(T("Status", "Статус"), "star")
    xDTaraZ.UI.Labels.Farm = status:AddParagraph({ Title = T("Farm", "Фарм"), Content = "-" })
    xDTaraZ.UI.Labels.Heal = status:AddParagraph({ Title = T("Health", "Здоровье"), Content = "-" })
    xDTaraZ.UI.Labels.Combat = status:AddParagraph({ Title = T("Combat", "Бой"), Content = "-" })
    xDTaraZ.UI.Labels.Rewards = status:AddParagraph({ Title = T("Rewards", "Награды"), Content = "-" })

    local discord = tab:AddRightGroupbox(T("Discord", "Дискорд"), "link")
    discord:AddLabel(xDTaraZ.Config.Discord)
    discord:AddButton({ Text = T("Copy Discord Link", "Скопировать ссылку"), Func = xDTaraZ.UI.Detach(function()
        if Util.Copy(xDTaraZ.Config.Discord) then
            Library:Notify(T("Discord", "Дискорд"), T("Link copied", "Ссылка скопирована"), 3, "Success")
        else
            Library:Notify(T("Discord", "Дискорд"), xDTaraZ.Config.Discord, 6, "Info")
        end
    end) })

    local logBox = tab:AddRightGroupbox(T("Update Log", "Обновления"), "bell")
    for i = 1, math.min(2, #xDTaraZ.Config.UpdateLog) do
        local entry = xDTaraZ.Config.UpdateLog[i]
        logBox:AddParagraph({ Title = entry[1], Content = entry[2] })
    end

    local live = tab:AddRightGroupbox(T("Loot and ESP", "Лут и ESP"), "coin")
    xDTaraZ.UI.Labels.Loot = live:AddParagraph({ Title = T("Loot", "Лут"), Content = "-" })
    xDTaraZ.UI.Labels.Esp = live:AddParagraph({ Title = T("ESP", "ESP"), Content = "-" })
end

function xDTaraZ.UI.BuildCombat(window)
    window:AddTabSection(T("Combat", "Бой"))
    local tab = window:AddTab(T("Aim", "Прицел"), "target", T("Silent aim, ragebot, aimbot, triggerbot", "Silent aim, ragebot, aimbot, triggerbot"))
    local priorities = { "Crosshair", "Distance", "Health" }

    local silent = tab:AddLeftGroupbox(T("Silent Aim", "Silent Aim"), "bomb", "OP")
    silent:AddToggle("SilentAim", { Text = T("Silent aim", "Silent aim"), Description = T("Your shots hit the target in the FOV", "Ваши выстрелы попадают в цель в радиусе FOV") })
        :AddKeyPicker("SilentAimKey", { Default = "None", Mode = "Toggle" })
    silent:AddSlider("SilentHitChance", { Text = T("Hit chance", "Шанс попадания"), Min = 1, Max = 100, Default = 100, Rounding = 0, Suffix = "%" })
    silent:AddSlider("SilentHeadChance", { Text = T("Headshot chance", "Шанс хедшота"), Min = 0, Max = 100, Default = 100, Rounding = 0, Suffix = "%" })
    silent:AddDropdown("SilentPriority", { Text = T("Target priority", "Приоритет цели"), Values = priorities, Default = "Crosshair" })
    silent:AddSlider("SilentFov", { Text = T("FOV", "FOV"), Min = 20, Max = 1000, Default = 250, Suffix = "px" })
    silent:AddToggle("ShowSilentFov", { Text = T("Show FOV circle", "Показать круг FOV") })
    silent:AddSlider("SilentMaxDistance", { Text = T("Max distance", "Макс. дистанция"), Min = 50, Max = 2000, Default = 1000, Suffix = "m" })
    -- УЛУЧШЕНО: Добавлена фиксация цели
    silent:AddCheckbox("SilentTargetLock", { Text = T("Target Lock", "Фиксация цели"), Default = false, Tooltip = T("Keeps aim on the same target", "Удерживает прицел на одной цели") })
    Library.Compat.NeedCap("SilentAim", "Namecall")

    local rage = tab:AddLeftGroupbox(T("Ragebot", "Ragebot"), "bomb")
    rage:AddToggle("Ragebot", { Text = T("Ragebot", "Ragebot"), Description = T("Shoots every enemy in sight on its own", "Стреляет по всем врагам в поле зрения") })
        :AddKeyPicker("RagebotKey", { Default = "None", Mode = "Toggle" })
    rage:AddSlider("RageMaxDistance", { Text = T("Max distance", "Макс. дистанция"), Min = 50, Max = 2000, Default = 1000, Suffix = "m" })
    Library.Compat.NeedCap("Ragebot", "Namecall")

    local aim = tab:AddRightGroupbox(T("Aimbot", "Aimbot"), "target")
    aim:AddToggle("Aimbot", { Text = T("Aimbot", "Aimbot"), Description = T("Locks your view onto the enemy in the FOV", "Наводит камеру на врага в радиусе FOV"), Tooltip = T("Right-click or long-press the key to change Hold / Toggle / Always", "ПКМ или удержание клавиши для смены режима") })
        :AddKeyPicker("AimbotKey", { Default = "X", Mode = "Hold" })
    aim:AddSlider("AimSmooth", { Text = T("Smoothness", "Плавность"), Min = 1, Max = 20, Default = 1, Rounding = 0 })
    aim:AddCheckbox("AimSticky", { Text = T("Sticky target", "Липкая цель") })
    -- УЛУЧШЕНО: Добавлены новые настройки прицеливания
    aim:AddDropdown("AimBone", { Text = T("Aim part", "Часть тела"), Values = { "Head", "Torso", "Auto" }, Default = "Auto" })
    aim:AddDropdown("AimSmoothType", { Text = T("Smoothing Type", "Тип сглаживания"), Values = { "Linear", "Exponential" }, Default = "Exponential" })
    aim:AddCheckbox("AimPrediction", { Text = T("Target Prediction", "Предсказание движения"), Default = false })
    aim:AddSlider("AimPredictionScale", { Text = T("Prediction Scale", "Сила предсказания"), Min = 0.05, Max = 0.5, Default = 0.15, Rounding = 2 })
    aim:AddDropdown("AimPriority", { Text = T("Target priority", "Приоритет цели"), Values = priorities, Default = "Crosshair" })
    aim:AddSlider("AimFov", { Text = T("FOV", "FOV"), Min = 20, Max = 800, Default = 200, Suffix = "px" })
    aim:AddToggle("ShowFov", { Text = T("Show FOV circle", "Показать круг FOV") })
    aim:AddSlider("AimMaxDistance", { Text = T("Max distance", "Макс. дистанция"), Min = 50, Max = 2000, Default = 1000, Suffix = "m" })

    local trigger = tab:AddRightGroupbox(T("Triggerbot", "Triggerbot"), "crosshair")
    trigger:AddToggle("Triggerbot", { Text = T("Triggerbot", "Triggerbot"), Description = T("Fires when your crosshair is on an enemy", "Стреляет, когда прицел на враге") })
        :AddKeyPicker("TriggerbotKey", { Default = "None", Mode = "Toggle" })
    trigger:AddSlider("TriggerDelay", { Text = T("Reaction delay", "Задержка реакции"), Min = 0, Max = 500, Default = 0, Rounding = 0, Suffix = "ms" })
    trigger:AddSlider("TriggerChance", { Text = T("Fire chance", "Шанс выстрела"), Min = 1, Max = 100, Default = 100, Rounding = 0, Suffix = "%" })
    trigger:AddCheckbox("TargetBots", { Text = T("Include bots", "Включать ботов"), Default = true })

    xDTaraZ.UI.BuildSurvival(window)
end

function xDTaraZ.UI.BuildSurvival(window)
    local tab = window:AddTab(T("Survival", "Выживание"), "heart", T("Hunt, healing, respawn and gun mods", "Охота, лечение, возрождение и моды оружия"))

    local hunt = tab:AddLeftGroupbox(T("Hunt", "Охота"), "zap")
    hunt:AddToggle("Hunt", { Text = T("Hunt", "Охота"), Description = T("Warps to the closest enemy whenever nobody is in sight", "Телепортируется к ближайшему врагу, когда никого нет в поле зрения") })
    hunt:AddDropdown("HuntMode", { Text = T("Position", "Позиция"), Values = { "Behind", "Above", "Front" }, Default = "Behind" })
    hunt:AddSlider("HuntDistance", { Text = T("Distance", "Дистанция"), Min = 0, Max = 60, Default = 15, Rounding = 0, Suffix = "m" })
    hunt:AddSlider("HuntHeight", { Text = T("Height", "Высота"), Min = 0, Max = 40, Default = 10, Rounding = 0, Suffix = "m" })
    hunt:AddSlider("HuntMaxWarp", { Text = T("Max warp per jump", "Макс. телепорт за раз"), Min = 0, Max = 400, Default = 0, Rounding = 0, Suffix = "m", Tooltip = T("0 = no limit", "0 = без лимита") })
    hunt:AddSlider("HuntIdle", { Text = T("Wait before warp", "Ожидание перед телепортом"), Min = 0, Max = 5, Default = 0.6, Rounding = 1, Suffix = "s" })

    local life = tab:AddLeftGroupbox(T("Respawn", "Возрождение"), "heart")
    life:AddToggle("InstantRespawn", { Text = T("Auto respawn", "Авто-возрождение"), Description = T("Respawns as soon as the game allows", "Возрождается, как только игра позволяет") })
    life:AddSlider("RespawnDelay", { Text = T("Respawn delay", "Задержка возрождения"), Min = 0, Max = 10, Default = 0, Rounding = 1, Suffix = "s" })
    life:AddToggle("AutoRejoin", { Text = T("Auto rejoin match", "Авто-переподключение"), Description = T("Jumps back into a match when you sit in the lobby", "Возвращается в матч, если вы застряли в лобби") })
    life:AddButton({ Text = T("Respawn Now", "Возродиться сейчас"), Func = xDTaraZ.UI.Detach(function()
        xDTaraZ.State.LastRespawn = 0
        xDTaraZ.Respawn.Now()
    end) })

    local heal = tab:AddRightGroupbox(T("Auto Heal", "Авто-лечение"), "heart")
    heal:AddToggle("AutoHeal", { Text = T("Auto heal", "Авто-лечение"), Description = T("Grabs a med from anywhere on the map when you get hurt", "Берет аптечку с карты, когда вы ранены") })
    heal:AddSlider("HealAt", { Text = T("Heal below", "Лечить ниже"), Min = 10, Max = 99, Default = 70, Rounding = 0, Suffix = "%" })
    local meds = xDTaraZ.Heal.Names()
    xDTaraZ.Look.Decorate(heal:AddDropdown("HealMeds", { Text = T("Meds to use", "Используемые медикаменты"), Values = meds, Default = meds, Multi = true, AllowNull = true }))
    heal:AddButton({ Text = T("Heal Now", "Лечить сейчас"), Style = "Success", Func = xDTaraZ.UI.Detach(function()
        if not xDTaraZ.Heal.Now() then Library:Notify("Heal", "No med on the map or HP is full", 3, "Info") end
    end) })

    local gun = tab:AddRightGroupbox(T("Gun Mods", "Моды оружия"), "swords")
    gun:AddToggle("SmartReload", { Text = T("Auto reload", "Авто-перезарядка"), Description = T("Tops up your magazine while nobody is in sight", "Перезаряжает магазин, когда никого нет в поле зрения") })
    gun:AddSlider("ReloadAt", { Text = T("Reload below", "Перезарядить ниже"), Min = 10, Max = 95, Default = 50, Rounding = 0, Suffix = "%" })
    gun:AddToggle("NoSpread", { Text = T("No spread", "Без разброса") })
    gun:AddToggle("NoRecoil", { Text = T("No recoil", "Без отдачи") })
    gun:AddToggle("InstantAds", { Text = T("Instant aim down sights", "Мгновенный прицел") })
    for _, idx in ipairs(xDTaraZ.Config.GunToggles) do
        Library.Compat.NeedCap(idx, "Gc")
    end
end

function xDTaraZ.UI.BuildLoot(window)
    window:AddTabSection(T("Farming", "Фарм"))
    local tab = window:AddTab(T("Loot", "Лут"), "coin", T("Gear, valuables and air drops from anywhere", "Снаряжение, ценности и аирдропы отовсюду"))

    local gear = tab:AddLeftGroupbox(T("Best Gear", "Лучшее снаряжение"), "star")
    gear:AddToggle("AutoGear", { Text = T("Auto loot best gear", "Авто-лут лучшего снаряжения"), Description = T("Grabs better guns and armor from any crate on the map", "Берет лучшее оружие и броню из любых ящиков на карте") })
    local gearLabels = xDTaraZ.Loot.SlotLabels()
    gear:AddDropdown("LootGear", { Text = T("Gear types", "Типы снаряжения"), Values = gearLabels, Default = gearLabels, Multi = true, AllowNull = true })
    gear:AddToggle("AutoAmmo", { Text = T("Auto ammo", "Авто-патроны"), Description = T("Takes ammo for your guns from anywhere on the map", "Берет патроны для вашего оружия с карты") })
    gear:AddDropdown("GearScore", { Text = T("Rank guns by", "Ранжировать оружие по"), Values = { "Damage per second", "Damage per shot", "Rarity" }, Default = "Damage per second" })
    gear:AddButton({ Text = T("Loot Best Now", "Залутать лучшее сейчас"), Style = "Primary", Func = xDTaraZ.UI.Detach(function()
        xDTaraZ.UI.Report("Loot", xDTaraZ.Loot.TakeUpgrades(), "Took %d upgrades", "Nothing better on the map")
    end) })

    local money = tab:AddRightGroupbox(T("Valuables", "Ценности"), "coin")
    money:AddToggle("AutoValuables", { Text = T("Auto loot valuables", "Авто-лут ценностей"), Description = T("Takes ore, crystals and gold from every crate on the map", "Берет руду, кристаллы и золото из всех ящиков") })
    local currencies, buffs = xDTaraZ.Loot.Kinds()
    xDTaraZ.Look.Decorate(money:AddDropdown("LootCurrency", { Text = T("Valuables to take", "Ценности для сбора"), Values = currencies, Default = currencies, Multi = true, AllowNull = true, Searchable = true }))
    money:AddToggle("AutoBuffs", { Text = T("Auto loot buffs", "Авто-лут баффов"), Description = T("Takes damage, fire rate, ammo and health buffs from every crate", "Берет баффы урона, скорострельности, патронов и здоровья") })
    money:AddDropdown("LootBuffs", { Text = T("Buffs to take", "Баффы для сбора"), Values = buffs, Default = buffs, Multi = true, AllowNull = true })
    money:AddButton({ Text = T("Loot Valuables Now", "Залутать ценности сейчас"), Style = "Primary", Func = xDTaraZ.UI.Detach(function()
        xDTaraZ.UI.Report("Loot", xDTaraZ.Loot.TakeValuables({ Currency = true, Buff = true }), "Took %d items", "No valuables on the map")
    end) })

    local drop = tab:AddRightGroupbox(T("Air Drop", "Аирдроп"), "flag")
    drop:AddToggle("AutoAirDrop", { Text = T("Auto air drop", "Авто-аирдроп"), Description = T("Takes air drop loot from anywhere on the map", "Берет лут из аирдропов с любой точки карты") })
    drop:AddButton({ Text = T("Loot Air Drops Now", "Залутать аирдропы сейчас"), Style = "Primary", Func = xDTaraZ.UI.Detach(function()
        xDTaraZ.UI.Report("Air Drop", xDTaraZ.Loot.EmptyAirDrops(), "Took %d items", "Nothing to take")
    end) })
end

function xDTaraZ.UI.BuildRewards(window)
    local tab = window:AddTab(T("Rewards", "Награды"), "qblock", T("Tasks, season pass, gifts, codes and boxes", "Задания, боевой пропуск, подарки, коды и ящики"))

    local claim = tab:AddLeftGroupbox(T("Claim", "Получение"), "star")
    claim:AddToggle("AutoClaim", { Text = T("Auto claim", "Авто-получение"), Description = T("Tasks, season pass, rank rewards, online gifts, sign-in and update gifts", "Задания, боевой пропуск, награды ранга, онлайн-подарки, ежедневный вход и подарки за обновление") })
    local kinds = xDTaraZ.Config.ClaimKinds
    claim:AddDropdown("ClaimKinds", { Text = T("Rewards to claim", "Награды для получения"), Values = kinds, Default = kinds, Multi = true, AllowNull = true })
    claim:AddButton({ Text = T("Claim All Now", "Получить все сейчас"), Style = "Success", Func = function() xDTaraZ.Rewards.Request("Claim") end })

    local codes = tab:AddLeftGroupbox(T("Codes", "Коды"), "key")
    codes:AddButton({ Text = T("Redeem All Codes", "Активировать все коды"), Style = "Primary", Func = function() xDTaraZ.Rewards.Request("Codes") end })

    local boxes = tab:AddRightGroupbox(T("Boxes", "Ящики"), "qblock")
    boxes:AddToggle("AutoOpenBoxes", { Text = T("Auto open boxes", "Авто-открытие ящиков"), Description = T("Opens every skin and weapon box you own", "Открывает все ящики со скинами и оружием, которые у вас есть") })
    local owned = {}
    for _, box in ipairs(xDTaraZ.Rewards.Boxes()) do
        if not table.find(owned, box[2]) then owned[#owned + 1] = box[2] end
    end
    xDTaraZ.Look.Decorate(boxes:AddDropdown("OpenBoxList", { Text = T("Boxes to open", "Ящики для открытия"), Values = owned, Default = owned, Multi = true, AllowNull = true, Searchable = true }))
    boxes:AddButton({ Text = T("Open Boxes Now", "Открыть ящики сейчас"), Func = function() xDTaraZ.Rewards.Request("Open") end })

    local shop = tab:AddRightGroupbox(T("Buy Boxes", "Покупка ящиков"), "coin")
    local names = {}
    for _, box in ipairs(xDTaraZ.Rewards.Boxes()) do
        if box[3] > 0 then names[#names + 1] = box[2] end
    end
    xDTaraZ.Look.Decorate(shop:AddDropdown("BuyBox", { Text = T("Box", "Ящик"), Values = names, Default = names[1] }))
    shop:AddSlider("BuyAmount", { Text = T("Amount", "Количество"), Min = 1, Max = xDTaraZ.Config.BuyAmountMax, Default = 1, Rounding = 0 })
    shop:AddSlider("KeepGold", { Text = T("Keep gold", "Оставить золота"), Min = 0, Max = 1000000, Default = 50000, Rounding = 0 })
    shop:AddButton({ Text = T("Buy Now", "Купить сейчас"), Func = function() xDTaraZ.Rewards.Request("Buy") end })
end

function xDTaraZ.UI.BuildVisuals(window)
    window:AddTabSection(T("Visuals", "Визуал"))
    window:AddVisualsTab({ Provider = xDTaraZ.Esp.Targets, Preview = true })

    local tab = window:AddTab(T("Loot ESP", "ESP Лута"), "eye", T("Air drops, crates and items", "Аирдропы, ящики и предметы"))
    local esp = tab:AddLeftGroupbox(T("Loot ESP", "ESP Лута"), "eye")
    esp:AddToggle("LootEspAirDrop", { Text = T("Air drops", "Аирдропы") })
    esp:AddToggle("LootEspCrate", { Text = T("Crates", "Ящики") })
    esp:AddToggle("LootEspItem", { Text = T("Items", "Предметы") })

    local range = tab:AddRightGroupbox(T("Range", "Дистанция"), "eye")
    range:AddSlider("LootEspRange", { Text = T("Range", "Дистанция"), Min = 50, Max = 2000, Default = 400, Suffix = "m" })
end

function xDTaraZ.UI.BuildMisc(window)
    window:AddTabSection(T("Misc", "Разное"))
    local tab = window:AddTab(T("Player", "Игрок"), "oneup", T("Movement, world, server", "Передвижение, мир, сервер"))

    local move = tab:AddLeftGroupbox(T("Movement", "Передвижение"), "zap")
    move:AddToggle("Speed", { Text = T("Speed", "Скорость") }):AddKeyPicker("SpeedKey", { Default = "None", Mode = "Toggle" })
    move:AddSlider("SpeedValue", { Text = T("Speed", "Скорость"), Min = 16, Max = 120, Default = 40, Rounding = 0 })
    move:AddToggle("InfiniteJump", { Text = T("Infinite jump", "Бесконечный прыжок") })
    move:AddToggle("Noclip", { Text = T("Noclip", "Сквозь стены") }):AddKeyPicker("NoclipKey", { Default = "None", Mode = "Toggle" })

    local others = tab:AddLeftGroupbox(T("Players", "Игроки"), "oneup")
    others:AddDropdown("TargetPlayer", { Text = T("Player", "Игрок"), SpecialType = "Player", AllowNull = true, Searchable = true })
    others:AddButton({ Text = T("Teleport", "Телепорт"), Func = function()
        if not xDTaraZ.World.TeleportTo(xDTaraZ.Options.TargetPlayer) then
            Library:Notify(T("Players", "Игроки"), T("That player isn't in the match", "Этого игрока нет в матче"), 4, "Warning")
        end
    end })
    others:AddToggle("Spectate", { Text = T("Spectate", "Наблюдение"), Callback = function(on)
        xDTaraZ.World.Spectate(on and xDTaraZ.Options.TargetPlayer or nil)
    end })

    local fly = tab:AddLeftGroupbox(T("Fly", "Полет"), "star")
    fly:AddToggle("Fly", { Text = T("Fly", "Полет"), Description = T("Space up, Ctrl down", "Space вверх, Ctrl вниз"), Callback = function(on)
        if not on then xDTaraZ.Movement.StopFly() end
    end }):AddKeyPicker("FlyKey", { Default = "None", Mode = "Toggle" })
    fly:AddSlider("FlySpeed", { Text = T("Fly speed", "Скорость полета"), Min = 20, Max = 200, Default = 60, Rounding = 0 })

    local slide = tab:AddRightGroupbox(T("Slide", "Слайд"), "zap")
    slide:AddToggle("SuperSlide", { Text = T("Slide boost", "Усиленный слайд"), Description = T("Faster and longer slides", "Более быстрые и длинные слайды") })
    slide:AddSlider("SlideSpeed", { Text = T("Slide speed", "Скорость слайда"), Min = 60, Max = 300, Default = 120, Rounding = 0 })
    Library.Compat.NeedCap("SuperSlide", "Gc")

    local world = tab:AddRightGroupbox(T("World", "Мир"), "globe")
    world:AddToggle("Fullbright", { Text = T("Fullbright", "Полная яркость") })
    world:AddToggle("CameraFov", { Text = T("Camera FOV", "FOV камеры") })
    world:AddSlider("CameraFovValue", { Text = T("FOV", "FOV"), Min = 50, Max = 120, Default = 90, Rounding = 0 })

    local server = tab:AddRightGroupbox(T("Server", "Сервер"), "castle")
    server:AddToggle("AntiAfk", { Text = T("Anti AFK", "Анти-AFK") })
    server:AddToggle("AdminAlert", { Text = T("Staff alert", "Оповещение о персонале"), Description = T("Tells you when a game staff member is in your server", "Сообщает, когда сотрудник игры находится на вашем сервере") })
    server:AddToggle("AdminHop", { Text = T("Leave when staff joins", "Покидать при входе персонала") })
    server:AddButton({ Text = T("Rejoin", "Переподключиться"), Func = xDTaraZ.UI.Detach(xDTaraZ.World.Rejoin) })
        :AddButton({ Text = T("Server hop", "Сменить сервер"), Func = xDTaraZ.UI.Detach(function()
            if not xDTaraZ.World.Hop() then Library:Notify(T("Server", "Сервер"), T("No other server found", "Других серверов не найдено"), 4, "Warning") end
        end) })
end

function xDTaraZ.UI.RefreshStatus()
    local labels, state = xDTaraZ.UI.Labels, xDTaraZ.State
    if labels.Combat then labels.Combat:SetContent(xDTaraZ.Combat.GetStatus()) end
    if labels.Loot then
        local wait = math.max(0, math.floor(state.AirDropAt - Workspace:GetServerTimeNow()))
        local eta = wait > 0 and ("next in %ds"):format(wait) or "-"
        labels.Loot:SetContent(string.format("Gear %d | Valuables %d | Air drop items %d (%s) | Last: %s", state.Looted, state.Valuables, state.AirDrops, eta, state.LastLoot))
    end
    if labels.Esp then labels.Esp:SetContent(xDTaraZ.Esp.GetStatus()) end
    if labels.Heal then labels.Heal:SetContent(xDTaraZ.Heal.GetStatus()) end
    if labels.Farm then labels.Farm:SetContent(xDTaraZ.Farm.GetStatus()) end
    if labels.Rewards then labels.Rewards:SetContent(xDTaraZ.Rewards.GetStatus()) end
end

function xDTaraZ.UI.Queue(title, text)
    table.insert(xDTaraZ.State.Notices, { title, text })
end

function xDTaraZ.UI.ShowNotices()
    local notices = xDTaraZ.State.Notices
    if #notices == 0 then return end
    local pending = table.clone(notices)
    table.clear(notices)
    for _, notice in ipairs(pending) do Library:Notify(notice[1], notice[2], 5, "Info") end
end

function xDTaraZ.UI.ShowHalted()
    local queue = xDTaraZ.State.Halted
    if #queue == 0 then return end
    local stopped = table.clone(queue)
    table.clear(queue)

    for _, halt in ipairs(stopped) do
        local name, reason, toggles = halt[1], halt[2], halt[3]
        for _, key in ipairs(toggles) do
            local toggle = Library.Options[key]
            if toggle and toggle.Value == true then Util.Try("halt " .. key, toggle.SetValue, toggle, false) end
        end
        Library:Notify("Mario Hub", name .. " stopped: " .. reason, 6, "Error")
    end
end

function xDTaraZ.UI.HookOnDemand()
    for _, idx in ipairs({ "SilentAim", "Ragebot" }) do
        local toggle = Library.Options[idx]
        if toggle then toggle:OnChanged(function() task.defer(xDTaraZ.Combat.SyncHook) end) end
    end
end

function xDTaraZ.UI.GuardConfigFeatures()
    local unsupported = T("Not available on this executor", "Недоступно на этом эксплоите")
    local outdated = T("Changed by a game update, wait for a script update", "Изменено обновлением игры, ждите обновления скрипта")
    local missing = GameLib.Missing.ConfigManager
    for _, idx in ipairs(xDTaraZ.Config.ConfigFeatures) do
        if missing then
            Library.Compat.Block(idx, missing == "Absent" and outdated or unsupported)
        else
            Library.Compat.NeedCap(idx, "Gc")
        end
    end

    for _, idx in ipairs(xDTaraZ.Config.GcFeatures) do
        Library.Compat.NeedCap(idx, "Gc")
    end

    if GameLib.Main then return end
    for _, idx in ipairs(xDTaraZ.Config.RemoteFeatures) do
        local option = Library.Options[idx]
        if option and not option.Blocked then Library.Compat.Block(option, outdated) end
    end
end

function xDTaraZ.UI.Build()
    local window = Library.Window
    local sections = {
        { "main tab", xDTaraZ.UI.BuildMain },
        { "combat tab", xDTaraZ.UI.BuildCombat },
        { "loot tab", xDTaraZ.UI.BuildLoot },
        { "rewards tab", xDTaraZ.UI.BuildRewards },
        { "visuals tab", xDTaraZ.UI.BuildVisuals },
        { "misc tab", xDTaraZ.UI.BuildMisc },
    }
    for _, section in ipairs(sections) do
        Util.Try(section[1], section[2], window)
    end
    Util.Try("settings tab", window.AddSettingsTab, window)

    for key in pairs(xDTaraZ.Options) do
        local widget = Library.Options[key]
        if widget then Util.Try("bind " .. key, xDTaraZ.UI.Bind, widget, key) end
    end
    Util.Try("hooks", xDTaraZ.UI.HookOnDemand)
    Util.Try("feature guards", xDTaraZ.UI.GuardConfigFeatures)

    Library:Every(xDTaraZ.Config.StatusInterval, xDTaraZ.UI.RefreshStatus)
    Library:Every(xDTaraZ.Config.StatusInterval, xDTaraZ.UI.ShowHalted)
    Library:Every(xDTaraZ.Config.StatusInterval, xDTaraZ.UI.ShowNotices)
end

local function BuildInterface()
    Library = Util.LoadLibrary(xDTaraZ.Config.UiSource)
    if not Library then return false end
    pcall(MarioBanner.Step, "UI library")
    xDTaraZ.Library = Library
    T = function(en, th) return Library:T(en, th) end

    local opened, err = pcall(Library.CreateWindow, Library, {
        Title = "Mario Hub",
        SubTitle = "FPS AirDrop Arena by xDTaraZ",
        MenuKey = Enum.KeyCode.LeftControl,
        ConfigFolder = xDTaraZ.Config.SaveFolder,
        Language = "Auto",
        Theme = "Halloween",
        Intro = xDTaraZ.Config.Intro,
        OnUnlocked = function()
            xDTaraZ.UI.Build()
            task.defer(Util.Try, "boot", xDTaraZ.Boot)
            task.defer(Util.Try, "autoload config", Library.LoadAutoloadConfig, Library)
        end,
    })
    if not opened then
        Util.Alert("The menu failed to load on this executor: " .. tostring(err):match("^[^\n]*"), err)
        return false
    end
    Library:OnUnload(function()
        xDTaraZ:Unload()
    end)
    return true
end

function xDTaraZ.Boot()
    Util.Try("combat", xDTaraZ.Combat.Start)
    Util.Try("movement", xDTaraZ.Movement.Start)
    xDTaraZ:Connect(LocalPlayer.Idled, xDTaraZ.World.OnIdled)
    xDTaraZ:Connect(RunService.RenderStepped, xDTaraZ.World.OnRender)
    if LocalPlayer.Character then xDTaraZ.Respawn.Watch(LocalPlayer.Character) end
    xDTaraZ:Connect(LocalPlayer.CharacterAdded, xDTaraZ.Respawn.Watch)

    local config = xDTaraZ.Config
    xDTaraZ.Scheduler.Every("Gun Mods", 0.5, xDTaraZ.Guns.Step, config.GunToggles, xDTaraZ.Guns.Restore)
    xDTaraZ.Scheduler.Every("Auto Air Drop", 1, xDTaraZ.Loot.AirDropStep, { "AutoAirDrop" })
    xDTaraZ.Scheduler.Every("Loot ESP", 0.5, xDTaraZ.Loot.EspStep, config.LootEspToggles, xDTaraZ.Loot.ClearMarks)
    xDTaraZ.Scheduler.Every("Fullbright", 0.5, xDTaraZ.World.Step, { "Fullbright" }, xDTaraZ.World.Step)
    xDTaraZ.Scheduler.Every("Auto Respawn", 0.5, xDTaraZ.Respawn.Step, { "InstantRespawn" })
    xDTaraZ.Scheduler.Every("Best Gear", 0.5, xDTaraZ.Loot.GearStep, { "AutoGear" })
    xDTaraZ.Scheduler.Every("Auto Ammo", 1, xDTaraZ.Loot.AmmoStep, { "AutoAmmo" })
    xDTaraZ.Scheduler.Every("Guns in hand", 0.2, xDTaraZ.Combat.GunStep)
    xDTaraZ.Scheduler.Every("Valuables", 1, xDTaraZ.Loot.ValuablesStep, { "AutoValuables" })
    xDTaraZ.Scheduler.Every("Auto Heal", 0.1, xDTaraZ.Heal.Step, { "AutoHeal" })
    xDTaraZ.Scheduler.Every("Farm stats", 2, xDTaraZ.Farm.Sample)
    xDTaraZ.Scheduler.Every("Auto Rejoin", 2, xDTaraZ.Respawn.Rejoin, { "AutoRejoin" })
    xDTaraZ.Scheduler.Every("Hunt", 0.5, xDTaraZ.Hunt.Step, { "Hunt" })
    xDTaraZ.Scheduler.Every("Rewards", 1, xDTaraZ.Rewards.Step)
    xDTaraZ.Scheduler.Every("Staff", 3, xDTaraZ.Admin.Step)
    Util.Try("scheduler", xDTaraZ.Scheduler.Boot)
end

local function UnloadHub()
    if xDTaraZ.Library and not xDTaraZ.Library.Unloaded then
        xDTaraZ.Library:Unload()
    else
        xDTaraZ:Unload()
    end
end

function xDTaraZ:Unload()
    self.State.Alive = false
    if environment.AirDropArenaUnload == UnloadHub then environment.AirDropArenaUnload = nil end
    xDTaraZ.Combat.Unload()
    xDTaraZ.Guns.Restore()
    for _, key in ipairs({ "Fullbright", "CameraFov", "Noclip", "Fly", "Speed" }) do
        xDTaraZ.Options[key] = false
    end
    pcall(xDTaraZ.Loot.ClearMarks)
    pcall(xDTaraZ.World.Step)
    pcall(xDTaraZ.World.OnRender)
    pcall(xDTaraZ.Movement.OnStepped)
    for _, conn in ipairs(self.State.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    table.clear(self.State.Connections)
    if xDTaraZ.Respawn.Conn then
        xDTaraZ.Respawn.Conn:Disconnect()
        xDTaraZ.Respawn.Conn = nil
    end
    if Util.Overlay then
        Util.Overlay:Destroy()
        Util.Overlay = nil
    end
end

environment.AirDropArenaUnload = UnloadHub

pcall(MarioBanner.Step, "Systems")
if not BuildInterface() then return end
pcall(MarioBanner.Step, "Interface")
pcall(MarioBanner.Ready)
