-- Script name: UI Library Roblox GUI
-- Version: D2.0
-- Author: Dang Dizi
-- Description: This script will help easy make script layout
Dizi = {}
Dizi.__index = Dizi
Dizi.Storage = {}

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- táº¡o constructor
function Dizi:new()
    local self = setmetatable({}, Dizi)

    self.width = 400
    self.height = 250
    self.tabWidth = 120
    self.headerHeight = 40
    self.logoSize = 30
    self.textColor = Color3.fromRGB(215, 215, 215)
    self.title = "Dizi Hub"
    self.logo = "rbxassetid://133458018032042"
    self.closeIcon = "rbxassetid://104975705317843"
    self.minIcon = "rbxassetid://82052087731298"
    self.maxIcon = "rbxassetid://119189737000754"
    self.guiHidden = false

    -- táº¡o há»‡ thá»‘ng vĂ  cĂ¡c dá»‹ch vá»¥ káº¿t ná»‘i game
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local MiniIcon = Instance.new("ImageButton")
    MiniIcon.Size = UDim2.new(0, 0, 0, 0)
    MiniIcon.Position = UDim2.new(0, 100, 0, 100)
    MiniIcon.Active = true
    MiniIcon.Draggable = true
    MiniIcon.BackgroundTransparency = 0.4
    MiniIcon.BorderSizePixel = 0
    MiniIcon.ClipsDescendants = true
    MiniIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MiniIcon.Parent = nil

    local dragStartPos

    MiniIcon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragStartPos = input.Position
        end
    end)

    MiniIcon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local movedDistance = (input.Position - dragStartPos).magnitude
            if movedDistance < 10 then -- Náº¿u khĂ´ng kĂ©o quĂ¡ xa thĂ¬ tĂ­nh lĂ  báº¥m
                self.mainFrame.Parent = gui
                local newSize = UDim2.new(0, self.width, 0, self.height)
                local newPosition = UDim2.new(0.5, -self.width / 2, 0.5, -self.height / 2)
                self:tweenUI(self.mainFrame, newPosition, newSize, nil, 0.2)

                self:tweenUI(MiniIcon, nil, UDim2.new(0, 0, 0, 0), nil, 0.2)
                wait(0.2)
                MiniIcon.Parent = nil
            end
        end
    end)

    local MiniIconRounded = Instance.new("UICorner")
    MiniIconRounded.CornerRadius = UDim.new(1, 0)
    MiniIconRounded.Parent = MiniIcon

    local MiniImage = Instance.new("ImageLabel")
    MiniImage.Image = self.logo
    MiniImage.Size = UDim2.new(0, 35, 0, 35)
    MiniImage.Position = UDim2.new(0.5, -35 / 2, 0.5, -35 / 2)
    MiniImage.BackgroundTransparency = 1
    MiniImage.Parent = MiniIcon

    -- táº¡o main frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, self.width, 0, self.height)
    mainFrame.Position = UDim2.new(0.5, -self.width / 2, 0.5, -self.height / 2)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BackgroundTransparency = 0.3
    mainFrame.ClipsDescendants = true
    mainFrame.BorderColor3 = Color3.fromRGB(126, 126, 126)
    mainFrame.Draggable = true
    mainFrame.Active = true
    mainFrame.Parent = gui
    self.mainFrame = mainFrame

    -- táº¡o header
    local headerFrame = Instance.new("Frame")
    headerFrame.Size = UDim2.new(1, 0, 0, self.headerHeight)
    headerFrame.Position = UDim2.new(0, 0, 0, 0)
    headerFrame.BorderColor3 = Color3.fromRGB(126, 126, 126)
    headerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    headerFrame.BackgroundTransparency = 0.4
    headerFrame.Parent = mainFrame
    self.headerFrame = headerFrame

    -- táº¡o logo header
    local logoImage = Instance.new("ImageLabel")
    logoImage.Size = UDim2.new(0, self.logoSize, 0, self.logoSize)
    logoImage.Position = UDim2.new(0, 10, 0.5, -self.logoSize / 2 - 1)
    logoImage.Image = self.logo
    logoImage.BackgroundTransparency = 1
    logoImage.BorderSizePixel = 0
    logoImage.Parent = headerFrame
    self.logoImage = logoImage

    -- táº¡o title cho header
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = self.title
    titleLabel.Size = UDim2.new(1, -self.logoSize - 20, 1, 0)
    titleLabel.Position = UDim2.new(0, self.logoSize + 15, 0, 0)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderSizePixel = 0
    titleLabel.TextSize = 20
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextColor3 = self.textColor
    titleLabel.Parent = headerFrame
    self.titleLabel = titleLabel

    -- táº¡o nĂºt close
    local closeBtn = Instance.new("ImageButton")
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -30, 0.5, -10)
    closeBtn.BackgroundTransparency = 1
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = headerFrame

    closeBtn.MouseButton1Click:Connect(function()
        local newSize = UDim2.new(0, 0, 0, 0)
        local newPosition = MiniIcon.Position
        self:tweenUI(mainFrame, newPosition, newSize, nil, 0.2)
        MiniIcon.Parent = gui
        self:tweenUI(MiniIcon, nil, UDim2.new(0, 60, 0, 60), nil, 0.2)
        wait(0.2)
        mainFrame.Parent = nil
    end)

    local closeBtnImage = Instance.new("ImageLabel")
    closeBtnImage.Image = self.closeIcon
    closeBtnImage.Size = UDim2.new(0, 18, 0, 18)
    closeBtnImage.Position = UDim2.new(0.5, -9, 0.5, -9)
    closeBtnImage.BackgroundTransparency = 1
    closeBtnImage.BorderSizePixel = 0
    closeBtnImage.ImageTransparency = 0.2
    closeBtnImage.Parent = closeBtn

    -- táº¡o nĂºt max button
    local maxBtn = Instance.new("ImageButton")
    maxBtn.Size = UDim2.new(0, 20, 0, 20)
    maxBtn.Position = UDim2.new(1, -60, 0.5, -10)
    maxBtn.BackgroundTransparency = 1
    maxBtn.BorderSizePixel = 0
    maxBtn.Parent = headerFrame

    local maxStatus = false
    maxBtn.MouseButton1Click:Connect(function()
        if maxStatus then
            local newSize = UDim2.new(0, self.width, 0, self.height)
            local newPosition = UDim2.new(0.5, -self.width / 2, 0.5, -self.height / 2)
            self:tweenUI(mainFrame, newPosition, newSize, nil, 0.2)
            maxStatus = false
        else
            local newSize = UDim2.new(0, self.width + 100, 0, self.height + 100)
            local newPosition = UDim2.new(0.5, -(self.width + 100) / 2, 0.5, -(self.height + 100) / 2)
            self:tweenUI(mainFrame, newPosition, newSize, nil, 0.2)
            maxStatus = true
        end
    end)

    local maxBtnImage = Instance.new("ImageLabel")
    maxBtnImage.Image = self.maxIcon
    maxBtnImage.Size = UDim2.new(0, 18, 0, 18)
    maxBtnImage.Position = UDim2.new(0.5, -9, 0.5, -9)
    maxBtnImage.BackgroundTransparency = 1
    maxBtnImage.BorderSizePixel = 0
    maxBtnImage.ImageTransparency = 0.2
    maxBtnImage.Parent = maxBtn

    -- táº¡o body frame
    local bodyFrame = Instance.new("Frame")
    bodyFrame.Size = UDim2.new(1, 0, 1, -self.headerHeight + 1)
    bodyFrame.Position = UDim2.new(0, 0, 0, self.headerHeight + 1)
    bodyFrame.BackgroundTransparency = 1
    bodyFrame.BorderSizePixel = 0
    bodyFrame.Parent = mainFrame
    self.bodyFrame = bodyFrame

    -- táº¡o tab frame
    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Size = UDim2.new(0, self.tabWidth, 1, 0)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    tabFrame.BackgroundTransparency = 0.6
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 0
    tabFrame.Parent = bodyFrame
    self.tabFrame = tabFrame

    local tabFrameList = Instance.new("UIListLayout")
    tabFrameList.FillDirection = Enum.FillDirection.Vertical
    tabFrameList.Parent = tabFrame
    self.tabFrameList = tabFrameList
    self:setAutoCanvasSize(self.tabFrame, self.tabFrameList)

    local tabFrameBorder = Instance.new("Frame")
    tabFrameBorder.Size = UDim2.new(0, 1, 1, 0)
    tabFrameBorder.Position = UDim2.new(0, self.tabWidth, 0, 0)
    tabFrameBorder.BackgroundColor3 = Color3.new(126, 126, 126)
    tabFrameBorder.BorderSizePixel = 0
    tabFrameBorder.BackgroundTransparency = 0.7
    tabFrameBorder.Parent = bodyFrame

    -- táº¡o action frame
    local actionFrame = Instance.new("Frame")
    actionFrame.Size = UDim2.new(1, -self.tabWidth - 2, 1, 0)
    actionFrame.Position = UDim2.new(0, self.tabWidth + 1, 0, 0)
    actionFrame.BackgroundTransparency = 0.6
    actionFrame.BorderSizePixel = 0
    actionFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    actionFrame.Parent = bodyFrame
    self.actionFrame = actionFrame
    return self
