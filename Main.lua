--[[
    ╔═══════════════════════════════════════════════════════╗
    ║         SEA MINH UI LIBRARY v3.0.0                    ║
    ║         Full Features + Notifications + More          ║
    ║         Discord: https://discord.gg/kJqB7R242H        ║
    ╚═══════════════════════════════════════════════════════╝
]]--

local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local HttpService = game:GetService('HttpService')

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- ============================================================
-- MAIN LIBRARY
-- ============================================================
local SeaMinhUI = {
    Version = '3.0.0',
    Windows = {},
    Theme = 'Dark',
    Notifications = {}
}

-- ============================================================
-- THEMES
-- ============================================================
local Themes = {
    Dark = {
        Accent = Color3.fromRGB(96, 205, 255),
        Main = Color3.fromRGB(30, 30, 30),
        Border = Color3.fromRGB(70, 70, 70),
        Tab = Color3.fromRGB(100, 100, 100),
        Element = Color3.fromRGB(50, 50, 50),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(80, 80, 80),
        Success = Color3.fromRGB(52, 211, 153),
        Warning = Color3.fromRGB(251, 191, 36),
        Error = Color3.fromRGB(239, 68, 68),
        Info = Color3.fromRGB(96, 205, 255)
    }
}

-- ============================================================
-- ICONS
-- ============================================================
local Icons = {
    ['x'] = 'rbxassetid://10747384394',
    ['minus'] = 'rbxassetid://10734896206',
    ['chevron'] = 'rbxassetid://10709790948',
    ['check'] = 'rbxassetid://10709790644',
    ['home'] = 'rbxassetid://10723407389',
    ['settings'] = 'rbxassetid://10734950309',
    ['user'] = 'rbxassetid://10747373176',
    ['star'] = 'rbxassetid://10734966248',
    ['bell'] = 'rbxassetid://10723407389',
    ['info'] = 'rbxassetid://10723415903',
    ['alert'] = 'rbxassetid://10747384394',
    ['search'] = 'rbxassetid://10734943674',
    ['box'] = 'rbxassetid://10734882525'
}

-- ============================================================
-- SAVE MANAGER
-- ============================================================
local SaveManager = {Folder = "SeaMinhUI", Data = {}}

function SaveManager:Init()
    pcall(function()
        if not isfolder(self.Folder) then makefolder(self.Folder) end
        if not isfile(self.Folder .. "/data.json") then
            writefile(self.Folder .. "/data.json", "{}")
        end
        self.Data = HttpService:JSONDecode(readfile(self.Folder .. "/data.json"))
    end)
    return self
end

function SaveManager:Get(k, d) return self.Data[k] or d end
function SaveManager:Set(k, v) self.Data[k] = v end
function SaveManager:Save()
    pcall(function()
        writefile(self.Folder .. "/data.json", HttpService:JSONEncode(self.Data))
    end)
end

SaveManager:Init()

-- ============================================================
-- NOTIFICATION SYSTEM
-- ============================================================
function SeaMinhUI:Notify(config)
    config.Title = config.Title or "Notification"
    config.Content = config.Content or ""
    config.Duration = config.Duration or 3
    config.Type = config.Type or "Info" -- Info, Success, Warning, Error
    
    local notifGui = Instance.new('ScreenGui')
    notifGui.Name = 'SeaMinhNotif'
    notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    notifGui.Parent = RunService:IsStudio() and LocalPlayer.PlayerGui or game.CoreGui
    
    local notif = Instance.new('Frame')
    notif.Size = UDim2.fromOffset(320, 80)
    notif.Position = UDim2.new(1, -340, 1, 100)
    notif.BackgroundColor3 = Themes.Dark.Main
    notif.Parent = notifGui
    Instance.new('UICorner', notif).CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new('UIStroke', notif)
    stroke.Color = Themes.Dark[config.Type] or Themes.Dark.Info
    stroke.Thickness = 2
    
    -- Icon
    local iconFrame = Instance.new('Frame')
    iconFrame.Size = UDim2.fromOffset(50, 80)
    iconFrame.BackgroundColor3 = Themes.Dark[config.Type] or Themes.Dark.Info
    iconFrame.Parent = notif
    Instance.new('UICorner', iconFrame).CornerRadius = UDim.new(0, 8)
    
    local icon = Instance.new('ImageLabel')
    icon.Size = UDim2.fromOffset(24, 24)
    icon.Position = UDim2.fromScale(0.5, 0.5)
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.BackgroundTransparency = 1
    icon.Image = Icons[config.Icon or 'bell']
    icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    icon.Parent = iconFrame
    
    -- Text Container
    local textContainer = Instance.new('Frame')
    textContainer.Size = UDim2.new(1, -60, 1, -10)
    textContainer.Position = UDim2.fromOffset(55, 5)
    textContainer.BackgroundTransparency = 1
    textContainer.Parent = notif
    
    local title = Instance.new('TextLabel')
    title.Text = config.Title
    title.Size = UDim2.new(1, 0, 0, 20)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextColor3 = Themes.Dark.Text
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Top
    title.Parent = textContainer
    
    local content = Instance.new('TextLabel')
    content.Text = config.Content
    content.Size = UDim2.new(1, 0, 1, -25)
    content.Position = UDim2.fromOffset(0, 22)
    content.BackgroundTransparency = 1
    content.Font = Enum.Font.Gotham
    content.TextSize = 12
    content.TextColor3 = Themes.Dark.SubText
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextYAlignment = Enum.TextYAlignment.Top
    content.TextWrapped = true
    content.Parent = textContainer
    
    -- Close Button
    local closeBtn = Instance.new('TextButton')
    closeBtn.Size = UDim2.fromOffset(20, 20)
    closeBtn.Position = UDim2.new(1, -25, 0, 5)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = '✕'
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.TextColor3 = Themes.Dark.SubText
    closeBtn.Parent = notif
    
    -- Animations
    notif:TweenPosition(UDim2.new(1, -340, 1, -100), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true)
    
    local function close()
        notif:TweenPosition(UDim2.new(1, -340, 1, 100), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.3, true)
        task.wait(0.3)
        notifGui:Destroy()
    end
    
    closeBtn.MouseButton1Click:Connect(close)
    
    task.delay(config.Duration, close)
    
    return {
        Close = close,
        SetTitle = function(t) title.Text = t end,
        SetContent = function(c) content.Text = c end
    }
