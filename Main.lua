--[[
    ╔═══════════════════════════════════════════════════════╗
    ║         SEA MINH UI LIBRARY v2.3.0                    ║
    ║         Extended with More UI Elements                ║
    ║         Discord: https://discord.gg/kJqB7R242H        ║
    ╚═══════════════════════════════════════════════════════╝
]]--

local Lighting = game:GetService('Lighting')
local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local HttpService = game:GetService('HttpService')

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then error('LocalPlayer not found') end

local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local SeaMinhUI = {
    Version = '2.3.0',
    Name = 'Sea Minh UI',
    Discord = 'https://discord.gg/kJqB7R242H',
    Themes = {'Dark', 'Light', 'Aqua'},
    Windows = {},
    Theme = 'Dark'
}

-- ============================================================
-- CREATOR MODULE
-- ============================================================
local Creator = {
    Registry = {},
    Signals = {},
    Tweens = {},
    DefaultProperties = {
        ScreenGui = {
            ResetOnSpawn = false,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        },
        Frame = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderSizePixel = 0
        },
        TextLabel = {
            BackgroundTransparency = 1,
            Font = Enum.Font.Gotham,
            Text = '',
            TextColor3 = Color3.new(1, 1, 1),
            TextSize = 14
        },
        TextButton = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            AutoButtonColor = false,
            Font = Enum.Font.Gotham,
            Text = '',
            TextSize = 14
        },
        TextBox = {
            BackgroundColor3 = Color3.new(1, 1, 1),
            ClearTextOnFocus = false,
            Font = Enum.Font.Gotham,
            Text = '',
            TextSize = 14
        },
        ScrollingFrame = {
            ScrollBarThickness = 0,
            BorderSizePixel = 0
        }
    }
}

function Creator.New(className, properties, children)
    local success, instance = pcall(function()
        return Instance.new(className)
    end)
    if not success then
        warn('[Sea Minh UI] Failed to create:', className)
        return nil
    end
    for prop, value in pairs(Creator.DefaultProperties[className] or {}) do
        pcall(function() instance[prop] = value end)
    end
    for prop, value in pairs(properties or {}) do
        if prop ~= 'ThemeTag' then
            pcall(function() instance[prop] = value end)
        end
    end
    for _, child in pairs(children or {}) do
        if child then pcall(function() child.Parent = instance end) end
    end
    if properties and properties.ThemeTag then
        Creator.AddThemeObject(instance, properties.ThemeTag)
    end
    return instance
end

function Creator.AddSignal(signal, callback)
    if not signal or not callback then return end
    local success, connection = pcall(function()
        return signal:Connect(callback)
    end)
    if success and connection then
        table.insert(Creator.Signals, connection)
        return connection
    end
end

function Creator.CreateTween(instance, tweenInfo, properties)
    if not instance then return end
    if Creator.Tweens[instance] then
        pcall(function() Creator.Tweens[instance]:Cancel() end)
    end
    local success, tween = pcall(function()
        return TweenService:Create(instance, tweenInfo, properties)
    end)
    if success and tween then
        Creator.Tweens[instance] = tween
        tween:Play()
        return tween
    end
end

function Creator.GetThemeProperty(propertyName)
    local currentTheme = Themes[SeaMinhUI.Theme]
    if currentTheme and currentTheme[propertyName] then
        return currentTheme[propertyName]
    end
    return Themes.Dark[propertyName] or Color3.new(1, 1, 1)
end

function Creator.UpdateTheme()
    for instance, data in pairs(Creator.Registry) do
        if instance and instance.Parent then
            for property, themeProp in pairs(data.Properties or {}) do
                pcall(function()
                    instance[property] = Creator.GetThemeProperty(themeProp)
                end)
            end
        end
    end
end

function Creator.AddThemeObject(instance, themeTag)
    if not instance then return end
    Creator.Registry[instance] = {Object = instance, Properties = themeTag}
end

function Creator.Cleanup()
    for _, signal in ipairs(Creator.Signals) do
        pcall(function() signal:Disconnect() end)
    end
    Creator.Signals = {}
    for _, tween in pairs(Creator.Tweens) do
        pcall(function() tween:Cancel() end)
    end
    Creator.Tweens = {}
    Creator.Registry = {}
end

-- ============================================================
-- THEMES
-- ============================================================
local Themes = {
    Dark = {
        Accent = Color3.fromRGB(96, 205, 255),
        AcrylicMain = Color3.fromRGB(30, 30, 30),
        AcrylicBorder = Color3.fromRGB(70, 70, 70),
        TitleBarLine = Color3.fromRGB(60, 60, 60),
        Tab = Color3.fromRGB(100, 100, 100),
        Element = Color3.fromRGB(50, 50, 50),
        ElementBorder = Color3.fromRGB(40, 40, 40),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(80, 80, 80),
        Input = Color3.fromRGB(60, 60, 60),
        InputBorder = Color3.fromRGB(80, 80, 80),
        Section = Color3.fromRGB(45, 45, 45),
        SectionBorder = Color3.fromRGB(55, 55, 55),
        Success = Color3.fromRGB(52, 211, 153),
        Warning = Color3.fromRGB(251, 191, 36),
        Danger = Color3.fromRGB(239, 68, 68)
    },
    Light = {
        Accent = Color3.fromRGB(0, 103, 192),
        AcrylicMain = Color3.fromRGB(240, 240, 240),
        AcrylicBorder = Color3.fromRGB(200, 200, 200),
        TitleBarLine = Color3.fromRGB(220, 220, 220),
        Tab = Color3.fromRGB(200, 200, 200),
        Element = Color3.fromRGB(255, 255, 255),
        ElementBorder = Color3.fromRGB(220, 220, 220),
        Text = Color3.fromRGB(20, 20, 20),
        SubText = Color3.fromRGB(80, 80, 80),
        Hover = Color3.fromRGB(230, 230, 230),
        Input = Color3.fromRGB(250, 250, 250),
        InputBorder = Color3.fromRGB(200, 200, 200),
        Section = Color3.fromRGB(250, 250, 250),
        SectionBorder = Color3.fromRGB(230, 230, 230),
        Success = Color3.fromRGB(34, 197, 94),
        Warning = Color3.fromRGB(245, 158, 11),
        Danger = Color3.fromRGB(220, 38, 38)
    },
    Aqua = {
        Accent = Color3.fromRGB(60, 165, 165),
        AcrylicMain = Color3.fromRGB(30, 30, 30),
        AcrylicBorder = Color3.fromRGB(70, 70, 70),
        TitleBarLine = Color3.fromRGB(60, 60, 60),
        Tab = Color3.fromRGB(100, 100, 100),
        Element = Color3.fromRGB(50, 50, 50),
        ElementBorder = Color3.fromRGB(40, 40, 40),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(170, 170, 170),
        Hover = Color3.fromRGB(80, 80, 80),
        Input = Color3.fromRGB(60, 60, 60),
        InputBorder = Color3.fromRGB(80, 80, 80),
        Section = Color3.fromRGB(45, 45, 45),
        SectionBorder = Color3.fromRGB(55, 55, 55),
        Success = Color3.fromRGB(52, 211, 153),
        Warning = Color3.fromRGB(251, 191, 36),
        Danger = Color3.fromRGB(239, 68, 68)
    }
}

