}, {}, {}, {}, {}
	local y, z = {
		GetChildren = function(y)
			local z, A = x[y], {}
			for B in ag, z do
				l(A, B)
			end
			return A
		end,
		FindFirstChild = function(y, z)
			if not z then
				ad('Argument 1 missing or nil', 2)
			end
			for A in ag, x[y] do
				if A.Name == z then
					return A
				end
			end
			return
		end,
		GetFullName = function(y)
			local z, A = y.Name, y.Parent
			while A do
				z = A.Name .. '.' .. z
				A = A.Parent
			end
			return 'VirtualEnv.' .. z
		end
	}, {}
	for A, B in ag, y do
		z[A] = function(C, ...)
			if not x[C] then
				ad("Expected ':' not '.' calling member function " .. A, 1)
			end
			return B(C, ...)
		end
	end
	local C = function(C, D, E)
		local F, G, H, I, J = ac({}, {
			__mode = 'k'
		}), function(F)
			ad(F .. ' is not a valid (virtual) member of ' .. C .. ' "' .. D .. '"', 1)
		end, function(F)
			ad('Unable to assign (virtual) property ' .. F .. '. Property is read only', 1)
		end, (ae(true))
		local K = af(I)
		K.__index = function(L, M)
			if M == 'ClassName' then
				return C
			elseif M == 'Name' then
				return D
			elseif M == 'Parent' then
				return E
			elseif C == 'StringValue' and M == 'Value' then
				return J
			else
				local N = z[M]
				if N then
					return N
				end
			end
			for N in ag, F do
				if N.Name == M then
					return N
				end
			end
			G(M)
		end
		K.__newindex = function(L, M, N)
			if M == 'ClassName' then
				H(M)
			elseif M == 'Name' then
				D = N
			elseif M == 'Parent' then
				if N == I then
					return
				end
				if E ~= nil then
					x[E][I] = nil
				end
				E = N
				if N ~= nil then
					x[N][I] = true
				end
			elseif C == 'StringValue' and M == 'Value' then
				J = N
			else
				G(M)
			end
		end
		K.__tostring = function()
			return D
		end
		x[I] = F
		if E ~= nil then
			x[E][I] = true
		end
		return I
	end
	local function D(E, F)
		local G, H, I, J = E[1], E[2], E[3], E[4]
		local K = m(I, 1)
		local L = C(H, K, F)
		s[G] = L
		if I then
			for M, N in ag, I do
				L[M] = N
			end
		end
		if J then
			for M, N in ag, J do
				D(N, L)
			end
		end
		return L
	end
	local E = {}
	for F, G in ag, a do
		l(E, D(G))
	end
	for H, I in ag, aa do
		local J = s[H]
		t[J] = I
		local K = J.ClassName
		if K == 'LocalScript' or K == 'Script' then
			l(v, J)
		end
	end
	local J = function(J)
		local K, L = J.ClassName, u[J]
		if L and K == 'ModuleScript' then
			return aj(L)
		end
		local M = t[J]
		if not M then
			return
		end
		if K == 'LocalScript' or K == 'Script' then
			M()
			return
		else
			local N = {
				M()
			}
			u[J] = N
			return aj(N)
		end
	end
	function b(K)
		local L = s[K]
		local M = t[L]
		if not M then
			return
		end
		local N, O, P, Q, R, S, T = false, n{
			Version = p,
			Script = e,
			Shared = w,
			GetScript = function()
				return e
			end,
			GetShared = function()
				return w
			end
		}, L, function(N, ...)
			if x[N] and N.ClassName == 'ModuleScript' and t[N] then
				return J(N)
			end
			return g(N, ...)
		end
		local U, V = function(U, ...)
			if not N then
				T()
			end
			if f(U) == 'number' and U >= 0 then
				if U == 0 then
					return S
				else
					U = U + 1
					local V, W = h(i, U)
					if V and W == R then
						return S
					end
				end
			end
			return i(U, ...)
		end, function(U, V, ...)
			if not N then
				T()
			end
			if f(U) == 'number' and U >= 0 then
				if U == 0 then
					return j(S, V)
				else
					U = U + 1
					local W, X = h(i, U)
					if W and X == R then
						return j(S, V)
					end
				end
			end
			return j(U, V, ...)
		end
		function T()
			R = i(0)
			local W = {
				maui = O,
				script = P,
				require = Q,
				getfenv = U,
				setfenv = V
			}
			S = ac({}, {
				__index = function(X, Y)
					local Z = k(S, Y)
					if Z ~= nil then
						return Z
					end
					local _ = W[Y]
					if _ ~= nil then
						return _
					end
					return R[Y]
				end
			})
			j(M, S)
			N = true
		end
		return O, P, Q, U, V
	end
	for K, L in ag, v do
		o(J, L)
	end
	do
		local M
		for N, O in ag, E do
			if O.ClassName == 'ModuleScript' and O.Name == 'MainModule' then
				M = O
				break
			end
		end
		if M then
			return J(M)
		end
	end
end

