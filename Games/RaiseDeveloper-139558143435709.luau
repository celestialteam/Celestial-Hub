return function(Rayfield, Window, ...)

    --// services
    local Players = game:GetService("Players")

    --//
    local Tab = Window:CreateTab("Main", "hard-hat") -- Title, Image

    do
        local AutoFarm, AutoCollect = false, false

        Tab:CreateToggle({
            Name = "Auto click pet",
            CurrentValue = false,
            Callback = function(Value)
                AutoFarm = Value
            end
        })

        Tab:CreateToggle({
            Name = "Auto collect",
            CurrentValue = false,
            Callback = function(Value)
                AutoCollect = Value
            end
        })

        task.spawn(function()
            while task.wait() do
                if AutoFarm then
                    fireclickdetector(workspace.DevPet:FindFirstChild("ClickDetector"))
                end

                if AutoCollect then
                    for i, v in workspace:GetChildren() do
                        if v.Name == "Cash" then
                            pcall(function()
                                v.CFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            end)
                        end
                    end
                end
            end
        end)
    end
end