end

-- ============================================================
-- CREATE WINDOW
-- ============================================================
function SeaMinhUI:CreateWindow(config)
    config = config or {}
    config.Title = config.Title or "Sea Minh UI"
    config.Size = config.Size or UDim2.fromOffset(600, 500)
    config.MinimizeKey = config.MinimizeKey or Enum.KeyCode.RightControl
    config.Center = config.Center ~= false
    
    local gui = Instance.new('ScreenGui')
    gui.Name = 'SeaMinhUI'
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = RunService:IsStudio() and LocalPlayer.PlayerGui or game.CoreGui
    
    pcall(function()
        if syn and syn.protect_gui then syn.protect_gui(gui)
        elseif protectgui then protectgui(gui) end
    end)
    
    local window = {
        Root = nil,
        Tabs = {},
        GUI = gui,
        Dragging = false,
        Visible = true,
        Config = config
    }
    
    local size = config.Size
    
    window.Root = Instance.new('Frame')
    window.Root.Size = size
    if config.Center then
        window.Root.Position = UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2)
    else
        window.Root.Position = config.Position or UDim2.fromOffset(50, 50)
    end
    window.Root.BackgroundTransparency = 1
    window.Root.Parent = gui
    
    -- Shadow effect
    local shadow = Instance.new('ImageLabel')
    shadow.Name = 'Shadow'
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.Position = UDim2.fromOffset(-15, -15)
    shadow.BackgroundTransparency = 1
    shadow.Image = 'rbxassetid://5554236805'
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.7
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.Parent = window.Root
    
    local bg = Instance.new('Frame')
    bg.Size = UDim2.fromScale(1, 1)
    bg.BackgroundColor3 = Themes.Dark.Main
    bg.Parent = window.Root
    Instance.new('UICorner', bg).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new('UIStroke', bg)
    stroke.Color = Themes.Dark.Border
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    
    -- Title Bar
    local titleBar = Instance.new('Frame')
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundTransparency = 1
    titleBar.Parent = window.Root
    
    -- Icon
    if config.Icon then
        local iconImg = Instance.new('ImageLabel')
        iconImg.Size = UDim2.fromOffset(20, 20)
        iconImg.Position = UDim2.fromOffset(12, 10)
        iconImg.BackgroundTransparency = 1
        iconImg.Image = Icons[config.Icon] or config.Icon
        iconImg.ImageColor3 = Themes.Dark.Accent
        iconImg.Parent = titleBar
    end
    
    -- Title
    local title = Instance.new('TextLabel')
    title.Text = config.Title
    title.Size = UDim2.new(1, -100, 1, 0)
    title.Position = UDim2.fromOffset(config.Icon and 40 or 16, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 15
    title.TextColor3 = Themes.Dark.Text
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar
    
    -- SubTitle
    if config.SubTitle then
        title.Size = UDim2.new(1, -100, 0, 18)
        title.Position = UDim2.fromOffset(config.Icon and 40 or 16, 4)
        
        local subtitle = Instance.new('TextLabel')
        subtitle.Text = config.SubTitle
        subtitle.Size = UDim2.new(1, -100, 0, 14)
        subtitle.Position = UDim2.fromOffset(config.Icon and 40 or 16, 22)
        subtitle.BackgroundTransparency = 1
        subtitle.Font = Enum.Font.Gotham
        subtitle.TextSize = 11
        subtitle.TextColor3 = Themes.Dark.SubText
        subtitle.TextTransparency = 0.3
        subtitle.TextXAlignment = Enum.TextXAlignment.Left
        subtitle.Parent = titleBar
    end
    
    -- Close Button
    local closeBtn = Instance.new('TextButton')
    closeBtn.Size = UDim2.fromOffset(30, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = ''
    closeBtn.Parent = titleBar
    Instance.new('UICorner', closeBtn).CornerRadius = UDim.new(0, 6)
    local closeIcon = Instance.new('ImageLabel')
    closeIcon.Size = UDim2.fromOffset(14, 14)
    closeIcon.Position = UDim2.fromScale(0.5, 0.5)
    closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    closeIcon.BackgroundTransparency = 1
    closeIcon.Image = Icons.x
    closeIcon.ImageColor3 = Themes.Dark.Text
    closeIcon.Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
    
    closeBtn.MouseEnter:Connect(function()
        closeBtn.BackgroundTransparency = 0.9
        closeBtn.BackgroundColor3 = Themes.Dark.Error
    end)
    
    closeBtn.MouseLeave:Connect(function()
        closeBtn.BackgroundTransparency = 1
    end)
    
    -- Minimize Button
    local minBtn = Instance.new('TextButton')
    minBtn.Size = UDim2.fromOffset(30, 30)
    minBtn.Position = UDim2.new(1, -68, 0, 5)
    minBtn.BackgroundTransparency = 1
    minBtn.Text = ''
    minBtn.Parent = titleBar
    Instance.new('UICorner', minBtn).CornerRadius = UDim.new(0, 6)
    local minIcon = Instance.new('ImageLabel')
    minIcon.Size = UDim2.fromOffset(14, 14)
    minIcon.Position = UDim2.fromScale(0.5, 0.5)
    minIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    minIcon.BackgroundTransparency = 1
    minIcon.Image = Icons.minus
    minIcon.ImageColor3 = Themes.Dark.Text
    minIcon.Parent = minBtn
    
    minBtn.MouseButton1Click:Connect(function()
        window.Visible = not window.Visible
        window.Root.Visible = window.Visible
    end)
    
    minBtn.MouseEnter:Connect(function()
        minBtn.BackgroundTransparency = 0.9
        minBtn.BackgroundColor3 = Themes.Dark.Hover
    end)
    
    minBtn.MouseLeave:Connect(function()
        minBtn.BackgroundTransparency = 1
    end)
    
    -- Minimize Keybind
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == config.MinimizeKey then
            window.Visible = not window.Visible
            window.Root.Visible = window.Visible
        end
    end)
    
    -- Divider
    local divider = Instance.new('Frame')
    divider.Size = UDim2.new(1, 0, 0, 1)
    divider.Position = UDim2.new(0, 0, 0, 40)
    divider.BackgroundColor3 = Themes.Dark.Border
    divider.BorderSizePixel = 0
    divider.Parent = window.Root
    
    -- Dragging
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            window.Dragging = true
            window.DragStart = input.Position
            window.StartPos = window.Root.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if window.Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - window.DragStart
            window.Root.Position = UDim2.new(
                window.StartPos.X.Scale,
                window.StartPos.X.Offset + delta.X,
                window.StartPos.Y.Scale,
                window.StartPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            window.Dragging = false
        end
    end)
    
    -- Tab Container
    window.TabContainer = Instance.new('Frame')
    window.TabContainer.Size = UDim2.new(0, 150, 1, -41)
    window.TabContainer.Position = UDim2.fromOffset(0, 41)
    window.TabContainer.BackgroundTransparency = 1
    window.TabContainer.Parent = window.Root
    
    window.TabList = Instance.new('ScrollingFrame')
    window.TabList.Size = UDim2.fromScale(1, 1)
    window.TabList.BackgroundTransparency = 1
    window.TabList.ScrollBarThickness = 4
    window.TabList.ScrollBarImageTransparency = 0.9
    window.TabList.CanvasSize = UDim2.fromScale(0, 0)
    window.TabList.Parent = window.TabContainer
    local tabLayout = Instance.new('UIListLayout')
    tabLayout.Padding = UDim.new(0, 4)
    tabLayout.Parent = window.TabList
    local tabPadding = Instance.new('UIPadding')
    tabPadding.PaddingLeft = UDim.new(0, 8)
    tabPadding.PaddingRight = UDim.new(0, 8)
    tabPadding.PaddingTop = UDim.new(0, 8)
    tabPadding.Parent = window.TabList
    
    tabLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
        window.TabList.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y + 16)
    end)
    
    -- Content Container
    window.ContentContainer = Instance.new('Frame')
    window.ContentContainer.Size = UDim2.new(1, -160, 1, -51)
    window.ContentContainer.Position = UDim2.fromOffset(155, 46)
    window.ContentContainer.BackgroundTransparency = 1
    window.ContentContainer.ClipsDescendants = true
    window.ContentContainer.Parent = window.Root
    
    table.insert(SeaMinhUI.Windows, window)
    
    window.AddTab = function(self, cfg) return SeaMinhUI:AddTab(window, cfg) end
    window.Minimize = function() window.Visible = false; window.Root.Visible = false end
    window.Restore = function() window.Visible = true; window.Root.Visible = true end
    window.Toggle = function() window.Visible = not window.Visible; window.Root.Visible = window.Visible end
    window.Destroy = function() gui:Destroy() end
    
    return window