--[[
═══════════════════════════════════════════════════════════════
                    SEAMINHUI - VÍ DỤ SỬ DỤNG
═══════════════════════════════════════════════════════════════

-- Load Library
local SeaMinhUI = loadstring(game:HttpGet("YOUR_URL_HERE"))()

-- Tạo Window với Icon
local Window = SeaMinhUI:CreateWindow({
    Title = "SeaMinhUI",
    SubTitle = "by SeaMinh",
    Icon = 12345678, -- ID Roblox hoặc "home" cho icon có sẵn
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark"
})

-- Tạo Tab với Icon từ ID Roblox
local Tab1 = Window:AddTab({
    Title = "Main",
    Icon = 10723407389 -- ID icon home
})

-- Tạo Tab với Icon có sẵn
local Tab2 = Window:AddTab({
    Title = "Settings",
    Icon = "settings" -- Icon có sẵn trong library
})

-- Tạo Tab không có Icon (như cũ)
local Tab3 = Window:AddTab({
    Title = "Credits"
})

-- Thêm Elements
Tab1:AddButton({
    Title = "Button",
    Description = "Click me!",
    Callback = function()
        print("Button clicked!")
    end
})

Tab1:AddToggle({
    Title = "Toggle",
    Description = "Toggle me!",
    Default = false,
    Callback = function(Value)
        print("Toggle:", Value)
    end
})

Tab1:AddSlider({
    Title = "Slider",
    Description = "Slide me!",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(Value)
        print("Slider:", Value)
    end
})

Tab1:AddDropdown({
    Title = "Dropdown",
    Values = {"Option 1", "Option 2", "Option 3"},
    Multi = false,
    Default = 1,
    Callback = function(Value)
        print("Selected:", Value)
    end
})

Tab1:AddColorpicker({
    Title = "Colorpicker",
    Default = Color3.fromRGB(96, 205, 255),
    Callback = function(Value)
        print("Color:", Value)
    end
})

Tab1:AddInput({
    Title = "Input",
    Default = "",
    Placeholder = "Enter text...",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        print("Input:", Value)
    end
})

Tab1:AddKeybind({
    Title = "Keybind",
    Default = "E",
    Callback = function()
        print("Keybind pressed!")
    end
})

-- Thông báo
SeaMinhUI:Notify({
    Title = "SeaMinhUI",
    Content = "UI đã load thành công!",
    SubContent = "Chào mừng bạn đến với SeaMinhUI",
    Duration = 5
})

-- Thay đổi Theme
SeaMinhUI:SetTheme("Dark") -- Dark, Darker, Light, Aqua, Amethyst, Rose

-- Đóng UI
-- SeaMinhUI:Destroy()

═══════════════════════════════════════════════════════════════
                        ICON HỖ TRỢ
═══════════════════════════════════════════════════════════════

CÁCH SỬ DỤNG ICON:

1. Icon từ ID Roblox:
   Icon = 12345678
   Icon = "12345678"
   Icon = "rbxassetid://12345678"

2. Icon có sẵn trong library:
   Icon = "home"
   Icon = "settings"
   Icon = "user"
   Icon = "crown"
   Icon = "chevron-down"
   Icon = "chevron-left"
   Icon = "chevron-right"

3. Không dùng Icon:
   Không truyền tham số Icon hoặc Icon = nil

═══════════════════════════════════════════════════════════════
                        TÍNH NĂNG
═══════════════════════════════════════════════════════════════

✅ Hỗ trợ Icon cho Window Title
✅ Hỗ trợ Icon cho Tab
✅ Icon có thể load từ ID Roblox
✅ Icon có thể dùng icon có sẵn trong library
✅ Tự động điều chỉnh vị trí text khi có Icon
✅ Tương thích ngược với code cũ (không có Icon)
✅ 6 Theme đẹp: Dark, Darker, Light, Aqua, Amethyst, Rose
✅ Acrylic Blur Effect
✅ Drag & Resize Window
✅ Minimize/Maximize
✅ Tất cả Elements: Button, Toggle, Slider, Dropdown, Colorpicker, Input, Keybind
✅ Dialog & Notification System
✅ Smooth Animations

═══════════════════════════════════════════════════════════════
                    MADE BY SEAMINH ❤️
═══════════════════════════════════════════════════════════════
]],
	[31] = function()
		local aa, ab, ac, ad, ae = b(31)
		local af, ag, ah, ai = game:GetService'RunService', ac(ab.Parent.Signal), function()
		end, {}
		ai.__index = ai
		function ai.new()
			return setmetatable({
				_onStep = ag.new(),
				_onStart = ag.new(),
				_onComplete = ag.new()
			}, ai)
		end
		function ai.onStep(aj, c)
			return aj._onStep:connect(c)
		end
		function ai.onStart(aj, c)
			return aj._onStart:connect(c)
		end
		function ai.onComplete(aj, c)
			return aj._onComplete:connect(c)
		end
		function ai.start(aj)
			if not aj._connection then
				aj._connection = af.RenderStepped:Connect(function(c)
					aj:step(c)
				end)
			end
		end
		function ai.stop(aj)
			if aj._connection then
				aj._connection:Disconnect()
				aj._connection = nil
			end
		end
		ai.destroy = ai.stop
		ai.step = ah
		ai.getValue = ah
		ai.setGoal = ah
		function ai.__tostring(aj)
			return 'Motor'
		end
		return ai
	end,
	[32] = function()
		local aa, ab, ac, ad, ae = b(32)
		return function()
		end
	end,
	[33] = function()
		local aa, ab, ac, ad, ae = b(33)
		local af, ag, ah = ac(ab.Parent.BaseMotor), ac(ab.Parent.SingleMotor), ac(ab.Parent.isMotor)
		local ai = setmetatable({}, af)
		ai.__index = ai
		local aj = function(aj)
			if ah(aj) then
				return aj
			end
			local c = typeof(aj)
			if c == 'number' then
				return ag.new(aj, false)
			elseif c == 'table' then
				return ai.new(aj, false)
			end
			error(('Unable to convert %q to motor; type %s is unsupported'):format(aj, c), 2)
		end
		function ai.new(c, d)
			assert(c, 'Missing argument #1: initialValues')
			assert(typeof(c) == 'table', 'initialValues must be a table!')
			assert(not c.step, [[initialValues contains disallowed property "step". Did you mean to put a table of values here?]])
			local e = setmetatable(af.new(), ai)
			if d ~= nil then
				e._useImplicitConnections = d
			else
				e._useImplicitConnections = true
			end
			e._complete = true
			e._motors = {}
			for f, g in pairs(c) do
				e._motors[f] = aj(g)
			end
			return e
		end
		function ai.step(c, d)
			if c._complete then
				return true
			end
			local e = true
			for f, g in pairs(c._motors) do
				local h = g:step(d)
				if not h then
					e = false
				end
			end
			c._onStep:fire(c:getValue())
			if e then
				if c._useImplicitConnections then
					c:stop()
				end
				c._complete = true
				c._onComplete:fire()
			end
			return e
		end
		function ai.setGoal(c, d)
			assert(not d.step, [[goals contains disallowed property "step". Did you mean to put a table of goals here?]])
			c._complete = false
			c._onStart:fire()
			for e, f in pairs(d) do
				local g = assert(c._motors[e], ('Unknown motor for key %s'):format(e))
				g:setGoal(f)
			end
			if c._useImplicitConnections then
				c:start()
			end
		end
		function ai.getValue(c)
			local d = {}
			for e, f in pairs(c._motors) do
				d[e] = f:getValue()
			end
			return d
		end
		function ai.__tostring(c)
			return 'Motor(Group)'
		end
		return ai
	end,
	[34] = function()
		local aa, ab, ac, ad, ae = b(34)
		return function()
		end
	end,
	[35] = function()
		local aa, ab, ac, ad, ae = b(35)
		local af = {}
		af.__index = af
		function af.new(ag)
			return setmetatable({
				_targetValue = ag
			}, af)
		end
		function af.step(ag)
			return {
				complete = true,
				value = ag._targetValue
			}
		end
		return af
	end,
	[36] = function()
		local aa, ab, ac, ad, ae = b(36)
		return function()
		end
	end,
	[37] = function()
		local aa, ab, ac, ad, ae = b(37)
		local af = {}
		af.__index = af
		function af.new(ag, ah)
			assert(ag, 'Missing argument #1: targetValue')
			ah = ah or {}
			return setmetatable({
				_targetValue = ag,
				_velocity = ah.velocity or 1
			}, af)
		end
		function af.step(ag, ah, ai)
			local aj, c, d = ah.value, ag._velocity, ag._targetValue
			local e = ai * c
			local f = e >= math.abs(d - aj)
			aj = aj + e * (d > aj and 1 or -1)
			if f then
				aj = ag._targetValue
				c = 0
			end
			return {
				complete = f,
				value = aj,
				velocity = c
			}
		end
		return af
	end,
	[38] = function()
		local aa, ab, ac, ad, ae = b(38)
		return function()
		end
	end,
	[39] = function()
		local aa, ab, ac, ad, ae = b(39)
		local af = {}
		af.__index = af
		function af.new(ag, ah)
			return setmetatable({
				signal = ag,
				connected = true,
				_handler = ah
			}, af)
		end
		function af.disconnect(ag)
			if ag.connected then
				ag.connected = false
				for ah, ai in pairs(ag.signal._connections) do
					if ai == ag then
						table.remove(ag.signal._connections, ah)
						return
					end
				end
			end
		end
		local ag = {}
		ag.__index = ag
		function ag.new()
			return setmetatable({
				_connections = {},
				_threads = {}
			}, ag)
		end
		function ag.fire(ah, ...)
			for ai, aj in pairs(ah._connections) do
				aj._handler(...)
			end
			for c, d in pairs(ah._threads) do
				coroutine.resume(d, ...)
			end
			ah._threads = {}
		end
		function ag.connect(ah, aj)
			local c = af.new(ah, aj)
			table.insert(ah._connections, c)
			return c
		end
		function ag.wait(ah)
			table.insert(ah._threads, coroutine.running())
			return coroutine.yield()
		end
		return ag
	end,
	[40] = function()
		local aa, ab, ac, ad, ae = b(40)
		return function()
		end
	end,
	[41] = function()
		local aa, ab, ac, ad, ae = b(41)
		local af = ac(ab.Parent.BaseMotor)
		local ag = setmetatable({}, af)
		ag.__index = ag
		function ag.new(ah, aj)
			assert(ah, 'Missing argument #1: initialValue')
			assert(typeof(ah) == 'number', 'initialValue must be a number!')
			local c = setmetatable(af.new(), ag)
			if aj ~= nil then
				c._useImplicitConnections = aj
			else
				c._useImplicitConnections = true
			end
			c._goal = nil
			c._state = {
				complete = true,
				value = ah
			}
			return c
		end
		function ag.step(ah, aj)
			if ah._state.complete then
				return true
			end
			local c = ah._goal:step(ah._state, aj)
			ah._state = c
			ah._onStep:fire(c.value)
			if c.complete then
				if ah._useImplicitConnections then
					ah:stop()
				end
				ah._onComplete:fire()
			end
			return c.complete
		end
		function ag.getValue(ah)
			return ah._state.value
		end
		function ag.setGoal(ah, aj)
			ah._state.complete = false
			ah._goal = aj
			ah._onStart:fire()
			if ah._useImplicitConnections then
				ah:start()
			end
		end
		function ag.__tostring(ah)
			return 'Motor(Single)'
		end
		return ag
	end,
	[42] = function()
		local aa, ab, ac, ad, ae = b(42)
		return function()
		end
	end,
	[43] = function()
		local aa, ab, ac, ad, ae = b(43)
		local af, ag, ah, aj = 0.001, 0.001, 0.0001, {}
		aj.__index = aj
		function aj.new(c, d)
			assert(c, 'Missing argument #1: targetValue')
			d = d or {}
			return setmetatable({
				_targetValue = c,
				_frequency = d.frequency or 4,
				_dampingRatio = d.dampingRatio or 1
			}, aj)
		end
		function aj.step(c, d, e)
			local f, g, h, i, j = c._dampingRatio, c._frequency * 2 * math.pi, c._targetValue, d.value, d.velocity or 0
			local k, l, m, n = i - h, (math.exp(-f * g * e))
			if f == 1 then
				m = (k * (1 + g * e) + j * e) * l + h
				n = (j * (1 - g * e) - k * (g * g * e)) * l
			elseif f < 1 then
				local o = math.sqrt(1 - f * f)
				local p, s, t = math.cos(g * o * e), (math.sin(g * o * e))
				if o > ah then
					t = s / o
				else
					local u = e * g
					t = u + ((u * u) * (o * o) * (o * o) / 20 - o * o) * (u * u * u) / 6
				end
				local u
				if g * o > ah then
					u = s / (g * o)
				else
					local v = g * o
					u = e + ((e * e) * (v * v) * (v * v) / 20 - v * v) * (e * e * e) / 6
				end
				m = (k * (p + f * t) + j * u) * l + h
				n = (j * (p - t * f) - k * (t * g)) * l
			else
				local o = math.sqrt(f * f - 1)
				local p, s = -g * (f - o), -g * (f + o)
				local t = (j - k * p) / (2 * g * o)
				local u = k - t
				local v, w = u * math.exp(p * e), t * math.exp(s * e)
				m = v + w + h
				n = v * p + w * s
			end
			local o = math.abs(n) < af and math.abs(m - h) < ag
			return {
				complete = o,
				value = o and h or m,
				velocity = n
			}
		end
		return aj
	end,
	[44] = function()
		local aa, ab, ac, ad, ae = b(44)
		return function()
		end
	end,
	[45] = function()
		local aa, ab, ac, ad, ae = b(45)
		local af = function(af)
			local ag = tostring(af):match'^Motor%((.+)%)				local C = e(t.Dialog):Create()
				C.Title.Text = z.Title
				C.Root.Size = UDim2.fromOffset(430, 330)
				local D, E, F, G, H, I = z.Hue, z.Sat, z.Vib, z.Transparency, function()
					local D = e(t.Textbox)()
					D.Frame.Parent = C.Root
					D.Frame.Size = UDim2.new(0, 90, 0, 32)
					return D
				end, function(D, E)
					return s('TextLabel', {
						FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
						Text = D,
						TextColor3 = Color3.fromRGB(240, 240, 240),
						TextSize = 13,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, 0, 0, 32),
						Position = E,
						BackgroundTransparency = 1,
						Parent = C.Root,
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
				end
				local J, K = function()
					local J = Color3.fromHSV(D, E, F)
					return {
						R = math.floor(J.r * 255),
						G = math.floor(J.g * 255),
						B = math.floor(J.b * 255)
					}
				end, s('ImageLabel', {
					Size = UDim2.new(0, 18, 0, 18),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = 'http://www.roblox.com/asset/?id=4805639000'
				})
				local L, M = s('ImageLabel', {
					Size = UDim2.fromOffset(180, 160),
					Position = UDim2.fromOffset(20, 55),
					Image = 'rbxassetid://4155801252',
					BackgroundColor3 = z.Value,
					BackgroundTransparency = 0,
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					K
				}), s('Frame', {
					BackgroundColor3 = z.Value,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = z.Transparency
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					})
				})
				local N, O = s('ImageLabel', {
					Image = 'http://www.roblox.com/asset/?id=14204231522',
					ImageTransparency = 0.45,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.fromOffset(40, 40),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(112, 220),
					Size = UDim2.fromOffset(88, 24),
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					s('UIStroke', {
						Thickness = 2,
						Transparency = 0.75
					}),
					M
				}), s('Frame', {
					BackgroundColor3 = z.Value,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 0
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					})
				})
				local P, Q = s('ImageLabel', {
					Image = 'http://www.roblox.com/asset/?id=14204231522',
					ImageTransparency = 0.45,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.fromOffset(40, 40),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(20, 220),
					Size = UDim2.fromOffset(88, 24),
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					s('UIStroke', {
						Thickness = 2,
						Transparency = 0.75
					}),
					O
				}), {}
				for R = 0, 1, 0.1 do
					table.insert(Q, ColorSequenceKeypoint.new(R, Color3.fromHSV(R, 1, 1)))
				end
				local R, S = s('UIGradient', {
					Color = ColorSequence.new(Q),
					Rotation = 90
				}), s('Frame', {
					Size = UDim2.new(1, 0, 1, -10),
					Position = UDim2.fromOffset(0, 5),
					BackgroundTransparency = 1
				})
				local T, U, V = s('ImageLabel', {
					Size = UDim2.fromOffset(14, 14),
					Image = 'http://www.roblox.com/asset/?id=12266946128',
					Parent = S,
					ThemeTag = {
						ImageColor3 = 'DialogInput'
					}
				}), s('Frame', {
					Size = UDim2.fromOffset(12, 190),
					Position = UDim2.fromOffset(210, 55),
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(1, 0)
					}),
					R,
					S
				}), H()
				V.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 55)
				I('Hex', UDim2.fromOffset(x.Transparency and 360 or 340, 55))
				local W = H()
				W.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 95)
				I('Red', UDim2.fromOffset(x.Transparency and 360 or 340, 95))
				local X = H()
				X.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 135)
				I('Green', UDim2.fromOffset(x.Transparency and 360 or 340, 135))
				local Y = H()
				Y.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 175)
				I('Blue', UDim2.fromOffset(x.Transparency and 360 or 340, 175))
				local Z
				if x.Transparency then
					Z = H()
					Z.Frame.Position = UDim2.fromOffset(260, 215)
					I('Alpha', UDim2.fromOffset(360, 215))
				end
				local _, aa, ab
				if x.Transparency then
					local ac = s('Frame', {
						Size = UDim2.new(1, 0, 1, -10),
						Position = UDim2.fromOffset(0, 5),
						BackgroundTransparency = 1
					})
					aa = s('ImageLabel', {
						Size = UDim2.fromOffset(14, 14),
						Image = 'http://www.roblox.com/asset/?id=12266946128',
						Parent = ac,
						ThemeTag = {
							ImageColor3 = 'DialogInput'
						}
					})
					ab = s('Frame', {
						Size = UDim2.fromScale(1, 1)
					}, {
						s('UIGradient', {
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0, 0),
								NumberSequenceKeypoint.new(1, 1)
							},
							Rotation = 270
						}),
						s('UICorner', {
							CornerRadius = UDim.new(1, 0)
						})
					})
					_ = s('Frame', {
						Size = UDim2.fromOffset(12, 190),
						Position = UDim2.fromOffset(230, 55),
						Parent = C.Root,
						BackgroundTransparency = 1
					}, {
						s('UICorner', {
							CornerRadius = UDim.new(1, 0)
						}),
						s('ImageLabel', {
							Image = 'http://www.roblox.com/asset/?id=14204231522',
							ImageTransparency = 0.45,
							ScaleType = Enum.ScaleType.Tile,
							TileSize = UDim2.fromOffset(40, 40),
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							Parent = C.Root
						}, {
							s('UICorner', {
								CornerRadius = UDim.new(1, 0)
							})
						}),
						ab,
						ac
					})
				end
				local ac = function()
					L.BackgroundColor3 = Color3.fromHSV(D, 1, 1)
					T.Position = UDim2.new(0, -1, D, -6)
					K.Position = UDim2.new(E, 0, 1 - F, 0)
					O.BackgroundColor3 = Color3.fromHSV(D, E, F)
					V.Input.Text = '#' .. Color3.fromHSV(D, E, F):ToHex()
					W.Input.Text = J().R
					X.Input.Text = J().G
					Y.Input.Text = J().B
					if x.Transparency then
						ab.BackgroundColor3 = Color3.fromHSV(D, E, F)
						O.BackgroundTransparency = G
						aa.Position = UDim2.new(0, -1, 1 - G, -6)
						Z.Input.Text = e(o):Round((1 - G) * 100, 0) .. '%'
					end
				end
				p.AddSignal(V.Input.FocusLost, function(ad)
					if ad then
						local ae, af = pcall(Color3.fromHex, V.Input.Text)
						if ae and typeof(af) == 'Color3' then
							D, E, F = Color3.toHSV(af)
						end
					end
					ac()
				end)
				p.AddSignal(W.Input.FocusLost, function(ad)
					if ad then
						local ae = J()
						local af, ag = pcall(Color3.fromRGB, W.Input.Text, ae.G, ae.B)
						if af and typeof(ag) == 'Color3' then
							if tonumber(W.Input.Text) <= 255 then
								D, E, F = Color3.toHSV(ag)
							end
						end
					end
					ac()
				end)
				p.AddSignal(X.Input.FocusLost, function(ad)
					if ad then
						local ae = J()
						local af, ag = pcall(Color3.fromRGB, ae.R, X.Input.Text, ae.B)
						if af and typeof(ag) == 'Color3' then
							if tonumber(X.Input.Text) <= 255 then
								D, E, F = Color3.toHSV(ag)
							end
						end
					end
					ac()
				end)
				p.AddSignal(Y.Input.FocusLost, function(ad)
					if ad then
						local ae = J()
						local af, ag = pcall(Color3.fromRGB, ae.R, ae.G, Y.Input.Text)
						if af and typeof(ag) == 'Color3' then
							if tonumber(Y.Input.Text) <= 255 then
								D, E, F = Color3.toHSV(ag)
							end
						end
					end
					ac()
				end)
				if x.Transparency then
					p.AddSignal(Z.Input.FocusLost, function(ad)
						if ad then
							pcall(function()
								local ae = tonumber(Z.Input.Text)
								if ae >= 0 and ae <= 100 then
									G = 1 - ae * 0.01
								end
							end)
						end
						ac()
					end)
				end
				p.AddSignal(L.InputBegan, function(ad)
					if ad.UserInputType == Enum.UserInputType.MouseButton1 or ad.UserInputType == Enum.UserInputType.Touch then
						while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local ae = L.AbsolutePosition.X
							local af = ae + L.AbsoluteSize.X
							local ag, ah = math.clamp(n.X, ae, af), L.AbsolutePosition.Y
							local ai = ah + L.AbsoluteSize.Y
							local aj = math.clamp(n.Y, ah, ai)
							E = (ag - ae) / (af - ae)
							F = 1 - ((aj - ah) / (ai - ah))
							ac()
							l:Wait()
						end
					end
				end)
				p.AddSignal(U.InputBegan, function(ad)
					if ad.UserInputType == Enum.UserInputType.MouseButton1 or ad.UserInputType == Enum.UserInputType.Touch then
						while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local ae = U.AbsolutePosition.Y
							local af = ae + U.AbsoluteSize.Y
							local ag = math.clamp(n.Y, ae, af)
							D = ((ag - ae) / (af - ae))
							ac()
							l:Wait()
						end
					end
				end)
				if x.Transparency then
					p.AddSignal(_.InputBegan, function(ad)
						if ad.UserInputType == Enum.UserInputType.MouseButton1 then
							while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								local ae = _.AbsolutePosition.Y
								local af = ae + _.AbsoluteSize.Y
								local ag = math.clamp(n.Y, ae, af)
								G = 1 - ((ag - ae) / (af - ae))
								ac()
								l:Wait()
							end
						end
					end)
				end
				ac()
				C:Button('Done', function()
					z:SetValue({
						D,
						E,
						F
					}, G)
				end)
				C:Button'Cancel'
				C:Open()
			end
			function z.Display(ac)
				z.Value = Color3.fromHSV(z.Hue, z.Sat, z.Vib)
				B.BackgroundColor3 = z.Value
				B.BackgroundTransparency = z.Transparency
				u.Library:SafeCallback(z.Callback, z.Value)
				u.Library:SafeCallback(z.Changed, z.Value)
			end
			function z.SetValue(ac, ad, ae)
				local af = Color3.fromHSV(ad[1], ad[2], ad[3])
				z.Transparency = ae or 0
				z:SetHSVFromRGB(af)
				z:Display()
			end
			function z.SetValueRGB(ac, ad, ae)
				z.Transparency = ae or 0
				z:SetHSVFromRGB(ad)
				z:Display()
			end
			function z.OnChanged(ac, ad)
				z.Changed = ad
				ad(z.Value)
			end
			function z.Destroy(ac)
				A:Destroy()
				y.Options[w] = nil
			end
			p.AddSignal(A.Frame.MouseButton1Click, function()
				ab()
			end)
			z:Display()
			y.Options[w] = z
			return z
		end
		return u
	end,
	[22] = function()
		local aa, ab, ac, ad, ae = b(22)
		local af, ag, ah, ai, aj = game:GetService'TweenService', game:GetService'UserInputService', game:GetService'Players'.LocalPlayer:GetMouse(), game:GetService'Workspace'.CurrentCamera, ab.Parent.Parent
		local c, d = ac(aj.Creator), ac(aj.Packages.Flipper)
		local e, f, g = c.New, aj.Components, {}
		g.__index = g
		g.__type = 'Dropdown'
		function g.New(h, i, j)
			local k, l, m = h.Library, {
				Values = j.Values,
				Value = j.Default,
				Multi = j.Multi,
				Buttons = {},
				Opened = false,
				Type = 'Dropdown',
				Callback = j.Callback or function()
				end
			}, ac(f.Element)(j.Title, j.Description, h.Container, false)
			m.DescLabel.Size = UDim2.new(1, -170, 0, 14)
			l.SetTitle = m.SetTitle
			l.SetDesc = m.SetDesc
			local n, o = e('TextLabel', {
				FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				Text = 'Value',
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, -30, 0, 14),
				Position = UDim2.new(0, 8, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), e('ImageLabel', {
				Image = 'rbxassetid://10709790948',
				Size = UDim2.fromOffset(16, 16),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -8, 0.5, 0),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = 'SubText'
				}
			})
			local p, s = e('TextButton', {
				Size = UDim2.fromOffset(160, 30),
				Position = UDim2.new(1, -10, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 0.9,
				Parent = m.Frame,
				ThemeTag = {
					BackgroundColor3 = 'DropdownFrame'
				}
			}, {
				e('UICorner', {
					CornerRadius = UDim.new(0, 5)
				}),
				e('UIStroke', {
					Transparency = 0.5,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					ThemeTag = {
						Color = 'InElementBorder'
					}
				}),
				o,
				n
			}), e('UIListLayout', {
				Padding = UDim.new(0, 3)
			})
			local t = e('ScrollingFrame', {
				Size = UDim2.new(1, -5, 1, -10),
				Position = UDim2.fromOffset(5, 5),
				BackgroundTransparency = 1,
				BottomImage = 'rbxassetid://6889812791',
				MidImage = 'rbxassetid://6889812721',
				TopImage = 'rbxassetid://6276641225',
				ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
				ScrollBarImageTransparency = 0.95,
				ScrollBarThickness = 4,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0)
			}, {
				s
			})
			local u = e('Frame', {
				Size = UDim2.fromScale(1, 0.6),
				ThemeTag = {
					BackgroundColor3 = 'DropdownHolder'
				}
			}, {
				t,
				e('UICorner', {
					CornerRadius = UDim.new(0, 7)
				}),
				e('UIStroke', {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					ThemeTag = {
						Color = 'DropdownBorder'
					}
				}),
				e('ImageLabel', {
					BackgroundTransparency = 1,
					Image = 'http://www.roblox.com/asset/?id=5554236805',
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(23, 23, 277, 277),
					Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
					Position = UDim2.fromOffset(-15, -15),
					ImageColor3 = Color3.fromRGB(0, 0, 0),
					ImageTransparency = 0.1
				})
			})
			local v = e('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(170, 300),
				Parent = h.Library.GUI,
				Visible = false
			}, {
				u,
				e('UISizeConstraint', {
					MinSize = Vector2.new(170, 0)
				})
			})
			table.insert(k.OpenFrames, v)
			local w, x = function()
				local w = 0
				if ai.ViewportSize.Y - p.AbsolutePosition.Y < v.AbsoluteSize.Y - 5 then
					w = v.AbsoluteSize.Y - 5 - (ai.ViewportSize.Y - p.AbsolutePosition.Y) + 40
				end
				v.Position = UDim2.fromOffset(p.AbsolutePosition.X - 1, p.AbsolutePosition.Y - 5 - w)
			end, 0
			local y, z = function()
				if #l.Values > 10 then
					v.Size = UDim2.fromOffset(x, 392)
				else
					v.Size = UDim2.fromOffset(x, s.AbsoluteContentSize.Y + 10)
				end
			end, function()
				t.CanvasSize = UDim2.fromOffset(0, s.AbsoluteContentSize.Y)
			end
			w()
			y()
			c.AddSignal(p:GetPropertyChangedSignal'AbsolutePosition', w)
			c.AddSignal(p.MouseButton1Click, function()
				l:Open()
			end)
			c.AddSignal(ag.InputBegan, function(A)
				if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
					local B, C = u.AbsolutePosition, u.AbsoluteSize
					if ah.X < B.X or ah.X > B.X + C.X or ah.Y < (B.Y - 20 - 1) or ah.Y > B.Y + C.Y then
						l:Close()
					end
				end
			end)
			local A = h.ScrollFrame
			function l.Open(B)
				l.Opened = true
				A.ScrollingEnabled = false
				v.Visible = true
				af:Create(u, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Size = UDim2.fromScale(1, 1)
				}):Play()
			end
			function l.Close(B)
				l.Opened = false
				A.ScrollingEnabled = true
				u.Size = UDim2.fromScale(1, 0.6)
				v.Visible = false
			end
			function l.Display(B)
				local C, D = l.Values, ''
				if j.Multi then
					for E, F in next, C do
						if l.Value[F] then
							D = D .. F .. ', '
						end
					end
					D = D:sub(1, #D - 2)
				else
					D = l.Value or ''
				end
				n.Text = (D == '' and '--' or D)
			end
			function l.GetActiveValues(B)
				if j.Multi then
					local C = {}
					for D, E in next, l.Value do
						table.insert(C, D)
					end
					return C
				else
					return l.Value and 1 or 0
				end
			end
			function l.BuildDropdownList(B)
				local C, D = l.Values, {}
				for E, F in next, t:GetChildren() do
					if not F:IsA'UIListLayout' then
						F:Destroy()
					end
				end
				local G = 0
				for H, I in next, C do
					local J = {}
					G = G + 1
					local K, L = e('Frame', {
						Size = UDim2.fromOffset(4, 14),
						BackgroundColor3 = Color3.fromRGB(76, 194, 255),
						Position = UDim2.fromOffset(-1, 16),
						AnchorPoint = Vector2.new(0, 0.5),
						ThemeTag = {
							BackgroundColor3 = 'Accent'
						}
					}, {
						e('UICorner', {
							CornerRadius = UDim.new(0, 2)
						})
					}), e('TextLabel', {
						FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
						Text = I,
						TextColor3 = Color3.fromRGB(200, 200, 200),
						TextSize = 13,
						TextXAlignment = Enum.TextXAlignment.Left,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Position = UDim2.fromOffset(10, 0),
						Name = 'ButtonLabel',
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
					local M, N = (e('TextButton', {
						Size = UDim2.new(1, -5, 0, 32),
						BackgroundTransparency = 1,
						ZIndex = 23,
						Text = '',
						Parent = t,
						ThemeTag = {
							BackgroundColor3 = 'DropdownOption'
						}
					}, {
						K,
						L,
						e('UICorner', {
							CornerRadius = UDim.new(0, 6)
						})
					}))
					if j.Multi then
						N = l.Value[I]
					else
						N = l.Value == I
					end
					local O, P = c.SpringMotor(1, M, 'BackgroundTransparency')
					local Q, R = c.SpringMotor(1, K, 'BackgroundTransparency')
					local S = d.SingleMotor.new(6)
					S:onStep(function(T)
						K.Size = UDim2.new(0, 4, 0, T)
					end)
					c.AddSignal(M.MouseEnter, function()
						P(N and 0.85 or 0.89)
					end)
					c.AddSignal(M.MouseLeave, function()
						P(N and 0.89 or 1)
					end)
					c.AddSignal(M.MouseButton1Down, function()
						P(0.92)
					end)
					c.AddSignal(M.MouseButton1Up, function()
						P(N and 0.85 or 0.89)
					end)
					function J.UpdateButton(T)
						if j.Multi then
							N = l.Value[I]
							if N then
								P(0.89)
							end
						else
							N = l.Value == I
							P(N and 0.89 or 1)
						end
						S:setGoal(d.Spring.new(N and 14 or 6, {
							frequency = 6
						}))
						R(N and 0 or 1)
					end
					L.InputBegan:Connect(function(T)
						if T.UserInputType == Enum.UserInputType.MouseButton1 or T.UserInputType == Enum.UserInputType.Touch then
							local U = not N
							if l:GetActiveValues() == 1 and not U and not j.AllowNull then
							else
								if j.Multi then
									N = U
									l.Value[I] = N and true or nil
								else
									N = U
									l.Value = N and I or nil
									for V, W in next, D do
										W:UpdateButton()
									end
								end
								J:UpdateButton()
								l:Display()
								k:SafeCallback(l.Callback, l.Value)
								k:SafeCallback(l.Changed, l.Value)
							end
						end
					end)
					J:UpdateButton()
					l:Display()
					D[M] = J
				end
				x = 0
				for J, K in next, D do
					if J.ButtonLabel then
						if J.ButtonLabel.TextBounds.X > x then
							x = J.ButtonLabel.TextBounds.X
						end
					end
				end
				x = x + 30
				z()
				y()
			end
			function l.SetValues(B, C)
				if C then
					l.Values = C
				end
				l:BuildDropdownList()
			end
			function l.OnChanged(B, C)
				l.Changed = C
				C(l.Value)
			end
			function l.SetValue(B, C)
				if l.Multi then
					local D = {}
					for E, F in next, C do
						if table.find(l.Values, E) then
							D[E] = true
						end
					end
					l.Value = D
				else
					if not C then
						l.Value = nil
					elseif table.find(l.Values, C) then
						l		return l
	end,
	[21] = function()
		local c, d, e, f, g = b(21)
		local h, i, j, k = game:GetService'UserInputService', game:GetService'TouchInputService', game:GetService'RunService', game:GetService'Players'
		local l, m = j.RenderStepped, k.LocalPlayer
		local n, o = m:GetMouse(), d.Parent.Parent
		local p = e(o.Creator)
		local s, t, u = p.New, o.Components, {}
		u.__index = u
		u.__type = 'Colorpicker'
		function u.New(v, w, x)
			local y = v.Library
			assert(x.Title, 'Colorpicker - Missing Title')
			assert(x.Default, 'AddColorPicker: Missing default value.')
			local z = {
				Value = x.Default,
				Transparency = x.Transparency or 0,
				Type = 'Colorpicker',
				Title = type(x.Title) == 'string' and x.Title or 'Colorpicker',
				Callback = x.Callback or function(z)
				end
			}
			function z.SetHSVFromRGB(A, B)
				local C, D, E = Color3.toHSV(B)
				z.Hue = C
				z.Sat = D
				z.Vib = E
			end
			z:SetHSVFromRGB(z.Value)
			local A = e(t.Element)(x.Title, x.Description, v.Container, true)
			z.SetTitle = A.SetTitle
			z.SetDesc = A.SetDesc
			local B = s('Frame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = z.Value,
				Parent = A.Frame
			}, {
				s('UICorner', {
					CornerRadius = UDim.new(0, 4)
				})
			})
			local aa, ab = s('ImageLabel', {
				Size = UDim2.fromOffset(26, 26),
				Position = UDim2.new(1, -10, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Parent = A.Frame,
				Image = 'http://www.roblox.com/asset/?id=14204231522',
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40)
			}, {
				s('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				B
			}), function()
				local C = e(t.Dialog):Create()-- SeaMinhUI Library - Full Code
-- Hỗ trợ Icon linh hoạt cho Window và Tab

local a, b = {
	{
		1,
		'ModuleScript',
		{
			'MainModule'
		},
		{
			{
				18,
				'ModuleScript',
				{
					'Creator'
				}
			},
			{
				28,
				'ModuleScript',
				{
					'Icons'
				}
			},
			{
				47,
				'ModuleScript',
				{
					'Themes'
				},
				{
					{
						50,
						'ModuleScript',
						{
							'Dark'
						}
					},
					{
						52,
						'ModuleScript',
						{
							'Light'
						}
					},
					{
						51,
						'ModuleScript',
						{
							'Darker'
						}
					},
					{
						53,
						'ModuleScript',
						{
							'Rose'
						}
					},
					{
						49,
						'ModuleScript',
						{
							'Aqua'
						}
					},
					{
						48,
						'ModuleScript',
						{
							'Amethyst'
						}
					}
				}
			},
			{
				19,
				'ModuleScript',
				{
					'Elements'
				},
				{
					{
						21,
						'ModuleScript',
						{
							'Colorpicker'
						}
					},
					{
						27,
						'ModuleScript',
						{
							'Toggle'
						}
					},
					{
						23,
						'ModuleScript',
						{
							'Input'
						}
					},
					{
						20,
						'ModuleScript',
						{
							'Button'
						}
					},
					{
						25,
						'ModuleScript',
						{
							'Paragraph'
						}
					},
					{
						22,
						'ModuleScript',
						{
							'Dropdown'
						}
					},
					{
						26,
						'ModuleScript',
						{
							'Slider'
						}
					},
					{
						24,
						'ModuleScript',
						{
							'Keybind'
						}
					}
				}
			},
			{
				29,
				'Folder',
				{
					'Packages'
				},
				{
					{
						30,
						'ModuleScript',
						{
							'Flipper'
						},
						{
							{
								33,
								'ModuleScript',
								{
									'GroupMotor'
								}
							},
							{
								46,
								'ModuleScript',
								{
									'isMotor.spec'
								}
							},
							{
								39,
								'ModuleScript',
								{
									'Signal'
								}
							},
							{
								40,
								'ModuleScript',
								{
									'Signal.spec'
								}
							},
							{
								45,
								'ModuleScript',
								{
									'isMotor'
								}
							},
							{
								36,
								'ModuleScript',
								{
									'Instant.spec'
								}
							},
							{
								44,
								'ModuleScript',
								{
									'Spring.spec'
								}
							},
							{
								42,
								'ModuleScript',
								{
									'SingleMotor.spec'
								}
							},
							{
								38,
								'ModuleScript',
								{
									'Linear.spec'
								}
							},
							{
								31,
								'ModuleScript',
								{
									'BaseMotor'
								}
							},
							{
								43,
								'ModuleScript',
								{
									'Spring'
								}
							},
							{
								35,
								'ModuleScript',
								{
									'Instant'
								}
							},
							{
								37,
								'ModuleScript',
								{
									'Linear'
								}
							},
							{
								41,
								'ModuleScript',
								{
									'SingleMotor'
								}
							},
							{
								34,
								'ModuleScript',
								{
									'GroupMotor.spec'
								}
							},
							{
								32,
								'ModuleScript',
								{
									'BaseMotor.spec'
								}
							}
						}
					}
				}
			},
			{
				2,
				'ModuleScript',
				{
					'Acrylic'
				},
				{
					{
						3,
						'ModuleScript',
						{
							'AcrylicBlur'
						}
					},
					{
						5,
						'ModuleScript',
						{
							'CreateAcrylic'
						}
					},
					{
						6,
						'ModuleScript',
						{
							'Utils'
						}
					},
					{
						4,
						'ModuleScript',
						{
							'AcrylicPaint'
						}
					}
				}
			},
			{
				7,
				'Folder',
				{
					'Components'
				},
				{
					{
						9,
						'ModuleScript',
						{
							'Button'
						}
					},
					{
						12,
						'ModuleScript',
						{
							'Notification'
						}
					},
					{
						13,
						'ModuleScript',
						{
							'Section'
						}
					},
					{
						17,
						'ModuleScript',
						{
							'Window'
						}
					},
					{
						14,
						'ModuleScript',
						{
							'Tab'
						}
					},
					{
						10,
						'ModuleScript',
						{
							'Dialog'
						}
					},
					{
						8,
						'ModuleScript',
						{
							'Assets'
						}
					},
					{
						16,
						'ModuleScript',
						{
							'TitleBar'
						}
					},
					{
						15,
						'ModuleScript',
						{
							'Textbox'
						}
					},
					{
						11,
						'ModuleScript',
						{
							'Element'
						}
					}
				}
			}
		}
	}
}
local aa = {
	function()
		local c, d, e, f, g = b(1)
		local h, i, j, k, l, m = game:GetService'Lighting', game:GetService'RunService', game:GetService'Players'.LocalPlayer, game:GetService'UserInputService', game:GetService'TweenService', game:GetService'Workspace'.CurrentCamera
		local n, o = j:GetMouse(), d
		local p, q, r, s = e(o.Creator), e(o.Elements), e(o.Acrylic), o.Components
		local t, u, v = e(s.Notification), p.New, protectgui or (syn and syn.protect_gui) or function()
		end
		local w = u('ScreenGui', {
			Parent = i:IsStudio() and j.PlayerGui or game:GetService'CoreGui'
		})
		v(w)
		t:Init(w)
		local x = {
			Version = '1.0.0',
			Name = 'SeaMinhUI',
			OpenFrames = {},
			Options = {},
			Themes = e(o.Themes).Names,
			Window = nil,
			WindowFrame = nil,
			Unloaded = false,
			Theme = 'Dark',
			DialogOpen = false,
			UseAcrylic = false,
			Acrylic = false,
			Transparency = true,
			MinimizeKeybind = nil,
			MinimizeKey = Enum.KeyCode.LeftControl,
			GUI = w
		}
		function x.SafeCallback(y, z, ...)
			if not z then
				return
			end
			local A, B = pcall(z, ...)
			if not A then
				local C, D = B:find':%d+: '
				if not D then
					return x:Notify{
						Title = 'SeaMinhUI',
						Content = 'Callback error',
						SubContent = B,
						Duration = 5
					}
				end
				return x:Notify{
					Title = 'SeaMinhUI',
					Content = 'Callback error',
					SubContent = B:sub(D + 1),
					Duration = 5
				}
			end
		end
		function x.Round(y, z, A)
			if A == 0 then
				return math.floor(z)
			end
			z = tostring(z)
			return z:find'%.' and tonumber(z:sub(1, z:find'%.' + A)) or z
		end
		local y = e(o.Icons).assets
		function x.GetIcon(z, A)
			if A ~= nil and y['lucide-' .. A] then
				return y['lucide-' .. A]
			end
			return nil
		end
		local z = {}
		z.__index = z
		z.__namecall = function(A, B, ...)
			return z[B](...)
		end
		for A, B in ipairs(q) do
			z['Add' .. B.__type] = function(C, D, E)
				B.Container = C.Container
				B.Type = C.Type
				B.ScrollFrame = C.ScrollFrame
				B.Library = x
				return B:New(D, E)
			end
		end
		x.Elements = z
		function x.CreateWindow(C, D)
			assert(D.Title, 'Window - Missing Title')
			if x.Window then
				print'You cannot create more than one window.'
				return
			end
			x.MinimizeKey = D.MinimizeKey
			x.UseAcrylic = D.Acrylic
			if D.Acrylic then
				r.init()
			end
			local E = e(s.Window){
				Parent = w,
				Size = D.Size,
				Title = D.Title,
				SubTitle = D.SubTitle,
				TabWidth = D.TabWidth,
				Icon = D.Icon
			}
			x.Window = E
			x:SetTheme(D.Theme)
			return E
		end
		function x.SetTheme(C, D)
			if x.Window and table.find(x.Themes, D) then
				x.Theme = D
				p.UpdateTheme()
			end
		end
		function x.Destroy(C)
			if x.Window then
				x.Unloaded = true
				if x.UseAcrylic then
					x.Window.AcrylicPaint.Model:Destroy()
				end
				p.Disconnect()
				x.GUI:Destroy()
			end
		end
		function x.ToggleAcrylic(C, D)
			if x.Window then
				if x.UseAcrylic then
					x.Acrylic = D
					x.Window.AcrylicPaint.Model.Transparency = D and 0.98 or 1
					if D then
						r.Enable()
					else
						r.Disable()
					end
				end
			end
		end
		function x.ToggleTransparency(C, D)
			if x.Window then
				x.Window.AcrylicPaint.Frame.Background.BackgroundTransparency = D and 0.35 or 0
			end
		end
		function x.Notify(C, D)
			return t:New(D)
		end
		if getgenv then
			getgenv().SeaMinhUI = x
			getgenv().Fluent = x
		end
		return x
	end,
	function()
		local c, d, e, f, g = b(2)
		local h = {
			AcrylicBlur = e(d.AcrylicBlur),
			CreateAcrylic = e(d.CreateAcrylic),
			AcrylicPaint = e(d.AcrylicPaint)
		}
		function h.init()
			local i = Instance.new'DepthOfFieldEffect'
			i.FarIntensity = 0
			i.InFocusRadius = 0.1
			i.NearIntensity = 1
			local j = {}
			function h.Enable()
				for k, l in pairs(j) do
					l.Enabled = false
				end
				i.Parent = game:GetService'Lighting'
			end
			function h.Disable()
				for k, l in pairs(j) do
					l.Enabled = l.enabled
				end
				i.Parent = nil
			end
			local k = function()
				local k = function(k)
					if k:IsA'DepthOfFieldEffect' then
						j[k] = {
							enabled = k.Enabled
						}
					end
				end
				for l, m in pairs(game:GetService'Lighting':GetChildren()) do
					k(m)
				end
				if game:GetService'Workspace'.CurrentCamera then
					for n, o in pairs(game:GetService'Workspace'.CurrentCamera:GetChildren()) do
						k(o)
					end
				end
			end
			k()
			h.Enable()
		end
		return h
	end,
	function()
		local c, d, e, f, g = b(3)
		local h, i, j, k = e(d.Parent.Parent.Creator), e(d.Parent.CreateAcrylic), unpack(e(d.Parent.Utils))
		local l = function(l)
			local m = {}
			l = l or 0.001
			local n, o = {
				topLeft = Vector2.new(),
				topRight = Vector2.new(),
				bottomRight = Vector2.new()
			}, i()
			o.Parent = workspace
			local p, q = function(p, q)
				n.topLeft = q
				n.topRight = q + Vector2.new(p.X, 0)
				n.bottomRight = q + p
			end, function()
				local p = game:GetService'Workspace'.CurrentCamera
				if p then
					p = p.CFrame
				end
				local q = p
				if not q then
					q = CFrame.new()
				end
				local r, s, t, u = q, n.topLeft, n.topRight, n.bottomRight
				local v, w, x = j(s, l), j(t, l), j(u, l)
				local y, z = (w - v).Magnitude, (w - x).Magnitude
				o.CFrame = CFrame.fromMatrix((v + x) / 2, r.XVector, r.YVector, r.ZVector)
				o.Mesh.Scale = Vector3.new(y, z, 0)
			end
			local r, s = function(r)
				local s = k()
				local t, u = r.AbsoluteSize - Vector2.new(s, s), r.AbsolutePosition + Vector2.new(s / 2, s / 2)
				p(t, u)
				task.spawn(q)
			end, function()
				local r = game:GetService'Workspace'.CurrentCamera
				if not r then
					return
				end
				table.insert(m, r:GetPropertyChangedSignal'CFrame':Connect(q))
				table.insert(m, r:GetPropertyChangedSignal'ViewportSize':Connect(q))
				table.insert(m, r:GetPropertyChangedSignal'FieldOfView':Connect(q))
				task.spawn(q)
			end
			o.Destroying:Connect(function()
				for t, u in m do
					pcall(function()
						u:Disconnect()
					end)
				end
			end)
			s()
			return r, o
		end
		return function(m)
			local n, o, p = {}, l(m)
			local q = h.New('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1)
			})
			h.AddSignal(q:GetPropertyChangedSignal'AbsolutePosition', function()
				o(q)
			end)
			h.AddSignal(q:GetPropertyChangedSignal'AbsoluteSize', function()
				o(q)
			end)
			n.AddParent = function(r)
				h.AddSignal(r:GetPropertyChangedSignal'Visible', function()
					n.SetVisibility(r.Visible)
				end)
			end
			n.SetVisibility = function(r)
				p.Transparency = r and 0.98 or 1
			end
			n.Frame = q
			n.Model = p
			return n
		end
	end,
	function()
		local c, d, e, f, g = b(4)
		local h, i = e(d.Parent.Parent.Creator), e(d.Parent.AcrylicBlur)
		local j = h.New
		return function(k)
			local l = {}
			l.Frame = j('Frame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0.9,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0
			}, {
				j('ImageLabel', {
					Image = 'rbxassetid://8992230677',
					ScaleType = 'Slice',
					SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(1, 120, 1, 116),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					BackgroundTransparency = 1,
					ImageColor3 = Color3.fromRGB(0, 0, 0),
					ImageTransparency = 0.7
				}),
				j('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				j('Frame', {
					BackgroundTransparency = 0.45,
					Size = UDim2.fromScale(1, 1),
					Name = 'Background',
					ThemeTag = {
						BackgroundColor3 = 'AcrylicMain'
					}
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				j('Frame', {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.4,
					Size = UDim2.fromScale(1, 1)
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					}),
					j('UIGradient', {
						Rotation = 90,
						ThemeTag = {
							Color = 'AcrylicGradient'
						}
					})
				}),
				j('ImageLabel', {
					Image = 'rbxassetid://9968344105',
					ImageTransparency = 0.98,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				j('ImageLabel', {
					Image = 'rbxassetid://9968344227',
					ImageTransparency = 0.9,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageTransparency = 'AcrylicNoise'
					}
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				j('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					}),
					j('UIStroke', {
						Transparency = 0.5,
						Thickness = 1,
						ThemeTag = {
							Color = 'AcrylicBorder'
						}
					})
				})
			})
			local m
			if e(d.Parent.Parent).UseAcrylic then
				m = i()
				m.Frame.Parent = l.Frame
				l.Model = m.Model
				l.AddParent = m.AddParent
				l.SetVisibility = m.SetVisibility
			end
			return l
		end
	end,
	function()
		local c, d, e, f, g = b(5)
		local h = d.Parent.Parent
		local i = e(h.Creator)
		local j = function()
			local j = i.New('Part', {
				Name = 'Body',
				Color = Color3.new(0, 0, 0),
				Material = Enum.Material.Glass,
				Size = Vector3.new(1, 1, 0),
				Anchored = true,
				CanCollide = false,
				Locked = true,
				CastShadow = false,
				Transparency = 0.98
			}, {
				i.New('SpecialMesh', {
					MeshType = Enum.MeshType.Brick,
					Offset = Vector3.new(0, 0, -1E-6)
				})
			})
			return j
		end
		return j
	end,
	function()
		local c, d, e, f, g = b(6)
		local h, i = function(h, i, j, k, l)
			return (h - i) * (l - k) / (j - i) + k
		end, function(h, i)
			local j = game:GetService'Workspace'.CurrentCamera:ScreenPointToRay(h.X, h.Y)
			return j.Origin + j.Direction * i
		end
		local j = function()
			local j = game:GetService'Workspace'.CurrentCamera.ViewportSize.Y
			return h(j, 0, 2560, 8, 56)
		end
		return {
			i,
			j
		}
	end,
	[8] = function()
		local c, d, e, f, g = b(8)
		return {
			Close = 'rbxassetid://9886659671',
			Min = 'rbxassetid://9886659276',
			Max = 'rbxassetid://9886659406',
			Restore = 'rbxassetid://9886659001'
		}
	end,
	[9] = function()
		local c, d, e, f, g = b(9)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l = j.New, i.Spring.new
		return function(m, n, o)
			o = o or false
			local p = {}
			p.Title = k('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			p.HoverFrame = k('Frame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ThemeTag = {
					BackgroundColor3 = 'Hover'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 4)
				})
			})
			p.Frame = k('TextButton', {
				Size = UDim2.new(0, 0, 0, 32),
				Parent = n,
				ThemeTag = {
					BackgroundColor3 = 'DialogButton'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				k('UIStroke', {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Transparency = 0.65,
					ThemeTag = {
						Color = 'DialogButtonBorder'
					}
				}),
				p.HoverFrame,
				p.Title
			})
			local q, r = j.SpringMotor(1, p.HoverFrame, 'BackgroundTransparency', o)
			j.AddSignal(p.Frame.MouseEnter, function()
				r(0.97)
			end)
			j.AddSignal(p.Frame.MouseLeave, function()
				r(1)
			end)
			j.AddSignal(p.Frame.MouseButton1Down, function()
				r(1)
			end)
			j.AddSignal(p.Frame.MouseButton1Up, function()
				r(0.97)
			end)
			return p
		end
	end,
	[10] = function()
		local c, d, e, f, g = b(10)
		local h, i, j, k = game:GetService'UserInputService', game:GetService'Players'.LocalPlayer:GetMouse(), game:GetService'Workspace'.CurrentCamera, d.Parent.Parent
		local l, m = e(k.Packages.Flipper), e(k.Creator)
		local n, o, p, q = l.Spring.new, l.Instant.new, m.New, {
			Window = nil
		}
		function q.Init(r, s)
			q.Window = s
			return q
		end
		function q.Create(r)
			local s = {
				Buttons = 0
			}
			s.TintFrame = p('TextButton', {
				Text = '',
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				Parent = q.Window.Root
			}, {
				p('UICorner', {
					CornerRadius = UDim.new(0, 8)
				})
			})
			local t, u = m.SpringMotor(1, s.TintFrame, 'BackgroundTransparency', true)
			s.ButtonHolder = p('Frame', {
				Size = UDim2.new(1, -40, 1, -40),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = 1
			}, {
				p('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			})
			s.ButtonHolderFrame = p('Frame', {
				Size = UDim2.new(1, 0, 0, 70),
				Position = UDim2.new(0, 0, 1, -70),
				ThemeTag = {
					BackgroundColor3 = 'DialogHolder'
				}
			}, {
				p('Frame', {
					Size = UDim2.new(1, 0, 0, 1),
					ThemeTag = {
						BackgroundColor3 = 'DialogHolderLine'
					}
				}),
				s.ButtonHolder
			})
			s.Title = p('TextLabel', {
				FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
				Text = 'Dialog',
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 22,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, 22),
				Position = UDim2.fromOffset(20, 25),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			s.Scale = p('UIScale', {
				Scale = 1
			})
			local v, w = m.SpringMotor(1.1, s.Scale, 'Scale')
			s.Root = p('CanvasGroup', {
				Size = UDim2.fromOffset(300, 165),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				GroupTransparency = 1,
				Parent = s.TintFrame,
				ThemeTag = {
					BackgroundColor3 = 'Dialog'
				}
			}, {
				p('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				p('UIStroke', {
					Transparency = 0.5,
					ThemeTag = {
						Color = 'DialogBorder'
					}
				}),
				s.Scale,
				s.Title,
				s.ButtonHolderFrame
			})
			local x, y = m.SpringMotor(1, s.Root, 'GroupTransparency')
			function s.Open(z)
				e(k).DialogOpen = true
				s.Scale.Scale = 1.1
				u(0.75)
				y(0)
				w(1)
			end
			function s.Close(z)
				e(k).DialogOpen = false
				u(1)
				y(1)
				w(1.1)
				s.Root.UIStroke:Destroy()
				task.wait(0.15)
				s.TintFrame:Destroy()
			end
			function s.Button(z, A, B)
				s.Buttons = s.Buttons + 1
				A = A or 'Button'
				B = B or function()
				end
				local C = e(k.Components.Button)('', s.ButtonHolder, true)
				C.Title.Text = A
				for D, E in next, s.ButtonHolder:GetChildren() do
					if E:IsA'TextButton' then
						E.Size = UDim2.new(1 / s.Buttons, -(((s.Buttons - 1) * 10) / s.Buttons), 0, 32)
					end
				end
				m.AddSignal(C.Frame.MouseButton1Click, function()
					e(k):SafeCallback(B)
					pcall(function()
						s:Close()
					end)
				end)
				return C
			end
			return s
		end
		return q
	end,
	[11] = function()
		local c, d, e, f, g = b(11)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l = j.New, i.Spring.new
		return function(m, n, o, p)
			local q = {}
			q.TitleLabel = k('TextLabel', {
				FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
				Text = m,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			q.DescLabel = k('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				Text = n,
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 14),
				ThemeTag = {
					TextColor3 = 'SubText'
				}
			})
			q.LabelHolder = k('Frame', {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(10, 0),
				Size = UDim2.new(1, -28, 0, 0)
			}, {
				k('UIListLayout', {
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				k('UIPadding', {
					PaddingBottom = UDim.new(0, 13),
					PaddingTop = UDim.new(0, 13)
				}),
				q.TitleLabel,
				q.DescLabel
			})
			q.Border = k('UIStroke', {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(0, 0, 0),
				ThemeTag = {
					Color = 'ElementBorder'
				}
			})
			q.Frame = k('TextButton', {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 0.89,
				BackgroundColor3 = Color3.fromRGB(130, 130, 130),
				Parent = o,
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = '',
				LayoutOrder = 7,
				ThemeTag = {
					BackgroundColor3 = 'Element',
					BackgroundTransparency = 'ElementTransparency'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				q.Border,
				q.LabelHolder
			})
			function q.SetTitle(r, s)
				q.TitleLabel.Text = s
			end
			function q.SetDesc(r, s)
				if s == nil then
					s = ''
				end
				if s == '' then
					q.DescLabel.Visible = false
				else
					q.DescLabel.Visible = true
				end
				q.DescLabel.Text = s
			end
			function q.Destroy(r)
				q.Frame:Destroy()
			end
			q:SetTitle(m)
			q:SetDesc(n)
			if p then
				local r, s, t = h.Themes, j.SpringMotor(j.GetThemeProperty'ElementTransparency', q.Frame, 'BackgroundTransparency', false, true)
				j.AddSignal(q.Frame.MouseEnter, function()
					t(j.GetThemeProperty'ElementTransparency' - j.GetThemeProperty'HoverChange')
				end)
				j.AddSignal(q.Frame.MouseLeave, function()
					t(j.GetThemeProperty'ElementTransparency')
				end)
				j.AddSignal(q.Frame.MouseButton1Down, function()
					t(j.GetThemeProperty'ElementTransparency' + j.GetThemeProperty'HoverChange')
				end)
				j.AddSignal(q.Frame.MouseButton1Up, function()
					t(j.GetThemeProperty'ElementTransparency' - j.GetThemeProperty'HoverChange')
				end)
			end
			return q
		end
	end,
	[12] = function()
		local c, d, e, f, g = b(12)
		local h = d.Parent.Parent
		local i, j, k = e(h.Packages.Flipper), e(h.Creator), e(h.Acrylic)
		local l, m, n, o = i.Spring.new, i.Instant.new, j.New, {}
		function o.Init(p, q)
			o.Holder = n('Frame', {
				Position = UDim2.new(1, -30, 1, -30),
				Size = UDim2.new(0, 310, 1, -30),
				AnchorPoint = Vector2.new(1, 1),
				BackgroundTransparency = 1,
				Parent = q
			}, {
				n('UIListLayout', {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					Padding = UDim.new(0, 20)
				})
			})
		end
		function o.New(p, q)
			q.Title = q.Title or 'Title'
			q.Content = q.Content or 'Content'
			q.SubContent = q.SubContent or ''
			q.Duration = q.Duration or nil
			q.Buttons = q.Buttons or {}
			local r = {
				Closed = false
			}
			r.AcrylicPaint = k.AcrylicPaint()
			r.Title = n('TextLabel', {
				Position = UDim2.new(0, 14, 0, 17),
				Text = q.Title,
				RichText = true,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextTransparency = 0,
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				TextSize = 13,
				TextXAlignment = 'Left',
				TextYAlignment = 'Center',
				Size = UDim2.new(1, -12, 0, 12),
				TextWrapped = true,
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			r.ContentLabel = n('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				Text = q.Content,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				TextWrapped = true,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			r.SubContentLabel = n('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				Text = q.SubContent,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				TextWrapped = true,
				ThemeTag = {
					TextColor3 = 'SubText'
				}
			})
			r.LabelHolder = n('Frame', {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 40),
				Size = UDim2.new(1, -28, 0, 0)
			}, {
				n('UIListLayout', {
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 3)
				}),
				r.ContentLabel,
				r.SubContentLabel
			})
			r.CloseButton = n('TextButton', {
				Text = '',
				Position = UDim2.new(1, -14, 0, 13),
				Size = UDim2.fromOffset(20, 20),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1
			}, {
				n('ImageLabel', {
					Image = e(d.Parent.Assets).Close,
					Size = UDim2.fromOffset(16, 16),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'Text'
					}
				})
			})
			r.Root = n('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.fromScale(1, 0)
			}, {
				r.AcrylicPaint.Frame,
				r.Title,
				r.CloseButton,
				r.LabelHolder
			})
			if q.Content == '' then
				r.ContentLabel.Visible = false
			end
			if q.SubContent == '' then
				r.SubContentLabel.Visible = false
			end
			r.Holder = n('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 200),
				Parent = o.Holder
			}, {
				r.Root
			})
			local s = i.GroupMotor.new{
				Scale = 1,
				Offset = 60
			}
			s:onStep(function(t)
				r.Root.Position = UDim2.new(t.Scale, t.Offset, 0, 0)
			end)
			j.AddSignal(r.CloseButton.MouseButton1Click, function()
				r:Close()
			end)
			function r.Open(t)
				local u = r.LabelHolder.AbsoluteSize.Y
				r.Holder.Size = UDim2.new(1, 0, 0, 58 + u)
				s:setGoal{
					Scale = l(0, {
						frequency = 5
					}),
					Offset = l(0, {
						frequency = 5
					})
				}
			end
			function r.Close(t)
				if not r.Closed then
					r.Closed = true
					task.spawn(function()
						s:setGoal{
							Scale = l(1, {
								frequency = 5
							}),
							Offset = l(60, {
								frequency = 5
							})
						}
						task.wait(0.4)
						if e(h).UseAcrylic then
							r.AcrylicPaint.Model:Destroy()
						end
						r.Holder:Destroy()
					end)
				end
			end
			r:Open()
			if q.Duration then
				task.delay(q.Duration, function()
					r:Close()
				end)
			end
			return r
		end
		return o
	end,
	[13] = function()
		local c, d, e, f, g = b(13)
		local h = d.Parent.Parent
		local i = e(h.Creator)
		local j = i.New
		return function(k, l)
			local m = {}
			m.Layout = j('UIListLayout', {
				Padding = UDim.new(0, 5)
			})
			m.Container = j('Frame', {
				Size = UDim2.new(1, 0, 0, 26),
				Position = UDim2.fromOffset(0, 24),
				BackgroundTransparency = 1
			}, {
				m.Layout
			})
			m.Root = j('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 26),
				LayoutOrder = 7,
				Parent = l
			}, {
				j('TextLabel', {
					RichText = true,
					Text = k,
					TextTransparency = 0,
					FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
					TextSize = 18,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.new(1, -16, 0, 18),
					Position = UDim2.fromOffset(0, 2),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				}),
				m.Container
			})
			i.AddSignal(m.Layout:GetPropertyChangedSignal'AbsoluteContentSize', function()
				m.Container.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y)
				m.Root.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y + 25)
			end)
			return m
		end
	end,
	[14] = function()
		local c, d, e, f, g = b(14)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l, m, n, o = j.New, i.Spring.new, i.Instant.new, h.Components, {
			Window = nil,
			Tabs = {},
			Containers = {},
			SelectedTab = 0,
			TabCount = 0
		}
		function o.Init(p, q)
			o.Window = q
			return o
		end
		function o.GetCurrentTabPos(p)
			local q, r = o.Window.TabHolder.AbsolutePosition.Y, o.Tabs[o.SelectedTab].Frame.AbsolutePosition.Y
			return r - q
		end
		function o.New(p, q, r, s)
			local t, u = e(h), o.Window
			local v = t.Elements
			o.TabCount = o.TabCount + 1
			local w, x = o.TabCount, {
				Selected = false,
				Name = q,
				Type = 'Tab'
			}
			
			-- Xử lý Icon cho Tab
			local iconImage = nil
			local textPosX = 12
			
			if r then
				if type(r) == "number" then
					iconImage = "rbxassetid://" .. tostring(r)
				elseif type(r) == "string" then
					if r:match("^%d+$") then
						iconImage = "rbxassetid://" .. r
					else
						local libIcon = t:GetIcon(r)
						if libIcon then
							iconImage = libIcon
						else
							iconImage = r
						end
					end
				end
				
				if iconImage then
					textPosX = 30
				end
			end
			
			x.Frame = k('TextButton', {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundTransparency = 1,
				Parent = s,
				ThemeTag = {
					BackgroundColor3 = 'Tab'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 6)
				}),
				k('TextLabel', {
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, textPosX, 0.5, 0),
					Text = q,
					RichText = true,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextTransparency = 0,
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
					TextSize = 12,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.new(1, -textPosX - 12, 1, 0),
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				}),
				iconImage and k('ImageLabel', {
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.fromOffset(16, 16),
					Position = UDim2.new(0, 8, 0.5, 0),
					BackgroundTransparency = 1,
					Image = iconImage,
					ThemeTag = {
						ImageColor3 = 'Text'
					}
				}) or nil
			})
			
			local y = k('UIListLayout', {
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			
			x.ContainerFrame = k('ScrollingFrame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Parent = u.ContainerHolder,
				Visible = false,
				BottomImage = 'rbxassetid://6889812791',
				MidImage = 'rbxassetid://6889812721',
				TopImage = 'rbxassetid://6276641225',
				ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
				ScrollBarImageTransparency = 0.95,
				ScrollBarThickness = 3,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}, {
				y,
				k('UIPadding', {
					PaddingRight = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 1),
					PaddingTop = UDim.new(0, 1),
					PaddingBottom = UDim.new(0, 1)
				})
			})
			
			j.AddSignal(y:GetPropertyChangedSignal'AbsoluteContentSize', function()
				x.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, y.AbsoluteContentSize.Y + 2)
			end)
			
			x.Motor, x.SetTransparency = j.SpringMotor(1, x.Frame, 'BackgroundTransparency')
			
			j.AddSignal(x.Frame.MouseEnter, function()
				x.SetTransparency(x.Selected and 0.85 or 0.89)
			end)
			j.AddSignal(x.Frame.MouseLeave, function()
				x.SetTransparency(x.Selected and 0.89 or 1)
			end)
			j.AddSignal(x.Frame.MouseButton1Down, function()
				x.SetTransparency(0.92)
			end)
			j.AddSignal(x.Frame.MouseButton1Up, function()
				x.SetTransparency(x.Selected and 0.85 or 0.89)
			end)
			j.AddSignal(x.Frame.MouseButton1Click, function()
				o:SelectTab(w)
			end)
			
			o.Containers[w] = x.ContainerFrame
			o.Tabs[w] = x
			x.Container = x.ContainerFrame
			x.ScrollFrame = x.Container
			
			function x.AddSection(z, A)
				local B, C = {
					Type = 'Section'
				}, e(n.Section)(A, x.Container)
				B.Container = C.Container
				B.ScrollFrame = x.Container
				setmetatable(B, v)
				return B
			end
			
			setmetatable(x, v)
			return x
		end
		
		function o.SelectTab(p, q)
			local r = o.Window
			o.SelectedTab = q
			for s, t in next, o.Tabs do
				t.SetTransparency(1)
				t.Selected = false
			end
			o.Tabs[q].SetTransparency(0.89)
			o.Tabs[q].Selected = true
			r.TabDisplay.Text = o.Tabs[q].Name
			r.SelectorPosMotor:setGoal(l(o:GetCurrentTabPos(), {
				frequency = 6
			}))
			task.spawn(function()
				r.ContainerPosMotor:setGoal(l(110, {
					frequency = 10
				}))
				r.ContainerBackMotor:setGoal(l(1, {
					frequency = 10
				}))
				task.wait(0.15)
				for u, v in next, o.Containers do
					v.Visible = false
				end
				o.Containers[q].Visible = true
				r.ContainerPosMotor:setGoal(l(94, {
					frequency = 5
				}))
				r.ContainerBackMotor:setGoal(l(0, {
					frequency = 8
				}))
			end)
		end
		
		return o
	end,
	[15] = function()
		local c, d, e, f, g = b(15)
		local h, i = game:GetService'TextService', d.Parent.Parent
		local j, k = e(i.Packages.Flipper), e(i.Creator)
		local l = k.New
		return function(m, n)
			n = n or false
			local o = {}
			o.Input = l('TextBox', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(10, 0),
				ThemeTag = {
					TextColor3 = 'Text',
					PlaceholderColor3 = 'SubText'
				}
			})
			o.Container = l('Frame', {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Position = UDim2.new(0, 6, 0, 0),
				Size = UDim2.new(1, -12, 1, 0)
			}, {
				o.Input
			})
			o.Indicator = l('Frame', {
				Size = UDim2.new(1, -4, 0, 1),
				Position = UDim2.new(0, 2, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = n and 0.5 or 0,
				ThemeTag = {
					BackgroundColor3 = n and 'InputIndicator' or 'DialogInputLine'
				}
			})
			o.Frame = l('Frame', {
				Size = UDim2.new(0, 0, 0, 30),
				BackgroundTransparency = n and 0.9 or 0,
				Parent = m,
				ThemeTag = {
					BackgroundColor3 = n and 'Input' or 'DialogInput'
				}
			}, {
				l('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				l('UIStroke', {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Transparency = n and 0.5 or 0.65,
					ThemeTag = {
						Color = n and 'InElementBorder' or 'DialogButtonBorder'
					}
				}),
				o.Indicator,
				o.Container
			})
			local p = function()
				local p, q = 2, o.Container.AbsoluteSize.X
				if not o.Input:IsFocused() or o.Input.TextBounds.X <= q - 2 * p then
					o.Input.Position = UDim2.new(0, p, 0, 0)
				else
					local r = o.Input.CursorPosition
					if r ~= -1 then
						local s = string.sub(o.Input.Text, 1, r - 1)
						local t = h:GetTextSize(s, o.Input.TextSize, o.Input.Font, Vector2.new(math.huge, math.huge)).X
						local u = o.Input.Position.X.Offset + t
						if u < p then
							o.Input.Position = UDim2.fromOffset(p - t, 0)
						elseif u > q - p - 1 then
							o.Input.Position = UDim2.fromOffset(q - t - p - 1, 0)
						end
					end
				end
			end
			task.spawn(p)
			k.AddSignal(o.Input:GetPropertyChangedSignal'Text', p)
			k.AddSignal(o.Input:GetPropertyChangedSignal'CursorPosition', p)
			k.AddSignal(o.Input.Focused, function()
				p()
				o.Indicator.Size = UDim2.new(1, -2, 0, 2)
				o.Indicator.Position = UDim2.new(0, 1, 1, 0)
				o.Indicator.BackgroundTransparency = 0
				k.OverrideTag(o.Frame, {
					BackgroundColor3 = n and 'InputFocused' or 'DialogHolder'
				})
				k.OverrideTag(o.Indicator, {
					BackgroundColor3 = 'Accent'
				})
			end)
			k.AddSignal(o.Input.FocusLost, function()
				p()
				o.Indicator.Size = UDim2.new(1, -4, 0, 1)
				o.Indicator.Position = UDim2.new(0, 2, 1, 0)
				o.Indicator.BackgroundTransparency = 0.5
				k.OverrideTag(o.Frame, {
					BackgroundColor3 = n and 'Input' or 'DialogInput'
				})
				k.OverrideTag(o.Indicator, {
					BackgroundColor3 = n and 'InputIndicator' or 'DialogInputLine'
				})
			end)
			return o
		end
	end,
	[16] = function()
		local c, d, e, f, g = b(16)
		local h, i = d.Parent.Parent, e(d.Parent.Assets)
		local j, k = e(h.Creator), e(h.Packages.Flipper)
		local l, m = j.New, j.AddSignal
		
		return function(n)
			local o, p, q = {}, e(h), function(o, p, q, r)
				local s = {
					Callback = r or function()
					end
				}
				s.Frame = l('TextButton', {
					Size = UDim2.new(0, 34, 1, -8),
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = 1,
					Parent = q,
					Position = p,
					Text = '',
					ThemeTag = {
						BackgroundColor3 = 'Text'
					}
				}, {
					l('UICorner', {
						CornerRadius = UDim.new(0, 7)
					}),
					l('ImageLabel', {
						Image = o,
						Size = UDim2.fromOffset(16, 16),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1
			if ag then
				return true, ag
			else
				return false
			end
		end
		return af
	end,
	[46] = function()
		local aa, ab, ac, ad, ae = b(46)
		return function()
		end
	end,
	[47] = function()
		local aa, ab, ac, ad, ae = b(47)
		local af = {
			Names = {
				'Dark',
				'Darker',
				'Light',
				'Aqua',
				'Amethyst',
				'Rose'
			}
		}
		for ag, ah in next, ab:GetChildren() do
			local aj = ac(ah)
			af[aj.Name] = aj
		end
		return af
	end,
	[48] = function()
		local aa, ab, ac, ad, ae = b(48)
		return {
			Name = 'Amethyst',
			Accent = Color3.fromRGB(97, 62, 167),
			AcrylicMain = Color3.fromRGB(20, 20, 20),
			AcrylicBorder = Color3.fromRGB(110, 90, 130),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
			AcrylicNoise = 0.92,
			TitleBarLine = Color3.fromRGB(95, 75, 110),
			Tab = Color3.fromRGB(160, 140, 180),
			Element = Color3.fromRGB(140, 120, 160),
			ElementBorder = Color3.fromRGB(60, 50, 70),
			InElementBorder = Color3.fromRGB(100, 90, 110),
			ElementTransparency = 0.87,
			ToggleSlider = Color3.fromRGB(140, 120, 160),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(140, 120, 160),
			DropdownFrame = Color3.fromRGB(170, 160, 200),
			DropdownHolder = Color3.fromRGB(60, 45, 80),
			DropdownBorder = Color3.fromRGB(50, 40, 65),
			DropdownOption = Color3.fromRGB(140, 120, 160),
			Keybind = Color3.fromRGB(140, 120, 160),
			Input = Color3.fromRGB(140, 120, 160),
			InputFocused = Color3.fromRGB(20, 10, 30),
			InputIndicator = Color3.fromRGB(170, 150, 190),
			Dialog = Color3.fromRGB(60, 45, 80),
			DialogHolder = Color3.fromRGB(45, 30, 65),
			DialogHolderLine = Color3.fromRGB(40, 25, 60),
			DialogButton = Color3.fromRGB(60, 45, 80),
			DialogButtonBorder = Color3.fromRGB(95, 80, 110),
			DialogBorder = Color3.fromRGB(85, 70, 100),
			DialogInput = Color3.fromRGB(70, 55, 85),
			DialogInputLine = Color3.fromRGB(175, 160, 190),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(140, 120, 160),
			HoverChange = 0.04
		}
	end,
	[49] = function()
		local aa, ab, ac, ad, ae = b(49)
		return {
			Name = 'Aqua',
			Accent = Color3.fromRGB(60, 165, 165),
			AcrylicMain = Color3.fromRGB(20, 20, 20),
			AcrylicBorder = Color3.fromRGB(50, 100, 100),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
			AcrylicNoise = 0.92,
			TitleBarLine = Color3.fromRGB(60, 120, 120),
			Tab = Color3.fromRGB(140, 180, 180),
			Element = Color3.fromRGB(110, 160, 160),
			ElementBorder = Color3.fromRGB(40, 70, 70),
			InElementBorder = Color3.fromRGB(80, 110, 110),
			ElementTransparency = 0.84,
			ToggleSlider = Color3.fromRGB(110, 160, 160),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(110, 160, 160),
			DropdownFrame = Color3.fromRGB(160, 200, 200),
			DropdownHolder = Color3.fromRGB(40, 80, 80),
			DropdownBorder = Color3.fromRGB(40, 65, 65),
			DropdownOption = Color3.fromRGB(110, 160, 160),
			Keybind = Color3.fromRGB(110, 160, 160),
			Input = Color3.fromRGB(110, 160, 160),
			InputFocused = Color3.fromRGB(20, 10, 30),
			InputIndicator = Color3.fromRGB(130, 170, 170),
			Dialog = Color3.fromRGB(40, 80, 80),
			DialogHolder = Color3.fromRGB(30, 60, 60),
			DialogHolderLine = Color3.fromRGB(25, 50, 50),
			DialogButton = Color3.fromRGB(40, 80, 80),
			DialogButtonBorder = Color3.fromRGB(80, 110, 110),
			DialogBorder = Color3.fromRGB(50, 100, 100),
			DialogInput = Color3.fromRGB(45, 90, 90),
			DialogInputLine = Color3.fromRGB(130, 170, 170),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(110, 160, 160),
			HoverChange = 0.04
		}
	end,
	[50] = function()
		local aa, ab, ac, ad, ae = b(50)
		return {
			Name = 'Dark',
			Accent = Color3.fromRGB(96, 205, 255),
			AcrylicMain = Color3.fromRGB(60, 60, 60),
			AcrylicBorder = Color3.fromRGB(90, 90, 90),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
			AcrylicNoise = 0.9,
			TitleBarLine = Color3.fromRGB(75, 75, 75),
			Tab = Color3.fromRGB(120, 120, 120),
			Element = Color3.fromRGB(120, 120, 120),
			ElementBorder = Color3.fromRGB(35, 35, 35),
			InElementBorder = Color3.fromRGB(90, 90, 90),
			ElementTransparency = 0.87,
			ToggleSlider = Color3.fromRGB(120, 120, 120),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(120, 120, 120),
			DropdownFrame = Color3.fromRGB(160, 160, 160),
			DropdownHolder = Color3.fromRGB(45, 45, 45),
			DropdownBorder = Color3.fromRGB(35, 35, 35),
			DropdownOption = Color3.fromRGB(120, 120, 120),
			Keybind = Color3.fromRGB(120, 120, 120),
			Input = Color3.fromRGB(160, 160, 160),
			InputFocused = Color3.fromRGB(10, 10, 10),
			InputIndicator = Color3.fromRGB(150, 150, 150),
			Dialog = Color3.fromRGB(45, 45, 45),
			DialogHolder = Color3.fromRGB(35, 35, 35),
			DialogHolderLine = Color3.fromRGB(30, 30, 30),
			DialogButton = Color3.fromRGB(45, 45, 45),
			DialogButtonBorder = Color3.fromRGB(80, 80, 80),
			DialogBorder = Color3.fromRGB(70, 70, 70),
			DialogInput = Color3.fromRGB(55, 55, 55),
			DialogInputLine = Color3.fromRGB(160, 160, 160),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(120, 120, 120),
			HoverChange = 0.07
		}
	end,
	[51] = function()
		local aa, ab, ac, ad, ae = b(51)
		return {
			Name = 'Darker',
			Accent = Color3.fromRGB(72, 138, 182),
			AcrylicMain = Color3.fromRGB(30, 30, 30),
			AcrylicBorder = Color3.fromRGB(60, 60, 60),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
			AcrylicNoise = 0.94,
			TitleBarLine = Color3.fromRGB(65, 65, 65),
			Tab = Color3.fromRGB(100, 100, 100),
			Element = Color3.fromRGB(70, 70, 70),
			ElementBorder = Color3.fromRGB(25, 25, 25),
			InElementBorder = Color3.fromRGB(55, 55, 55),
			ElementTransparency = 0.82,
			DropdownFrame = Color3.fromRGB(120, 120, 120),
			DropdownHolder = Color3.fromRGB(35, 35, 35),
			DropdownBorder = Color3.fromRGB(25, 25, 25),
			Dialog = Color3.fromRGB(35, 35, 35),
			DialogHolder = Color3.fromRGB(25, 25, 25),
			DialogHolderLine = Color3.fromRGB(20, 20, 20),
			DialogButton = Color3.fromRGB(35, 35, 35),
			DialogButtonBorder = Color3.fromRGB(55, 55, 55),
			DialogBorder = Color3.fromRGB(50, 50, 50),
			DialogInput = Color3.fromRGB(45, 45, 45),
			DialogInputLine = Color3.fromRGB(120, 120, 120)
		}
	end,
	[52] = function()
		local aa, ab, ac, ad, ae = b(52)
		return {
			Name = 'Light',
			Accent = Color3.fromRGB(0, 103, 192),
			AcrylicMain = Color3.fromRGB(200, 200, 200),
			AcrylicBorder = Color3.fromRGB(120, 120, 120),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
			AcrylicNoise = 0.96,
			TitleBarLine = Color3.fromRGB(160, 160, 160),
			Tab = Color3.fromRGB(90, 90, 90),
			Element = Color3.fromRGB(255, 255, 255),
			ElementBorder = Color3.fromRGB(180, 180, 180),
			InElementBorder = Color3.fromRGB(150, 150, 150),
			ElementTransparency = 0.65,
			ToggleSlider = Color3.fromRGB(40, 40, 40),
			ToggleToggled = Color3.fromRGB(255, 255, 255),
			SliderRail = Color3.fromRGB(40, 40, 40),
			DropdownFrame = Color3.fromRGB(200, 200, 200),
			DropdownHolder = Color3.fromRGB(240, 240, 240),
			DropdownBorder = Color3.fromRGB(200, 200, 200),
			DropdownOption = Color3.fromRGB(150, 150, 150),
			Keybind = Color3.fromRGB(120, 120, 120),
			Input = Color3.fromRGB(200, 200, 200),
			InputFocused = Color3.fromRGB(100, 100, 100),
			InputIndicator = Color3.fromRGB(80, 80, 80),
			Dialog = Color3.fromRGB(255, 255, 255),
			DialogHolder = Color3.fromRGB(240, 240, 240),
			DialogHolderLine = Color3.fromRGB(228, 228, 228),
			DialogButton = Color3.fromRGB(255, 255, 255),
			DialogButtonBorder = Color3.fromRGB(190, 190, 190),
			DialogBorder = Color3.fromRGB(140, 140, 140),
			DialogInput = Color3.fromRGB(250, 250, 250),
			DialogInputLine = Color3.fromRGB(160, 160, 160),
			Text = Color3.fromRGB(0, 0, 0),
			SubText = Color3.fromRGB(40, 40, 40),
			Hover = Color3.fromRGB(50, 50, 50),
			HoverChange = 0.16
		}
	end,
	[53] = function()
		local aa, ab, ac, ad, ae = b(53)
		return {
			Name = 'Rose',
			Accent = Color3.fromRGB(180, 55, 90),
			AcrylicMain = Color3.fromRGB(40, 40, 40),
			AcrylicBorder = Color3.fromRGB(130, 90, 110),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(190, 60, 135), Color3.fromRGB(165, 50, 70)),
			AcrylicNoise = 0.92,
			TitleBarLine = Color3.fromRGB(140, 85, 105),
			Tab = Color3.fromRGB(180, 140, 160),
			Element = Color3.fromRGB(200, 120, 170),
			ElementBorder = Color3.fromRGB(110, 70, 85),
			InElementBorder = Color3.fromRGB(120, 90, 90),
			ElementTransparency = 0.86,
			ToggleSlider = Color3.fromRGB(200, 120, 170),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(200, 120, 170),
			DropdownFrame = Color3.fromRGB(200, 160, 180),
			DropdownHolder = Color3.fromRGB(120, 50, 75),
			DropdownBorder = Color3.fromRGB(90, 40, 55),
			DropdownOption = Color3.fromRGB(200, 120, 170),
			Keybind = Color3.fromRGB(200, 120, 170),
			Input = Color3.fromRGB(200, 120, 170),
			InputFocused = Color3.fromRGB(20, 10, 30),
			InputIndicator = Color3.fromRGB(170, 150, 190),
			Dialog = Color3.fromRGB(120, 50, 75),
			DialogHolder = Color3.fromRGB(95, 40, 60),
			DialogHolderLine = Color3.fromRGB(90, 35, 55),
			DialogButton = Color3.fromRGB(120, 50, 75),
			DialogButtonBorder = Color3.fromRGB(155, 90, 115),
			DialogBorder = Color3.fromRGB(100, 70, 90),
			DialogInput = Color3.fromRGB(135, 55, 80),
			DialogInputLine = Color3.fromRGB(190, 160, 180),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(200, 120, 170),
			HoverChange = 0.04
		}
	end
}
do
	local ab, ac, ad, ae, af, ag, ah, aj, c, e, f, g, h, i, j, k = task, setmetatable, error, newproxy, getmetatable, next, table, unpack, coroutine, script, type, require, pcall, getfenv, setfenv, rawget
	local l, m, n, o, p, s, t, u, v, w, x = ah.insert, ah.remove, ah.freeze or function(l)
		return l
	end, ab and ab.defer or function(l, ...)
		local m = c.create(l)
		c.resume(m, ...)
		return m
	end, '0.0.0-venv', {}, {				local C = e(t.Dialog):Create()
				C.Title.Text = z.Title
				C.Root.Size = UDim2.fromOffset(430, 330)
				local D, E, F, G, H, I = z.Hue, z.Sat, z.Vib, z.Transparency, function()
					local D = e(t.Textbox)()
					D.Frame.Parent = C.Root
					D.Frame.Size = UDim2.new(0, 90, 0, 32)
					return D
				end, function(D, E)
					return s('TextLabel', {
						FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
						Text = D,
						TextColor3 = Color3.fromRGB(240, 240, 240),
						TextSize = 13,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, 0, 0, 32),
						Position = E,
						BackgroundTransparency = 1,
						Parent = C.Root,
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
				end
				local J, K = function()
					local J = Color3.fromHSV(D, E, F)
					return {
						R = math.floor(J.r * 255),
						G = math.floor(J.g * 255),
						B = math.floor(J.b * 255)
					}
				end, s('ImageLabel', {
					Size = UDim2.new(0, 18, 0, 18),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = 'http://www.roblox.com/asset/?id=4805639000'
				})
				local L, M = s('ImageLabel', {
					Size = UDim2.fromOffset(180, 160),
					Position = UDim2.fromOffset(20, 55),
					Image = 'rbxassetid://4155801252',
					BackgroundColor3 = z.Value,
					BackgroundTransparency = 0,
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					K
				}), s('Frame', {
					BackgroundColor3 = z.Value,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = z.Transparency
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					})
				})
				local N, O = s('ImageLabel', {
					Image = 'http://www.roblox.com/asset/?id=14204231522',
					ImageTransparency = 0.45,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.fromOffset(40, 40),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(112, 220),
					Size = UDim2.fromOffset(88, 24),
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					s('UIStroke', {
						Thickness = 2,
						Transparency = 0.75
					}),
					M
				}), s('Frame', {
					BackgroundColor3 = z.Value,
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 0
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					})
				})
				local P, Q = s('ImageLabel', {
					Image = 'http://www.roblox.com/asset/?id=14204231522',
					ImageTransparency = 0.45,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.fromOffset(40, 40),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(20, 220),
					Size = UDim2.fromOffset(88, 24),
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					s('UIStroke', {
						Thickness = 2,
						Transparency = 0.75
					}),
					O
				}), {}
				for R = 0, 1, 0.1 do
					table.insert(Q, ColorSequenceKeypoint.new(R, Color3.fromHSV(R, 1, 1)))
				end
				local R, S = s('UIGradient', {
					Color = ColorSequence.new(Q),
					Rotation = 90
				}), s('Frame', {
					Size = UDim2.new(1, 0, 1, -10),
					Position = UDim2.fromOffset(0, 5),
					BackgroundTransparency = 1
				})
				local T, U, V = s('ImageLabel', {
					Size = UDim2.fromOffset(14, 14),
					Image = 'http://www.roblox.com/asset/?id=12266946128',
					Parent = S,
					ThemeTag = {
						ImageColor3 = 'DialogInput'
					}
				}), s('Frame', {
					Size = UDim2.fromOffset(12, 190),
					Position = UDim2.fromOffset(210, 55),
					Parent = C.Root
				}, {
					s('UICorner', {
						CornerRadius = UDim.new(1, 0)
					}),
					R,
					S
				}), H()
				V.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 55)
				I('Hex', UDim2.fromOffset(x.Transparency and 360 or 340, 55))
				local W = H()
				W.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 95)
				I('Red', UDim2.fromOffset(x.Transparency and 360 or 340, 95))
				local X = H()
				X.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 135)
				I('Green', UDim2.fromOffset(x.Transparency and 360 or 340, 135))
				local Y = H()
				Y.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 175)
				I('Blue', UDim2.fromOffset(x.Transparency and 360 or 340, 175))
				local Z
				if x.Transparency then
					Z = H()
					Z.Frame.Position = UDim2.fromOffset(260, 215)
					I('Alpha', UDim2.fromOffset(360, 215))
				end
				local _, aa, ab
				if x.Transparency then
					local ac = s('Frame', {
						Size = UDim2.new(1, 0, 1, -10),
						Position = UDim2.fromOffset(0, 5),
						BackgroundTransparency = 1
					})
					aa = s('ImageLabel', {
						Size = UDim2.fromOffset(14, 14),
						Image = 'http://www.roblox.com/asset/?id=12266946128',
						Parent = ac,
						ThemeTag = {
							ImageColor3 = 'DialogInput'
						}
					})
					ab = s('Frame', {
						Size = UDim2.fromScale(1, 1)
					}, {
						s('UIGradient', {
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0, 0),
								NumberSequenceKeypoint.new(1, 1)
							},
							Rotation = 270
						}),
						s('UICorner', {
							CornerRadius = UDim.new(1, 0)
						})
					})
					_ = s('Frame', {
						Size = UDim2.fromOffset(12, 190),
						Position = UDim2.fromOffset(230, 55),
						Parent = C.Root,
						BackgroundTransparency = 1
					}, {
						s('UICorner', {
							CornerRadius = UDim.new(1, 0)
						}),
						s('ImageLabel', {
							Image = 'http://www.roblox.com/asset/?id=14204231522',
							ImageTransparency = 0.45,
							ScaleType = Enum.ScaleType.Tile,
							TileSize = UDim2.fromOffset(40, 40),
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							Parent = C.Root
						}, {
							s('UICorner', {
								CornerRadius = UDim.new(1, 0)
							})
						}),
						ab,
						ac
					})
				end
				local ac = function()
					L.BackgroundColor3 = Color3.fromHSV(D, 1, 1)
					T.Position = UDim2.new(0, -1, D, -6)
					K.Position = UDim2.new(E, 0, 1 - F, 0)
					O.BackgroundColor3 = Color3.fromHSV(D, E, F)
					V.Input.Text = '#' .. Color3.fromHSV(D, E, F):ToHex()
					W.Input.Text = J().R
					X.Input.Text = J().G
					Y.Input.Text = J().B
					if x.Transparency then
						ab.BackgroundColor3 = Color3.fromHSV(D, E, F)
						O.BackgroundTransparency = G
						aa.Position = UDim2.new(0, -1, 1 - G, -6)
						Z.Input.Text = e(o):Round((1 - G) * 100, 0) .. '%'
					end
				end
				p.AddSignal(V.Input.FocusLost, function(ad)
					if ad then
						local ae, af = pcall(Color3.fromHex, V.Input.Text)
						if ae and typeof(af) == 'Color3' then
							D, E, F = Color3.toHSV(af)
						end
					end
					ac()
				end)
				p.AddSignal(W.Input.FocusLost, function(ad)
					if ad then
						local ae = J()
						local af, ag = pcall(Color3.fromRGB, W.Input.Text, ae.G, ae.B)
						if af and typeof(ag) == 'Color3' then
							if tonumber(W.Input.Text) <= 255 then
								D, E, F = Color3.toHSV(ag)
							end
						end
					end
					ac()
				end)
				p.AddSignal(X.Input.FocusLost, function(ad)
					if ad then
						local ae = J()
						local af, ag = pcall(Color3.fromRGB, ae.R, X.Input.Text, ae.B)
						if af and typeof(ag) == 'Color3' then
							if tonumber(X.Input.Text) <= 255 then
								D, E, F = Color3.toHSV(ag)
							end
						end
					end
					ac()
				end)
				p.AddSignal(Y.Input.FocusLost, function(ad)
					if ad then
						local ae = J()
						local af, ag = pcall(Color3.fromRGB, ae.R, ae.G, Y.Input.Text)
						if af and typeof(ag) == 'Color3' then
							if tonumber(Y.Input.Text) <= 255 then
								D, E, F = Color3.toHSV(ag)
							end
						end
					end
					ac()
				end)
				if x.Transparency then
					p.AddSignal(Z.Input.FocusLost, function(ad)
						if ad then
							pcall(function()
								local ae = tonumber(Z.Input.Text)
								if ae >= 0 and ae <= 100 then
									G = 1 - ae * 0.01
								end
							end)
						end
						ac()
					end)
				end
				p.AddSignal(L.InputBegan, function(ad)
					if ad.UserInputType == Enum.UserInputType.MouseButton1 or ad.UserInputType == Enum.UserInputType.Touch then
						while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local ae = L.AbsolutePosition.X
							local af = ae + L.AbsoluteSize.X
							local ag, ah = math.clamp(n.X, ae, af), L.AbsolutePosition.Y
							local ai = ah + L.AbsoluteSize.Y
							local aj = math.clamp(n.Y, ah, ai)
							E = (ag - ae) / (af - ae)
							F = 1 - ((aj - ah) / (ai - ah))
							ac()
							l:Wait()
						end
					end
				end)
				p.AddSignal(U.InputBegan, function(ad)
					if ad.UserInputType == Enum.UserInputType.MouseButton1 or ad.UserInputType == Enum.UserInputType.Touch then
						while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local ae = U.AbsolutePosition.Y
							local af = ae + U.AbsoluteSize.Y
							local ag = math.clamp(n.Y, ae, af)
							D = ((ag - ae) / (af - ae))
							ac()
							l:Wait()
						end
					end
				end)
				if x.Transparency then
					p.AddSignal(_.InputBegan, function(ad)
						if ad.UserInputType == Enum.UserInputType.MouseButton1 then
							while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								local ae = _.AbsolutePosition.Y
								local af = ae + _.AbsoluteSize.Y
								local ag = math.clamp(n.Y, ae, af)
								G = 1 - ((ag - ae) / (af - ae))
								ac()
								l:Wait()
							end
						end
					end)
				end
				ac()
				C:Button('Done', function()
					z:SetValue({
						D,
						E,
						F
					}, G)
				end)
				C:Button'Cancel'
				C:Open()
			end
			function z.Display(ac)
				z.Value = Color3.fromHSV(z.Hue, z.Sat, z.Vib)
				B.BackgroundColor3 = z.Value
				B.BackgroundTransparency = z.Transparency
				u.Library:SafeCallback(z.Callback, z.Value)
				u.Library:SafeCallback(z.Changed, z.Value)
			end
			function z.SetValue(ac, ad, ae)
				local af = Color3.fromHSV(ad[1], ad[2], ad[3])
				z.Transparency = ae or 0
				z:SetHSVFromRGB(af)
				z:Display()
			end
			function z.SetValueRGB(ac, ad, ae)
				z.Transparency = ae or 0
				z:SetHSVFromRGB(ad)
				z:Display()
			end
			function z.OnChanged(ac, ad)
				z.Changed = ad
				ad(z.Value)
			end
			function z.Destroy(ac)
				A:Destroy()
				y.Options[w] = nil
			end
			p.AddSignal(A.Frame.MouseButton1Click, function()
				ab()
			end)
			z:Display()
			y.Options[w] = z
			return z
		end
		return u
	end,
	[22] = function()
		local aa, ab, ac, ad, ae = b(22)
		local af, ag, ah, ai, aj = game:GetService'TweenService', game:GetService'UserInputService', game:GetService'Players'.LocalPlayer:GetMouse(), game:GetService'Workspace'.CurrentCamera, ab.Parent.Parent
		local c, d = ac(aj.Creator), ac(aj.Packages.Flipper)
		local e, f, g = c.New, aj.Components, {}
		g.__index = g
		g.__type = 'Dropdown'
		function g.New(h, i, j)
			local k, l, m = h.Library, {
				Values = j.Values,
				Value = j.Default,
				Multi = j.Multi,
				Buttons = {},
				Opened = false,
				Type = 'Dropdown',
				Callback = j.Callback or function()
				end
			}, ac(f.Element)(j.Title, j.Description, h.Container, false)
			m.DescLabel.Size = UDim2.new(1, -170, 0, 14)
			l.SetTitle = m.SetTitle
			l.SetDesc = m.SetDesc
			local n, o = e('TextLabel', {
				FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				Text = 'Value',
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, -30, 0, 14),
				Position = UDim2.new(0, 8, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), e('ImageLabel', {
				Image = 'rbxassetid://10709790948',
				Size = UDim2.fromOffset(16, 16),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -8, 0.5, 0),
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = 'SubText'
				}
			})
			local p, s = e('TextButton', {
				Size = UDim2.fromOffset(160, 30),
				Position = UDim2.new(1, -10, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 0.9,
				Parent = m.Frame,
				ThemeTag = {
					BackgroundColor3 = 'DropdownFrame'
				}
			}, {
				e('UICorner', {
					CornerRadius = UDim.new(0, 5)
				}),
				e('UIStroke', {
					Transparency = 0.5,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					ThemeTag = {
						Color = 'InElementBorder'
					}
				}),
				o,
				n
			}), e('UIListLayout', {
				Padding = UDim.new(0, 3)
			})
			local t = e('ScrollingFrame', {
				Size = UDim2.new(1, -5, 1, -10),
				Position = UDim2.fromOffset(5, 5),
				BackgroundTransparency = 1,
				BottomImage = 'rbxassetid://6889812791',
				MidImage = 'rbxassetid://6889812721',
				TopImage = 'rbxassetid://6276641225',
				ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
				ScrollBarImageTransparency = 0.95,
				ScrollBarThickness = 4,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0)
			}, {
				s
			})
			local u = e('Frame', {
				Size = UDim2.fromScale(1, 0.6),
				ThemeTag = {
					BackgroundColor3 = 'DropdownHolder'
				}
			}, {
				t,
				e('UICorner', {
					CornerRadius = UDim.new(0, 7)
				}),
				e('UIStroke', {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					ThemeTag = {
						Color = 'DropdownBorder'
					}
				}),
				e('ImageLabel', {
					BackgroundTransparency = 1,
					Image = 'http://www.roblox.com/asset/?id=5554236805',
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(23, 23, 277, 277),
					Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
					Position = UDim2.fromOffset(-15, -15),
					ImageColor3 = Color3.fromRGB(0, 0, 0),
					ImageTransparency = 0.1
				})
			})
			local v = e('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(170, 300),
				Parent = h.Library.GUI,
				Visible = false
			}, {
				u,
				e('UISizeConstraint', {
					MinSize = Vector2.new(170, 0)
				})
			})
			table.insert(k.OpenFrames, v)
			local w, x = function()
				local w = 0
				if ai.ViewportSize.Y - p.AbsolutePosition.Y < v.AbsoluteSize.Y - 5 then
					w = v.AbsoluteSize.Y - 5 - (ai.ViewportSize.Y - p.AbsolutePosition.Y) + 40
				end
				v.Position = UDim2.fromOffset(p.AbsolutePosition.X - 1, p.AbsolutePosition.Y - 5 - w)
			end, 0
			local y, z = function()
				if #l.Values > 10 then
					v.Size = UDim2.fromOffset(x, 392)
				else
					v.Size = UDim2.fromOffset(x, s.AbsoluteContentSize.Y + 10)
				end
			end, function()
				t.CanvasSize = UDim2.fromOffset(0, s.AbsoluteContentSize.Y)
			end
			w()
			y()
			c.AddSignal(p:GetPropertyChangedSignal'AbsolutePosition', w)
			c.AddSignal(p.MouseButton1Click, function()
				l:Open()
			end)
			c.AddSignal(ag.InputBegan, function(A)
				if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
					local B, C = u.AbsolutePosition, u.AbsoluteSize
					if ah.X < B.X or ah.X > B.X + C.X or ah.Y < (B.Y - 20 - 1) or ah.Y > B.Y + C.Y then
						l:Close()
					end
				end
			end)
			local A = h.ScrollFrame
			function l.Open(B)
				l.Opened = true
				A.ScrollingEnabled = false
				v.Visible = true
				af:Create(u, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Size = UDim2.fromScale(1, 1)
				}):Play()
			end
			function l.Close(B)
				l.Opened = false
				A.ScrollingEnabled = true
				u.Size = UDim2.fromScale(1, 0.6)
				v.Visible = false
			end
			function l.Display(B)
				local C, D = l.Values, ''
				if j.Multi then
					for E, F in next, C do
						if l.Value[F] then
							D = D .. F .. ', '
						end
					end
					D = D:sub(1, #D - 2)
				else
					D = l.Value or ''
				end
				n.Text = (D == '' and '--' or D)
			end
			function l.GetActiveValues(B)
				if j.Multi then
					local C = {}
					for D, E in next, l.Value do
						table.insert(C, D)
					end
					return C
				else
					return l.Value and 1 or 0
				end
			end
			function l.BuildDropdownList(B)
				local C, D = l.Values, {}
				for E, F in next, t:GetChildren() do
					if not F:IsA'UIListLayout' then
						F:Destroy()
					end
				end
				local G = 0
				for H, I in next, C do
					local J = {}
					G = G + 1
					local K, L = e('Frame', {
						Size = UDim2.fromOffset(4, 14),
						BackgroundColor3 = Color3.fromRGB(76, 194, 255),
						Position = UDim2.fromOffset(-1, 16),
						AnchorPoint = Vector2.new(0, 0.5),
						ThemeTag = {
							BackgroundColor3 = 'Accent'
						}
					}, {
						e('UICorner', {
							CornerRadius = UDim.new(0, 2)
						})
					}), e('TextLabel', {
						FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
						Text = I,
						TextColor3 = Color3.fromRGB(200, 200, 200),
						TextSize = 13,
						TextXAlignment = Enum.TextXAlignment.Left,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Position = UDim2.fromOffset(10, 0),
						Name = 'ButtonLabel',
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
					local M, N = (e('TextButton', {
						Size = UDim2.new(1, -5, 0, 32),
						BackgroundTransparency = 1,
						ZIndex = 23,
						Text = '',
						Parent = t,
						ThemeTag = {
							BackgroundColor3 = 'DropdownOption'
						}
					}, {
						K,
						L,
						e('UICorner', {
							CornerRadius = UDim.new(0, 6)
						})
					}))
					if j.Multi then
						N = l.Value[I]
					else
						N = l.Value == I
					end
					local O, P = c.SpringMotor(1, M, 'BackgroundTransparency')
					local Q, R = c.SpringMotor(1, K, 'BackgroundTransparency')
					local S = d.SingleMotor.new(6)
					S:onStep(function(T)
						K.Size = UDim2.new(0, 4, 0, T)
					end)
					c.AddSignal(M.MouseEnter, function()
						P(N and 0.85 or 0.89)
					end)
					c.AddSignal(M.MouseLeave, function()
						P(N and 0.89 or 1)
					end)
					c.AddSignal(M.MouseButton1Down, function()
						P(0.92)
					end)
					c.AddSignal(M.MouseButton1Up, function()
						P(N and 0.85 or 0.89)
					end)
					function J.UpdateButton(T)
						if j.Multi then
							N = l.Value[I]
							if N then
								P(0.89)
							end
						else
							N = l.Value == I
							P(N and 0.89 or 1)
						end
						S:setGoal(d.Spring.new(N and 14 or 6, {
							frequency = 6
						}))
						R(N and 0 or 1)
					end
					L.InputBegan:Connect(function(T)
						if T.UserInputType == Enum.UserInputType.MouseButton1 or T.UserInputType == Enum.UserInputType.Touch then
							local U = not N
							if l:GetActiveValues() == 1 and not U and not j.AllowNull then
							else
								if j.Multi then
									N = U
									l.Value[I] = N and true or nil
								else
									N = U
									l.Value = N and I or nil
									for V, W in next, D do
										W:UpdateButton()
									end
								end
								J:UpdateButton()
								l:Display()
								k:SafeCallback(l.Callback, l.Value)
								k:SafeCallback(l.Changed, l.Value)
							end
						end
					end)
					J:UpdateButton()
					l:Display()
					D[M] = J
				end
				x = 0
				for J, K in next, D do
					if J.ButtonLabel then
						if J.ButtonLabel.TextBounds.X > x then
							x = J.ButtonLabel.TextBounds.X
						end
					end
				end
				x = x + 30
				z()
				y()
			end
			function l.SetValues(B, C)
				if C then
					l.Values = C
				end
				l:BuildDropdownList()
			end
			function l.OnChanged(B, C)
				l.Changed = C
				C(l.Value)
			end
			function l.SetValue(B, C)
				if l.Multi then
					local D = {}
					for E, F in next, C do
						if table.find(l.Values, E) then
							D[E] = true
						end
					end
					l.Value = D
				else
					if not C then
						l.Value = nil
					elseif table.find(l.Values, C) then
						l		return l
	end,
	[21] = function()
		local c, d, e, f, g = b(21)
		local h, i, j, k = game:GetService'UserInputService', game:GetService'TouchInputService', game:GetService'RunService', game:GetService'Players'
		local l, m = j.RenderStepped, k.LocalPlayer
		local n, o = m:GetMouse(), d.Parent.Parent
		local p = e(o.Creator)
		local s, t, u = p.New, o.Components, {}
		u.__index = u
		u.__type = 'Colorpicker'
		function u.New(v, w, x)
			local y = v.Library
			assert(x.Title, 'Colorpicker - Missing Title')
			assert(x.Default, 'AddColorPicker: Missing default value.')
			local z = {
				Value = x.Default,
				Transparency = x.Transparency or 0,
				Type = 'Colorpicker',
				Title = type(x.Title) == 'string' and x.Title or 'Colorpicker',
				Callback = x.Callback or function(z)
				end
			}
			function z.SetHSVFromRGB(A, B)
				local C, D, E = Color3.toHSV(B)
				z.Hue = C
				z.Sat = D
				z.Vib = E
			end
			z:SetHSVFromRGB(z.Value)
			local A = e(t.Element)(x.Title, x.Description, v.Container, true)
			z.SetTitle = A.SetTitle
			z.SetDesc = A.SetDesc
			local B = s('Frame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = z.Value,
				Parent = A.Frame
			}, {
				s('UICorner', {
					CornerRadius = UDim.new(0, 4)
				})
			})
			local aa, ab = s('ImageLabel', {
				Size = UDim2.fromOffset(26, 26),
				Position = UDim2.new(1, -10, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Parent = A.Frame,
				Image = 'http://www.roblox.com/asset/?id=14204231522',
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40)
			}, {
				s('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				B
			}), function()
				local C = e(t.Dialog):Create()-- SeaMinhUI Library - Full Code
-- Hỗ trợ Icon linh hoạt cho Window và Tab

local a, b = {
	{
		1,
		'ModuleScript',
		{
			'MainModule'
		},
		{
			{
				18,
				'ModuleScript',
				{
					'Creator'
				}
			},
			{
				28,
				'ModuleScript',
				{
					'Icons'
				}
			},
			{
				47,
				'ModuleScript',
				{
					'Themes'
				},
				{
					{
						50,
						'ModuleScript',
						{
							'Dark'
						}
					},
					{
						52,
						'ModuleScript',
						{
							'Light'
						}
					},
					{
						51,
						'ModuleScript',
						{
							'Darker'
						}
					},
					{
						53,
						'ModuleScript',
						{
							'Rose'
						}
					},
					{
						49,
						'ModuleScript',
						{
							'Aqua'
						}
					},
					{
						48,
						'ModuleScript',
						{
							'Amethyst'
						}
					}
				}
			},
			{
				19,
				'ModuleScript',
				{
					'Elements'
				},
				{
					{
						21,
						'ModuleScript',
						{
							'Colorpicker'
						}
					},
					{
						27,
						'ModuleScript',
						{
							'Toggle'
						}
					},
					{
						23,
						'ModuleScript',
						{
							'Input'
						}
					},
					{
						20,
						'ModuleScript',
						{
							'Button'
						}
					},
					{
						25,
						'ModuleScript',
						{
							'Paragraph'
						}
					},
					{
						22,
						'ModuleScript',
						{
							'Dropdown'
						}
					},
					{
						26,
						'ModuleScript',
						{
							'Slider'
						}
					},
					{
						24,
						'ModuleScript',
						{
							'Keybind'
						}
					}
				}
			},
			{
				29,
				'Folder',
				{
					'Packages'
				},
				{
					{
						30,
						'ModuleScript',
						{
							'Flipper'
						},
						{
							{
								33,
								'ModuleScript',
								{
									'GroupMotor'
								}
							},
							{
								46,
								'ModuleScript',
								{
									'isMotor.spec'
								}
							},
							{
								39,
								'ModuleScript',
								{
									'Signal'
								}
							},
							{
								40,
								'ModuleScript',
								{
									'Signal.spec'
								}
							},
							{
								45,
								'ModuleScript',
								{
									'isMotor'
								}
							},
							{
								36,
								'ModuleScript',
								{
									'Instant.spec'
								}
							},
							{
								44,
								'ModuleScript',
								{
									'Spring.spec'
								}
							},
							{
								42,
								'ModuleScript',
								{
									'SingleMotor.spec'
								}
							},
							{
								38,
								'ModuleScript',
								{
									'Linear.spec'
								}
							},
							{
								31,
								'ModuleScript',
								{
									'BaseMotor'
								}
							},
							{
								43,
								'ModuleScript',
								{
									'Spring'
								}
							},
							{
								35,
								'ModuleScript',
								{
									'Instant'
								}
							},
							{
								37,
								'ModuleScript',
								{
									'Linear'
								}
							},
							{
								41,
								'ModuleScript',
								{
									'SingleMotor'
								}
							},
							{
								34,
								'ModuleScript',
								{
									'GroupMotor.spec'
								}
							},
							{
								32,
								'ModuleScript',
								{
									'BaseMotor.spec'
								}
							}
						}
					}
				}
			},
			{
				2,
				'ModuleScript',
				{
					'Acrylic'
				},
				{
					{
						3,
						'ModuleScript',
						{
							'AcrylicBlur'
						}
					},
					{
						5,
						'ModuleScript',
						{
							'CreateAcrylic'
						}
					},
					{
						6,
						'ModuleScript',
						{
							'Utils'
						}
					},
					{
						4,
						'ModuleScript',
						{
							'AcrylicPaint'
						}
					}
				}
			},
			{
				7,
				'Folder',
				{
					'Components'
				},
				{
					{
						9,
						'ModuleScript',
						{
							'Button'
						}
					},
					{
						12,
						'ModuleScript',
						{
							'Notification'
						}
					},
					{
						13,
						'ModuleScript',
						{
							'Section'
						}
					},
					{
						17,
						'ModuleScript',
						{
							'Window'
						}
					},
					{
						14,
						'ModuleScript',
						{
							'Tab'
						}
					},
					{
						10,
						'ModuleScript',
						{
							'Dialog'
						}
					},
					{
						8,
						'ModuleScript',
						{
							'Assets'
						}
					},
					{
						16,
						'ModuleScript',
						{
							'TitleBar'
						}
					},
					{
						15,
						'ModuleScript',
						{
							'Textbox'
						}
					},
					{
						11,
						'ModuleScript',
						{
							'Element'
						}
					}
				}
			}
		}
	}
}
local aa = {
	function()
		local c, d, e, f, g = b(1)
		local h, i, j, k, l, m = game:GetService'Lighting', game:GetService'RunService', game:GetService'Players'.LocalPlayer, game:GetService'UserInputService', game:GetService'TweenService', game:GetService'Workspace'.CurrentCamera
		local n, o = j:GetMouse(), d
		local p, q, r, s = e(o.Creator), e(o.Elements), e(o.Acrylic), o.Components
		local t, u, v = e(s.Notification), p.New, protectgui or (syn and syn.protect_gui) or function()
		end
		local w = u('ScreenGui', {
			Parent = i:IsStudio() and j.PlayerGui or game:GetService'CoreGui'
		})
		v(w)
		t:Init(w)
		local x = {
			Version = '1.0.0',
			Name = 'SeaMinhUI',
			OpenFrames = {},
			Options = {},
			Themes = e(o.Themes).Names,
			Window = nil,
			WindowFrame = nil,
			Unloaded = false,
			Theme = 'Dark',
			DialogOpen = false,
			UseAcrylic = false,
			Acrylic = false,
			Transparency = true,
			MinimizeKeybind = nil,
			MinimizeKey = Enum.KeyCode.LeftControl,
			GUI = w
		}
		function x.SafeCallback(y, z, ...)
			if not z then
				return
			end
			local A, B = pcall(z, ...)
			if not A then
				local C, D = B:find':%d+: '
				if not D then
					return x:Notify{
						Title = 'SeaMinhUI',
						Content = 'Callback error',
						SubContent = B,
						Duration = 5
					}
				end
				return x:Notify{
					Title = 'SeaMinhUI',
					Content = 'Callback error',
					SubContent = B:sub(D + 1),
					Duration = 5
				}
			end
		end
		function x.Round(y, z, A)
			if A == 0 then
				return math.floor(z)
			end
			z = tostring(z)
			return z:find'%.' and tonumber(z:sub(1, z:find'%.' + A)) or z
		end
		local y = e(o.Icons).assets
		function x.GetIcon(z, A)
			if A ~= nil and y['lucide-' .. A] then
				return y['lucide-' .. A]
			end
			return nil
		end
		local z = {}
		z.__index = z
		z.__namecall = function(A, B, ...)
			return z[B](...)
		end
		for A, B in ipairs(q) do
			z['Add' .. B.__type] = function(C, D, E)
				B.Container = C.Container
				B.Type = C.Type
				B.ScrollFrame = C.ScrollFrame
				B.Library = x
				return B:New(D, E)
			end
		end
		x.Elements = z
		function x.CreateWindow(C, D)
			assert(D.Title, 'Window - Missing Title')
			if x.Window then
				print'You cannot create more than one window.'
				return
			end
			x.MinimizeKey = D.MinimizeKey
			x.UseAcrylic = D.Acrylic
			if D.Acrylic then
				r.init()
			end
			local E = e(s.Window){
				Parent = w,
				Size = D.Size,
				Title = D.Title,
				SubTitle = D.SubTitle,
				TabWidth = D.TabWidth,
				Icon = D.Icon
			}
			x.Window = E
			x:SetTheme(D.Theme)
			return E
		end
		function x.SetTheme(C, D)
			if x.Window and table.find(x.Themes, D) then
				x.Theme = D
				p.UpdateTheme()
			end
		end
		function x.Destroy(C)
			if x.Window then
				x.Unloaded = true
				if x.UseAcrylic then
					x.Window.AcrylicPaint.Model:Destroy()
				end
				p.Disconnect()
				x.GUI:Destroy()
			end
		end
		function x.ToggleAcrylic(C, D)
			if x.Window then
				if x.UseAcrylic then
					x.Acrylic = D
					x.Window.AcrylicPaint.Model.Transparency = D and 0.98 or 1
					if D then
						r.Enable()
					else
						r.Disable()
					end
				end
			end
		end
		function x.ToggleTransparency(C, D)
			if x.Window then
				x.Window.AcrylicPaint.Frame.Background.BackgroundTransparency = D and 0.35 or 0
			end
		end
		function x.Notify(C, D)
			return t:New(D)
		end
		if getgenv then
			getgenv().SeaMinhUI = x
			getgenv().Fluent = x
		end
		return x
	end,
	function()
		local c, d, e, f, g = b(2)
		local h = {
			AcrylicBlur = e(d.AcrylicBlur),
			CreateAcrylic = e(d.CreateAcrylic),
			AcrylicPaint = e(d.AcrylicPaint)
		}
		function h.init()
			local i = Instance.new'DepthOfFieldEffect'
			i.FarIntensity = 0
			i.InFocusRadius = 0.1
			i.NearIntensity = 1
			local j = {}
			function h.Enable()
				for k, l in pairs(j) do
					l.Enabled = false
				end
				i.Parent = game:GetService'Lighting'
			end
			function h.Disable()
				for k, l in pairs(j) do
					l.Enabled = l.enabled
				end
				i.Parent = nil
			end
			local k = function()
				local k = function(k)
					if k:IsA'DepthOfFieldEffect' then
						j[k] = {
							enabled = k.Enabled
						}
					end
				end
				for l, m in pairs(game:GetService'Lighting':GetChildren()) do
					k(m)
				end
				if game:GetService'Workspace'.CurrentCamera then
					for n, o in pairs(game:GetService'Workspace'.CurrentCamera:GetChildren()) do
						k(o)
					end
				end
			end
			k()
			h.Enable()
		end
		return h
	end,
	function()
		local c, d, e, f, g = b(3)
		local h, i, j, k = e(d.Parent.Parent.Creator), e(d.Parent.CreateAcrylic), unpack(e(d.Parent.Utils))
		local l = function(l)
			local m = {}
			l = l or 0.001
			local n, o = {
				topLeft = Vector2.new(),
				topRight = Vector2.new(),
				bottomRight = Vector2.new()
			}, i()
			o.Parent = workspace
			local p, q = function(p, q)
				n.topLeft = q
				n.topRight = q + Vector2.new(p.X, 0)
				n.bottomRight = q + p
			end, function()
				local p = game:GetService'Workspace'.CurrentCamera
				if p then
					p = p.CFrame
				end
				local q = p
				if not q then
					q = CFrame.new()
				end
				local r, s, t, u = q, n.topLeft, n.topRight, n.bottomRight
				local v, w, x = j(s, l), j(t, l), j(u, l)
				local y, z = (w - v).Magnitude, (w - x).Magnitude
				o.CFrame = CFrame.fromMatrix((v + x) / 2, r.XVector, r.YVector, r.ZVector)
				o.Mesh.Scale = Vector3.new(y, z, 0)
			end
			local r, s = function(r)
				local s = k()
				local t, u = r.AbsoluteSize - Vector2.new(s, s), r.AbsolutePosition + Vector2.new(s / 2, s / 2)
				p(t, u)
				task.spawn(q)
			end, function()
				local r = game:GetService'Workspace'.CurrentCamera
				if not r then
					return
				end
				table.insert(m, r:GetPropertyChangedSignal'CFrame':Connect(q))
				table.insert(m, r:GetPropertyChangedSignal'ViewportSize':Connect(q))
				table.insert(m, r:GetPropertyChangedSignal'FieldOfView':Connect(q))
				task.spawn(q)
			end
			o.Destroying:Connect(function()
				for t, u in m do
					pcall(function()
						u:Disconnect()
					end)
				end
			end)
			s()
			return r, o
		end
		return function(m)
			local n, o, p = {}, l(m)
			local q = h.New('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1)
			})
			h.AddSignal(q:GetPropertyChangedSignal'AbsolutePosition', function()
				o(q)
			end)
			h.AddSignal(q:GetPropertyChangedSignal'AbsoluteSize', function()
				o(q)
			end)
			n.AddParent = function(r)
				h.AddSignal(r:GetPropertyChangedSignal'Visible', function()
					n.SetVisibility(r.Visible)
				end)
			end
			n.SetVisibility = function(r)
				p.Transparency = r and 0.98 or 1
			end
			n.Frame = q
			n.Model = p
			return n
		end
	end,
	function()
		local c, d, e, f, g = b(4)
		local h, i = e(d.Parent.Parent.Creator), e(d.Parent.AcrylicBlur)
		local j = h.New
		return function(k)
			local l = {}
			l.Frame = j('Frame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0.9,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0
			}, {
				j('ImageLabel', {
					Image = 'rbxassetid://8992230677',
					ScaleType = 'Slice',
					SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(1, 120, 1, 116),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					BackgroundTransparency = 1,
					ImageColor3 = Color3.fromRGB(0, 0, 0),
					ImageTransparency = 0.7
				}),
				j('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				j('Frame', {
					BackgroundTransparency = 0.45,
					Size = UDim2.fromScale(1, 1),
					Name = 'Background',
					ThemeTag = {
						BackgroundColor3 = 'AcrylicMain'
					}
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				j('Frame', {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.4,
					Size = UDim2.fromScale(1, 1)
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					}),
					j('UIGradient', {
						Rotation = 90,
						ThemeTag = {
							Color = 'AcrylicGradient'
						}
					})
				}),
				j('ImageLabel', {
					Image = 'rbxassetid://9968344105',
					ImageTransparency = 0.98,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				j('ImageLabel', {
					Image = 'rbxassetid://9968344227',
					ImageTransparency = 0.9,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageTransparency = 'AcrylicNoise'
					}
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				j('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2
				}, {
					j('UICorner', {
						CornerRadius = UDim.new(0, 8)
					}),
					j('UIStroke', {
						Transparency = 0.5,
						Thickness = 1,
						ThemeTag = {
							Color = 'AcrylicBorder'
						}
					})
				})
			})
			local m
			if e(d.Parent.Parent).UseAcrylic then
				m = i()
				m.Frame.Parent = l.Frame
				l.Model = m.Model
				l.AddParent = m.AddParent
				l.SetVisibility = m.SetVisibility
			end
			return l
		end
	end,
	function()
		local c, d, e, f, g = b(5)
		local h = d.Parent.Parent
		local i = e(h.Creator)
		local j = function()
			local j = i.New('Part', {
				Name = 'Body',
				Color = Color3.new(0, 0, 0),
				Material = Enum.Material.Glass,
				Size = Vector3.new(1, 1, 0),
				Anchored = true,
				CanCollide = false,
				Locked = true,
				CastShadow = false,
				Transparency = 0.98
			}, {
				i.New('SpecialMesh', {
					MeshType = Enum.MeshType.Brick,
					Offset = Vector3.new(0, 0, -1E-6)
				})
			})
			return j
		end
		return j
	end,
	function()
		local c, d, e, f, g = b(6)
		local h, i = function(h, i, j, k, l)
			return (h - i) * (l - k) / (j - i) + k
		end, function(h, i)
			local j = game:GetService'Workspace'.CurrentCamera:ScreenPointToRay(h.X, h.Y)
			return j.Origin + j.Direction * i
		end
		local j = function()
			local j = game:GetService'Workspace'.CurrentCamera.ViewportSize.Y
			return h(j, 0, 2560, 8, 56)
		end
		return {
			i,
			j
		}
	end,
	[8] = function()
		local c, d, e, f, g = b(8)
		return {
			Close = 'rbxassetid://9886659671',
			Min = 'rbxassetid://9886659276',
			Max = 'rbxassetid://9886659406',
			Restore = 'rbxassetid://9886659001'
		}
	end,
	[9] = function()
		local c, d, e, f, g = b(9)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l = j.New, i.Spring.new
		return function(m, n, o)
			o = o or false
			local p = {}
			p.Title = k('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			p.HoverFrame = k('Frame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ThemeTag = {
					BackgroundColor3 = 'Hover'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 4)
				})
			})
			p.Frame = k('TextButton', {
				Size = UDim2.new(0, 0, 0, 32),
				Parent = n,
				ThemeTag = {
					BackgroundColor3 = 'DialogButton'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				k('UIStroke', {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Transparency = 0.65,
					ThemeTag = {
						Color = 'DialogButtonBorder'
					}
				}),
				p.HoverFrame,
				p.Title
			})
			local q, r = j.SpringMotor(1, p.HoverFrame, 'BackgroundTransparency', o)
			j.AddSignal(p.Frame.MouseEnter, function()
				r(0.97)
			end)
			j.AddSignal(p.Frame.MouseLeave, function()
				r(1)
			end)
			j.AddSignal(p.Frame.MouseButton1Down, function()
				r(1)
			end)
			j.AddSignal(p.Frame.MouseButton1Up, function()
				r(0.97)
			end)
			return p
		end
	end,
	[10] = function()
		local c, d, e, f, g = b(10)
		local h, i, j, k = game:GetService'UserInputService', game:GetService'Players'.LocalPlayer:GetMouse(), game:GetService'Workspace'.CurrentCamera, d.Parent.Parent
		local l, m = e(k.Packages.Flipper), e(k.Creator)
		local n, o, p, q = l.Spring.new, l.Instant.new, m.New, {
			Window = nil
		}
		function q.Init(r, s)
			q.Window = s
			return q
		end
		function q.Create(r)
			local s = {
				Buttons = 0
			}
			s.TintFrame = p('TextButton', {
				Text = '',
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				Parent = q.Window.Root
			}, {
				p('UICorner', {
					CornerRadius = UDim.new(0, 8)
				})
			})
			local t, u = m.SpringMotor(1, s.TintFrame, 'BackgroundTransparency', true)
			s.ButtonHolder = p('Frame', {
				Size = UDim2.new(1, -40, 1, -40),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = 1
			}, {
				p('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			})
			s.ButtonHolderFrame = p('Frame', {
				Size = UDim2.new(1, 0, 0, 70),
				Position = UDim2.new(0, 0, 1, -70),
				ThemeTag = {
					BackgroundColor3 = 'DialogHolder'
				}
			}, {
				p('Frame', {
					Size = UDim2.new(1, 0, 0, 1),
					ThemeTag = {
						BackgroundColor3 = 'DialogHolderLine'
					}
				}),
				s.ButtonHolder
			})
			s.Title = p('TextLabel', {
				FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
				Text = 'Dialog',
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 22,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, 22),
				Position = UDim2.fromOffset(20, 25),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			s.Scale = p('UIScale', {
				Scale = 1
			})
			local v, w = m.SpringMotor(1.1, s.Scale, 'Scale')
			s.Root = p('CanvasGroup', {
				Size = UDim2.fromOffset(300, 165),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				GroupTransparency = 1,
				Parent = s.TintFrame,
				ThemeTag = {
					BackgroundColor3 = 'Dialog'
				}
			}, {
				p('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				p('UIStroke', {
					Transparency = 0.5,
					ThemeTag = {
						Color = 'DialogBorder'
					}
				}),
				s.Scale,
				s.Title,
				s.ButtonHolderFrame
			})
			local x, y = m.SpringMotor(1, s.Root, 'GroupTransparency')
			function s.Open(z)
				e(k).DialogOpen = true
				s.Scale.Scale = 1.1
				u(0.75)
				y(0)
				w(1)
			end
			function s.Close(z)
				e(k).DialogOpen = false
				u(1)
				y(1)
				w(1.1)
				s.Root.UIStroke:Destroy()
				task.wait(0.15)
				s.TintFrame:Destroy()
			end
			function s.Button(z, A, B)
				s.Buttons = s.Buttons + 1
				A = A or 'Button'
				B = B or function()
				end
				local C = e(k.Components.Button)('', s.ButtonHolder, true)
				C.Title.Text = A
				for D, E in next, s.ButtonHolder:GetChildren() do
					if E:IsA'TextButton' then
						E.Size = UDim2.new(1 / s.Buttons, -(((s.Buttons - 1) * 10) / s.Buttons), 0, 32)
					end
				end
				m.AddSignal(C.Frame.MouseButton1Click, function()
					e(k):SafeCallback(B)
					pcall(function()
						s:Close()
					end)
				end)
				return C
			end
			return s
		end
		return q
	end,
	[11] = function()
		local c, d, e, f, g = b(11)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l = j.New, i.Spring.new
		return function(m, n, o, p)
			local q = {}
			q.TitleLabel = k('TextLabel', {
				FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
				Text = m,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			q.DescLabel = k('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				Text = n,
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 14),
				ThemeTag = {
					TextColor3 = 'SubText'
				}
			})
			q.LabelHolder = k('Frame', {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(10, 0),
				Size = UDim2.new(1, -28, 0, 0)
			}, {
				k('UIListLayout', {
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				k('UIPadding', {
					PaddingBottom = UDim.new(0, 13),
					PaddingTop = UDim.new(0, 13)
				}),
				q.TitleLabel,
				q.DescLabel
			})
			q.Border = k('UIStroke', {
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(0, 0, 0),
				ThemeTag = {
					Color = 'ElementBorder'
				}
			})
			q.Frame = k('TextButton', {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 0.89,
				BackgroundColor3 = Color3.fromRGB(130, 130, 130),
				Parent = o,
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = '',
				LayoutOrder = 7,
				ThemeTag = {
					BackgroundColor3 = 'Element',
					BackgroundTransparency = 'ElementTransparency'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				q.Border,
				q.LabelHolder
			})
			function q.SetTitle(r, s)
				q.TitleLabel.Text = s
			end
			function q.SetDesc(r, s)
				if s == nil then
					s = ''
				end
				if s == '' then
					q.DescLabel.Visible = false
				else
					q.DescLabel.Visible = true
				end
				q.DescLabel.Text = s
			end
			function q.Destroy(r)
				q.Frame:Destroy()
			end
			q:SetTitle(m)
			q:SetDesc(n)
			if p then
				local r, s, t = h.Themes, j.SpringMotor(j.GetThemeProperty'ElementTransparency', q.Frame, 'BackgroundTransparency', false, true)
				j.AddSignal(q.Frame.MouseEnter, function()
					t(j.GetThemeProperty'ElementTransparency' - j.GetThemeProperty'HoverChange')
				end)
				j.AddSignal(q.Frame.MouseLeave, function()
					t(j.GetThemeProperty'ElementTransparency')
				end)
				j.AddSignal(q.Frame.MouseButton1Down, function()
					t(j.GetThemeProperty'ElementTransparency' + j.GetThemeProperty'HoverChange')
				end)
				j.AddSignal(q.Frame.MouseButton1Up, function()
					t(j.GetThemeProperty'ElementTransparency' - j.GetThemeProperty'HoverChange')
				end)
			end
			return q
		end
	end,
	[12] = function()
		local c, d, e, f, g = b(12)
		local h = d.Parent.Parent
		local i, j, k = e(h.Packages.Flipper), e(h.Creator), e(h.Acrylic)
		local l, m, n, o = i.Spring.new, i.Instant.new, j.New, {}
		function o.Init(p, q)
			o.Holder = n('Frame', {
				Position = UDim2.new(1, -30, 1, -30),
				Size = UDim2.new(0, 310, 1, -30),
				AnchorPoint = Vector2.new(1, 1),
				BackgroundTransparency = 1,
				Parent = q
			}, {
				n('UIListLayout', {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					Padding = UDim.new(0, 20)
				})
			})
		end
		function o.New(p, q)
			q.Title = q.Title or 'Title'
			q.Content = q.Content or 'Content'
			q.SubContent = q.SubContent or ''
			q.Duration = q.Duration or nil
			q.Buttons = q.Buttons or {}
			local r = {
				Closed = false
			}
			r.AcrylicPaint = k.AcrylicPaint()
			r.Title = n('TextLabel', {
				Position = UDim2.new(0, 14, 0, 17),
				Text = q.Title,
				RichText = true,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextTransparency = 0,
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				TextSize = 13,
				TextXAlignment = 'Left',
				TextYAlignment = 'Center',
				Size = UDim2.new(1, -12, 0, 12),
				TextWrapped = true,
				BackgroundTransparency = 1,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			r.ContentLabel = n('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				Text = q.Content,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				TextWrapped = true,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			r.SubContentLabel = n('TextLabel', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				Text = q.SubContent,
				TextColor3 = Color3.fromRGB(240, 240, 240),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				TextWrapped = true,
				ThemeTag = {
					TextColor3 = 'SubText'
				}
			})
			r.LabelHolder = n('Frame', {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 40),
				Size = UDim2.new(1, -28, 0, 0)
			}, {
				n('UIListLayout', {
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 3)
				}),
				r.ContentLabel,
				r.SubContentLabel
			})
			r.CloseButton = n('TextButton', {
				Text = '',
				Position = UDim2.new(1, -14, 0, 13),
				Size = UDim2.fromOffset(20, 20),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1
			}, {
				n('ImageLabel', {
					Image = e(d.Parent.Assets).Close,
					Size = UDim2.fromOffset(16, 16),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'Text'
					}
				})
			})
			r.Root = n('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.fromScale(1, 0)
			}, {
				r.AcrylicPaint.Frame,
				r.Title,
				r.CloseButton,
				r.LabelHolder
			})
			if q.Content == '' then
				r.ContentLabel.Visible = false
			end
			if q.SubContent == '' then
				r.SubContentLabel.Visible = false
			end
			r.Holder = n('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 200),
				Parent = o.Holder
			}, {
				r.Root
			})
			local s = i.GroupMotor.new{
				Scale = 1,
				Offset = 60
			}
			s:onStep(function(t)
				r.Root.Position = UDim2.new(t.Scale, t.Offset, 0, 0)
			end)
			j.AddSignal(r.CloseButton.MouseButton1Click, function()
				r:Close()
			end)
			function r.Open(t)
				local u = r.LabelHolder.AbsoluteSize.Y
				r.Holder.Size = UDim2.new(1, 0, 0, 58 + u)
				s:setGoal{
					Scale = l(0, {
						frequency = 5
					}),
					Offset = l(0, {
						frequency = 5
					})
				}
			end
			function r.Close(t)
				if not r.Closed then
					r.Closed = true
					task.spawn(function()
						s:setGoal{
							Scale = l(1, {
								frequency = 5
							}),
							Offset = l(60, {
								frequency = 5
							})
						}
						task.wait(0.4)
						if e(h).UseAcrylic then
							r.AcrylicPaint.Model:Destroy()
						end
						r.Holder:Destroy()
					end)
				end
			end
			r:Open()
			if q.Duration then
				task.delay(q.Duration, function()
					r:Close()
				end)
			end
			return r
		end
		return o
	end,
	[13] = function()
		local c, d, e, f, g = b(13)
		local h = d.Parent.Parent
		local i = e(h.Creator)
		local j = i.New
		return function(k, l)
			local m = {}
			m.Layout = j('UIListLayout', {
				Padding = UDim.new(0, 5)
			})
			m.Container = j('Frame', {
				Size = UDim2.new(1, 0, 0, 26),
				Position = UDim2.fromOffset(0, 24),
				BackgroundTransparency = 1
			}, {
				m.Layout
			})
			m.Root = j('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 26),
				LayoutOrder = 7,
				Parent = l
			}, {
				j('TextLabel', {
					RichText = true,
					Text = k,
					TextTransparency = 0,
					FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
					TextSize = 18,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.new(1, -16, 0, 18),
					Position = UDim2.fromOffset(0, 2),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				}),
				m.Container
			})
			i.AddSignal(m.Layout:GetPropertyChangedSignal'AbsoluteContentSize', function()
				m.Container.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y)
				m.Root.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y + 25)
			end)
			return m
		end
	end,
	[14] = function()
		local c, d, e, f, g = b(14)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l, m, n, o = j.New, i.Spring.new, i.Instant.new, h.Components, {
			Window = nil,
			Tabs = {},
			Containers = {},
			SelectedTab = 0,
			TabCount = 0
		}
		function o.Init(p, q)
			o.Window = q
			return o
		end
		function o.GetCurrentTabPos(p)
			local q, r = o.Window.TabHolder.AbsolutePosition.Y, o.Tabs[o.SelectedTab].Frame.AbsolutePosition.Y
			return r - q
		end
		function o.New(p, q, r, s)
			local t, u = e(h), o.Window
			local v = t.Elements
			o.TabCount = o.TabCount + 1
			local w, x = o.TabCount, {
				Selected = false,
				Name = q,
				Type = 'Tab'
			}
			
			-- Xử lý Icon cho Tab
			local iconImage = nil
			local textPosX = 12
			
			if r then
				if type(r) == "number" then
					iconImage = "rbxassetid://" .. tostring(r)
				elseif type(r) == "string" then
					if r:match("^%d+$") then
						iconImage = "rbxassetid://" .. r
					else
						local libIcon = t:GetIcon(r)
						if libIcon then
							iconImage = libIcon
						else
							iconImage = r
						end
					end
				end
				
				if iconImage then
					textPosX = 30
				end
			end
			
			x.Frame = k('TextButton', {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundTransparency = 1,
				Parent = s,
				ThemeTag = {
					BackgroundColor3 = 'Tab'
				}
			}, {
				k('UICorner', {
					CornerRadius = UDim.new(0, 6)
				}),
				k('TextLabel', {
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, textPosX, 0.5, 0),
					Text = q,
					RichText = true,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextTransparency = 0,
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
					TextSize = 12,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.new(1, -textPosX - 12, 1, 0),
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				}),
				iconImage and k('ImageLabel', {
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.fromOffset(16, 16),
					Position = UDim2.new(0, 8, 0.5, 0),
					BackgroundTransparency = 1,
					Image = iconImage,
					ThemeTag = {
						ImageColor3 = 'Text'
					}
				}) or nil
			})
			
			local y = k('UIListLayout', {
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			
			x.ContainerFrame = k('ScrollingFrame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Parent = u.ContainerHolder,
				Visible = false,
				BottomImage = 'rbxassetid://6889812791',
				MidImage = 'rbxassetid://6889812721',
				TopImage = 'rbxassetid://6276641225',
				ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
				ScrollBarImageTransparency = 0.95,
				ScrollBarThickness = 3,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}, {
				y,
				k('UIPadding', {
					PaddingRight = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 1),
					PaddingTop = UDim.new(0, 1),
					PaddingBottom = UDim.new(0, 1)
				})
			})
			
			j.AddSignal(y:GetPropertyChangedSignal'AbsoluteContentSize', function()
				x.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, y.AbsoluteContentSize.Y + 2)
			end)
			
			x.Motor, x.SetTransparency = j.SpringMotor(1, x.Frame, 'BackgroundTransparency')
			
			j.AddSignal(x.Frame.MouseEnter, function()
				x.SetTransparency(x.Selected and 0.85 or 0.89)
			end)
			j.AddSignal(x.Frame.MouseLeave, function()
				x.SetTransparency(x.Selected and 0.89 or 1)
			end)
			j.AddSignal(x.Frame.MouseButton1Down, function()
				x.SetTransparency(0.92)
			end)
			j.AddSignal(x.Frame.MouseButton1Up, function()
				x.SetTransparency(x.Selected and 0.85 or 0.89)
			end)
			j.AddSignal(x.Frame.MouseButton1Click, function()
				o:SelectTab(w)
			end)
			
			o.Containers[w] = x.ContainerFrame
			o.Tabs[w] = x
			x.Container = x.ContainerFrame
			x.ScrollFrame = x.Container
			
			function x.AddSection(z, A)
				local B, C = {
					Type = 'Section'
				}, e(n.Section)(A, x.Container)
				B.Container = C.Container
				B.ScrollFrame = x.Container
				setmetatable(B, v)
				return B
			end
			
			setmetatable(x, v)
			return x
		end
		
		function o.SelectTab(p, q)
			local r = o.Window
			o.SelectedTab = q
			for s, t in next, o.Tabs do
				t.SetTransparency(1)
				t.Selected = false
			end
			o.Tabs[q].SetTransparency(0.89)
			o.Tabs[q].Selected = true
			r.TabDisplay.Text = o.Tabs[q].Name
			r.SelectorPosMotor:setGoal(l(o:GetCurrentTabPos(), {
				frequency = 6
			}))
			task.spawn(function()
				r.ContainerPosMotor:setGoal(l(110, {
					frequency = 10
				}))
				r.ContainerBackMotor:setGoal(l(1, {
					frequency = 10
				}))
				task.wait(0.15)
				for u, v in next, o.Containers do
					v.Visible = false
				end
				o.Containers[q].Visible = true
				r.ContainerPosMotor:setGoal(l(94, {
					frequency = 5
				}))
				r.ContainerBackMotor:setGoal(l(0, {
					frequency = 8
				}))
			end)
		end
		
		return o
	end,
	[15] = function()
		local c, d, e, f, g = b(15)
		local h, i = game:GetService'TextService', d.Parent.Parent
		local j, k = e(i.Packages.Flipper), e(i.Creator)
		local l = k.New
		return function(m, n)
			n = n or false
			local o = {}
			o.Input = l('TextBox', {
				FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(10, 0),
				ThemeTag = {
					TextColor3 = 'Text',
					PlaceholderColor3 = 'SubText'
				}
			})
			o.Container = l('Frame', {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Position = UDim2.new(0, 6, 0, 0),
				Size = UDim2.new(1, -12, 1, 0)
			}, {
				o.Input
			})
			o.Indicator = l('Frame', {
				Size = UDim2.new(1, -4, 0, 1),
				Position = UDim2.new(0, 2, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = n and 0.5 or 0,
				ThemeTag = {
					BackgroundColor3 = n and 'InputIndicator' or 'DialogInputLine'
				}
			})
			o.Frame = l('Frame', {
				Size = UDim2.new(0, 0, 0, 30),
				BackgroundTransparency = n and 0.9 or 0,
				Parent = m,
				ThemeTag = {
					BackgroundColor3 = n and 'Input' or 'DialogInput'
				}
			}, {
				l('UICorner', {
					CornerRadius = UDim.new(0, 4)
				}),
				l('UIStroke', {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Transparency = n and 0.5 or 0.65,
					ThemeTag = {
						Color = n and 'InElementBorder' or 'DialogButtonBorder'
					}
				}),
				o.Indicator,
				o.Container
			})
			local p = function()
				local p, q = 2, o.Container.AbsoluteSize.X
				if not o.Input:IsFocused() or o.Input.TextBounds.X <= q - 2 * p then
					o.Input.Position = UDim2.new(0, p, 0, 0)
				else
					local r = o.Input.CursorPosition
					if r ~= -1 then
						local s = string.sub(o.Input.Text, 1, r - 1)
						local t = h:GetTextSize(s, o.Input.TextSize, o.Input.Font, Vector2.new(math.huge, math.huge)).X
						local u = o.Input.Position.X.Offset + t
						if u < p then
							o.Input.Position = UDim2.fromOffset(p - t, 0)
						elseif u > q - p - 1 then
							o.Input.Position = UDim2.fromOffset(q - t - p - 1, 0)
						end
					end
				end
			end
			task.spawn(p)
			k.AddSignal(o.Input:GetPropertyChangedSignal'Text', p)
			k.AddSignal(o.Input:GetPropertyChangedSignal'CursorPosition', p)
			k.AddSignal(o.Input.Focused, function()
				p()
				o.Indicator.Size = UDim2.new(1, -2, 0, 2)
				o.Indicator.Position = UDim2.new(0, 1, 1, 0)
				o.Indicator.BackgroundTransparency = 0
				k.OverrideTag(o.Frame, {
					BackgroundColor3 = n and 'InputFocused' or 'DialogHolder'
				})
				k.OverrideTag(o.Indicator, {
					BackgroundColor3 = 'Accent'
				})
			end)
			k.AddSignal(o.Input.FocusLost, function()
				p()
				o.Indicator.Size = UDim2.new(1, -4, 0, 1)
				o.Indicator.Position = UDim2.new(0, 2, 1, 0)
				o.Indicator.BackgroundTransparency = 0.5
				k.OverrideTag(o.Frame, {
					BackgroundColor3 = n and 'Input' or 'DialogInput'
				})
				k.OverrideTag(o.Indicator, {
					BackgroundColor3 = n and 'InputIndicator' or 'DialogInputLine'
				})
			end)
			return o
		end
	end,
	[16] = function()
		local c, d, e, f, g = b(16)
		local h, i = d.Parent.Parent, e(d.Parent.Assets)
		local j, k = e(h.Creator), e(h.Packages.Flipper)
		local l, m = j.New, j.AddSignal
		
		return function(n)
			local o, p, q = {}, e(h), function(o, p, q, r)
				local s = {
					Callback = r or function()
					end
				}
				s.Frame = l('TextButton', {
					Size = UDim2.new(0, 34, 1, -8),
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = 1,
					Parent = q,
					Position = p,
					Text = '',
					ThemeTag = {
						BackgroundColor3 = 'Text'
					}
				}, {
					l('UICorner', {
						CornerRadius = UDim.new(0, 7)
					}),
					l('ImageLabel', {
						Image = o,
						Size = UDim2.fromOffset(16, 16),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1