end

-- táº¡o getter setter
function Dizi:get(key, value)
    self.Storage[key] = value
end

function Dizi:set(key)
    return self.Storage[key]
end

-- táº¡o cĂ¡c hĂ m setter
function Dizi:setTitle(title)
    self.title = title
    self.titleLabel.Text = title
end

function Dizi:setLogo(logo)
    self.logo = logo
    self.logoImage.Image = logo
end

-- táº¡o tweenService
function Dizi:tweenUI(frame, newPosition, newSize, newColor, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

    local data = {}

    if newPosition then
        data.Position = newPosition
    end

    if newSize then
        data.Size = newSize
    end

    if newColor then
        data.BackgroundColor3 = newColor
    end

    local tween = TweenService:Create(frame, tweenInfo, data)
    tween:Play()
end

-- tá»± Ä‘á»™ng tĂ­nh toĂ¡n canvas size
function Dizi:setAutoCanvasSize(scroll, list)
    scroll.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 10)
    list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 10)
    end)
end

-- táº¡o tab button
function Dizi:createTab(icon, tabName, action)
    local tabButton = Instance.new("ImageButton")
    tabButton.BorderSizePixel = 0
    tabButton.BackgroundTransparency = 1
    tabButton.Size = UDim2.new(1, 0, 0, 30)
    tabButton.Parent = self.tabFrame

    local tabButtonBorder = Instance.new("Frame")
    tabButtonBorder.Size = UDim2.new(1, 0, 0, 1)
    tabButtonBorder.Position = UDim2.new(0, 0, 1, 0)
    tabButtonBorder.BorderSizePixel = 0
    tabButtonBorder.BackgroundColor3 = Color3.new(126, 126, 126)
    tabButtonBorder.BackgroundTransparency = 0.7
    tabButtonBorder.Parent = tabButton

    if icon then
        local tabImage = Instance.new("ImageLabel")
        tabImage.Size = UDim2.new(0, 12, 0, 12)
        tabImage.Position = UDim2.new(0, 10, 0.5, -12 / 2)
        tabImage.Image = icon
        tabImage.BackgroundTransparency = 1
        tabImage.BorderSizePixel = 0
        tabImage.Parent = tabButton
    end

    local tabText = Instance.new("TextLabel")
    tabText.Size = UDim2.new(1, 0, 1, 0)
    if icon then
        tabText.Position = UDim2.new(0, 30, 0, 0)
    else
        tabText.Position = UDim2.new(0, 15, 0, 0)
    end
    tabText.Text = tabName
    tabText.TextXAlignment = Enum.TextXAlignment.Left
    tabText.BackgroundTransparency = 1
    tabText.BorderSizePixel = 0
    tabText.TextColor3 = self.textColor
    tabText.Font = Enum.Font.Arial
    tabText.TextSize = 15
    tabText.Parent = tabButton

    local tab = setmetatable({
        Tab = tabButton,
        Root = self
    }, Dizi)
    return tab