-- ============================================================
-- ICONS
-- ============================================================
local Icons = {
    ['lucide-home'] = 'rbxassetid://10723407389',
    ['lucide-settings'] = 'rbxassetid://10734950309',
    ['lucide-x'] = 'rbxassetid://10747384394',
    ['lucide-minus'] = 'rbxassetid://10734896206',
    ['lucide-chevron-down'] = 'rbxassetid://10709790948',
    ['lucide-check'] = 'rbxassetid://10709790644',
    ['lucide-alert'] = 'rbxassetid://10747384394'
}

-- ============================================================
-- SAVE MANAGER
-- ============================================================
local SaveManager = {}
SaveManager.Folder = "SeaMinhUI_Settings"
SaveManager.Data = {}
SaveManager.Modified = {}

function SaveManager:Init()
    pcall(function()
        local path = self.Folder
        if not isfile(path .. "/data.json") then
            makefolder(path)
            writefile(path .. "/data.json", HttpService:JSONEncode({}))
        end
        self.Data = HttpService:JSONDecode(readfile(path .. "/data.json")) or {}
    end)
    return self
end

function SaveManager:Get(key, default)
    if self.Data[key] ~= nil then
        return self.Data[key]
    end
    return default
end

function SaveManager:Set(key, value)
    self.Data[key] = value
    self.Modified[key] = true
end

function SaveManager:Save()
    pcall(function()
        if next(self.Modified) then
            writefile(self.Folder .. "/data.json", HttpService:JSONEncode(self.Data))
            self.Modified = {}
        end
    end)
end

function SaveManager:Delete(key)
    self.Data[key] = nil
    self.Modified[key] = true
    self:Save()
end

-- ============================================================
-- INTERFACE MANAGER
-- ============================================================
local InterfaceManager = {}
InterfaceManager.Tabs = {}
InterfaceManager.Config = {AutoSave = true, SaveInterval = 5}

function InterfaceManager:Init(config)
    self.Config = config or self.Config
    if self.Config.AutoSave then
        task.spawn(function()
            while true do
                task.wait(self.Config.SaveInterval)
                SaveManager:Save()
            end
        end)
    end
    return self
end

function InterfaceManager:RegisterTab(name, tab)
    self.Tabs[name] = tab
end

function InterfaceManager:GetTab(name)
    return self.Tabs[name]
end

-- ============================================================
-- UTILITY FUNCTIONS
-- ============================================================
function SeaMinhUI:SafeCallback(callback, ...)
    if not callback or type(callback) ~= 'function' then return end
    local success, errorMsg = pcall(callback, ...)
    if not success then
        warn('[Sea Minh UI] Callback Error:', errorMsg)
    end
end

function SeaMinhUI:Round(value, decimals)
    decimals = decimals or 0
    if decimals == 0 then
        return math.floor(value + 0.5)
    end
    local mult = 10 ^ decimals
    return math.floor(value * mult + 0.5) / mult
end

function SeaMinhUI:Notify(title, message, duration)
    duration = duration or 3
    print(string.format("[%s] %s", title or "Notification", message or ""))
end

