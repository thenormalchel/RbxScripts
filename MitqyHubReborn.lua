--<>----<>----<>----< Main Script >----<>----<>----<>--
print("[MITQY-HUB REBORN! | MURDER MISTERY 2]: loading...")
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

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

-- Creating tabs
local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
    Main = Window:AddTab({ Title = "Main", Icon = "code" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "diamond" }),
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
