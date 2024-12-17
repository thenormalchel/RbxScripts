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
