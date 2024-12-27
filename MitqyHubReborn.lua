--<>----<>----<>----< Main Script >----<>----<>----<>--
print("[MITQY-HUB REBORN! | MURDER MISTERY 2]: loading...")
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local StarterPlayer = game:GetService("StarterPlayer")
warn("MitqyHub Reborn - T.me/mitqydev")
local Window = Fluent:CreateWindow({
    Title = "MitqyHub Reborn",
    SubTitle = "v2",
    TabWidth = 150,
    Size = UDim2.fromOffset(600, 400),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

    Fluent:Notify({
        Title = "MitqyHub Reborn",
        Content = "Thanks to use my script!",
        SubContent = "TG Dev Channel - T.me/mitqyhub", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })


-- Creating tabs
local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
    Main = Window:AddTab({ Title = "Main", Icon = "code" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "diamond" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "code" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "compass" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "file-text" }),
    Fun = Window:AddTab({ Title = "Fun", Icon = "coffee" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Its Source Code Bruh - T.me/mitqydev

    Tabs.Combat:AddButton({
        Title = "Kill All",
        Description = "Kill everyone with one button :3 (Works if you're a Murder! :D",
        Callback = function()
            Window:Dialog({
                Title = "You sure want kill all?",
                Content = "It can be detected!",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Genocide lol.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Pacifist.")
                        end
                    }
                }
            })
        end
    })

        local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Speedhack",
        Description = "Change you'r speed!",
        Default = 15,
        Min = 0,
        Max = 200,
        Rounding = 1,
        Callback = function(SpeedValueSigma)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValueSigma
        end
    })

        Tabs.Home:AddButton({
        Title = "Developer's Telegram Channel",
        Description = "Copy the link to the developer's telegram channel :3",
        Callback = function()
            Window:Dialog({
                Title = "Copy TG Link",
                Content = "Copy The Link?",
                Buttons = {
                    {
                        Title = "Yes :D",
                        Callback = function()
                            setclipboard("https://t.me/mitqyhub")
                        end
                    },
                    {
                        Title = "No :()",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

        Tabs.Main:AddButton({
        Title = "Die",
        Description = "Kill local player :3",
        Callback = function()
            Window:Dialog({
                Title = "Die?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            game.Players.LocalPlayer.Character.Humanoid.Health = 0
                        end
                    },
                    {
                        Title = "No)",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

        local Slider = Tabs.Misc:AddSlider("Slider", {
        Title = "Custom FOV",
        Description = "Change you'r FOV, lol.",
        Default = 60,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(FovValueBruh)
            workspace.Camera.FieldOfView = FovValueBruh
        end
    })

    local Toggle = Tabs.Visuals:AddToggle("ESP", {Title = "Esp", Default = false })

    Toggle:OnChanged(function()
        print("Toggle Esp:")
    end)


        Tabs.Fun:AddButton({
        Title = "Bang😅",
        Description = "You are such a naughty boy)))",
        Callback = function()
            Window:Dialog({
                Title = "YOU ARE SURE?",
                Content = "Do you want to masturbate?",
                Buttons = {
                    {
                        Title = "Yes :)",
                        Callback = function()
                            setclipboard("https://pastebin.com/EuHBvQmF")
                        end
                    },
                    {
                        Title = "No.",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    
    local Input = Tabs.Fun:AddInput("FlingPLR", {
        Title = "Fling Player",
        Default = "Write username...",
        Placeholder = "Write username...",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(txt)
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
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)

        Tabs.Fun:AddButton({
        Title = "Fling All",
        Description = "Fling All?",
        Callback = function()
            Window:Dialog({
                Title = "YOU ARE SURE?",
                Content = "Its can detected",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
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

                            if not Welcome then Message("Script by mitqydev", "T.me/mitqydev", 5) end
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
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

        Tabs.Teleports:AddButton({
        Title = "TP To Lobby",
        Description = "Teleport to lobby (MM2)",
        Callback = function()
            Window:Dialog({
                Title = "YOU ARE SURE?",
                Content = "Do you want to masturbate?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            local player = game.Players.LocalPlayer
                            local char = player.Character or player.CharacterAdded:Wait()
                            local pos = Vector3.new(-107, 135, 19)

                            char:MoveTo(pos)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