end

-- ============================================================
-- ADD TAB
-- ============================================================
function SeaMinhUI:AddTab(window, config)
    local tab = {Title = config.Title, Elements = {}}
    
    tab.Button = Instance.new('TextButton')
    tab.Button.Size = UDim2.new(1, 0, 0, 34)
    tab.Button.BackgroundColor3 = Themes.Dark.Tab
    tab.Button.BackgroundTransparency = 0.8
    tab.Button.Text = ''
    tab.Button.Parent = window.TabList
    Instance.new('UICorner', tab.Button).CornerRadius = UDim.new(0, 6)
    
    local btnContainer = Instance.new('Frame')
    btnContainer.Size = UDim2.fromScale(1, 1)
    btnContainer.BackgroundTransparency = 1
    btnContainer.Parent = tab.Button
    local btnLayout = Instance.new('UIListLayout')
    btnLayout.FillDirection = Enum.FillDirection.Horizontal
    btnLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    btnLayout.Padding = UDim.new(0, 8)
    btnLayout.Parent = btnContainer
    Instance.new('UIPadding', btnContainer).PaddingLeft = UDim.new(0, 10)
    
    if config.Icon then
        local tabIcon = Instance.new('ImageLabel')
        tabIcon.Size = UDim2.fromOffset(16, 16)
        tabIcon.BackgroundTransparency = 1
        tabIcon.Image = Icons[config.Icon] or config.Icon
        tabIcon.ImageColor3 = Themes.Dark.Text
        tabIcon.Parent = btnContainer
    end
    
    local tabLabel = Instance.new('TextLabel')
    tabLabel.Text = config.Title
    tabLabel.Size = UDim2.new(1, config.Icon and -24 or 0, 1, 0)
    tabLabel.BackgroundTransparency = 1
    tabLabel.Font = Enum.Font.GothamMedium
    tabLabel.TextSize = 13
    tabLabel.TextColor3 = Themes.Dark.Text
    tabLabel.TextXAlignment = Enum.TextXAlignment.Left
    tabLabel.Parent = btnContainer
    
    tab.Content = Instance.new('ScrollingFrame')
    tab.Content.Size = UDim2.fromScale(1, 1)
    tab.Content.BackgroundTransparency = 1
    tab.Content.ScrollBarThickness = 4
    tab.Content.ScrollBarImageTransparency = 0.9
    tab.Content.CanvasSize = UDim2.fromScale(0, 0)
    tab.Content.Visible = false
    tab.Content.Parent = window.ContentContainer
    local contentLayout = Instance.new('UIListLayout')
    contentLayout.Padding = UDim.new(0, 6)
    contentLayout.Parent = tab.Content
    local contentPadding = Instance.new('UIPadding')
    contentPadding.PaddingLeft = UDim.new(0, 6)
    contentPadding.PaddingRight = UDim.new(0, 6)
    contentPadding.PaddingTop = UDim.new(0, 6)
    contentPadding.PaddingBottom = UDim.new(0, 10)
    contentPadding.Parent = tab.Content
    
    contentLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
        tab.Content.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 16)
    end)
    
    tab.Button.MouseButton1Click:Connect(function()
        for _, t in pairs(window.Tabs) do
            t.Content.Visible = false
            t.Button.BackgroundTransparency = 0.8
        end
        tab.Content.Visible = true
        tab.Button.BackgroundTransparency = 0.6
    end)
    
    if #window.Tabs == 0 then
        tab.Content.Visible = true
        tab.Button.BackgroundTransparency = 0.6
    end
    
    table.insert(window.Tabs, tab)
    
    tab.AddSection = function(self, title) return SeaMinhUI:AddSection(tab, title) end
    tab.AddButton = function(self, cfg) return SeaMinhUI:AddButton(tab, cfg) end
    tab.AddToggle = function(self, cfg) return SeaMinhUI:AddToggle(tab, cfg) end
    tab.AddSlider = function(self, cfg) return SeaMinhUI:AddSlider(tab, cfg) end
    tab.AddInput = function(self, cfg) return SeaMinhUI:AddInput(tab, cfg) end
    tab.AddDropdown = function(self, cfg) return SeaMinhUI:AddDropdown(tab, cfg) end
    tab.AddLabel = function(self, cfg) return SeaMinhUI:AddLabel(tab, cfg) end
    tab.AddDivider = function(self) return SeaMinhUI:AddDivider(tab) end
    tab.AddColorPicker = function(self, cfg) return SeaMinhUI:AddColorPicker(tab, cfg) end
    tab.AddKeybind = function(self, cfg) return SeaMinhUI:AddKeybind(tab, cfg) end
    
    return tab