end

-- thĂªm action vĂ o tab
function Dizi:setAction(action)
    self.Tab.MouseButton1Click:Connect(function()
        action.Root:cleanAction(action.Root.actionFrame)
        action.Frame.Parent = action.Root.actionFrame
    end)
end

function Dizi:cleanAction(action)
    for _, frame in pairs(action:GetChildren()) do
        frame.Parent = nil
    end
end

-- function Dizi:createAction(default)
--     local actionFrame = Instance.new("ScrollingFrame")
--     actionFrame.Size = UDim2.new(1, 0, 1, 0)
--     actionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
--     actionFrame.ScrollBarThickness = 2
--     actionFrame.BackgroundTransparency = 1
--     actionFrame.BorderSizePixel = 0

--     if default then
--         actionFrame.Parent = self.actionFrame
--     end

--     local actionFrameList = Instance.new("UIListLayout")
--     actionFrameList.FillDirection = Enum.FillDirection.Vertical
--     actionFrameList.SortOrder = Enum.SortOrder.LayoutOrder
--     actionFrameList.Parent = actionFrame

--     local action = setmetatable({
--         Frame = actionFrame,
--         List = actionFrameList,
--         Root = self,
--         _layoutOrder = 0
--     }, Dizi)

--     -- helper tÄƒng LayoutOrder
--     function action:nextOrder()
--         self._layoutOrder += 1
--         return self._layoutOrder
--     end