-- ============================================================
-- CREATE WINDOW
-- ============================================================
function SeaMinhUI:CreateWindow(config)
    assert(config and config.Title, 'Window - Missing Title')
    
    config.Size = config.Size or UDim2.fromOffset(700, 550)
    config.TabWidth = config.TabWidth or 150
    config.MinimizeKey = config.MinimizeKey or Enum.KeyCode.LeftControl
    
    local guiParent = (RunService:IsStudio() and LocalPlayer.PlayerGui) or game:GetService('CoreGui')
    local gui = Creator.New('ScreenGui', {
        Name = 'SeaMinhUI_' .. tick(),
        Parent = guiParent
    })
    
    if not gui then error('Failed to create GUI') end
    
    pcall(function()
        if syn and syn.protect_gui then syn.protect_gui(gui)
        elseif protectgui then protectgui(gui) end
    end)
    
    local window = {
        Root = nil,
        Tabs = {},
        CurrentTab = nil,
        Minimized = false,
        Size = config.Size,
        TabWidth = config.TabWidth,
        GUI = gui,
        Config = config,
        Elements = {}
    }
    
    window.Root = Creator.New('Frame', {
        Name = 'WindowRoot',
        BackgroundTransparency = 1,
        Size = config.Size,
        Position = UDim2.new(0.5, -config.Size.X.Offset / 2, 0.5, -config.Size.Y.Offset / 2),
        Parent = gui
    })
    
    Creator.New('Frame', {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        Parent = window.Root,
        ThemeTag = {BackgroundColor3 = 'AcrylicMain'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 8)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(70, 70, 70),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'AcrylicBorder'}
        })
    })
    
    local titleBar = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundTransparency = 1,
        Parent = window.Root
    })
    
    local titleContainer = Creator.New('Frame', {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.fromOffset(16, 0),
        Parent = titleBar
    })
    
    Creator.New('UIListLayout', {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 8),
        Parent = titleContainer
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(0, 0, 0, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        Parent = titleContainer,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    local closeBtn = Creator.New('TextButton', {
        Size = UDim2.fromOffset(32, 32),
        Position = UDim2.new(1, -36, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Text = '',
        Parent = titleBar
    }, {
        Creator.New('ImageLabel', {
            Image = Icons['lucide-x'],
            Size = UDim2.fromOffset(16, 16),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            ThemeTag = {ImageColor3 = 'Text'}
        }),
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)})
    })
    
    Creator.AddSignal(closeBtn.MouseButton1Click, function()
        SeaMinhUI:Destroy(window)
    end)
    
    local minBtn = Creator.New('TextButton', {
        Size = UDim2.fromOffset(32, 32),
        Position = UDim2.new(1, -70, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Text = '',
        Parent = titleBar
    }, {
        Creator.New('ImageLabel', {
            Image = Icons['lucide-minus'],
            Size = UDim2.fromOffset(16, 16),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            ThemeTag = {ImageColor3 = 'Text'}
        }),
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)})
    })
    
    Creator.AddSignal(minBtn.MouseButton1Click, function()
        window.Minimized = not window.Minimized
        window.Root.Visible = not window.Minimized
    end)
    
    Creator.AddSignal(UserInputService.InputBegan, function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == config.MinimizeKey then
            window.Minimized = not window.Minimized
            window.Root.Visible = not window.Minimized
        end
    end)
    
    Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0, 42),
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        BorderSizePixel = 0,
        Parent = window.Root,
        ThemeTag = {BackgroundColor3 = 'TitleBarLine'}
    })
    
    window.TabContainer = Creator.New('Frame', {
        Size = UDim2.new(0, config.TabWidth, 1, -43),
        Position = UDim2.fromOffset(0, 43),
        BackgroundTransparency = 1,
        Parent = window.Root
    })
    
    window.TabList = Creator.New('ScrollingFrame', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100),
        ScrollBarImageTransparency = 0.9,
        ScrollBarThickness = 4,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = window.TabContainer
    }, {
        Creator.New('UIListLayout', {
            Padding = UDim.new(0, 4),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        Creator.New('UIPadding', {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingTop = UDim.new(0, 10)
        })
    })
    
    local tabLayout = window.TabList:FindFirstChildOfClass('UIListLayout')
    if tabLayout then
        Creator.AddSignal(tabLayout:GetPropertyChangedSignal('AbsoluteContentSize'), function()
            window.TabList.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y + 20)
        end)
    end
    
    window.ContentContainer = Creator.New('Frame', {
        Size = UDim2.new(1, -config.TabWidth - 20, 1, -53),
        Position = UDim2.fromOffset(config.TabWidth + 10, 48),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = window.Root
    })
    
    table.insert(SeaMinhUI.Windows, window)
    SeaMinhUI:SetTheme(config.Theme or 'Dark')
    
    window.AddTab = function(self, cfg) return SeaMinhUI:AddTab(window, cfg) end
    window.SetTheme = function(self, theme) return SeaMinhUI:SetTheme(theme) end
    window.Destroy = function(self) return SeaMinhUI:Destroy(window) end
    
    return window
end

-- ============================================================
-- ADD TAB
-- ============================================================
function SeaMinhUI:AddTab(window, config)
    assert(config and config.Title, 'Tab - Missing Title')
    
    local tab = {Title = config.Title, Elements = {}, Window = window}
    
    tab.Button = Creator.New('TextButton', {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = Color3.fromRGB(100, 100, 100),
        BackgroundTransparency = 0.8,
        Text = '',
        Parent = window.TabList,
        ThemeTag = {BackgroundColor3 = 'Tab'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)})
    })
    
    local btnContainer = Creator.New('Frame', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Parent = tab.Button
    })
    
    Creator.New('UIListLayout', {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 8),
        Parent = btnContainer
    })
    
    Creator.New('UIPadding', {PaddingLeft = UDim.new(0, 10), Parent = btnContainer})
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 13,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Parent = btnContainer,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    tab.Content = Creator.New('ScrollingFrame', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100),
        ScrollBarImageTransparency = 0.9,
        ScrollBarThickness = 4,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Visible = false,
        Parent = window.ContentContainer
    }, {
        Creator.New('UIListLayout', {
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        Creator.New('UIPadding', {
            PaddingRight = UDim.new(0, 6),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 6),
            PaddingTop = UDim.new(0, 6)
        })
    })
    
    local layout = tab.Content:FindFirstChildOfClass('UIListLayout')
    if layout then
        Creator.AddSignal(layout:GetPropertyChangedSignal('AbsoluteContentSize'), function()
            tab.Content.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 16)
        end)
    end
    
    Creator.AddSignal(tab.Button.MouseButton1Click, function()
        for _, t in pairs(window.Tabs) do
            t.Content.Visible = false
            Creator.CreateTween(t.Button, TweenInfo.new(0.2), {BackgroundTransparency = 0.8})
        end
        tab.Content.Visible = true
        Creator.CreateTween(tab.Button, TweenInfo.new(0.2), {BackgroundTransparency = 0.6})
        window.CurrentTab = tab
    end)
    
    if #window.Tabs == 0 then
        tab.Content.Visible = true
        tab.Button.BackgroundTransparency = 0.6
        window.CurrentTab = tab
    end
    
    table.insert(window.Tabs, tab)
    InterfaceManager:RegisterTab(config.Title, tab)
    
    tab.AddButton = function(self, cfg) return SeaMinhUI:AddButton(tab, cfg) end
    tab.AddToggle = function(self, cfg) return SeaMinhUI:AddToggle(tab, cfg) end
    tab.AddSlider = function(self, cfg) return SeaMinhUI:AddSlider(tab, cfg) end
    tab.AddInput = function(self, cfg) return SeaMinhUI:AddInput(tab, cfg) end
    tab.AddDropdown = function(self, cfg) return SeaMinhUI:AddDropdown(tab, cfg) end
    tab.AddSection = function(self, title) return SeaMinhUI:AddSection(tab, title) end
    tab.AddColorPicker = function(self, cfg) return SeaMinhUI:AddColorPicker(tab, cfg) end
    tab.AddLabel = function(self, cfg) return SeaMinhUI:AddLabel(tab, cfg) end
    tab.AddDivider = function(self) return SeaMinhUI:AddDivider(tab) end
    tab.AddButtonRow = function(self, cfg) return SeaMinhUI:AddButtonRow(tab, cfg) end
    tab.AddTextBox = function(self, cfg) return SeaMinhUI:AddTextBox(tab, cfg) end
    tab.AddCheckbox = function(self, cfg) return SeaMinhUI:AddCheckbox(tab, cfg) end
    tab.AddKeybind = function(self, cfg) return SeaMinhUI:AddKeybind(tab, cfg) end
    
    return tab