end

-- ============================================================
-- ADD SECTION
-- ============================================================
function SeaMinhUI:AddSection(parent, title)
    local section = {Elements = {}}
    
    section.Container = Instance.new('Frame')
    section.Container.Size = UDim2.new(1, 0, 0, 0)
    section.Container.AutomaticSize = Enum.AutomaticSize.Y
    section.Container.BackgroundColor3 = Themes.Dark.Element
    section.Container.BackgroundTransparency = 0.3
    section.Container.Parent = parent.Content
    Instance.new('UICorner', section.Container).CornerRadius = UDim.new(0, 6)
    local sectionStroke = Instance.new('UIStroke', section.Container)
    sectionStroke.Color = Themes.Dark.Border
    sectionStroke.Transparency = 0.5
    
    if title then
        local titleLabel = Instance.new('TextLabel')
        titleLabel.Text = title
        titleLabel.Size = UDim2.new(1, -20, 0, 20)
        titleLabel.Position = UDim2.fromOffset(10, 8)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 14
        titleLabel.TextColor3 = Themes.Dark.Text
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = section.Container
    end
    
    section.Content = Instance.new('Frame')
    section.Content.Size = UDim2.new(1, -16, 0, 0)
    section.Content.Position = UDim2.fromOffset(8, title and 36 or 8)
    section.Content.AutomaticSize = Enum.AutomaticSize.Y
    section.Content.BackgroundTransparency = 1
    section.Content.Parent = section.Container
    local sectionLayout = Instance.new('UIListLayout')
    sectionLayout.Padding = UDim.new(0, 6)
    sectionLayout.Parent = section.Content
    Instance.new('UIPadding', section.Content).PaddingBottom = UDim.new(0, 8)
    
    section.AddButton = function(self, cfg) return SeaMinhUI:AddButton(section, cfg) end
    section.AddToggle = function(self, cfg) return SeaMinhUI:AddToggle(section, cfg) end
    section.AddSlider = function(self, cfg) return SeaMinhUI:AddSlider(section, cfg) end
    section.AddInput = function(self, cfg) return SeaMinhUI:AddInput(section, cfg) end
    section.AddDropdown = function(self, cfg) return SeaMinhUI:AddDropdown(section, cfg) end
    section.AddLabel = function(self, cfg) return SeaMinhUI:AddLabel(section, cfg) end
    section.AddDivider = function(self) return SeaMinhUI:AddDivider(section) end
    section.AddColorPicker = function(self, cfg) return SeaMinhUI:AddColorPicker(section, cfg) end
    section.AddKeybind = function(self, cfg) return SeaMinhUI:AddKeybind(section, cfg) end
    
    return section
