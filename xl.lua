
local Player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")

Player.Idled:Connect(function()
    game:GetService("VirtalUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtalUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

function validCharacter(char)
	if char and char:IsA("Model") then
		local hum = char:FindFirstChildWhichIsA("Humanoid")
		if hum and hum.Health > 0 then
			local hrp = char.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
			if hrp then
				return true
			end
		end
	end
	return false
end

function inMatch()
    return Player.PlayerGui.MainGUI.Game.CashBag.Visible
end
getgenv().startFarming = true
while getgenv().startFarming do
    wait()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if not getgenv().startFarming then return end
        if v:FindFirstChild("CoinType") and v.Name == "Coin_Server" and validCharacter(Player.Character) and inMatch() and v:FindFirstChild("CoinType").Value ~= nil and v:FindFirstChild("CoinType").Value:find("Candy") and v.Transparency > 0 and v:FindFirstChild("Coin") then
            if not getgenv().startFarming == true then return end
            pcall(function()
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(v.Coin.Position + Vector3.new(0, 3, 0)) * CFrame.Angles(90, 0, 0)
                wait(0.7)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-107.101, 137.823, 1.04364)
                wait(1.6)
            end)
        end
    end
end