end

-- ============================================================
-- ADD SECTION
-- ============================================================
function SeaMinhUI:AddSection(parent, title)
    local section = {Elements = {}}
    
    section.Container = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Section'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(55, 55, 55),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'SectionBorder'}
        })
    })
    
    if title then
        Creator.New('TextLabel', {
            Text = title,
            TextSize = 15,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -20, 0, 20),
            Position = UDim2.fromOffset(10, 8),
            BackgroundTransparency = 1,
            Parent = section.Container,
            ThemeTag = {TextColor3 = 'Text'}
        })
    end
    
    section.Content = Creator.New('Frame', {
        Size = UDim2.new(1, -16, 0, 0),
        Position = UDim2.fromOffset(8, title and 36 or 8),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = section.Container
    }, {
        Creator.New('UIListLayout', {
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        Creator.New('UIPadding', {PaddingBottom = UDim.new(0, 8)})
    })
    
    section.AddButton = function(self, cfg) return SeaMinhUI:AddButton(section, cfg) end
    section.AddToggle = function(self, cfg) return SeaMinhUI:AddToggle(section, cfg) end
    section.AddSlider = function(self, cfg) return SeaMinhUI:AddSlider(section, cfg) end
    section.AddInput = function(self, cfg) return SeaMinhUI:AddInput(section, cfg) end
    section.AddDropdown = function(self, cfg) return SeaMinhUI:AddDropdown(section, cfg) end
    section.AddColorPicker = function(self, cfg) return SeaMinhUI:AddColorPicker(section, cfg) end
    section.AddLabel = function(self, cfg) return SeaMinhUI:AddLabel(section, cfg) end
    section.AddDivider = function(self) return SeaMinhUI:AddDivider(section) end
    section.AddButtonRow = function(self, cfg) return SeaMinhUI:AddButtonRow(section, cfg) end
    
    return section
end

-- ============================================================
-- ADD BUTTON
-- ============================================================
function SeaMinhUI:AddButton(parent, config)
    assert(config and config.Title, 'Button - Missing Title')
    
    local buttonKey = "btn_" .. config.Title:gsub(" ", "_"):lower()
    
    local button = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, config.Description and 48 or 36),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    local btnClick = Creator.New('TextButton', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = '',
        Parent = button
    })
    
    local textContainer = Creator.New('Frame', {
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.fromOffset(10, 0),
        BackgroundTransparency = 1,
        Parent = button
    })
    
    Creator.New('UIListLayout', {
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 2),
        Parent = textContainer
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundTransparency = 1,
        Parent = textContainer,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    if config.Description then
        Creator.New('TextLabel', {
            Text = config.Description,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            Size = UDim2.new(1, 0, 0, 12),
            BackgroundTransparency = 1,
            Parent = textContainer,
            ThemeTag = {TextColor3 = 'SubText'}
        })
    end
    
    Creator.AddSignal(btnClick.MouseEnter, function()
        Creator.CreateTween(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Creator.GetThemeProperty('Hover')
        })
    end)
    
    Creator.AddSignal(btnClick.MouseLeave, function()
        Creator.CreateTween(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Creator.GetThemeProperty('Element')
        })
    end)
    
    Creator.AddSignal(btnClick.MouseButton1Click, function()
        self:SafeCallback(config.Callback)
        SaveManager:Set(buttonKey .. "_clicked", os.time())
    end)
    
    table.insert(parent.Elements, button)
    return button
end

