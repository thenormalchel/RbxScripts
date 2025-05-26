local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
--[[ 
В данный момент стоит тема "RJTheme3" ,
вы можете использовать другую тему приведённую ниже -
"RJTheme1"
"RJTheme2"
"RJTheme3"
"RJTheme4"
"RJTheme5"
"RJTheme6"
"RJTheme7"
"RJTheme8"
//////////////////////////////////////////////////////////////////

Что бы сделать свою тему , уберите часть скрипта из "комминтариев" ,
который находится чуть ниже , и вместо "RJTheme3" в переменной "Windows" - 
напишите переменную которая используется в скрипте чуть ниже .
]]
--[[
local colors = {
	-- Цвет фона у Секций
    SchemeColor = Color3.fromRGB(150, 72, 148),
	-- Цвет фона в правой части UI
	Background = Color3.fromRGB(15,15,15),
	-- Цвет фона в левой части UI
    Header = Color3.fromRGB(15,15,15),
	-- Цвет текста
    TextColor = Color3.fromRGB(255,255,255),
	-- Цвет фона у кнопок
    ElementColor = Color3.fromRGB(20, 20, 20)
}
]]
-- Создать окно UI

-- Получаем локального игрока
local player = game:GetService("Players").LocalPlayer

-- Получаем username игрока
local username = player.Name

-- Сохраняем username в переменную
local sfusername = username

-- Выводим приветствие в консоль
print("Hi - " .. sfusername)

local Window = Library.CreateLib("SF Hub | MM2", "RJTheme3")

while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui do wait() end

local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Icon = "http://www.roblox.com/asset/?id=417446600"

-- Секция
local Tab = Window:NewTab("Visual")

-- Подсекция
local Section = Tab:NewSection("SF Hub | Visuals")

-- Заголовок
Section:NewLabel("Chams")

-- Переключатель
Section:NewToggle("Chams", "Toggle - Chams", function(state)
    if state then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
        print("Chams On!")
    else
        print("Chams Off!")
    end
end)

-- Бинд на клавиши
Section:NewKeybind("Fly key bind", "Press Key To Fly!", Enum.KeyCode.F, function()
end)

-- Дропдаун
Section:NewDropdown("Nothing...", ":/", {"Scroll it.", "Scroll it.", "Scroll it."}, function(currentOption)
    print(currentOption)
end)

-- Секция
local Tab = Window:NewTab("Troll")

local Section = Tab:NewSection("SF Hub | Trolling")

local Section = Tab:NewSection("Fling")