end

-- ============================================================
-- ADD BUTTON
-- ============================================================
function SeaMinhUI:AddButton(parent, config)
    local button = Instance.new('Frame')
    button.Size = UDim2.new(1, 0, 0, 34)
    button.BackgroundColor3 = Themes.Dark.Element
    button.Parent = parent.Content
    Instance.new('UICorner', button).CornerRadius = UDim.new(0, 6)
    
    local btn = Instance.new('TextButton')
    btn.Size = UDim2.fromScale(1, 1)
    btn.BackgroundTransparency = 1
    btn.Text = ''
    btn.Parent = button
    
    -- Icon support for buttons
    local hasIcon = config.Icon ~= nil
    local iconSize = 16
    
    if hasIcon then
        local icon = Instance.new('ImageLabel')
        icon.Size = UDim2.fromOffset(iconSize, iconSize)
        icon.Position = UDim2.fromOffset(10, 9)
        icon.BackgroundTransparency = 1
        icon.Image = Icons[config.Icon] or config.Icon
        icon.ImageColor3 = Themes.Dark.Accent
        icon.Parent = button
    end
    
    local label = Instance.new('TextLabel')
    label.Text = config.Title
    label.Size = UDim2.new(1, hasIcon and -40 or -20, 1, 0)
    label.Position = UDim2.fromOffset(hasIcon and 34 or 10, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Themes.Dark.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = button
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Themes.Dark.Hover}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Themes.Dark.Element}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        SeaMinhUI:SafeCallback(config.Callback)
    end)
    
    return button
end

-- ============================================================
-- ADD TOGGLE
-- ============================================================
function SeaMinhUI:AddToggle(parent, config)
    local key = "toggle_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(key, false)
    local toggled = config.Default
    
    local toggle = Instance.new('Frame')
    toggle.Size = UDim2.new(1, 0, 0, 34)
    toggle.BackgroundColor3 = Themes.Dark.Element
    toggle.Parent = parent.Content
    Instance.new('UICorner', toggle).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new('TextLabel')
    label.Text = config.Title
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.fromOffset(10, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Themes.Dark.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggle
    
    local switch = Instance.new('Frame')
    switch.Size = UDim2.fromOffset(38, 20)
    switch.Position = UDim2.new(1, -43, 0.5, 0)
    switch.AnchorPoint = Vector2.new(0, 0.5)
    switch.BackgroundColor3 = toggled and Themes.Dark.Accent or Color3.fromRGB(60, 60, 60)
    switch.Parent = toggle
    Instance.new('UICorner', switch).CornerRadius = UDim.new(1, 0)
    
    local knob = Instance.new('Frame')
    knob.Size = UDim2.fromOffset(16, 16)
    knob.Position = toggled and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
    knob.AnchorPoint = Vector2.new(0, 0.5)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = switch
    Instance.new('UICorner', knob).CornerRadius = UDim.new(1, 0)
    
    local btn = Instance.new('TextButton')
    btn.Size = UDim2.fromScale(1, 1)
    btn.BackgroundTransparency = 1
    btn.Text = ''
    btn.Parent = toggle
    
    local function update(state)
        toggled = state
        TweenService:Create(switch, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Themes.Dark.Accent or Color3.fromRGB(60, 60, 60)
        }):Play()
        TweenService:Create(knob, TweenInfo.new(0.2), {
            Position = state and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
        }):Play()
        SaveManager:Set(key, state)
        SeaMinhUI:SafeCallback(config.Callback, state)
    end
    
    btn.MouseButton1Click:Connect(function()
        update(not toggled)
    end)
    
    toggle.SetValue = function(v) update(v) end
    toggle.GetValue = function() return toggled end
    
    return toggle
end