-- ============================================================
-- ADD TOGGLE
-- ============================================================
function SeaMinhUI:AddToggle(parent, config)
    assert(config and config.Title, 'Toggle - Missing Title')
    
    local toggleKey = "toggle_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(toggleKey, false)
    local toggled = config.Default
    
    local toggle = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, config.Description and 48 or 36),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    local textContainer = Creator.New('Frame', {
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.fromOffset(10, 0),
        BackgroundTransparency = 1,
        Parent = toggle
    })
    
    Creator.New('UIListLayout', {
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 2),
        Parent = textContainer
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundTransparency = 1,
        Parent = textContainer,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    if config.Description then
        Creator.New('TextLabel', {
            Text = config.Description,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            Size = UDim2.new(1, 0, 0, 12),
            BackgroundTransparency = 1,
            Parent = textContainer,
            ThemeTag = {TextColor3 = 'SubText'}
        })
    end
    
    local switch = Creator.New('Frame', {
        Size = UDim2.fromOffset(40, 20),
        Position = UDim2.new(1, -45, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = toggled and Creator.GetThemeProperty('Accent') or Color3.fromRGB(60, 60, 60),
        Parent = toggle
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(1, 0)})
    })
    
    local knob = Creator.New('Frame', {
        Size = UDim2.fromOffset(16, 16),
        Position = toggled and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Parent = switch
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(1, 0)})
    })
    
    local btn = Creator.New('TextButton', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = '',
        Parent = toggle
    })
    
    local function updateToggle(state)
        toggled = state
        Creator.CreateTween(switch, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Creator.GetThemeProperty('Accent') or Color3.fromRGB(60, 60, 60)
        })
        Creator.CreateTween(knob, TweenInfo.new(0.2), {
            Position = state and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
        })
        SaveManager:Set(toggleKey, state)
        self:SafeCallback(config.Callback, state)
    end
    
    Creator.AddSignal(btn.MouseButton1Click, function()
        updateToggle(not toggled)
    end)
    
    toggle.SetValue = function(state)
        updateToggle(state)
    end
    
    toggle.GetValue = function()
        return toggled
    end
    
    table.insert(parent.Elements, toggle)
    return toggle
end

-- ============================================================
-- ADD SLIDER
-- ============================================================
function SeaMinhUI:AddSlider(parent, config)
    assert(config and config.Title, 'Slider - Missing Title')
    assert(config.Min, 'Slider - Missing Min')
    assert(config.Max, 'Slider - Missing Max')
    
    local sliderKey = "slider_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(sliderKey, config.Min)
    config.Rounding = config.Rounding or 1
    local value = config.Default
    local dragging = false
    
    local slider = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, config.Description and 58 or 46),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    local textContainer = Creator.New('Frame', {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.fromOffset(10, 8),
        BackgroundTransparency = 1,
        Parent = slider
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -60, 1, 0),
        BackgroundTransparency = 1,
        Parent = textContainer,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    local valueLabel = Creator.New('TextLabel', {
        Text = tostring(value),
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
        Size = UDim2.new(0, 50, 1, 0),
        Position = UDim2.new(1, -50, 0, 0),
        BackgroundTransparency = 1,
        Parent = textContainer,
        ThemeTag = {TextColor3 = 'SubText'}
    })
    
    if config.Description then
        Creator.New('TextLabel', {
            Text = config.Description,
            TextSize = 11,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -20, 0, 11),
            Position = UDim2.fromOffset(10, 28),
            BackgroundTransparency = 1,
            Parent = slider,
            ThemeTag = {TextColor3 = 'SubText'}
        })
    end
    
    local sliderBar = Creator.New('Frame', {
        Size = UDim2.new(1, -20, 0, 4),
        Position = UDim2.new(0, 10, 1, config.Description and -14 or -18),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        Parent = slider
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(1, 0)})
    })
    
    local fill = Creator.New('Frame', {
        Size = UDim2.fromScale(0, 1),
        BackgroundColor3 = Creator.GetThemeProperty('Accent'),
        Parent = sliderBar,
        ThemeTag = {BackgroundColor3 = 'Accent'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(1, 0)})
    })
    
    local function updateSlider(val)
        value = SeaMinhUI:Round(math.clamp(val, config.Min, config.Max), config.Rounding)
        local percent = (value - config.Min) / (config.Max - config.Min)
        Creator.CreateTween(fill, TweenInfo.new(0.1), {Size = UDim2.fromScale(percent, 1)})
        valueLabel.Text = tostring(value)
        SaveManager:Set(sliderKey, value)
        self:SafeCallback(config.Callback, value)
    end
    
    Creator.AddSignal(sliderBar.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local percent = math.clamp((Mouse.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            updateSlider(config.Min + (config.Max - config.Min) * percent)
        end
    end)
    
    Creator.AddSignal(UserInputService.InputChanged, function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percent = math.clamp((Mouse.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            updateSlider(config.Min + (config.Max - config.Min) * percent)
        end
    end)
    
    Creator.AddSignal(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    updateSlider(config.Default)
    
    slider.SetValue = function(val)
        updateSlider(val)
    end
    
    slider.GetValue = function()
        return value
    end
    
    table.insert(parent.Elements, slider)
    return slider
end

-- ============================================================
-- ADD INPUT
-- ============================================================
function SeaMinhUI:AddInput(parent, config)
    assert(config and config.Title, 'Input - Missing Title')
    
    local inputKey = "input_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(inputKey, '')
    config.Placeholder = config.Placeholder or 'Enter text...'
    
    local input = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, config.Description and 68 or 56),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -20, 0, 14),
        Position = UDim2.fromOffset(10, 8),
        BackgroundTransparency = 1,
        Parent = input,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    if config.Description then
        Creator.New('TextLabel', {
            Text = config.Description,
            TextSize = 11,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -20, 0, 11),
            Position = UDim2.fromOffset(10, 24),
            BackgroundTransparency = 1,
            Parent = input,
            ThemeTag = {TextColor3 = 'SubText'}
        })
    end
    
    local inputBox = Creator.New('TextBox', {
        Size = UDim2.new(1, -20, 0, 28),
        Position = UDim2.new(0, 10, 1, config.Description and -36 or -36),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        Text = config.Default,
        PlaceholderText = config.Placeholder,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        Parent = input,
        ThemeTag = {
            BackgroundColor3 = 'Input',
            TextColor3 = 'Text'
        }
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
        Creator.New('UIPadding', {
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8)
        }),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'InputBorder'}
        })
    })
    
    Creator.AddSignal(inputBox.FocusLost, function()
        SaveManager:Set(inputKey, inputBox.Text)
        self:SafeCallback(config.Callback, inputBox.Text)
    end)
    
    input.SetValue = function(text)
        inputBox.Text = text
    end
    
    input.GetValue = function()
        return inputBox.Text
    end
    
    table.insert(parent.Elements, input)
    return input