-- Кнопка
Section:NewButton("Fling All", "Fling All :D", function()
    print("By sf")
        local Targets = {"All"} -- "All", "Target Name", "arian_was_here"

    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer

    local AllBool = false

    local GetPlayer = function(Name)
        Name = Name:lower()
        if Name == "all" or Name == "others" then
            AllBool = true
            return
        elseif Name == "random" then
            local GetPlayers = Players:GetPlayers()
            if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
            return GetPlayers[math.random(#GetPlayers)]
        elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
            for _,x in next, Players:GetPlayers() do
                if x ~= Player then
                    if x.Name:lower():match("^"..Name) then
                        return x;
                    elseif x.DisplayName:lower():match("^"..Name) then
                        return x;
                    end
                end
            end
        else
            return
        end
    end

    local Message = function(_Title, _Text, Time)
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
    end

    local SkidFling = function(TargetPlayer)
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Humanoid and Humanoid.RootPart

        local TCharacter = TargetPlayer.Character
        local THumanoid
        local TRootPart
        local THead
        local Accessory
        local Handle

        if TCharacter:FindFirstChildOfClass("Humanoid") then
            THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
        end
        if THumanoid and THumanoid.RootPart then
            TRootPart = THumanoid.RootPart
        end
        if TCharacter:FindFirstChild("Head") then
            THead = TCharacter.Head
        end
        if TCharacter:FindFirstChildOfClass("Accessory") then
            Accessory = TCharacter:FindFirstChildOfClass("Accessory")
        end
        if Accessoy and Accessory:FindFirstChild("Handle") then
            Handle = Accessory.Handle
        end

        if Character and Humanoid and RootPart then
            if RootPart.Velocity.Magnitude < 50 then
                getgenv().OldPos = RootPart.CFrame
            end
            if THumanoid and THumanoid.Sit and not AllBool then
                return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
            end
            if THead then
                workspace.CurrentCamera.CameraSubject = THead
            elseif not THead and Handle then
                workspace.CurrentCamera.CameraSubject = Handle
            elseif THumanoid and TRootPart then
                workspace.CurrentCamera.CameraSubject = THumanoid
            end
            if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                return
            end
            
            local FPos = function(BasePart, Pos, Ang)
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end
            
            local SFBasePart = function(BasePart)
                local TimeToWait = 2
                local Time = tick()
                local Angle = 0

                repeat
                    if RootPart and THumanoid then
                        if BasePart.Velocity.Magnitude < 50 then
                            Angle = Angle + 100

                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                        else
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        end
                    else
                        break
                    end
                until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
            end
            
            workspace.FallenPartsDestroyHeight = 0/0
            
            local BV = Instance.new("BodyVelocity")
            BV.Name = "EpixVel"
            BV.Parent = RootPart
            BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
            
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            
            if TRootPart and THead then
                if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                    SFBasePart(THead)
                else
                    SFBasePart(TRootPart)
                end
            elseif TRootPart and not THead then
                SFBasePart(TRootPart)
            elseif not TRootPart and THead then
                SFBasePart(THead)
            elseif not TRootPart and not THead and Accessory and Handle then
                SFBasePart(Handle)
            else
                return Message("Error Occurred", "Target is missing everything", 5)
            end
            
            BV:Destroy()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            workspace.CurrentCamera.CameraSubject = Humanoid
            
            repeat
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                Humanoid:ChangeState("GettingUp")
                table.foreach(Character:GetChildren(), function(_, x)
                    if x:IsA("BasePart") then
                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                    end
                end)
                task.wait()
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        else
            return Message("Error Occurred", "Random error", 5)
        end
    end

    if not Welcome then Message("Script by SF", "T.me/SFHub", 5) end
    getgenv().Welcome = true
    if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

    if AllBool then
        for _,x in next, Players:GetPlayers() do
            SkidFling(x)
        end
    end

    for _,x in next, Targets do
        if GetPlayer(x) and GetPlayer(x) ~= Player then
            if GetPlayer(x).UserId ~= 1414978355 then
                local TPlayer = GetPlayer(x)
                if TPlayer then
                    SkidFling(TPlayer)
                end
            else
                Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
            end
        elseif not GetPlayer(x) and not AllBool then
            Message("Error Occurred", "Username Invalid", 5)
        end
    end

end)

-- Текст Бокс
Section:NewTextBox("Fling Player", "Write username player in text box!", function(txt)
        -- Settings
    local Settings = {
    Target = txt -- Target Name (Not display name)
    }

    -- Objects
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")

    local LocalPlayer = Players.LocalPlayer
    local Target = Players:FindFirstChild(Settings.Target)

    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
    BodyAngularVelocity.AngularVelocity = Vector3.new(10^6, 10^6, 10^6)
    BodyAngularVelocity.MaxTorque = Vector3.new(10^6, 10^6, 10^6)
    BodyAngularVelocity.P = 10^6

    -- Start
    if not Target then return end
    BodyAngularVelocity.Parent = LocalPlayer.Character.HumanoidRootPart

    while Target.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart do
    RunService.RenderStepped:Wait()
    LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * LocalPlayer.Character.HumanoidRootPart.CFrame.Rotation
    LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new()
    end
    
    BodyAngularVelocity.Parent = nil
end)

local Section = Tab:NewSection("Chat💬")

-- Текст Бокс
Section:NewTextBox("Spam chat💬", "Write message for spam!", function(txt)
        -- Серверный скрипт, который будет отправлять сообщения всем игрокам в чате
    local Players = game:GetService("Players")
    local ChatService = game:GetService("Chat")

    local message = txt -- Замените это на ваше сообщение
    local spamInterval = 0.1 -- Интервал между сообщениями в секундах

    -- Функция для спама в чате
    local function spamChat()
        while true do
            for _, player in ipairs(Players:GetPlayers()) do
                ChatService:Chat(player.Character.Head, message, Enum.ChatColor.Blue) -- Цвет сообщения можно изменить
            end
            wait(spamInterval)
        end
    end

    -- Запускаем спам
    spamChat()

end)

-- Кнопка
Section:NewButton("Draw in chat🎨🖌️", "Draw?💬", function()
    print("By SF")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/thenormalchel/RbxScripts/refs/heads/main/DrawChatMity.lua'))()
end)

local Tab = Window:NewTab("Player")

local Section = Tab:NewSection("SF Hub | Player")

-- Слайдер
Section:NewSlider("SpeedHack", "Change you'r speed", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

-- Текст Бокс
Section:NewTextBox("FOV Changer", "Edit your FOV!:3", function(fovnemb)
    workspace.Camera.FieldOfView = fovnemb
end)

-- Кнопка
Section:NewButton("Fly Gui✈️", "Bird, lol.✈️✈️✈️", function()
    print("By sf")
        local main = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local up = Instance.new("TextButton")
    local down = Instance.new("TextButton")
    local onof = Instance.new("TextButton")
    local TextLabel = Instance.new("TextLabel")
    local plus = Instance.new("TextButton")
    local speed = Instance.new("TextLabel")
    local mine = Instance.new("TextButton")
    local closebutton = Instance.new("TextButton")
    local mini = Instance.new("TextButton")
    local mini2 = Instance.new("TextButton")

    main.Name = "main"
    main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main.ResetOnSpawn = false

    Frame.Parent = main
    Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
    Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
    Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
    Frame.Size = UDim2.new(0, 190, 0, 57)

    up.Name = "up"
    up.Parent = Frame
    up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
    up.Size = UDim2.new(0, 44, 0, 28)
    up.Font = Enum.Font.SourceSans
    up.Text = "UP"
    up.TextColor3 = Color3.fromRGB(0, 0, 0)
    up.TextSize = 14.000

    down.Name = "down"
    down.Parent = Frame
    down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
    down.Position = UDim2.new(0, 0, 0.491228074, 0)
    down.Size = UDim2.new(0, 44, 0, 28)
    down.Font = Enum.Font.SourceSans
    down.Text = "DOWN"
    down.TextColor3 = Color3.fromRGB(0, 0, 0)
    down.TextSize = 14.000

    onof.Name = "onof"
    onof.Parent = Frame
    onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
    onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
    onof.Size = UDim2.new(0, 56, 0, 28)
    onof.Font = Enum.Font.SourceSans
    onof.Text = "fly"
    onof.TextColor3 = Color3.fromRGB(0, 0, 0)
    onof.TextSize = 14.000

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
    TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 100, 0, 28)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "Fly - T.me/sfhub"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true

    plus.Name = "plus"
    plus.Parent = Frame
    plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
    plus.Position = UDim2.new(0.231578946, 0, 0, 0)
    plus.Size = UDim2.new(0, 45, 0, 28)
    plus.Font = Enum.Font.SourceSans
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(0, 0, 0)
    plus.TextScaled = true
    plus.TextSize = 14.000
    plus.TextWrapped = true

    speed.Name = "speed"
    speed.Parent = Frame
    speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
    speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
    speed.Size = UDim2.new(0, 44, 0, 28)
    speed.Font = Enum.Font.SourceSans
    speed.Text = "1"
    speed.TextColor3 = Color3.fromRGB(0, 0, 0)
    speed.TextScaled = true
    speed.TextSize = 14.000
    speed.TextWrapped = true

    mine.Name = "mine"
    mine.Parent = Frame
    mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
    mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
    mine.Size = UDim2.new(0, 45, 0, 29)
    mine.Font = Enum.Font.SourceSans
    mine.Text = "-"
    mine.TextColor3 = Color3.fromRGB(0, 0, 0)
    mine.TextScaled = true
    mine.TextSize = 14.000
    mine.TextWrapped = true

    closebutton.Name = "Close"
    closebutton.Parent = main.Frame
    closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
    closebutton.Font = "SourceSans"
    closebutton.Size = UDim2.new(0, 45, 0, 28)
    closebutton.Text = "X"
    closebutton.TextSize = 30
    closebutton.Position =  UDim2.new(0, 0, -1, 27)

    mini.Name = "minimize"
    mini.Parent = main.Frame
    mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini.Font = "SourceSans"
    mini.Size = UDim2.new(0, 45, 0, 28)
    mini.Text = "-"
    mini.TextSize = 40
    mini.Position = UDim2.new(0, 44, -1, 27)

    mini2.Name = "minimize2"
    mini2.Parent = main.Frame
    mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini2.Font = "SourceSans"
    mini2.Size = UDim2.new(0, 45, 0, 28)
    mini2.Text = "+"
    mini2.TextSize = 40
    mini2.Position = UDim2.new(0, 44, -1, 57)
    mini2.Visible = false

    speeds = 1

    local speaker = game:GetService("Players").LocalPlayer

    local chr = game.Players.LocalPlayer.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

    nowe = false

    game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "Fly Gui";
        Text = "T.me/SFHub";
        Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
    Duration = 5;

    Frame.Active = true -- main = gui
    Frame.Draggable = true

    onof.MouseButton1Down:connect(function()

        if nowe == true then
            nowe = false

            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        else 
            nowe = true



            for i = 1, speeds do
                spawn(function()

                    local hb = game:GetService("RunService").Heartbeat	


                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end

                end)
            end
            game.Players.LocalPlayer.Character.Animate.Disabled = true
            local Char = game.Players.LocalPlayer.Character
            local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

            for i,v in next, Hum:GetPlayingAnimationTracks() do
                v:AdjustSpeed(0)
            end
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        end




        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



            local plr = game.Players.LocalPlayer
            local torso = plr.Character.Torso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0


            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                game:GetService("RunService").RenderStepped:Wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end
                --	game.Players.LocalPlayer.Character.Animate.Disabled = true
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false




        else
            local plr = game.Players.LocalPlayer
            local UpperTorso = plr.Character.UpperTorso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0


            local bg = Instance.new("BodyGyro", UpperTorso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = UpperTorso.CFrame
            local bv = Instance.new("BodyVelocity", UpperTorso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end

                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false



        end





    end)

    local tis

    up.MouseButton1Down:connect(function()
        tis = up.MouseEnter:connect(function()
            while tis do
                wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
            end
        end)
    end)

    up.MouseLeave:connect(function()
        if tis then
            tis:Disconnect()
            tis = nil
        end
    end)

    local dis

    down.MouseButton1Down:connect(function()
        dis = down.MouseEnter:connect(function()
            while dis do
                wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
            end
        end)
    end)

    down.MouseLeave:connect(function()
        if dis then
            dis:Disconnect()
            dis = nil
        end
    end)


    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
        wait(0.7)
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false

    end)


    plus.MouseButton1Down:connect(function()
        speeds = speeds + 1
        speed.Text = speeds
        if nowe == true then


            tpwalking = false
            for i = 1, speeds do
                spawn(function()

                    local hb = game:GetService("RunService").Heartbeat	


                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end

                end)
            end
        end
    end)
    mine.MouseButton1Down:connect(function()
        if speeds == 1 then
            speed.Text = 'cannot be less than 1'
            wait(1)
            speed.Text = speeds
        else
            speeds = speeds - 1
            speed.Text = speeds
            if nowe == true then
                tpwalking = false
                for i = 1, speeds do
                    spawn(function()

                        local hb = game:GetService("RunService").Heartbeat	


                        tpwalking = true
                        local chr = game.Players.LocalPlayer.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end

                    end)
                end
            end
        end
    end)

    closebutton.MouseButton1Click:Connect(function()
        main:Destroy()
    end)

    mini.MouseButton1Click:Connect(function()
        up.Visible = false
        down.Visible = false
        onof.Visible = false
        plus.Visible = false
        speed.Visible = false
        mine.Visible = false
        mini.Visible = false
        mini2.Visible = true
        main.Frame.BackgroundTransparency = 1
        closebutton.Position =  UDim2.new(0, 0, -1, 57)
    end)

    mini2.MouseButton1Click:Connect(function()
        up.Visible = true
        down.Visible = true
        onof.Visible = true
        plus.Visible = true
        speed.Visible = true
        mine.Visible = true
        mini.Visible = true
        mini2.Visible = false
        main.Frame.BackgroundTransparency = 0 
        closebutton.Position =  UDim2.new(0, 0, -1, 27)
    end)
end)

-- Секция
local Tab = Window:NewTab("MM2")

-- Подсекция
local Section = Tab:NewSection("ぽ SF Hub - T.me/SFHub | MM2 ぽ")

-- Заголовок
Section:NewLabel("も Visual ど")

-- Переключатель
Section:NewToggle("Chams", "Toggle - Chams", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP"))(' Watermelon ?')
        print("Chams On! | Thanks - ScriptNoKeys")
    else
        print("Chams Off!")
    end
end)

Section:NewLabel("も Murder ど")

-- Переключатель
Section:NewButton("Kill All", "Kill All if you murder", function()
    -- Таблица для хранения исходных позиций игроков
    local originalPositions = {}

    local function teleportPlayersTo(targetPlayerName)
        -- Находим целевого игрока
        local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
        if not targetPlayer then
            warn("Игрок с именем '" .. targetPlayerName .. "' не найден!")
            return
        end
        
        -- Проверяем, что у целевого игрока есть персонаж
        local targetCharacter = targetPlayer.Character
        if not targetCharacter then
            warn("У игрока '" .. targetPlayerName .. "' нет персонажа!")
            return
        end
        
        -- Находим точку телепортации (используем HumanoidRootPart)
        local targetCFrame = targetCharacter:FindFirstChild("HumanoidRootPart")
        if not targetCFrame then
            warn("У персонажа игрока '" .. targetPlayerName .. "' нет HumanoidRootPart!")
            return
        end
        
        -- Очищаем таблицу с исходными позициями
        originalPositions = {}
        
        -- Телепортируем всех игроков к целевому игроку
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= targetPlayer then -- Не телепортируем самого целевого игрока
                local character = player.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        -- Сохраняем исходную позицию игрока
                        originalPositions[player.Name] = {
                            CFrame = humanoidRootPart.CFrame,
                            Humanoid = character:FindFirstChildOfClass("Humanoid")
                        }
                        
                        -- Отключаем возможность ходить
                        local humanoid = originalPositions[player.Name].Humanoid
                        if humanoid then
                            humanoid:SetAttribute("OriginalWalkSpeed", humanoid.WalkSpeed)
                            humanoid.WalkSpeed = 0
                        end
                        
                        -- Телепортируем основного персонажа
                        humanoidRootPart.CFrame = targetCFrame.CFrame + Vector3.new(0, 0, -3) -- Немного смещаем, чтобы не сливаться
                        
                        -- Телепортируем хитбокс, если он есть
                        local hitbox = character:FindFirstChild("Hitbox") or character:FindFirstChildWhichIsA("BasePart", true)
                        if hitbox then
                            hitbox.CFrame = targetCFrame.CFrame + Vector3.new(0, 0, -3)
                        end
                    end
                end
            end
        end
        
        print("Все игроки телепортированы к " .. targetPlayerName)
        
        -- Запускаем таймер для возврата через 15 секунд
        task.delay(15, function()
            returnPlayersToOriginalPositions()
        end)
    end

    local function returnPlayersToOriginalPositions()
        for playerName, data in pairs(originalPositions) do
            local player = game.Players:FindFirstChild(playerName)
            if player then
                local character = player.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart and data.CFrame then
                        -- Возвращаем персонажа на исходную позицию
                        humanoidRootPart.CFrame = data.CFrame
                        
                        -- Восстанавливаем возможность ходить
                        if data.Humanoid then
                            local originalSpeed = data.Humanoid:GetAttribute("OriginalWalkSpeed")
                            data.Humanoid.WalkSpeed = originalSpeed or 16
                        end
                    end
                end
            end
        end
        
        print("Все игроки возвращены на свои исходные позиции")
        originalPositions = {} -- Очищаем таблицу
    end

    -- Пример использования:
    teleportPlayersTo(sfusername) -- Телепортирует всех к текущему игроку
end)

-- Подсекция
local Section = Tab:NewSection("む Farm も")

Section:NewButton("Farm Candy", "But easy farm script:D", function()
    print("By SF")
    local TweenService = game:GetService("TweenService")
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local userInterface = player:WaitForChild("PlayerGui")

    local maps = {
        "Factory",
        "BioLab",
        "House2",
        "Hospital3",
        "Workplace",
        "MilBase",
        "Bank2",
        "Hotel2",
        "Mansion2",
        "Office3",
        "PoliceStation",
        "ResearchFacility",
        "Hotel",
        "VampireCastle"
    }

    print("Debug: Loaded player, character, and maps.")

    local screenGui = Instance.new("ScreenGui")
    screenGui.ResetOnSpawn = false
    screenGui.Parent = userInterface
    screenGui.Name = "AutoFarmGui"

    local sliderFrame = Instance.new("Frame", screenGui)
    sliderFrame.Size = UDim2.new(0, 200, 0, 50)
    sliderFrame.Position = UDim2.new(0.5, -100, 0, 10)

    local slider = Instance.new("TextButton", sliderFrame)
    slider.Size = UDim2.new(1, 0, 1, 0)
    slider.Text = "Speed: 2"

    local speedValue = 2
    local autoFarmEnabled = false
    local noclipEnabled = false
    local mapFirstCoinCollected = {}

    local configFolder = workspace:FindFirstChild("AutoFarmConfig")
    if not configFolder then
        configFolder = Instance.new("Folder")
        configFolder.Name = "AutoFarmConfig"
        configFolder.Parent = workspace
    end

    local speedConfig = Instance.new("IntValue", configFolder)
    speedConfig.Name = "SpeedValue"
    speedConfig.Value = speedValue

    local autoFarmConfig = Instance.new("BoolValue", configFolder)
    autoFarmConfig.Name = "AutoFarmEnabled"
    autoFarmConfig.Value = autoFarmEnabled

    slider.MouseButton1Click:Connect(function()
        speedValue = speedValue + 1
        if speedValue > 10 then
            speedValue = 1
        end
        slider.Text = "Speed: " .. tostring(speedValue)
        speedConfig.Value = speedValue
        print("Debug: Speed adjusted to: " .. tostring(speedValue))
    end)

    local buttonFrame = Instance.new("Frame", screenGui)
    buttonFrame.Size = UDim2.new(0, 200, 0, 50)
    buttonFrame.Position = UDim2.new(0.5, -100, 0, 70)

    local startStopButton = Instance.new("TextButton", buttonFrame)
    startStopButton.Size = UDim2.new(1, 0, 1, 0)
    startStopButton.Text = "Start AutoFarm"

    startStopButton.MouseButton1Click:Connect(function()
        autoFarmEnabled = not autoFarmEnabled
        autoFarmConfig.Value = autoFarmEnabled
        if autoFarmEnabled then
            startStopButton.Text = "Stop AutoFarm"
            noclipEnabled = true
            print("Debug: AutoFarm started.")
            startAutoFarm()
        else
            startStopButton.Text = "Start AutoFarm"
            noclipEnabled = false
            print("Debug: AutoFarm stopped.")
        end
    end)

    local function noclip()
        while noclipEnabled do
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
            wait(0.1)
        end
    end

    coroutine.wrap(noclip)()

    local function teleportToCoin(coin)
        print("Debug: Teleporting to coin: " .. coin:GetFullName())
        humanoidRootPart.CFrame = coin.CFrame

        if coin:FindFirstChild("TouchInterest") then
            print("Debug: Firing touch interest for coin: " .. coin:GetFullName())
            firetouchinterest(humanoidRootPart, coin, 0)
            firetouchinterest(humanoidRootPart, coin, 1)
        end

        wait(0.1)

        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    end

    local function tweenToCoin(coin)
        print("Debug: Tweening to coin: " .. coin:GetFullName())
        local distance = (humanoidRootPart.Position - coin.Position).Magnitude

        local walkSpeed = 16
        local adjustedSpeed = walkSpeed * 1.2
        local tweenSpeed = distance / adjustedSpeed

        tweenSpeed = math.max(tweenSpeed, 0.5)

        local tweenInfo = TweenInfo.new(
            tweenSpeed,
            Enum.EasingStyle.Cubic,
            Enum.EasingDirection.InOut
        )
        local tweenGoal = {CFrame = coin.CFrame}
        local tween = TweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)
        tween:Play()

        if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
            tween.Completed:Wait()

            if coin:FindFirstChild("TouchInterest") then
                print("Debug: Firing touch interest for coin: " .. coin:GetFullName())
                firetouchinterest(humanoidRootPart, coin, 0)
                firetouchinterest(humanoidRootPart, coin, 1)
            end

            wait(0.1)

            humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        else
            print("Debug: Player is no longer alive, stopping tween.")
            tween:Cancel()
        end
    end

    function startAutoFarm()
        coroutine.wrap(function()
            while autoFarmEnabled do
                for _, mapName in ipairs(maps) do
                    local map = workspace:FindFirstChild(mapName)
                    if map then
                        print("Debug: Found map: " .. mapName)
                        local coinContainer = map:FindFirstChild("CoinContainer")
                        if coinContainer then
                            print("Debug: Found coin container in map: " .. mapName)
                            local coins = {}
                            for _, coin in ipairs(coinContainer:GetChildren()) do
                                if not coin:IsDescendantOf(workspace) then
                                    print("Debug: Skipping already collected coin: " .. coin:GetFullName())
                                elseif not coin:FindFirstChild("CoinVisual") then
                                    print("Debug: Skipping invalid coin: " .. coin:GetFullName())
                                else
                                    table.insert(coins, coin)
                                end
                            end
                            table.sort(coins, function(a, b)
                                if a:IsA("BasePart") and b:IsA("BasePart") then
                                    return (humanoidRootPart.Position - a.Position).Magnitude < (humanoidRootPart.Position - b.Position).Magnitude
                                end
                                return false
                            end)
                            if #coins > 0 then
                                local firstCoin = coins[1]
                                if not mapFirstCoinCollected[mapName] then
                                    if firstCoin:FindFirstChild("CoinVisual") then
                                        teleportToCoin(firstCoin.CoinVisual)
                                        mapFirstCoinCollected[mapName] = true
                                    end
                                else
                                    teleportToCoin(firstCoin.CoinVisual)
                                    for _, coin in ipairs(coins) do
                                        if not autoFarmEnabled then
                                            print("Debug: AutoFarm stopped, exiting loop.")
                                            return
                                        end
                                        if coin:FindFirstChild("CoinVisual") then
                                            tweenToCoin(coin.CoinVisual)
                                        end
                                    end
                                end
                            end
                        else
                            print("Debug: No coin container found in map: " .. mapName)
                        end
                    else
                        print("Debug: Map not found: " .. mapName)
                    end
                end
                wait(1)
            end
        end)()
    end

    player.CharacterAdded:Connect(function(newCharacter)
        character = newCharacter
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        print("Debug: Character respawned, GUI remains visible.")
        if autoFarmEnabled then
            print("Debug: Resuming AutoFarm after respawn.")
            startAutoFarm()
        end
    end)

    player.OnTeleport:Connect(function(teleportState)
        if teleportState == Enum.TeleportState.Failed then
            local rejoinButton = Instance.new("TextButton", screenGui)
            rejoinButton.Size = UDim2.new(0, 200, 0, 50)
            rejoinButton.Position = UDim2.new(0.5, -100, 0, 130)
            rejoinButton.Text = "Rejoin Game"
            rejoinButton.MouseButton1Click:Connect(function()
                game:GetService("TeleportService"):Teleport(game.PlaceId, player)
            end)
        end
    end)
end)

-- Секция
local Tab = Window:NewTab("Universal FE")

-- Подсекция
local Section = Tab:NewSection("SF Hub | Universal FE")

-- Кнопка
Section:NewButton("Telekines", ":D Instruction - R - Roates Block, T - Tilts Block, Y - Throws Block, Q & E - bring closer and further", function()
        -- Q & E - bring closer and further
    -- R - Roates Block
    -- T - Tilts Block
    -- Y - Throws Block
    local function a(b, c)
        local d = getfenv(c)
        local e =
            setmetatable(
            {},
            {__index = function(self, f)
                    if f == "script" then
                        return b
                    else
                        return d[f]
                    end
                end}
        )
        setfenv(c, e)
        return c
    end
    local g = {}
    local h = Instance.new("Model", game:GetService("Lighting"))
    local i = Instance.new("Tool")
    local j = Instance.new("Part")
    local k = Instance.new("Script")
    local l = Instance.new("LocalScript")
    local m = sethiddenproperty or set_hidden_property
    i.Name = "☄"
    i.Parent = h
    i.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
    i.GripForward = Vector3.new(-0, -1, -0)
    i.GripRight = Vector3.new(0, 0, 1)
    i.GripUp = Vector3.new(1, 0, 0)
    j.Name = "Handle"
    j.Parent = i
    j.CFrame = CFrame.new(-17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, -1)
    j.Orientation = Vector3.new(0, 180, 90)
    j.Position = Vector3.new(-17.2635937, 15.4915619, 46)
    j.Rotation = Vector3.new(-180, 0, -90)
    j.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
    j.Transparency = 1
    j.Size = Vector3.new(1, 1.20000005, 1)
    j.BottomSurface = Enum.SurfaceType.Weld
    j.BrickColor = BrickColor.new("Really black")
    j.Material = Enum.Material.Metal
    j.TopSurface = Enum.SurfaceType.Smooth
    j.brickColor = BrickColor.new("Really black")
    k.Name = "LineConnect"
    k.Parent = i
    table.insert(
        g,
        a(
            k,
            function()
                wait()
                local n = script.Part2
                local o = script.Part1.Value
                local p = script.Part2.Value
                local q = script.Par.Value
                local color = script.Color
                local r = Instance.new("Part")
                r.TopSurface = 0
                r.BottomSurface = 0
                r.Reflectance = .5
                r.Name = "Laser"
                r.Locked = true
                r.CanCollide = false
                r.Anchored = true
                r.formFactor = 0
                r.Size = Vector3.new(1, 1, 1)
                local s = Instance.new("BlockMesh")
                s.Parent = r
                while true do
                    if n.Value == nil then
                        break
                    end
                    if o == nil or p == nil or q == nil then
                        break
                    end
                    if o.Parent == nil or p.Parent == nil then
                        break
                    end
                    if q.Parent == nil then
                        break
                    end
                    local t = CFrame.new(o.Position, p.Position)
                    local dist = (o.Position - p.Position).magnitude
                    r.Parent = q
                    r.BrickColor = color.Value.BrickColor
                    r.Reflectance = color.Value.Reflectance
                    r.Transparency = color.Value.Transparency
                    r.CFrame = CFrame.new(o.Position + t.lookVector * dist / 2)
                    r.CFrame = CFrame.new(r.Position, p.Position)
                    s.Scale = Vector3.new(.25, .25, dist)
                    wait()
                end
                r:remove()
                script:remove()
            end
        )
    )
    k.Disabled = true
    l.Name = "MainScript"
    l.Parent = i
    table.insert(
        g,
        a(
            l,
            function()
                wait()
                tool = script.Parent
                lineconnect = tool.LineConnect
                object = nil
                mousedown = false
                found = false
                BP = Instance.new("BodyPosition")
                BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                BP.P = BP.P * 1.1
                dist = nil
                point = Instance.new("Part")
                point.Locked = true
                point.Anchored = true
                point.formFactor = 0
                point.Shape = 0
                point.BrickColor = BrickColor.Black()
                point.Size = Vector3.new(1, 1, 1)
                point.CanCollide = false
                local s = Instance.new("SpecialMesh")
                s.MeshType = "Sphere"
                s.Scale = Vector3.new(.7, .7, .7)
                s.Parent = point
                handle = tool.Handle
                front = tool.Handle
                color = tool.Handle
                objval = nil
                local u = false
                local v = BP:clone()
                v.maxForce = Vector3.new(30000, 30000, 30000)
                function LineConnect(o, p, q)
                    local w = Instance.new("ObjectValue")
                    w.Value = o
                    w.Name = "Part1"
                    local x = Instance.new("ObjectValue")
                    x.Value = p
                    x.Name = "Part2"
                    local y = Instance.new("ObjectValue")
                    y.Value = q
                    y.Name = "Par"
                    local z = Instance.new("ObjectValue")
                    z.Value = color
                    z.Name = "Color"
                    local A = lineconnect:clone()
                    A.Disabled = false
                    w.Parent = A
                    x.Parent = A
                    y.Parent = A
                    z.Parent = A
                    A.Parent = workspace
                    if p == object then
                        objval = x
                    end
                end
                function onButton1Down(B)
                    if mousedown == true then
                        return
                    end
                    mousedown = true
                    coroutine.resume(
                        coroutine.create(
                            function()
                                local C = point:clone()
                                C.Parent = tool
                                LineConnect(front, C, workspace)
                                while mousedown == true do
                                    C.Parent = tool
                                    if object == nil then
                                        if B.Target == nil then
                                            local t = CFrame.new(front.Position, B.Hit.p)
                                            C.CFrame = CFrame.new(front.Position + t.lookVector * 1000)
                                        else
                                            C.CFrame = CFrame.new(B.Hit.p)
                                        end
                                    else
                                        LineConnect(front, object, workspace)
                                        break
                                    end
                                    wait()
                                end
                                C:remove()
                            end
                        )
                    )
                    while mousedown == true do
                        if B.Target ~= nil then
                            local D = B.Target
                            if D.Anchored == false then
                                object = D
                                dist = (object.Position - front.Position).magnitude
                                break
                            end
                        end
                        wait()
                    end
                    while mousedown == true do
                        if object.Parent == nil then
                            break
                        end
                        local t = CFrame.new(front.Position, B.Hit.p)
                        BP.Parent = object
                        BP.position = front.Position + t.lookVector * dist
                        wait()
                    end
                    BP:remove()
                    object = nil
                    objval.Value = nil
                end
                function onKeyDown(E, B)
                    local E = E:lower()
                    local F = false
                    if E == "q" then
                        if dist >= 5 then
                            dist = dist - 10
                        end
                    end
                    if E == "r" then
                        if object == nil then
                            return
                        end
                        for G, H in pairs(object:children()) do
                            if H.className == "BodyGyro" then
                                return nil
                            end
                        end
                        BG = Instance.new("BodyGyro")
                        BG.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
                        BG.cframe = CFrame.new(object.CFrame.p)
                        BG.Parent = object
                        repeat
                            wait()
                        until object.CFrame == CFrame.new(object.CFrame.p)
                        BG.Parent = nil
                        if object == nil then
                            return
                        end
                        for G, H in pairs(object:children()) do
                            if H.className == "BodyGyro" then
                                H.Parent = nil
                            end
                        end
                        object.Velocity = Vector3.new(0, 0, 0)
                        object.RotVelocity = Vector3.new(0, 0, 0)
                        object.Orientation = Vector3.new(0, 0, 0)
                    end
                    if E == "e" then
                        dist = dist + 10
                    end
                    if E == "t" then
                        if dist ~= 10 then
                            dist = 10
                        end
                    end
                    if E == "y" then
                        if dist ~= 200 then
                            dist = 200
                        end
                    end
                    if E == "=" then
                        BP.P = BP.P * 1.5
                    end
                    if E == "-" then
                        BP.P = BP.P * 0.5
                    end
                end
                function onEquipped(B)
                    keymouse = B
                    local I = tool.Parent
                    human = I.Humanoid
                    human.Changed:connect(
                        function()
                            if human.Health == 0 then
                                mousedown = false
                                BP:remove()
                                point:remove()
                                tool:remove()
                            end
                        end
                    )
                    B.Button1Down:connect(
                        function()
                            onButton1Down(B)
                        end
                    )
                    B.Button1Up:connect(
                        function()
                            mousedown = false
                        end
                    )
                    B.KeyDown:connect(
                        function(E)
                            onKeyDown(E, B)
                        end
                    )
                    B.Icon = "rbxasset://textures\\GunCursor.png"
                end
                tool.Equipped:connect(onEquipped)
            end
        )
    )
    for J, H in pairs(h:GetChildren()) do
        H.Parent = game:GetService("Players").LocalPlayer.Backpack
        pcall(
            function()
                H:MakeJoints()
            end
        )
    end
    h:Destroy()
    for J, H in pairs(g) do
        spawn(
            function()
                pcall(H)
            end
        )
    end
end)
