print("Я разработчик если что Deep HvH и мне было так легче вставить скрипт")
-- Таблица для хранения исходных позиций игроков
local originalPositions = {}

local function teleportPlayersTo(targetPlayerName)
    -- Находим целевого игрока
    local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
    if not targetPlayer then
        warn(
            "Игрок с именем '"
                .. targetPlayerName
                .. "' не найден!"
        )
        return
    end

    -- Проверяем, что у целевого игрока есть персонаж
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then
        warn(
            "У игрока '"
                .. targetPlayerName
                .. "' нет персонажа!"
        )
        return
    end

    -- Находим точку телепортации (используем HumanoidRootPart)
    local targetCFrame = targetCharacter:FindFirstChild('HumanoidRootPart')
    if not targetCFrame then
        warn(
            "У персонажа игрока '"
                .. targetPlayerName
                .. "' нет HumanoidRootPart!"
        )
        return
    end

    -- Очищаем таблицу с исходными позициями
    originalPositions = {}

    -- Телепортируем всех игроков к целевому игроку
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= targetPlayer then -- Не телепортируем самого целевого игрока
            local character = player.Character
            if character then
                local humanoidRootPart =
                    character:FindFirstChild('HumanoidRootPart')
                if humanoidRootPart then
                    -- Сохраняем исходную позицию игрока
                    originalPositions[player.Name] = {
                        CFrame = humanoidRootPart.CFrame,
                        Humanoid = character:FindFirstChildOfClass(
                            'Humanoid'
                        ),
                    }

                    -- Отключаем возможность ходить
                    local humanoid = originalPositions[player.Name].Humanoid
                    if humanoid then
                        humanoid:SetAttribute(
                            'OriginalWalkSpeed',
                            humanoid.WalkSpeed
                        )
                        humanoid.WalkSpeed = 0
                    end

                    -- Телепортируем основного персонажа
                    humanoidRootPart.CFrame = targetCFrame.CFrame
                        + Vector3.new(0, 0, -3) -- Немного смещаем, чтобы не сливаться

                    -- Телепортируем хитбокс, если он есть
                    local hitbox = character:FindFirstChild('Hitbox')
                        or character:FindFirstChildWhichIsA(
                            'BasePart',
                            true
                        )
                    if hitbox then
                        hitbox.CFrame = targetCFrame.CFrame
                            + Vector3.new(0, 0, -3)
                    end
                end
            end
        end
    end

    print(
        'Все игроки телепортированы к '
            .. targetPlayerName
    )

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
                local humanoidRootPart =
                    character:FindFirstChild('HumanoidRootPart')
                if humanoidRootPart and data.CFrame then
                    -- Возвращаем персонажа на исходную позицию
                    humanoidRootPart.CFrame = data.CFrame

                    -- Восстанавливаем возможность ходить
                    if data.Humanoid then
                        local originalSpeed =
                            data.Humanoid:GetAttribute('OriginalWalkSpeed')
                        data.Humanoid.WalkSpeed = originalSpeed or 16
                    end
                end
            end
        end
    end

    print(
        'Все игроки возвращены на свои исходные позиции'
    )
    originalPositions = {} -- Очищаем таблицу
end

-- Пример использования:
teleportPlayersTo(sfusername) -- Телепортирует всех к текущему игроку
end)