end

-- ============================================================
-- ADD DROPDOWN
-- ============================================================
function SeaMinhUI:AddDropdown(parent, config)
    assert(config and config.Title, 'Dropdown - Missing Title')
    assert(config.Values, 'Dropdown - Missing Values')
    
    local dropdownKey = "dropdown_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(dropdownKey, config.Values[1])
    local selected = config.Default
    local opened = false
    
    local dropdown = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, config.Description and 68 or 56),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -20, 0, 14),
        Position = UDim2.fromOffset(10, 8),
        BackgroundTransparency = 1,
        Parent = dropdown,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    if config.Description then
        Creator.New('TextLabel', {
            Text = config.Description,
            TextSize = 11,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -20, 0, 11),
            Position = UDim2.fromOffset(10, 24),
            BackgroundTransparency = 1,
            Parent = dropdown,
            ThemeTag = {TextColor3 = 'SubText'}
        })
    end
    
    local selectBtn = Creator.New('TextButton', {
        Size = UDim2.new(1, -20, 0, 28),
        Position = UDim2.new(0, 10, 1, config.Description and -36 or -36),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        Text = '',
        Parent = dropdown,
        ThemeTag = {BackgroundColor3 = 'Input'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1,
            Transparency = 0.5
        })
    })
    
    local selectedLabel = Creator.New('TextLabel', {
        Text = selected,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -30, 1, 0),
        Position = UDim2.fromOffset(8, 0),
        BackgroundTransparency = 1,
        Parent = selectBtn,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    local chevron = Creator.New('ImageLabel', {
        Image = Icons['lucide-chevron-down'],
        Size = UDim2.fromOffset(16, 16),
        Position = UDim2.new(1, -20, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Rotation = 0,
        Parent = selectBtn,
        ThemeTag = {ImageColor3 = 'SubText'}
    })
    
    local optionsContainer = Creator.New('Frame', {
        Size = UDim2.new(1, -20, 0, 0),
        Position = UDim2.new(0, 10, 1, config.Description and -4 or -4),
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        ClipsDescendants = true,
        Visible = false,
        Parent = dropdown,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1,
            Transparency = 0.5
        })
    })
    
    local optionsList = Creator.New('ScrollingFrame', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ScrollBarImageTransparency = 0.9,
        ScrollBarThickness = 4,
        CanvasSize = UDim2.fromScale(0, 0),
        Parent = optionsContainer
    }, {
        Creator.New('UIListLayout', {
            Padding = UDim.new(0, 2),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        Creator.New('UIPadding', {
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4)
        })
    })
    
    for _, value in ipairs(config.Values) do
        local option = Creator.New('TextButton', {
            Size = UDim2.new(1, 0, 0, 26),
            BackgroundColor3 = Color3.fromRGB(45, 45, 45),
            BackgroundTransparency = value == selected and 0.5 or 1,
            Text = '',
            Parent = optionsList
        }, {
            Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
            Creator.New('TextLabel', {
                Text = value,
                TextSize = 12,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = UDim2.new(1, -8, 1, 0),
                Position = UDim2.fromOffset(8, 0),
                BackgroundTransparency = 1,
                ThemeTag = {TextColor3 = 'Text'}
            })
        })
        
        Creator.AddSignal(option.MouseEnter, function()
            if value ~= selected then
                Creator.CreateTween(option, TweenInfo.new(0.1), {BackgroundTransparency = 0.8})
            end
        end)
        
        Creator.AddSignal(option.MouseLeave, function()
            if value ~= selected then
                Creator.CreateTween(option, TweenInfo.new(0.1), {BackgroundTransparency = 1})
            end
        end)
        
        Creator.AddSignal(option.MouseButton1Click, function()
            selected = value
            selectedLabel.Text = value
            
            for _, opt in ipairs(optionsList:GetChildren()) do
                if opt:IsA('TextButton') then
                    opt.BackgroundTransparency = 1
                end
            end
            option.BackgroundTransparency = 0.5
            
            opened = false
            Creator.CreateTween(optionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, 0)})
            Creator.CreateTween(chevron, TweenInfo.new(0.2), {Rotation = 0})
            task.wait(0.2)
            optionsContainer.Visible = false
            
            SaveManager:Set(dropdownKey, value)
            self:SafeCallback(config.Callback, value)
        end)
    end
    
    local layout = optionsList:FindFirstChildOfClass('UIListLayout')
    if layout then
        Creator.AddSignal(layout:GetPropertyChangedSignal('AbsoluteContentSize'), function()
            optionsList.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 8)
        end)
    end
    
    Creator.AddSignal(selectBtn.MouseButton1Click, function()
        opened = not opened
        if opened then
            optionsContainer.Visible = true
            local height = math.min(layout.AbsoluteContentSize.Y + 8, 150)
            Creator.CreateTween(optionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, height)})
            Creator.CreateTween(chevron, TweenInfo.new(0.2), {Rotation = 180})
        else
            Creator.CreateTween(optionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, 0)})
            Creator.CreateTween(chevron, TweenInfo.new(0.2), {Rotation = 0})
            task.wait(0.2)
            optionsContainer.Visible = false
        end
    end)
    
    dropdown.SetValue = function(value)
        if table.find(config.Values, value) then
            selected = value
            selectedLabel.Text = value
            for _, opt in ipairs(optionsList:GetChildren()) do
                if opt:IsA('TextButton') then
                    local lbl = opt:FindFirstChildOfClass('TextLabel')
                    if lbl and lbl.Text == value then
                        opt.BackgroundTransparency = 0.5
                    else
                        opt.BackgroundTransparency = 1
                    end
                end
            end
        end
    end
    
    dropdown.GetValue = function()
        return selected
    end
    
    table.insert(parent.Elements, dropdown)
    return dropdown