-- ============================================================
-- ADD SLIDER
-- ============================================================
function SeaMinhUI:AddSlider(parent, config)
    local key = "slider_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(key, config.Min)
    config.Rounding = config.Rounding or 1
    local value = config.Default
    local dragging = false
    
    local slider = Instance.new('Frame')
    slider.Size = UDim2.new(1, 0, 0, 44)
    slider.BackgroundColor3 = Themes.Dark.Element
    slider.Parent = parent.Content
    Instance.new('UICorner', slider).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new('TextLabel')
    label.Text = config.Title
    label.Size = UDim2.new(1, -60, 0, 16)
    label.Position = UDim2.fromOffset(10, 6)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Themes.Dark.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = slider
    
    local valueLabel = Instance.new('TextLabel')
    valueLabel.Text = tostring(value)
    valueLabel.Size = UDim2.new(0, 50, 0, 16)
    valueLabel.Position = UDim2.new(1, -55, 0, 6)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.TextSize = 12
    valueLabel.TextColor3 = Themes.Dark.SubText
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = slider
    
    local bar = Instance.new('Frame')
    bar.Size = UDim2.new(1, -20, 0, 4)
    bar.Position = UDim2.new(0, 10, 1, -12)
    bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    bar.Parent = slider
    Instance.new('UICorner', bar).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new('Frame')
    fill.Size = UDim2.fromScale(0, 1)
    fill.BackgroundColor3 = Themes.Dark.Accent
    fill.Parent = bar
    Instance.new('UICorner', fill).CornerRadius = UDim.new(1, 0)
    
    local function update(val)
        value = SeaMinhUI:Round(math.clamp(val, config.Min, config.Max), config.Rounding)
        local percent = (value - config.Min) / (config.Max - config.Min)
        TweenService:Create(fill, TweenInfo.new(0.1), {Size = UDim2.fromScale(percent, 1)}):Play()
        valueLabel.Text = tostring(value)
        SaveManager:Set(key, value)
        SeaMinhUI:SafeCallback(config.Callback, value)
    end
    
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local percent = math.clamp((Mouse.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            update(config.Min + (config.Max - config.Min) * percent)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percent = math.clamp((Mouse.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            update(config.Min + (config.Max - config.Min) * percent)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    update(config.Default)
    
    slider.SetValue = function(v) update(v) end
    slider.GetValue = function() return value end
    
    return slider
end

-- ============================================================
-- ADD INPUT
-- ============================================================
function SeaMinhUI:AddInput(parent, config)
    local key = "input_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(key, '')
    
    local input = Instance.new('Frame')
    input.Size = UDim2.new(1, 0, 0, 54)
    input.BackgroundColor3 = Themes.Dark.Element
    input.Parent = parent.Content
    Instance.new('UICorner', input).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new('TextLabel')
    label.Text = config.Title
    label.Size = UDim2.new(1, -20, 0, 14)
    label.Position = UDim2.fromOffset(10, 6)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Themes.Dark.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = input
    
    local box = Instance.new('TextBox')
    box.Size = UDim2.new(1, -20, 0, 26)
    box.Position = UDim2.new(0, 10, 1, -32)
    box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    box.Text = config.Default
    box.PlaceholderText = config.Placeholder or 'Enter text...'
    box.Font = Enum.Font.Gotham
    box.TextSize = 13
    box.TextColor3 = Themes.Dark.Text
    box.TextXAlignment = Enum.TextXAlignment.Left
    box.ClearTextOnFocus = false
    box.Parent = input
    Instance.new('UICorner', box).CornerRadius = UDim.new(0, 4)
    local boxPadding = Instance.new('UIPadding', box)
    boxPadding.PaddingLeft = UDim.new(0, 8)
    boxPadding.PaddingRight = UDim.new(0, 8)
    
    box.FocusLost:Connect(function()
        SaveManager:Set(key, box.Text)
        SeaMinhUI:SafeCallback(config.Callback, box.Text)
    end)
    
    input.SetValue = function(v) box.Text = v end
    input.GetValue = function() return box.Text end
    
    return input
end

-- ============================================================
-- ADD DROPDOWN
-- ============================================================
function SeaMinhUI:AddDropdown(parent, config)
    local key = "dropdown_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(key, config.Values[1])
    local selected = config.Default
    local opened = false
    
    local dropdown = Instance.new('Frame')
    dropdown.Size = UDim2.new(1, 0, 0, 54)
    dropdown.BackgroundColor3 = Themes.Dark.Element
    dropdown.Parent = parent.Content
    Instance.new('UICorner', dropdown).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new('TextLabel')
    label.Text = config.Title
    label.Size = UDim2.new(1, -20, 0, 14)
    label.Position = UDim2.fromOffset(10, 6)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Themes.Dark.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = dropdown
    
    local selectBtn = Instance.new('TextButton')
    selectBtn.Size = UDim2.new(1, -20, 0, 26)
    selectBtn.Position = UDim2.new(0, 10, 1, -32)
    selectBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    selectBtn.Text = ''
    selectBtn.Parent = dropdown
    Instance.new('UICorner', selectBtn).CornerRadius = UDim.new(0, 4)
    
    local selectedLabel = Instance.new('TextLabel')
    selectedLabel.Text = selected
    selectedLabel.Size = UDim2.new(1, -30, 1, 0)
    selectedLabel.Position = UDim2.fromOffset(8, 0)
    selectedLabel.BackgroundTransparency = 1
    selectedLabel.Font = Enum.Font.Gotham
    selectedLabel.TextSize = 13
    selectedLabel.TextColor3 = Themes.Dark.Text
    selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
    selectedLabel.Parent = selectBtn
    
    local chevron = Instance.new('ImageLabel')
    chevron.Image = Icons.chevron
    chevron.Size = UDim2.fromOffset(14, 14)
    chevron.Position = UDim2.new(1, -18, 0.5, 0)
    chevron.AnchorPoint = Vector2.new(0, 0.5)
    chevron.BackgroundTransparency = 1
    chevron.ImageColor3 = Themes.Dark.SubText
    chevron.Rotation = 0
    chevron.Parent = selectBtn
    
    local optionsContainer = Instance.new('Frame')
    optionsContainer.Size = UDim2.new(1, -20, 0, 0)
    optionsContainer.Position = UDim2.new(0, 10, 1, -4)
    optionsContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    optionsContainer.ClipsDescendants = true
    optionsContainer.Visible = false
    optionsContainer.Parent = dropdown
    Instance.new('UICorner', optionsContainer).CornerRadius = UDim.new(0, 4)
    
    local optionsList = Instance.new('ScrollingFrame')
    optionsList.Size = UDim2.fromScale(1, 1)
    optionsList.BackgroundTransparency = 1
    optionsList.ScrollBarThickness = 4
    optionsList.ScrollBarImageTransparency = 0.9
    optionsList.CanvasSize = UDim2.fromScale(0, 0)
    optionsList.Parent = optionsContainer
    local optionsLayout = Instance.new('UIListLayout')
    optionsLayout.Padding = UDim.new(0, 2)
    optionsLayout.Parent = optionsList
    local optionsPadding = Instance.new('UIPadding')
    optionsPadding.PaddingTop = UDim.new(0, 4)
    optionsPadding.PaddingBottom = UDim.new(0, 4)
    optionsPadding.PaddingLeft = UDim.new(0, 4)
    optionsPadding.PaddingRight = UDim.new(0, 4)
    optionsPadding.Parent = optionsList
    
    for _, value in ipairs(config.Values) do
        local option = Instance.new('TextButton')
        option.Size = UDim2.new(1, 0, 0, 24)
        option.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        option.BackgroundTransparency = value == selected and 0.5 or 1
        option.Text = ''
        option.Parent = optionsList
        Instance.new('UICorner', option).CornerRadius = UDim.new(0, 4)
        
        local optionLabel = Instance.new('TextLabel')
        optionLabel.Text = value
        optionLabel.Size = UDim2.new(1, -8, 1, 0)
        optionLabel.Position = UDim2.fromOffset(8, 0)
        optionLabel.BackgroundTransparency = 1
        optionLabel.Font = Enum.Font.Gotham
        optionLabel.TextSize = 12
        optionLabel.TextColor3 = Themes.Dark.Text
        optionLabel.TextXAlignment = Enum.TextXAlignment.Left
        optionLabel.Parent = option
        
        option.MouseEnter:Connect(function()
            if value ~= selected then
                TweenService:Create(option, TweenInfo.new(0.1), {BackgroundTransparency = 0.8}):Play()
            end
        end)
        
        option.MouseLeave:Connect(function()
            if value ~= selected then
                TweenService:Create(option, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
            end
        end)
        
        option.MouseButton1Click:Connect(function()
            selected = value
            selectedLabel.Text = value
            
            for _, opt in ipairs(optionsList:GetChildren()) do
                if opt:IsA('TextButton') then
                    opt.BackgroundTransparency = 1
                end
            end
            option.BackgroundTransparency = 0.5
            
            opened = false
            TweenService:Create(optionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, 0)}):Play()
            TweenService:Create(chevron, TweenInfo.new(0.2), {Rotation = 0}):Play()
            task.wait(0.2)
            optionsContainer.Visible = false
            
            SaveManager:Set(key, value)
            SeaMinhUI:SafeCallback(config.Callback, value)
        end)
    end
    
    optionsLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
        optionsList.CanvasSize = UDim2.new(0, 0, 0, optionsLayout.AbsoluteContentSize.Y + 8)
    end)
    
    selectBtn.MouseButton1Click:Connect(function()
        opened = not opened
        if opened then
            optionsContainer.Visible = true
            local height = math.min(optionsLayout.AbsoluteContentSize.Y + 8, 120)
            TweenService:Create(optionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, height)}):Play()
            TweenService:Create(chevron, TweenInfo.new(0.2), {Rotation = 180}):Play()
        else
            TweenService:Create(optionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, 0)}):Play()
            TweenService:Create(chevron, TweenInfo.new(0.2), {Rotation = 0}):Play()
            task.wait(0.2)
            optionsContainer.Visible = false
        end
    end)
    
    dropdown.SetValue = function(v)
        if table.find(config.Values, v) then
            selected = v
            selectedLabel.Text = v
        end
    end
    dropdown.GetValue = function() return selected end
    
    return dropdown