--     -- helper update CanvasSize tá»± Ä‘á»™ng
--     function action:updateCanvas()
--         local list = self.List
--         local totalHeight = 0
--         for _, obj in ipairs(self.Frame:GetChildren()) do
--             if obj:IsA("GuiObject") then
--                 totalHeight += obj.Size.Y.Offset
--             end
--         end
--         self.Frame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
--     end

--     return action
-- end

-- function Dizi:createAction(default)
--     local actionFrame = Instance.new("ScrollingFrame")
--     actionFrame.Size = UDim2.new(1, 0, 1, 0)
--     actionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
--     actionFrame.ScrollBarThickness = 2
--     actionFrame.BackgroundTransparency = 1
--     actionFrame.BorderSizePixel = 0

--     if default then
--         actionFrame.Parent = self.actionFrame
--     end

--     local actionFrameList = Instance.new("UIListLayout")
--     actionFrameList.FillDirection = Enum.FillDirection.Vertical
--     actionFrameList.Parent = actionFrame

--     local action = setmetatable({
--         Frame = actionFrame,
--         List = actionFrameList,
--         Root = self
--     }, Dizi)
--     return action
-- end

function Dizi:createAction(default)
    local actionFrame = Instance.new("ScrollingFrame")
    actionFrame.Size = UDim2.new(1, 0, 1, 0)
    actionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    actionFrame.ScrollBarThickness = 2
    actionFrame.BackgroundTransparency = 1
    actionFrame.BorderSizePixel = 0
    actionFrame.AutomaticCanvasSize = Enum.AutomaticSize.None

    if default then
        actionFrame.Parent = self.actionFrame
    end

    local actionFrameList = Instance.new("UIListLayout")
    actionFrameList.FillDirection = Enum.FillDirection.Vertical
    actionFrameList.SortOrder = Enum.SortOrder.LayoutOrder
    actionFrameList.Parent = actionFrame

    -- 🔴 QUAN TRỌNG: cập nhật CanvasSize khi nội dung thay đổi
    actionFrameList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        actionFrame.CanvasSize = UDim2.new(
            0,
            0,
            0,
            actionFrameList.AbsoluteContentSize.Y + 80
        )
    end)

    local action = setmetatable({
        Frame = actionFrame,
        List = actionFrameList,
        Root = self
    }, Dizi)

    return action
