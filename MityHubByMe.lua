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
local Window = Library.CreateLib("MitqyHub - T.me/mitqydev", "RJTheme3")

-- Секция
local Tab = Window:NewTab("Visual")

-- Подсекция
local Section = Tab:NewSection("MitqyHub - T.me/mitqydev | Visuals")

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
Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
	print("You just clicked the bind")
end)

-- Дропдаун
Section:NewDropdown("Nothing...", ":/", {"Scroll it.", "Scroll it.", "Scroll it."}, function(currentOption)
    print(currentOption)
end)

-- Секция
local Tab = Window:NewTab("Troll")

local Section = Tab:NewSection("MitqyHub - T.me/mitqydev | Trolling")

local Section = Tab:NewSection("Fling")

-- Кнопка
Section:NewButton("Fling All", "Fling All :D", function()
    print("By mitqydev")
end)

-- Текст Бокс
Section:NewTextBox("Fling Player", "Write username player in text box!", function(txt)
	print(txt)
end)

local Section = Tab:NewSection("Chat💬")

-- Текст Бокс
Section:NewTextBox("Spam chat💬", "Write message for spam!", function(txt)
	print(txt)
end)

-- Кнопка
Section:NewButton("Draw in chat🎨🖌️", "Draw?💬", function()
    print("By mitqydev")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/thenormalchel/RbxScripts/refs/heads/main/DrawChatMity.lua'))()
end)

local Tab = Window:NewTab("Player")

local Section = Tab:NewSection("MitqyHub - T.me/mitqydev | Player")

-- Слайдер
Section:NewSlider("SpeedHack", "Change you'r speed", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

-- Секция
local Tab = Window:NewTab("MM2")

-- Подсекция
local Section = Tab:NewSection("MitqyHub - T.me/mitqydev | MM2")

-- Заголовок
Section:NewLabel("  --- Visual ---  ")

-- Переключатель
Section:NewToggle("Chams", "Toggle - Chams", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP"))(' Watermelon ?')
        print("Chams On! | Thanks - ScriptNoKeys")
    else
        print("Chams Off!")
    end
end)