end

-- ============================================================
-- ADD LABEL
-- ============================================================
function SeaMinhUI:AddLabel(parent, config)
    local label = Instance.new('Frame')
    label.Size = UDim2.new(1, 0, 0, 0)
    label.AutomaticSize = Enum.AutomaticSize.Y
    label.BackgroundTransparency = 1
    label.Parent = parent.Content
    
    local textLabel = Instance.new('TextLabel')
    textLabel.Text = config.Text
    textLabel.Size = UDim2.new(1, -20, 0, 0)
    textLabel.Position = UDim2.fromOffset(10, 4)
    textLabel.AutomaticSize = Enum.AutomaticSize.Y
    textLabel.BackgroundTransparency = 1
    textLabel.Font = config.Bold and Enum.Font.GothamBold or Enum.Font.Gotham
    textLabel.TextSize = config.Size or 13
    textLabel.TextColor3 = Themes.Dark.Text
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextWrapped = true
    textLabel.Parent = label
    
    label.SetText = function(t) textLabel.Text = t end
    
    return label
end

-- ============================================================
-- ADD DIVIDER
-- ============================================================
function SeaMinhUI:AddDivider(parent)
    local divider = Instance.new('Frame')
    divider.Size = UDim2.new(1, -20, 0, 1)
    divider.Position = UDim2.fromOffset(10, 0)
    divider.BackgroundColor3 = Themes.Dark.Border
    divider.BorderSizePixel = 0
    divider.Parent = parent.Content
    
    return divider
end