end


-- táº¡o text
function Dizi:createText(text, color)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.Size = UDim2.new(1, 0, 0, 20)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.BackgroundTransparency = 1
    textLabel.BorderSizePixel = 0
    textLabel.TextColor3 = self.Root.textColor
    textLabel.Font = Enum.Font.SourceSansSemibold
    textLabel.TextSize = 16
    if color then
        textLabel.TextColor3 = color
    end
    textLabel.Parent = self.Frame

    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 10)
    textPadding.Parent = textLabel
end

-- táº¡o label
function Dizi:createLabel(text, color)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.Size = UDim2.new(1, 0, 0, 20)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.BackgroundTransparency = 1
    textLabel.BorderSizePixel = 0
    textLabel.TextColor3 = self.Root.textColor
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    if color then
        textLabel.TextColor3 = color
    end
    textLabel.Parent = self.Frame

    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 10)
    textPadding.Parent = textLabel
end

-- táº¡o toggle switch
function Dizi:createToggleSwitch(label, callable)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = label
    textLabel.Size = UDim2.new(1, 0, 0, 20)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.BackgroundTransparency = 1
    textLabel.BorderSizePixel = 0
    textLabel.TextColor3 = self.Root.textColor
    textLabel.Font = Enum.Font.SourceSansSemibold
    textLabel.TextSize = 16
    textLabel.Parent = self.Frame

    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 10)
    textPadding.Parent = textLabel

    local toggleButton = Instance.new("ImageButton")
    toggleButton.Size = UDim2.new(0, 35, 0, 14)
    toggleButton.Position = UDim2.new(1, -50, 0.5, -14 / 2)
    toggleButton.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
    toggleButton.Parent = textLabel

    local rounded = Instance.new("UICorner")
    rounded.CornerRadius = UDim.new(1, 0)
    rounded.Parent = toggleButton

    local toggleButtonDot = Instance.new("Frame")
    toggleButtonDot.Size = UDim2.new(0, 18, 0, 18)
    toggleButtonDot.Position = UDim2.new(0, 0, 0.5, -18 / 2)
    toggleButtonDot.BackgroundColor3 = Color3.fromRGB(35, 182, 69)
    toggleButtonDot.Parent = toggleButton

    local rounded2 = Instance.new("UICorner")
    rounded2.CornerRadius = UDim.new(1, 0)
    rounded2.Parent = toggleButtonDot

    local storke = Instance.new("UIStroke")
    storke.Thickness = 1
    storke.Color = Color3.fromRGB(78, 77, 77)
    storke.Parent = toggleButtonDot

    local onStatus = false
    toggleButton.MouseButton1Click:Connect(function()
        if onStatus then
            self.Root:tweenUI(toggleButtonDot, UDim2.new(0, 0, 0.5, -18 / 2), nil, nil, 0.2)
            self.Root:tweenUI(toggleButton, nil, nil, Color3.fromRGB(93, 93, 93), 0.2)
            onStatus = false
        else
            self.Root:tweenUI(toggleButtonDot, UDim2.new(1, -18, 0.5, -18 / 2), nil, nil, 0.2)
            self.Root:tweenUI(toggleButton, nil, nil, Color3.fromRGB(35, 182, 69), 0.2)
            onStatus = true
        end

        callable(onStatus)
    end)
end

function Dizi:createButton(label, text, callable)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = label
    textLabel.Size = UDim2.new(1, 0, 0, 30)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.BackgroundTransparency = 1
    textLabel.BorderSizePixel = 0
    textLabel.TextColor3 = self.Root.textColor
    textLabel.Font = Enum.Font.SourceSansSemibold
    textLabel.TextSize = 16
    textLabel.Parent = self.Frame

    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 10)
    textPadding.Parent = textLabel

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 25)
    button.Position = UDim2.new(1, -115, 0.5, -25 / 2)
    button.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(216, 216, 216)
    button.BorderColor3 = Color3.fromRGB(39, 178, 92)
    button.Parent = textLabel

    button.MouseButton1Click:Connect(function()
        if typeof(callable) == "function" then
            local ok, err = pcall(callable)
            if not ok then
                warn("Dizi:createButton error:", err)
            end
        end
    end)