end

-- ============================================================
-- ADD LABEL
-- ============================================================
function SeaMinhUI:AddLabel(parent, config)
    assert(config and config.Text, 'Label - Missing Text')
    
    local label = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = parent.Content
    })
    
    local textLabel = Creator.New('TextLabel', {
        Text = config.Text,
        TextSize = config.Size or 13,
        Font = config.Bold and Enum.Font.GothamBold or Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        Size = UDim2.new(1, -20, 0, 0),
        Position = UDim2.fromOffset(10, 5),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = label,
        ThemeTag = {TextColor3 = config.Color or 'Text'}
    })
    
    label.SetText = function(text)
        textLabel.Text = text
    end
    
    table.insert(parent.Elements, label)
    return label
end

-- ============================================================
-- ADD DIVIDER
-- ============================================================
function SeaMinhUI:AddDivider(parent)
    local divider = Creator.New('Frame', {
        Size = UDim2.new(1, -20, 0, 1),
        Position = UDim2.fromOffset(10, 0),
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        BorderSizePixel = 0,
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'ElementBorder'}
    })
    
    table.insert(parent.Elements, divider)
    return divider
end

-- ============================================================
-- ADD CHECKBOX
-- ============================================================
function SeaMinhUI:AddCheckbox(parent, config)
    assert(config and config.Title, 'Checkbox - Missing Title')
    
    local checkboxKey = "checkbox_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(checkboxKey, false)
    local checked = config.Default
    
    local checkbox = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    local checkBox = Creator.New('Frame', {
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.new(0, 10, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = checked and Creator.GetThemeProperty('Accent') or Color3.fromRGB(40, 40, 40),
        Parent = checkbox
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1
        })
    })
    
    local checkIcon = Creator.New('ImageLabel', {
        Image = Icons['lucide-check'],
        Size = UDim2.fromOffset(14, 14),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        ImageTransparency = checked and 0 or 1,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Parent = checkBox
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 13,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -45, 1, 0),
        Position = UDim2.fromOffset(40, 0),
        BackgroundTransparency = 1,
        Parent = checkbox,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    local btn = Creator.New('TextButton', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = '',
        Parent = checkbox
    })
    
    local function updateCheckbox(state)
        checked = state
        Creator.CreateTween(checkBox, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Creator.GetThemeProperty('Accent') or Color3.fromRGB(40, 40, 40)
        })
        Creator.CreateTween(checkIcon, TweenInfo.new(0.2), {
            ImageTransparency = state and 0 or 1
        })
        SaveManager:Set(checkboxKey, state)
        self:SafeCallback(config.Callback, state)
    end
    
    Creator.AddSignal(btn.MouseButton1Click, function()
        updateCheckbox(not checked)
    end)
    
    checkbox.SetValue = function(state)
        updateCheckbox(state)
    end
    
    checkbox.GetValue = function()
        return checked
    end
    
    table.insert(parent.Elements, checkbox)
    return checkbox
end

-- ============================================================
-- ADD KEYBIND
-- ============================================================
function SeaMinhUI:AddKeybind(parent, config)
    assert(config and config.Title, 'Keybind - Missing Title')
    
    local keybindKey = "keybind_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(keybindKey, Enum.KeyCode.E)
    local currentKey = config.Default
    local listening = false
    
    local keybind = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.fromOffset(10, 0),
        BackgroundTransparency = 1,
        Parent = keybind,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    local keyBtn = Creator.New('TextButton', {
        Size = UDim2.fromOffset(70, 24),
        Position = UDim2.new(1, -80, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        Text = '',
        Parent = keybind,
        ThemeTag = {BackgroundColor3 = 'Input'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1
        })
    })
    
    local keyLabel = Creator.New('TextLabel', {
        Text = currentKey.Name,
        TextSize = 12,
        Font = Enum.Font.GothamMedium,
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Parent = keyBtn,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    Creator.AddSignal(keyBtn.MouseButton1Click, function()
        listening = true
        keyLabel.Text = "..."
    end)
    
    Creator.AddSignal(UserInputService.InputBegan, function(input, gameProcessed)
        if listening and not gameProcessed then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                currentKey = input.KeyCode
                keyLabel.Text = currentKey.Name
                listening = false
                SaveManager:Set(keybindKey, currentKey)
                self:SafeCallback(config.Callback, currentKey)
            end
        elseif not gameProcessed and input.KeyCode == currentKey and config.OnPress then
            self:SafeCallback(config.OnPress)
        end
    end)
    
    keybind.SetKey = function(key)
        currentKey = key
        keyLabel.Text = key.Name
    end
    
    keybind.GetKey = function()
        return currentKey
    end
    
    table.insert(parent.Elements, keybind)
    return keybind
end

-- ============================================================
-- ADD BUTTON ROW
-- ============================================================
function SeaMinhUI:AddButtonRow(parent, config)
    assert(config and config.Buttons, 'ButtonRow - Missing Buttons')
    
    local row = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundTransparency = 1,
        Parent = parent.Content
    })
    
    local layout = Creator.New('UIListLayout', {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Padding = UDim.new(0, 6),
        Parent = row
    })
    
    for _, btnConfig in ipairs(config.Buttons) do
        local btn = Creator.New('TextButton', {
            Size = UDim2.new(1 / #config.Buttons, -6 * (#config.Buttons - 1) / #config.Buttons, 1, 0),
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            Text = '',
            Parent = row,
            ThemeTag = {BackgroundColor3 = 'Element'}
        }, {
            Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
            Creator.New('UIStroke', {
                Color = Color3.fromRGB(40, 40, 40),
                Thickness = 1,
                Transparency = 0.5,
                ThemeTag = {Color = 'ElementBorder'}
            })
        })
        
        Creator.New('TextLabel', {
            Text = btnConfig.Title,
            TextSize = 13,
            Font = Enum.Font.GothamMedium,
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Parent = btn,
            ThemeTag = {TextColor3 = 'Text'}
        })
        
        Creator.AddSignal(btn.MouseEnter, function()
            Creator.CreateTween(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Creator.GetThemeProperty('Hover')
            })
        end)
        
        Creator.AddSignal(btn.MouseLeave, function()
            Creator.CreateTween(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Creator.GetThemeProperty('Element')
            })
        end)
        
        Creator.AddSignal(btn.MouseButton1Click, function()
            self:SafeCallback(btnConfig.Callback)
        end)
    end
    
    table.insert(parent.Elements, row)
    return row
