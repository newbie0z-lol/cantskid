-- 📦 Tạo UI
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Name = "WarningUI"

-- 🌫️ Nền mờ
local blurFrame = Instance.new("Frame", screenGui)
blurFrame.Size = UDim2.new(1, 0, 1, 0)
blurFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blurFrame.BackgroundTransparency = 0.5
blurFrame.ZIndex = 5

-- 📝 Dòng cảnh báo
local warningText = Instance.new("TextLabel", blurFrame)
warningText.Size = UDim2.new(0.7, 0, 0.2, 0)
warningText.Position = UDim2.new(0.15, 0, 0.35, 0)
warningText.Text = "⚠️ Script đã bị xóa\nCập nhật script mới tại Discord"
warningText.TextScaled = true
warningText.Font = Enum.Font.GothamBold
warningText.TextColor3 = Color3.new(1, 1, 1)
warningText.BackgroundTransparency = 1
warningText.TextStrokeTransparency = 0.8
warningText.ZIndex = 6
warningText.TextTransparency = 1

-- 🔘 Nút copy đẹp
local copyButton = Instance.new("TextButton", blurFrame)
copyButton.Size = UDim2.new(0.3, 0, 0.08, 0)
copyButton.Position = UDim2.new(0.35, 0, 0.6, 0)
copyButton.Text = "📋 Sao chép link Discord"
copyButton.TextScaled = true
copyButton.Font = Enum.Font.GothamMedium
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.BackgroundColor3 = Color3.new(1, 1, 1)
copyButton.BackgroundTransparency = 0.8
copyButton.BorderColor3 = Color3.new(1, 1, 1)
copyButton.BorderSizePixel = 2
copyButton.AutoButtonColor = false
copyButton.ZIndex = 5
copyButton.TextTransparency = 1

-- 💬 Copy khi click
local discordLink = "https://discord.gg/V4ymxbdZ" -- Thay bằng link thật
copyButton.MouseButton1Click:Connect(function()
	setclipboard(discordLink)
	copyButton.Text = "✅ Đã sao chép!"
	wait(1.5)
	copyButton.Text = "📋 Sao chép link Discord"
end)

-- ⏳ Hiện từ từ (Fade-in 2s)
for i = 1, 20 do
	local alpha = i * 0.05
	blurFrame.BackgroundTransparency = 1 - alpha
	warningText.TextTransparency = 1 - alpha
	copyButton.TextTransparency = 1 - alpha
	wait(0.1)
end

-- ⏱ Giữ 5 giây
wait(5)

-- ⏳ Ẩn từ từ (Fade-out 2s)
for i = 1, 20 do
	local alpha = i * 0.05
	blurFrame.BackgroundTransparency = alpha
	warningText.TextTransparency = alpha
	copyButton.TextTransparency = alpha
	wait(0.1)
end

-- 🗑️ Dọn sạch
screenGui:Destroy()