end

-- táº¡o dropdown
function Dizi:createDropdown(label, list, callable)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = label
    textLabel.Size = UDim2.new(1, 0, 0, 30)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.BackgroundTransparency = 1
    textLabel.BorderSizePixel = 0
    textLabel.TextColor3 = self.Root.textColor
    textLabel.Font = Enum.Font.SourceSansSemibold
    textLabel.TextSize = 16
    textLabel.Parent = self.Frame

    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 10)
    textPadding.Parent = textLabel

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Size = UDim2.new(0, 100, 0, 20)
    dropdownButton.Position = UDim2.new(1, -115, 0.5, -20 / 2)
    dropdownButton.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
    dropdownButton.Text = "---select---"
    dropdownButton.TextColor3 = Color3.fromRGB(216, 216, 216)
    dropdownButton.BorderColor3 = Color3.fromRGB(39, 178, 92)
    dropdownButton.Parent = textLabel

    local dropdownFrame = Instance.new("ScrollingFrame")
    dropdownFrame.Size = UDim2.new(1, 0, 0, 80)
    dropdownFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    dropdownFrame.Position = UDim2.new(0, 0, 1, 0)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
    dropdownFrame.ScrollBarThickness = 0
    dropdownFrame.ZIndex = 5
    dropdownFrame.BorderSizePixel = 0
    -- dropdownFrame.Parent = dropdownButton

    local dropdownList = Instance.new("UIListLayout")
    dropdownList.FillDirection = Enum.FillDirection.Vertical
    dropdownList.Parent = dropdownFrame
    self.Root:setAutoCanvasSize(dropdownFrame, dropdownList)

    for _, item in ipairs(list) do
        local label = item.label or tostring(item)
        local value = item.value or item

        local itemButton = Instance.new("TextButton")
        itemButton.Text = label
        itemButton.ZIndex = 6
        itemButton.Size = UDim2.new(1, 0, 0, 20)
        itemButton.Parent = dropdownFrame

        itemButton.MouseButton1Click:Connect(function()
            dropdownButton.Text = label
            dropdownFrame.Parent = nil
            if callable then
                callable({
                    label = label,
                    value = value
                })
            end
        end)
    end

    dropdownButton.MouseButton1Click:Connect(function()
        if dropdownFrame.Parent == nil then
            dropdownFrame.Parent = dropdownButton -- show
        else
            dropdownFrame.Parent = nil        -- hide
        end
    end)
end

function Dizi:createHr()
    local container = Instance.new("TextLabel")
    container.Size = UDim2.new(1, 0, 0, 19) -- tÄƒng tá»•ng chiá»u cao
    container.BackgroundTransparency = 1
    container.Text = ""
    container.Parent = self.Frame

    -- spacer trĂªn 12px
    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, 0, 12)
    top.BackgroundTransparency = 1
    top.Parent = container

    -- HR má»ng 1px
    local hr = Instance.new("Frame")
    hr.Size = UDim2.new(1, -20, 0, 1)
    hr.Position = UDim2.new(0, 10, 0, 12) -- ngay sau spacer trĂªn
    hr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    hr.BackgroundTransparency = 0.6
    hr.BorderSizePixel = 0
    hr.Parent = container

    -- spacer dÆ°á»›i 6px
    local bottom = Instance.new("Frame")
    bottom.Size = UDim2.new(1, 0, 0, 6)
    bottom.Position = UDim2.new(0, 0, 0, 13) -- ngay dÆ°á»›i HR (12 + 1)
    bottom.BackgroundTransparency = 1
    bottom.Parent = container
end