end

-- ============================================================
-- ADD TEXT BOX (Multiline)
-- ============================================================
function SeaMinhUI:AddTextBox(parent, config)
    assert(config and config.Title, 'TextBox - Missing Title')
    
    local textboxKey = "textbox_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(textboxKey, '')
    config.Placeholder = config.Placeholder or 'Enter text...'
    
    local textbox = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 120),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -20, 0, 14),
        Position = UDim2.fromOffset(10, 8),
        BackgroundTransparency = 1,
        Parent = textbox,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    local inputBox = Creator.New('TextBox', {
        Size = UDim2.new(1, -20, 1, -36),
        Position = UDim2.fromOffset(10, 28),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        Text = config.Default,
        PlaceholderText = config.Placeholder,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        MultiLine = true,
        ClearTextOnFocus = false,
        Parent = textbox,
        ThemeTag = {
            BackgroundColor3 = 'Input',
            TextColor3 = 'Text'
        }
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
        Creator.New('UIPadding', {
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8)
        }),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'InputBorder'}
        })
    })
    
    Creator.AddSignal(inputBox.FocusLost, function()
        SaveManager:Set(textboxKey, inputBox.Text)
        self:SafeCallback(config.Callback, inputBox.Text)
    end)
    
    textbox.SetValue = function(text)
        inputBox.Text = text
    end
    
    textbox.GetValue = function()
        return inputBox.Text
    end
    
    table.insert(parent.Elements, textbox)
    return textbox
end

-- ============================================================
-- ADD COLOR PICKER
-- ============================================================
function SeaMinhUI:AddColorPicker(parent, config)
    assert(config and config.Title, 'ColorPicker - Missing Title')
    
    local colorKey = "color_" .. config.Title:gsub(" ", "_"):lower()
    config.Default = config.Default or SaveManager:Get(colorKey, Color3.fromRGB(255, 255, 255))
    local currentColor = config.Default
    
    local colorpicker = Creator.New('Frame', {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = parent.Content,
        ThemeTag = {BackgroundColor3 = 'Element'}
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 6)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(40, 40, 40),
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {Color = 'ElementBorder'}
        })
    })
    
    Creator.New('TextLabel', {
        Text = config.Title,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.fromOffset(10, 0),
        BackgroundTransparency = 1,
        Parent = colorpicker,
        ThemeTag = {TextColor3 = 'Text'}
    })
    
    local colorDisplay = Creator.New('Frame', {
        Size = UDim2.fromOffset(50, 24),
        Position = UDim2.new(1, -60, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = currentColor,
        Parent = colorpicker
    }, {
        Creator.New('UICorner', {CornerRadius = UDim.new(0, 4)}),
        Creator.New('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 1
        })
    })
    
    local btn = Creator.New('TextButton', {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = '',
        Parent = colorDisplay
    })
    
    Creator.AddSignal(btn.MouseButton1Click, function()
        -- Simple color randomizer for demo
        local r = math.random(0, 255)
        local g = math.random(0, 255)
        local b = math.random(0, 255)
        currentColor = Color3.fromRGB(r, g, b)
        colorDisplay.BackgroundColor3 = currentColor
        SaveManager:Set(colorKey, currentColor)
        self:SafeCallback(config.Callback, currentColor)
    end)
    
    colorpicker.SetColor = function(color)
        currentColor = color
        colorDisplay.BackgroundColor3 = color
    end
    
    colorpicker.GetColor = function()
        return currentColor
    end
    
    table.insert(parent.Elements, colorpicker)
    return colorpicker
end

-- ============================================================
-- THEME MANAGEMENT
-- ============================================================
function SeaMinhUI:SetTheme(themeName)
    if table.find(self.Themes, themeName) then
        self.Theme = themeName
        Creator.UpdateTheme()
        SaveManager:Set("CurrentTheme", themeName)
    end
end

-- ============================================================
-- DESTROY
-- ============================================================
function SeaMinhUI:Destroy(window)
    if window and window.GUI then
        pcall(function()
            window.GUI:Destroy()
        end)
        
        for i, w in ipairs(self.Windows) do
            if w == window then
                table.remove(self.Windows, i)
                break
            end
        end
    end
    
    if #self.Windows == 0 then
        Creator.Cleanup()
    end
end

-- ============================================================
-- INITIALIZATION
-- ============================================================
SaveManager:Init()
InterfaceManager:Init({AutoSave = true, SaveInterval = 3})

local savedTheme = SaveManager:Get("CurrentTheme", "Dark")
if table.find(SeaMinhUI.Themes, savedTheme) then
    SeaMinhUI.Theme = savedTheme
end

-- ============================================================
-- EXPORT
-- ============================================================
if getgenv then
    getgenv().SeaMinhUI = SeaMinhUI
    getgenv().SaveManager = SaveManager
    getgenv().InterfaceManager = InterfaceManager
end

return SeaMinhUI