-- ============================================================
-- ADD COLOR PICKER
-- ============================================================
function SeaMinhUI:AddColorPicker(parent, config)
    local key = "color_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(key, Color3.fromRGB(255, 255, 255))
    local currentColor = config.Default
    
    local colorpicker = Instance.new('Frame')
    colorpicker.Size = UDim2.new(1, 0, 0, 34)
    colorpicker.BackgroundColor3 = Themes.Dark.Element
    colorpicker.Parent = parent.Content
    Instance.new('UICorner', colorpicker).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new('TextLabel')
    label.Text = config.Title
    label.Size = UDim2.new(1, -70, 1, 0)
    label.Position = UDim2.fromOffset(10, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Themes.Dark.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = colorpicker
    
    local colorDisplay = Instance.new('Frame')
    colorDisplay.Size = UDim2.fromOffset(50, 24)
    colorDisplay.Position = UDim2.new(1, -55, 0.5, 0)
    colorDisplay.AnchorPoint = Vector2.new(0, 0.5)
    colorDisplay.BackgroundColor3 = currentColor
    colorDisplay.Parent = colorpicker
    Instance.new('UICorner', colorDisplay).CornerRadius = UDim.new(0, 4)
    Instance.new('UIStroke', colorDisplay).Color = Themes.Dark.Border
    
    local btn = Instance.new('TextButton')
    btn.Size = UDim2.fromScale(1, 1)
    btn.BackgroundTransparency = 1
    btn.Text = ''
    btn.Parent = colorDisplay
    
    btn.MouseButton1Click:Connect(function()
        local r = math.random(0, 255)
        local g = math.random(0, 255)
        local b = math.random(0, 255)
        currentColor = Color3.fromRGB(r, g, b)
        colorDisplay.BackgroundColor3 = currentColor
        SaveManager:Set(key, currentColor)
        SeaMinhUI:SafeCallback(config.Callback, currentColor)
    end)
    
    colorpicker.SetColor = function(c)
        currentColor = c
        colorDisplay.BackgroundColor3 = c
    end
    colorpicker.GetColor = function() return currentColor end
    
    return colorpicker
end

-- ============================================================
-- ADD KEYBIND
-- ============================================================
function SeaMinhUI:AddKeybind(parent, config)
    local key = "keybind_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(key, Enum.KeyCode.E)
    local currentKey = config.Default
    local listening = false
    
    local keybind = Instance.new('Frame')
    keybind.Size = UDim2.new(1, 0, 0, 34)
    keybind.BackgroundColor3 = Themes.Dark.Element
    keybind.Parent = parent.Content
    Instance.new('UICorner', keybind).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new('TextLabel')
    label.Text = config.Title
    label.Size = UDim2.new(1, -90, 1, 0)
    label.Position = UDim2.fromOffset(10, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Themes.Dark.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = keybind
    
    local keyBtn = Instance.new('TextButton')
    keyBtn.Size = UDim2.fromOffset(65, 24)
    keyBtn.Position = UDim2.new(1, -70, 0.5, 0)
    keyBtn.AnchorPoint = Vector2.new(0, 0.5)
    keyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyBtn.Text = ''
    keyBtn.Parent = keybind
    Instance.new('UICorner', keyBtn).CornerRadius = UDim.new(0, 4)
    
    local keyLabel = Instance.new('TextLabel')
    keyLabel.Text = currentKey.Name
    keyLabel.Size = UDim2.fromScale(1, 1)
    keyLabel.BackgroundTransparency = 1
    keyLabel.Font = Enum.Font.GothamMedium
    keyLabel.TextSize = 12
    keyLabel.TextColor3 = Themes.Dark.Text
    keyLabel.Parent = keyBtn
    
    keyBtn.MouseButton1Click:Connect(function()
        listening = true
        keyLabel.Text = "..."
    end)
    
    UserInputService.InputBegan:Connect(function(input, processed)
        if listening and not processed then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                currentKey = input.KeyCode
                keyLabel.Text = currentKey.Name
                listening = false
                SaveManager:Set(key, currentKey)
                SeaMinhUI:SafeCallback(config.Callback, currentKey)
            end
        elseif not processed and input.KeyCode == currentKey and config.OnPress then
            SeaMinhUI:SafeCallback(config.OnPress)
        end
    end)
    
    keybind.SetKey = function(k)
        currentKey = k
        keyLabel.Text = k.Name
    end
    keybind.GetKey = function() return currentKey end
    
    return keybind
end

-- ============================================================
-- UTILITY
-- ============================================================
function SeaMinhUI:SafeCallback(callback, ...)
    if not callback or type(callback) ~= 'function' then return end
    local success, err = pcall(callback, ...)
    if not success then
        warn('[Sea Minh UI] Error:', err)
    end
end

function SeaMinhUI:Round(value, decimals)
    decimals = decimals or 0
    if decimals == 0 then return math.floor(value + 0.5) end
    local mult = 10 ^ decimals
    return math.floor(value * mult + 0.5) / mult
end

function SeaMinhUI:Destroy(window)
    if window and window.GUI then
        window.GUI:Destroy()
    end
end

-- ============================================================
-- AUTO SAVE
-- ============================================================
task.spawn(function()
    while true do
        task.wait(5)
        SaveManager:Save()
    end
end)

-- ============================================================
-- EXPORT
-- ============================================================
getgenv().SeaMinhUI = SeaMinhUI
getgenv().SaveManager = SaveManager

return SeaMinhUI
