if not game:IsLoaded() then game.Loaded:Wait() end

local Services = {
    UserInputService = game:GetService('UserInputService'),
    Players = game:GetService('Players'),
    RunService = game:GetService('RunService'),
    ReplicatedStorage = game:GetService('ReplicatedStorage'),
    Workspace = game:GetService('Workspace'),
    Lighting = game:GetService('Lighting'),
    TweenService = game:GetService('TweenService'),
    SoundService = game:GetService('SoundService'),
    Chat = game:GetService('Chat'),
    CoreGui = game:GetService('CoreGui'),
}

local is_game = (game.PlaceId == 2788229376 or game.PlaceId == 7213786345)
if not is_game then
    print('This script is only for da-hood.')
end

local skyboxes = {
    ['SpingleBoob'] = {170973129, 170973129, 170973129 ,170973129, 170973129, 170973129},
    ['Pink'] = {271042516, 271077243, 271042556 ,271042310, 271042467, 271077958},
    ['Purple'] = {16553658937, 16553660713, 16553662144 ,16553664042, 16553665766, 16553667750},
    ['Red'] = {15832429892, 15832430998, 15832430210 ,15832430671, 15832431198, 15832429401},
    ['Blue'] = {17124357467, 17124359797, 17124362093 ,17124365127, 17124367200, 17124369657},
    ['MilkyWay'] = {15146674442, 15146673704, 15146672849 ,15146672013, 15146671172, 15146670489},
    ['Minecraft'] = {8735166756, 8735166707, 8735231668 ,8735166755, 8735166751, 8735166729}
}

local emotes = {
    ['Yungblud Happier Jump'] = 15609995579,
    ['Sturdy Dance - Ice Spice'] = 17746180844,
    ['Elton John - Rock Out'] = 11753474067,
    ['Elton John - Heart Shuffle'] = 17748314784,
    ['Xaviers Dance'] = 86095591684772,
}

local cache = {
    FogColor = Services.Lighting.FogColor,
    FogStart = Services.Lighting.FogStart,
    FogEnd = Services.Lighting.FogEnd
}

local script_intro = function()
    local cam = Services.Workspace.CurrentCamera
    local x = cam.ViewportSize.X
    local y = cam.ViewportSize.Y
    local newx = math.floor(x/2)
    local newy = math.floor(y/2)
    local main = Instance.new('ScreenGui')
    local Image = Instance.new('ImageLabel')
    main.Name = 'SplashScreen'
    main.Parent = Services.CoreGui
    main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Image.Name = 'Image'
    Image.Parent = main
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1
    Image.Position = UDim2.new(0, newx, 0, newy)
    Image.Size = UDim2.new(0, 825, 0, 377)
    Image.Image = 'rbxassetid://75298466726042'
    Image.ImageTransparency = 1
    Image.AnchorPoint = Vector2.new(0.5, 0.7)

    local blur = Instance.new('BlurEffect')
    blur.Parent = Services.Lighting
    blur.Size = 0
    blur.Name = 'blur'

    local Tween = function(element, properties, duration, easingStyle, easingDirection)
        local tweenInfo = TweenInfo.new(duration or 1, easingStyle or Enum.EasingStyle.Sine, easingDirection or Enum.EasingDirection.InOut)
        local tween = Services.TweenService:Create(element, tweenInfo, properties)
        tween:Play()
        return tween
    end

    Tween(Image, {ImageTransparency = 0}, 0.3) 
    Tween(blur, {Size = 20}, 0.3)              
    wait(3)
    Tween(Image, {ImageTransparency = 1}, 0.3)  
    Tween(blur, {Size = 0}, 0.3)            
    wait(0.3)
end

script_intro()
local default_color = Color3.fromRGB(79, 155, 255)
local autofarm = loadstring(game:HttpGet('https://pastebin.com/raw/jrGKnAds'))()
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Reload-astro/onetap-menu-lib/refs/heads/main/library.lua'))({
    cheatname = 'Aurora v2',
    gamename = 'Da-Hood',
    color = default_color
})
local flags = lib.flags
local win = lib:window({
    name = 'Aurora | [Da-Hood]',
    size = UDim2.fromOffset(500, 650)
})

local vars = {
    void = {
        old = nil,
        clone = nil,
        cloneconnection = nil,
        cache = nil,
    },
    aura = {
        connection = nil,
        stored = game:GetObjects('rbxassetid://82905687543409')[1]
    },
    skybox = {
        connection = nil,
    },
    antistomp = {
        connection = nil
    },
    antigrab = {
        connection = nil
    },
    lettuce ={
        connection = nil,
    },
    autobuy ={
        weapon = nil,
    },
    cashaura = {
        connection = nil
    },
    animations = {
        connection = nil,
        animation = 'None',
        selection = nil
    },
    desync = {
        old = nil,
        clone = nil,
        fake = nil,
        cloneconnection = nil,
        switch = false,
        radians = 0,
        customsliders = {},
        strafesliders = {},
        randomsliders = {},
    },
    buyknife = {
        connection = nil
    },
    cashdrop = {
        connection = nil
    },
    autostomp = {
        connection = nil
    },
    hitboxexpander = {
        connection = nil
    },
    glow = {
        connection = nil
    },
    targetaim = {
        circle = nil,
        tracer = nil,
        target = nil,
    },
    killall = {
        connection = nil,
    },
    camlock = {
        notify = false,
        target = nil,
    },
    mouselock = {
        notify = false,
        target = nil,
    },
    spectate = {
        connection = nil,
    },
    headsit = {
        connection = nil,
    },
    bang = {
        connection = nil,
    },
    antivoid = {
        connection = nil,
    },
    fling = {
        connection = nil,
        switch = false,
    },
    loopkill = {
        stage = 0,
        enabled = false,
        target = nil
    },
    trigger = {
        connection = nil,
        userconnection = nil,
        lastFireTime = 0
    },
    seat = {
        seats = {},
    },
    anticheat = {
        tick = tick(),
    },
    armor = {
        connection = nil,
    },
    bring = {
        old = nil
    },
    clone = {
        connection = nil,
    }
}

vars.targetaim.circle = Drawing.new('Circle')
vars.targetaim.circle.Thickness = 1
vars.targetaim.circle.NumSides = 50
vars.targetaim.circle.Filled = false
vars.targetaim.circle.Transparency = 1
vars.targetaim.circle.Visible = false

vars.targetaim.tracer = Drawing.new('Line')
vars.targetaim.tracer.Thickness = 1
vars.targetaim.tracer.Visible = false

local items_values = {guns = {}, ammo = {}, armor = {}}
local items = {
    ['guns'] = {
        ['LMG'] = '[LMG] - $4098',
        ['AK-47'] = '[AK47] - $2459',
        ['Silencer AR'] = '[SilencerAR] - $1366',
        ['Silencer'] = '[Silencer] - $601',
        ['Revolver'] = '[Revolver] - $1421',
        ['AR'] = '[AR] - $1093',
        ['AUG'] = '[AUG] - $2131',
        ['Double-Barrel'] = '[Double-Barrel SG] - $1475',
        ['Drum Gun'] = '[DrumGun] - $3278',
        ['Flamethrower'] = '[Flamethrower] - $9835',
        ['Glock'] = '[Glock] - $546',
        ['P90'] = '[P90] - $1093',
        ['RPG'] = '[RPG] - $21855',
        ['Rifle'] = '[Rifle] - $1694',
        ['SMG'] = '[SMG] - $820',
        ['Shotgun'] = '[Shotgun] - $1366',
        ['Tactical Shotgun'] = '[TacticalShotgun] - $1912',
        ['Drum-Shotgun'] = '[Drum-Shotgun] - $1202',
        ['Knife'] = '[Knife] - $164',
    },

    ['ammo'] = {
        ['LMG'] = '200 [LMG Ammo] - $328',
        ['AK-47'] = '90 [AK47 Ammo] - $87',
        ['Silencer AR'] = '120 [SilencerAR Ammo] - $82',
        ['Silencer'] = '25 [Silencer Ammo] - $55',
        ['Revolver'] = '12 [Revolver Ammo] - $82',
        ['AR'] = '100 [AR Ammo] - $82',
        ['AUG'] = '90 [AUG Ammo] - $87',
        ['Double-Barrel'] = '18 [Double-Barrel SG Ammo] - $55',
        ['Drum Gun'] = '100 [DrumGun Ammo] - $219',
        ['Flamethrower'] = '140 [Flamethrower Ammo] - $1093',
        ['Glock'] = '25 [Glock Ammo] - $66',
        ['P90'] = '120 [P90 Ammo] - $66',
        ['RPG'] = '5 [RPG Ammo] - $1093',
        ['Rifle'] = '5 [Rifle Ammo] - $273',
        ['SMG'] = '80 [SMG Ammo] - $66',
        ['Shotgun'] = '20 [Shotgun Ammo] - $66',
        ['Tactical Shotgun'] = '20 [TacticalShotgun Ammo] - $66',
        ['Drum-Shotgun'] = '18 [Drum-Shotgun Ammo] - $71',
    },

    ['armor'] = {
        ['High'] = '[High-Medium Armor] - $3278',
        ['Medium'] = '[Medium Armor] - $1098',
        ['Fire'] = '[Fire Armor] - $2623',
    },

    ['food'] = {
        ['chicken'] = '',
        ['pizza'] = '',
    }
}

task.spawn(function()
    for i, v in pairs(items.guns) do 
        table.insert(items_values.guns, i)
    end 
    
    for i, v in pairs(items.ammo) do 
        table.insert(items_values.ammo, i)
    end 
    
    for i, v in pairs(items.armor) do 
        table.insert(items_values.armor, i)
    end 
    
    for _, object in pairs(Services.Workspace:GetDescendants()) do
        if object:IsA('Seat') and not object:IsA('VehicleSeat') then
            table.insert(vars.seat.seats, object)
        end
    end
end)

local utility = {
    create_fake = function(name, parent)
        local fakeplayer = game:GetObjects("rbxassetid://119988189820677")[1]
        fakeplayer.Name = name
        fakeplayer.Parent = parent
        fakeplayer.HumanoidRootPart.CanCollide = false
        
        local highlight = Instance.new('Highlight')
        highlight.Name = 'Visualize'
        highlight.Parent = fakeplayer
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillTransparency = 0
        highlight.OutlineTransparency = 0
        highlight.FillColor = default_color
        highlight.OutlineColor = default_color
    
        return fakeplayer
    end,

    create_clone = function(Character)
        local Player = Services.Players:FindFirstChild(Character.Name)
        if not Player or not Player.Character then return end
    
        local OriginalCharacter = Player.Character
        if not OriginalCharacter:FindFirstChild("HumanoidRootPart") then return end

        OriginalCharacter.Archivable = true
        local ClonedCharacter = OriginalCharacter:Clone()
        OriginalCharacter.Archivable = false
    
        ClonedCharacter.Parent = Services.Workspace
        ClonedCharacter.Name = "clone_"..OriginalCharacter.Name
        
        if ClonedCharacter:FindFirstChildOfClass("Humanoid") then ClonedCharacter:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None else ClonedCharacter:Destroy() return end

        local Connection
        Connection = Services.RunService.RenderStepped:Connect(function()
            if not OriginalCharacter or not ClonedCharacter or not Player.Character then Connection:Disconnect() return end

            for _, part in ipairs(ClonedCharacter:GetDescendants()) do
                if part:IsA('Script') or part:IsA('LocalScript') or part:IsA("Tool") then
                    part:Destroy()
                end
    
                if part:IsA("BasePart") or part:IsA("Part") then
                    part.CanCollide = false
                end
            end

            for _, part in ipairs(OriginalCharacter:GetDescendants()) do
                if part:IsA("Motor6D") then
                    local clonePart = ClonedCharacter:FindFirstChild(part.Name, true)
                    if clonePart and clonePart:IsA("Motor6D") then
                        clonePart.Transform = part.Transform
                    end
                end
            end
        end)

        table.insert(lib.connections, Connection)
    
        return ClonedCharacter, Connection
    end,
    
    new_connection = function(type, callback)
		local connection = type:Connect(callback);

		table.insert(lib.connections, connection);

		return connection;
	end,

    new_instance = function(instance, options)
        local ins = Instance.new(instance) 
        
        for prop, value in next, options do 
            ins[prop] = value
        end

        table.insert(lib.instances, ins)

        return ins 
    end,
    
    validate_player = function(Player)
        return Player and Player.Character and Player.Character:FindFirstChild('HumanoidRootPart') and Player.Character:FindFirstChild('Head') and Player.Character:FindFirstChild('Humanoid') and true or false 
    end,

    shoot_gun = function(target, tool, part)
        local Target = Services.Players:FindFirstChild(target).Character
        if not Target then 
            return 
        end 
        Services.ReplicatedStorage.MainEvent:FireServer(
            'ShootGun',
            tool.Handle,
            Services.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position,
            Target.HumanoidRootPart.Position,
            Target[part],
            Vector3.new(0,0,-1)
        )
    end,

    play_sound = function(Id, Volume, Pitch)
        local Sound = Instance.new('Sound', Services.SoundService)
        local PitchSound = Instance.new('PitchShiftSoundEffect', Sound)

        Sound.SoundId = 'rbxassetid://'.. Id ..''
        Sound.Volume = Volume
        PitchSound.Octave = Pitch
        Sound.PlayOnRemove = true
        Sound:Destroy()
    end,

    tween_cframe = function(part, speed, position)
        Services.TweenService:Create(part,TweenInfo.new(speed,Enum.EasingStyle.Linear),{CFrame = position}):Play()
    end,

    modify_vehicle_speed = function(speed)
        local Vehicles = Services.ReplicatedStorage:WaitForChild('Bike'):WaitForChild('Skins')
        for _, skin in pairs(Vehicles:GetChildren()) do 
            if typeof(skin) ~= 'Instance' or skin.ClassName ~= 'Model' then return end 
    
            local Attribute = skin:GetAttribute('Speed')
            if Attribute ~= nil then 
                skin:SetAttribute('Speed', speed)
            end 
        end 
    end,

    world_to_screen = function(Position)
        if not Position then return end

        local ViewportPointPosition, onScreen = Services.Workspace.CurrentCamera:WorldToViewportPoint(Position)
        local pos = Vector2.new(ViewportPointPosition.X, ViewportPointPosition.Y)
        return {
            pos = pos,
            onScreen = onScreen
        }
    end,

    move_mouse = function(position, smoothingX, smoothingY)
        local mousePosition = Services.UserInputService:GetMouseLocation()

        mousemoverel((position.X - mousePosition.X) / smoothingX, (position.Y - mousePosition.Y) / smoothingY)
    end,
    
    toggle_seats = function(state)
        for _, seat in pairs(vars.seat.seats) do
            seat.Disabled = not state
        end
    end,

    auto_buy = function(obj, type, amount)
        local Shop = Services.Workspace.Ignored:FindFirstChild("Shop")
        local Player = Services.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChild("Humanoid")
        local Camera = Services.Workspace.CurrentCamera
        local OldCFrame = Character.HumanoidRootPart.CFrame
        local OldCameraCF = Camera.CFrame
        local Part = nil
        local EquippedTool = nil 
    
        if Humanoid and Humanoid.Health > 0 and Shop then 
            for _, part in pairs(Shop[obj]:GetChildren()) do 
                if part:IsA("Part") or part:IsA("BasePart") or part:IsA("MeshPart") then 
                    Part = part 
                    break
                end 
            end 

            if Character and Character:FindFirstChildOfClass("Tool") then
                EquippedTool = Character:FindFirstChildOfClass("Tool")
                EquippedTool.Parent = Player.Backpack
            end
    
            if Part ~= nil and Shop[obj]:FindFirstChild("ClickDetector") then
                local ClickDetector = Shop[obj]:FindFirstChild("ClickDetector")

                Camera.CameraType = Enum.CameraType.Scriptable
                Camera.CFrame = CFrame.lookAt(
                    Part.Position + Part.CFrame.LookVector * 1 + Vector3.new(0, 6, 0), 
                    Part.Position
                )
    
                if type == "gun" or type == "armor" then
                    local OldMoney = Player.PlayerGui.MainScreenGui:FindFirstChild("MoneyText").Text
                    local StartTime = tick()
                    repeat task.wait()
                        Character.HumanoidRootPart.CFrame = Part.CFrame - Vector3.new(0,5,0)
                        fireclickdetector(ClickDetector)
                    until Player.PlayerGui.MainScreenGui:FindFirstChild("MoneyText").Text ~= OldMoney or tick() - StartTime >= 2
                elseif type == "ammo" then
                    for v = 1, amount do
                        local OldMoney = Player.PlayerGui.MainScreenGui:FindFirstChild("MoneyText").Text
                        local StartTime = tick()
                        repeat task.wait()
                            Character.HumanoidRootPart.CFrame = Part.CFrame - Vector3.new(0,5,0)
                            fireclickdetector(ClickDetector)
                        until Player.PlayerGui.MainScreenGui:FindFirstChild("MoneyText").Text ~= OldMoney or tick() - StartTime >= 0.5
                    end
                end

                Camera.CFrame = OldCameraCF
                Camera.CameraType = Enum.CameraType.Custom
            end 

            Character.HumanoidRootPart.CFrame = OldCFrame

            if EquippedTool then
                task.wait(0.1)
                EquippedTool.Parent = Player.Character
            end
        end 
    end,    

    play_animation = function(id, time, speed, player, stop)
        pcall(function()
            player.Character.Animate.Disabled = false
            local hum = player.Character.Humanoid
            local animtrack = hum:GetPlayingAnimationTracks()
            for _, track in pairs(animtrack) do
                track:Stop()
            end
            player.Character.Animate.Disabled = true
            local Anim = Instance.new('Animation')
            Anim.AnimationId = 'rbxassetid://' .. id
            local loadanim = hum:LoadAnimation(Anim)
            loadanim:Play()
            loadanim.TimePosition = time
            loadanim:AdjustSpeed(speed)
            local rootPart = player.Character:FindFirstChild('HumanoidRootPart')
            local connection
            local function onMove()
                if rootPart.Velocity.Magnitude > 8 and stop then
                    loadanim:Stop()
                    player.Character.Animate.Disabled = false
                    if connection then
                        connection:Disconnect()
                    end
                end
            end
            connection = Services.RunService.Heartbeat:Connect(onMove)
            loadanim.Stopped:Connect(function()
                player.Character.Animate.Disabled = false
                for _, track in pairs(animtrack) do
                    track:Stop()
                end
                if connection then
                    connection:Disconnect()
                end
            end)
        end)
    end,    
    
    stop_animation = function(player)
        player.Character.Animate.Disabled = false
        local animtrack = player.Character.Humanoid:GetPlayingAnimationTracks()
        for i, track in pairs (animtrack) do
            track:Stop()
        end
    end,

    is_forcefield = function(player, check)
        if check then
            return not (player.Character:FindFirstChild('ForceField') ~= nil)
        else
            return true
        end
    end,

    is_weapon = function(name)
        for _, v in ipairs({ '[Revolver]', '[TacticalShotgun]', '[Glock]', '[Silencer]', '[Double-Barrel SG]', '[Shotgun]' }) do
            if name == v then
                return true
            end
        end
        return false
    end,

	is_friends = function(player, check)
        if check then
            return not player:IsFriendsWith(Services.Players.LocalPlayer.UserId)
        else
            return true
        end
	end,

    get_ammo = function(player, gun_name)
		if (not player and player.Character and player.Character:FindFirstChild('Humanoid') and true or false) then return 100 end

		local gun = player.Character[gun_name]

		if not gun then
			return 10
		end

		return gun.Ammo.Value
	end,

    is_player_behind_a_wall = function(player, check)
        if check then
            local targetPosition = player.Character.HumanoidRootPart.Position
            local localPlayer = Services.Players.LocalPlayer
            local cameraPosition = Services.Workspace.CurrentCamera.CFrame.Position
            local distance = (targetPosition - cameraPosition).Magnitude
        
            local hitPart, hitPosition = Services.Workspace.FindPartOnRayWithIgnoreList(
                Services.Workspace,
                Ray.new(cameraPosition, (targetPosition - cameraPosition).Unit * distance),
                { localPlayer.Character, player.Character }
            )
        
            return hitPart == nil or (hitPosition - cameraPosition).Magnitude >= distance
        else
            return true 
        end
	end,

	is_on_vehicle = function(player, check)
        if check then
		    return not (player.Character:FindFirstChild('[CarHitBox]') ~= nil)
        else
            return true
        end
	end,

	is_knocked = function(player, check)
        if check then
            local value

            local bodyeffects = player.Character:FindFirstChild('BodyEffects')
            value = bodyeffects and bodyeffects['K.O'].Value or false
    
            return not value
        else
            return true
        end
	end,

    is_dead = function(player, check)
        if check then
            local value

            local bodyeffects = player.Character:FindFirstChild('BodyEffects')
            value = bodyeffects and bodyeffects['Dead'].Value or false
    
            return not value
        else
            return true
        end
	end,

	get_gun = function(player)
		local info

		--// character check
		if (not player and player.Character and player.Character:FindFirstChild('Humanoid') and true or false) then return end

		local tool = player.Character:FindFirstChildWhichIsA('Tool')

		--// tool check
		if (not (tool)) then return end

		--// main code
		local descendants = tool:GetDescendants()

		for i = 1, #descendants do
			local object = descendants[i]

			if (object.Name:lower():find('ammo') and not object.Name:lower():find('max') and (object.ClassName == 'IntValue' or object.ClassName == 'NumberValue')) then
				info = {}
				info.ammo = object
				info.tool = tool
			end
		end

		return info
	end,

	is_grabbed = function(player, check)
        if check then
            return not (player.Character:FindFirstChild('GRABBING_CONSTRAINT') ~= nil)
        else
            return true
        end
	end,

    is_alive = function(player)
        return (player.Character and player.Character:FindFirstChild('Humanoid'))
    end,

    reload_gun = function(gun)
        local KOValue = Services.Players.LocalPlayer.Character:WaitForChild('BodyEffects')['K.O'].Value
        local GrabbedValue = Services.Players.LocalPlayer.Character:WaitForChild('BodyEffects')['Grabbed'].Value
    
        if gun and KOValue ~= true and GrabbedValue ~= true then
            Services.ReplicatedStorage:FindFirstChild('MainEvent'):FireServer('Reload', gun)
        end
    end,
}

local tabs = {
    aimbot = win:tab({name = '   aimbot   '}),
    antiaim = win:tab({name = '   antiaim   '}),
    movement = win:tab({name = '   movement   '}),
    visuals = win:tab({name = '   visuals   '}),
    misc = win:tab({name = '   misc   '}),
    playerlist = win:tab({name = ' playerlist '}),
    configs = lib:CreateConfigTab(win),
}

local sections = {
    aimbot1 = tabs.aimbot:section({name = 'Cam-Lock', side = 'left'}),
    aimbot4 = tabs.aimbot:section({name = 'Target Aim', side = 'right'}),
    aimbot2 = tabs.aimbot:section({name = 'Other', side = 'right'}),
    aimbot3 = tabs.aimbot:section({name = 'Mouse-Lock', side = 'left'}),
    antiaim1 = tabs.antiaim:section({name = 'Main', side = 'left'}),
    antiaim2 = tabs.antiaim:section({name = 'Other', side = 'right'}),
    movement1 = tabs.movement:section({name = 'Main', side = 'left'}),
    movement2 = tabs.movement:section({name = 'Teleports', side = 'right'}),
    visuals1 = tabs.visuals:section({name = 'Players', side = 'left'}),
    visuals2 = tabs.visuals:section({name = 'Localplayer', side = 'right'}),
    misc1 = tabs.misc:section({name = 'Main', side = 'left'}),
    misc2 = tabs.misc:section({name = 'Other', side = 'right'}),
    misc3 = tabs.misc:section({name = 'Auto-Buy', side = 'right'}),
    players1 = tabs.playerlist:section({name = 'Playerlist', side = 'left'}),
    players2 = tabs.playerlist:section({name = 'Options', side = 'right'})
}

local ui = {
    -- aimbot
    targetaim = sections.aimbot4:toggle({
        text = 'Target Aim',
        state = false,
        flag = 'target-aim',
        callback = function(bool) end
    }),
    
    targetaimkey = sections.aimbot4:keybind({
        text = 'Target Aim Key',
        flag = 'target-aim-key',
        mode = 'hold',
        bind = 'None',
        callback = function(key)

        end
    }),

    fov_targetaim = sections.aimbot4:slider({
        text = 'FOV',
        min = 0,
        max = 360,
        increment = 1,
        flag = 'fov-target-aim',
        callback = function(value)
            vars.targetaim.circle.Radius = value
        end
    }),

    targetaim_part = sections.aimbot4:dropdown({
        text = 'Aim Part',
        values = {'Head', 'HumanoidRootPart'},
        flag = 'aim-part-target-aim',
        callback = function(selected) end
    }),

    targetaim_checks = sections.aimbot4:dropdown({
        text = 'Checks',
        multi = true,
        values = {'Knocked', 'Vehicle', 'Grabbed', 'Visible', 'Friend', 'ForceField'},
        flag = 'target-aim-checks',
        callback = function(selected) end
    }),

    targetaimcircle = sections.aimbot4:toggle({
        text = 'FOV Circle',
        state = false,
        flag = 'target-aim-circle',
        callback = function(bool) end
    }),
    
    targetaimcircle_color = sections.aimbot4:colorpicker({
        text = 'FOV Circle Color',
        color = default_color,
        flag = 'target-aim-circle-color',
        callback = function(value)
            vars.targetaim.circle.Color = value
        end
    }),

    targetaimtracer = sections.aimbot4:toggle({
        text = 'Tracer',
        state = false,
        flag = 'target-aim-tracer',
        callback = function(bool) end
    }),
    
    targetaimtracer_color = sections.aimbot4:colorpicker({
        text = 'Tracer Color',
        color = default_color,
        flag = 'tracer-color',
        callback = function(value)
            vars.targetaim.tracer.Color = value
        end
    }),
    
    camlock = sections.aimbot1:toggle({
        text = 'Cam-Lock',
        state = false,
        flag = 'cam-lock',
        callback = function(bool) end
    }),
    
    camlock_key = sections.aimbot1:keybind({
        text = 'Cam-Lock Key',
        flag = 'cam-lock-key',
        mode = 'toggle',
        bind = 'None',
        callback = function(key)

        end
    }),

    camlock_look_at = sections.aimbot1:toggle({
        text = 'Look At',
        state = false,
        flag = 'camlock-look-at',
        callback = function(value) end
    }),

    camlock_notify = sections.aimbot3:toggle({
        text = 'Notify',
        state = false,
        flag = 'cam-lock-notify',
        callback = function(value) end
    }),

    fov_camlock = sections.aimbot1:slider({
        text = 'FOV',
        min = 0,
        max = 360,
        increment = 1,
        flag = 'fov-camlock',
        callback = function(value) end
    }),

    camlock_smoothing = sections.aimbot1:toggle({
        text = 'Smoothing',
        state = false,
        flag = 'camlock-smoothing',
        callback = function(value) end
    }),

    camlock_smoothing_speed = sections.aimbot1:slider({
        text = 'Smoothing Speed',
        min = 0,
        max = 100,
        increment = 0.1,
        flag = 'camlock-smoothing-speed',
        callback = function(value) end
    }),

    camlock_aim_part = sections.aimbot1:dropdown({
        text = 'Aim Part',
        values = {'Head', 'HumanoidRootPart'},
        flag = 'aim-part-camlock',
        callback = function(selected) end
    }),

    camlock_checks = sections.aimbot1:dropdown({
        text = 'Checks',
        multi = true,
        values = {'Knocked', 'Vehicle', 'Grabbed', 'Visible', 'Friend', 'ForceField'},
        flag = 'camlock-checks',
        callback = function(selected) end
    }),

    mouselock = sections.aimbot3:toggle({
        text = 'Mouse-Lock',
        state = false,
        flag = 'mouse-lock',
        callback = function(bool) end
    }),
    
    mouselock_key = sections.aimbot3:keybind({
        text = 'Mouse-Lock Key',
        flag = 'mouse-lock-key',
        mode = 'toggle',
        bind = 'None',
        callback = function(key)

        end
    }),

    mouselock_look_at = sections.aimbot3:toggle({
        text = 'Look At',
        state = false,
        flag = 'mouselock-look-at',
        callback = function(value) end
    }),

    mouselock_notify = sections.aimbot3:toggle({
        text = 'Notify',
        state = false,
        flag = 'mouse-lock-notify',
        callback = function(value) end
    }),

    fov_mouselock = sections.aimbot3:slider({
        text = 'FOV',
        min = 0,
        max = 360,
        increment = 1,
        flag = 'fov-mouselock',
        callback = function(value) end
    }),

    mouselock_smoothing = sections.aimbot3:toggle({
        text = 'Smoothing',
        state = false,
        flag = 'mouselock-smoothing',
        callback = function(value) end
    }),

    mouselock_smoothing_speed = sections.aimbot3:slider({
        text = 'Smoothing Speed',
        min = 1,
        max = 100,
        increment = 0.1,
        flag = 'mouselock-smoothing-speed',
        callback = function(value) end
    }),

    mouselock_aim_part = sections.aimbot3:dropdown({
        text = 'Aim Part',
        values = {'Head', 'HumanoidRootPart'},
        flag = 'aim-part-mouselock',
        callback = function(selected) end
    }),

    mouselock_checks = sections.aimbot3:dropdown({
        text = 'Checks',
        multi = true,
        values = {'Knocked', 'Vehicle', 'Grabbed', 'Visible', 'Friend', 'ForceField'},
        flag = 'mouselock-checks',
        callback = function(selected) end
    }),

    triggerbot = sections.aimbot2:toggle({
        text = 'Trigger',
        state = false,
        flag = 'trigger',
        callback = function(bool) 
            if bool then
                vars.trigger.userconnection = utility.new_connection(Services.UserInputService.InputChanged, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        local target = Services.Players.LocalPlayer:GetMouse().Target
                        if target and target.Parent then
                            local humanoidRootPart = target.Parent:FindFirstChild('HumanoidRootPart')
                            local localPlayerCharacter = Services.Players.LocalPlayer.Character
                            if humanoidRootPart and target.Parent ~= localPlayerCharacter then
                                if not vars.trigger.connection then
                                    vars.trigger.connection = utility.new_connection(Services.RunService.RenderStepped, function()
                                        if (tick() - vars.trigger.lastFireTime) >= flags['trigger-delay'] then
                                            vars.trigger.lastFireTime = tick()
                                            local player = Services.Players:GetPlayerFromCharacter(target.Parent)
                                            if localPlayerCharacter then
                                                local tool = localPlayerCharacter:FindFirstChildOfClass('Tool')
                                                if tool and utility.is_weapon(tool.Name) then
                                                    if utility.is_knocked(player, true) 
                                                    and utility.is_player_behind_a_wall(player, true) 
                                                    and utility.is_grabbed(player, true)
                                                    and utility.is_forcefield(player, true)
                                                    and utility.is_friends(player, true) then
                                                        tool:Activate()
                                                    end
                                                end
                                            end
                                        end
                                    end)
                                end
                            else
                                if vars.trigger.connection then
                                    vars.trigger.connection:Disconnect()
                                    vars.trigger.connection = nil
                                end
                            end
                        else
                            if vars.trigger.connection then
                                vars.trigger.connection:Disconnect()
                                vars.trigger.connection = nil
                            end
                        end
                    end
                end)
            else
                if vars.trigger.userconnection then
                    vars.trigger.userconnection:Disconnect()
                    vars.trigger.userconnection = nil
                end
                if vars.trigger.connection then
                    vars.trigger.connection:Disconnect()
                    vars.trigger.connection = nil
                end
            end
        end
    }),

    trigger_delay = sections.aimbot2:slider({
        text = 'Triggerbot Delay',
        min = 0.01,
        max = 1,
        increment = 0.01,
        flag = 'trigger-delay',
        callback = function(value) end
    }),

    auto_stomp = sections.aimbot2:toggle({
        text = 'Auto Stomp',
        state = false,
        flag = 'auto-stomp',
        callback = function(bool) 
            if bool then
                vars.autostomp.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    Services.ReplicatedStorage.MainEvent:FireServer('Stomp')
                end)
            else
                if vars.autostomp.connection then
                    vars.autostomp.connection:Disconnect()
                    vars.autostomp.connection = nil
                end
            end
        end
    }),

    anti_stomp = sections.aimbot2:toggle({
        text = 'Anti-Stomp',
        state = false,
        flag = 'anti-stomp',
        callback = function(bool) 
            if bool then
                vars.antistomp.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local player = Services.Players.LocalPlayer
                    if utility.validate_player(player) and not utility.is_knocked(player, true) or not utility.is_grabbed(player, true) then
                        player.Character.Humanoid:ChangeState('Dead')
                    end
                end)
            else
                if vars.antistomp.connection then
                    vars.antistomp.connection:Disconnect()
                    vars.antistomp.connection = nil
                end
            end
        end
    }),

    anti_grab = sections.aimbot2:toggle({
        text = 'Anti-Grab',
        state = false,
        flag = 'anti-grab',
        callback = function(bool) 
            if bool then
                vars.antigrab.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local player = Services.Players.LocalPlayer
                    local GRABBING_CONSTRAINT = player.Character:FindFirstChild('GRABBING_CONSTRAINT')
                    if GRABBING_CONSTRAINT then
                        GRABBING_CONSTRAINT:Destroy()
                        wait(0.04)
                        player.Character.Humanoid:ChangeState('Dead')
                    end
                end)
            else
                if vars.antigrab.connection then
                    vars.antigrab.connection:Disconnect()
                    vars.antigrab.connection = nil
                end
            end
        end
    }),

    hitbox_expander = sections.aimbot2:toggle({
        text = 'Hitbox Expander',
        state = false,
        flag = 'hitbox-expander',
        callback = function(bool) 
            if bool then
                vars.hitboxexpander.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    for _, v in pairs(Services.Players:GetPlayers()) do
                        if v == Services.Players.LocalPlayer then
                            continue
                        end
                        if v.Character then
                            local HumanoidRootPart = v.Character:WaitForChild('HumanoidRootPart')
                            HumanoidRootPart.Size = Vector3.new(flags['hitbox-size'], flags['hitbox-size'], flags['hitbox-size'])
                            HumanoidRootPart.Transparency = 0.2
                            HumanoidRootPart.Material = Enum.Material.ForceField
                            HumanoidRootPart.Color = flags['hitbox-color'].Color
                            HumanoidRootPart.CanCollide = false 
                        end
                    end
                end)
            else
                if vars.hitboxexpander.connection then
                    vars.hitboxexpander.connection:Disconnect()
                    vars.hitboxexpander.connection = nil
                    for _, v in pairs(Services.Players:GetPlayers()) do
                        if v == Services.Players.LocalPlayer then
                            continue
                        end
                        if v.Character then
                            local HumanoidRootPart = v.Character:WaitForChild('HumanoidRootPart')
                            HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                            HumanoidRootPart.Transparency = 1
                            HumanoidRootPart.Material = Enum.Material.Plastic
                            HumanoidRootPart.Color = Color3.fromRGB(248, 248, 248)
                            HumanoidRootPart.CanCollide = true
                        end
                    end
                end
            end
        end
    }),
    
    hitbox_expander_color = sections.aimbot2:colorpicker({
        text = 'Hitbox Color',
        color = default_color,
        flag = 'hitbox-color',
        callback = function(value)

        end
    }),

    hitbox_size = sections.aimbot2:slider({
        text = 'Hitbox Size',
        min = 1,
        max = 30,
        increment = 0.1,
        flag = 'hitbox-size',
        callback = function(value) end
    }),

    --anti-aim
    strafe = sections.antiaim1:toggle({
        text = 'Target Strafe',
        state = false,
        flag = 'target-strafe',
        callback = function(bool) end
    }),
    
    strafe_key = sections.antiaim1:keybind({
        text = 'Target Strafe Key',
        flag = 'target-strafe-key',
        mode = 'toggle',
        bind = 'None',
        callback = function(key) end
    }),

    strafe_speed = sections.antiaim1:slider({
        text = 'Strafe Speed',
        min = 0,
        max = 255,
        increment = 0.1,
        flag = 'target-strafe-speed',
        callback = function(value) end
    }),

    strafe_distance = sections.antiaim1:slider({
        text = 'Strafe Distance',
        min = 0,
        max = 100,
        increment = 0.1,
        flag = 'target-strafe-distance',
        callback = function(value) end
    }),

    strafe_height = sections.antiaim1:slider({
        text = 'Strafe Height',
        min = 0,
        max = 50,
        increment = 0.1,
        flag = 'target-strafe-height',
        callback = function(value) end
    }),

    desync = sections.antiaim2:toggle({
        text = 'Desync',
        state = false,
        flag = 'desync',
        callback = function(bool) end
    }),

    visualize_desync = sections.antiaim2:toggle({
        text = 'Visualize Desync',
        state = false,
        flag = 'visualize-desync',
        callback = function(bool) end
    }),

    visualize_color = sections.antiaim2:colorpicker({
        text = 'Visualize Color',
        color = default_color,
        flag = 'visualize-color',
        callback = function(value)

        end
    }),
    
    desync_key = sections.antiaim2:keybind({
        text = 'Desync Key',
        flag = 'desync-key',
        mode = 'toggle',
        bind = 'None',
        callback = function(key) end
    }),

    attachtarget = sections.antiaim2:toggle({
        text = 'Attach Target',
        state = false,
        flag = 'attach-target',
        callback = function(bool) end
    }),

    desync_type = sections.antiaim2:dropdown({
        text = 'Desync Types',
        values = {'Custom', 'Random', 'Target Strafe', 'Roll', 'Destroy Cheaters'},
        flag = 'desync-type',
        callback = function(selected)
            if #vars.desync.customsliders ~= 0 then 
                for _,v in pairs(vars.desync.customsliders) do
                    v:set_visible(selected == 'Custom' and true or false)
                end
                for _,v in pairs(vars.desync.strafesliders) do
                    v:set_visible(selected == 'Target Strafe' and true or false)
                end
                for _,v in pairs(vars.desync.strafesliders) do
                    v:set_visible(selected == 'Destroy Cheaters' and true or false)
                end
                for _,v in pairs(vars.desync.randomsliders) do
                    v:set_visible(selected == 'Random' and true or false)
                end
            end 
        end
    }),

    setup_desync = function()
        table.insert(vars.desync.customsliders, sections.antiaim2:slider({text = 'Position X', min = -15, max = 15, increment = 0.1, default = 0, suffix = 'm', flag = 'desync-x'}))
        table.insert(vars.desync.customsliders, sections.antiaim2:slider({text = 'Position Y', min = -15, max = 15, increment = 0.1, default = 0, suffix = 'm', flag = 'desync-y'}))
        table.insert(vars.desync.customsliders, sections.antiaim2:slider({text = 'Position Z', min = -15, max = 15, increment = 0.1, default = 0, suffix = 'm', flag = 'desync-z'}))
        table.insert(vars.desync.customsliders, sections.antiaim2:slider({text = 'Rotation X', min = -180, max = 180, increment = 0.1, default = 0, suffix = '°', flag = 'rotation-x'}))
        table.insert(vars.desync.customsliders, sections.antiaim2:slider({text = 'Rotation Y', min = -180, max = 180, increment = 0.1, default = 0, suffix = '°', flag = 'rotation-y'}))
        table.insert(vars.desync.customsliders, sections.antiaim2:slider({text = 'Rotation Z', min = -180, max = 180, increment = 0.1, default = 0, suffix = '°', flag = 'rotation-z'}))

        table.insert(vars.desync.strafesliders, sections.antiaim2:slider({text = 'Radius', min = -15, max = 15, increment = 0.1, default = 10, suffix = 'm', flag = 'desync-strafe-radius'}))
        table.insert(vars.desync.strafesliders, sections.antiaim2:slider({text = 'Speed', min = -15, max = 15, increment = 0.1, default = 10, suffix = 'm/s', flag = 'desync-strafe-speed'}))
        table.insert(vars.desync.strafesliders, sections.antiaim2:slider({text = 'Height', min = -15, max = 15, increment = 0.1, default = 0, suffix = 'm', flag = 'desync-strafe-height'}))

        table.insert(vars.desync.randomsliders, sections.antiaim2:slider({text = 'Random Range', min = 0, max = 50, increment = 0.1, default = 0, suffix = 'st', flag = 'desync-random-range'}))

        for _, v in pairs(vars.desync.customsliders) do v:set_visible(false) end
        for _, v in pairs(vars.desync.strafesliders) do v:set_visible(true) end
        for _, v in pairs(vars.desync.randomsliders) do v:set_visible(false) end
    end,

    -- movement
    cframe_speed = sections.movement1:toggle({
        text = 'CFrame Speed',
        state = false,
        flag = 'cframe-speed',
        callback = function(bool) end
    }),
    
    cframe_speed_key = sections.movement1:keybind({
        text = 'CFrame Speed Key',
        flag = 'cframe-speed-key',
        mode = 'toggle',
        bind = 'None',
        callback = function(key) end
    }),

    cframe_speed_amt = sections.movement1:slider({
        text = 'CFrame Speed Amount',
        min = 0.1,
        max = 10,
        increment = 0.1,
        flag = 'cframe-amount',
        callback = function(value) end
    }),

    fly = sections.movement1:toggle({
        text = 'Fly',
        state = false,
        flag = 'fly',
        callback = function(bool) end
    }),
    
    fly_key = sections.movement1:keybind({
        text = 'Fly Key',
        flag = 'fly-key',
        mode = 'toggle',
        bind = 'None',
        callback = function(key) end
    }),

    fly_speed = sections.movement1:slider({
        text = 'Fly Speed',
        min = 0,
        max = 500,
        increment = 0.1,
        flag = 'fly-speed',
        callback = function(value) end
    }),

    lmg_buy = sections.movement2:button({
        enabled = true,
        text = 'LMG Buy',
        flag = 'lmg-buy',
        callback = function()
            local player = Services.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-618.458618, 23.2457371, -303.713989, 0.999983668, 4.94622565e-09, 0.00571341487, -4.49238158e-09, 1, -7.94476591e-08, -0.00571341487, 7.9420694e-08, 0.999983668)
        end
    }),

    bank = sections.movement2:button({
        enabled = true,
        text = 'Bank',
        flag = 'bank',
        callback = function()
            local player = Services.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-437.125885, 38.9783134, -285.587372, 0.0165725499, 5.298579e-08, -0.99986279, 1.16139711e-08, 1, 5.31855591e-08, 0.99986279, -1.24937944e-08, 0.0165725499)
        end
    }),

    vault = sections.movement2:button({
        enabled = true,
        text = 'Vault',
        flag = 'vault',
        callback = function()
            local player = Services.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-660.882446, -31.0535831, -286.008942, -6.10525021e-05, -3.81673608e-08, -1, -6.78549341e-08, 1, -3.81632184e-08, 1, 6.78526035e-08, -6.10525021e-05)
        end
    }),

    --Visuals
    esp = sections.visuals1:toggle({
        text = 'Esp',
        state = false,
        flag = 'esp',
        callback = function(bool) end
    }),

    esp_color = sections.visuals1:colorpicker({
        text = 'ESP Color',
        color = default_color,
        flag = 'esp-color',
        callback = function(value)

        end
    }),

    esp_types = sections.visuals1:dropdown({
        text = 'Esp Types',
        multi = true,
        values = {'Name', 'Health', 'Box'},
        flag = 'esp-types',
        callback = function(selected) end
    }),

    glow = sections.visuals1:toggle({
        text = 'Glow',
        state = false,
        flag = 'glow',
        callback = function(bool)
            if bool then
                vars.glow.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    for _, v in pairs(Services.Players:GetPlayers()) do
                        if v ~= Services.Players.LocalPlayer and v.Character then
                            if not v.Character:FindFirstChild('Glow') then
                                local highlight = Instance.new('Highlight')
                                highlight.Name = 'Glow'
                                highlight.Parent = v.Character
                                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                highlight.FillTransparency = 1
                                highlight.OutlineTransparency = 0
                                highlight.OutlineColor = flags['glow-color'].Color
                            end
                        end
                    end
                end)
            else
                if vars.glow.connection then
                    vars.glow.connection:Disconnect()
                    vars.glow.connection = nil
                    for _, v in pairs(Services.Players:GetPlayers()) do
                        if v ~= Services.Players.LocalPlayer and v.Character then
                            local highlight = v.Character:FindFirstChild('Glow')
                            if highlight then
                                highlight:Destroy()
                            end
                        end
                    end
                end
            end
        end
    }),
    
    glow_color = sections.visuals1:colorpicker({
        text = 'Glow Color',
        color = default_color,
        flag = 'glow-color',
        callback = function(value)
            for _, v in pairs(Services.Players:GetPlayers()) do
                if v ~= Services.Players.LocalPlayer and v.Character then
                    if v.Character:FindFirstChild('Glow') then
                        v.Character:FindFirstChild('Glow').OutlineColor = value
                    end
                end
            end
        end
    }),

    fog = sections.visuals1:toggle({
        text = 'Fog',
        state = false,
        flag = 'fog',
        callback = function(bool)
            if bool then
                Services.Lighting.FogColor = default_color
            else
                Services.Lighting.FogColor = cache.FogColor
            end
        end
    }),
    
    fog_color = sections.visuals1:colorpicker({
        text = 'Fog Color',
        color = default_color,
        flag = 'fog-color',
        callback = function(value)
            if flags['fog'] then
                Services.Lighting.FogColor = value
            end
        end
    }),

    fog_start = sections.visuals1:slider({
        text = 'Fog Start',
        min = 100,
        max = 10000,
        increment = 0.1,
        flag = 'fog-start',
        callback = function(value)
            if flags['fog'] then
                Services.Lighting.FogStart = value
            else
                Services.Lighting.FogStart = cache.FogStart
            end
        end
    }),

    fog_end = sections.visuals1:slider({
        text = 'Fog End',
        min = 100,
        max = 10000,
        increment = 0.1,
        flag = 'fog-end',
        callback = function(value)
            if flags['fog'] then
                Services.Lighting.FogEnd = value
            else
                Services.Lighting.FogEnd = cache.FogEnd
            end
        end
    }),

    aura = sections.visuals2:toggle({
        text = 'Aura',
        state = false,
        flag = 'aura',
        callback = function(bool)
            if bool then
                vars.aura.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local LocalPlayer = Services.Players.LocalPlayer
                    local Character = LocalPlayer.Character or LocalPlayer:WaitForChild('Character')
                    local HumanoidRootPart = Character.HumanoidRootPart or Character:WaitForChild('HumanoidRootPart')

                    if not vars.aura.stored then return end

                    for _, obj in ipairs(Character:GetChildren()) do
                        if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
                            obj.Transparency = 1
                        end
                        if obj:IsA('Accessory') or obj:IsA('Hat') then
                            local handle = obj:FindFirstChild('Handle')
                            if handle then
                                handle.Transparency = 1
                            end
                        end
                    end
                    for _, part in ipairs(Character:GetChildren()) do
                        if part:IsA('BasePart') and not part:FindFirstChild('Aura Part') and part.Name ~= 'HumanoidRootPart' then
                            local clone = vars.aura.stored:Clone()
                            clone['Aura Part'].Name = 'Aura Part'
                            clone['Aura Part'].Parent = part
                            local auraPart = part:FindFirstChild('Aura Part')
                            if auraPart then
                                local emitter = auraPart:FindFirstChild('aura')
                                if emitter then
                                    emitter.Color = ColorSequence.new(flags['aura-color'].Color)
                                end
                            end

                            clone:Destroy()
                        end
                    end
                end)
            else
                if vars.aura.connection then
                    vars.aura.connection:Disconnect()
                    vars.aura.connection = nil
                    for _, obj in ipairs(Services.Players.LocalPlayer.Character:GetChildren()) do
                        if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
                            obj.Transparency = 0
                        end
                        if obj:IsA('Accessory') or obj:IsA('Hat') then
                            local handle = obj:FindFirstChild('Handle')
                            if handle then
                                handle.Transparency = 0
                            end
                        end
                    end
                    for _, part in ipairs(Services.Players.LocalPlayer.Character:GetChildren()) do
                        if part:IsA('BasePart') and part:FindFirstChild('Aura Part') then
                            part['Aura Part']:Destroy()
                        end
                    end
                end
            end
        end
    }),
    
    aura_color = sections.visuals2:colorpicker({
        text = 'Aura Color',
        color = default_color,
        flag = 'aura-color',
        callback = function(value)
            for _, part in ipairs(Services.Players.LocalPlayer.Character:GetChildren()) do
                local auraPart = part:FindFirstChild('Aura Part')
                if auraPart then
                    local emitter = auraPart:FindFirstChild('aura')
                    if emitter then
                        emitter.Color = ColorSequence.new(value)
                    end
                end
            end
        end
    }),

    animations = sections.visuals2:toggle({
        text = 'Animations',
        state = false,
        flag = 'animations',
        callback = function(bool)
            if bool then
                vars.animations.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local player = Services.Players.LocalPlayer
                    local character = player.Character
                    local humanoid = character:FindFirstChildOfClass('Humanoid')
                    if not humanoid then return end
                    local animate = character:FindFirstChild('Animate')

                    if flags['animations-select'] == 'Zombie' and vars.animations.animation ~= 'Zombie' then
                        animate.Disabled = true
                        vars.animations.animation = 'Zombie'
                        utility.stop_animation(player)
                        animate.walk.WalkAnim.AnimationId = 'rbxassetid://616168032'
                        animate.run.RunAnim.AnimationId = 'rbxassetid://616163682'
                        animate.fall.FallAnim.AnimationId = 'rbxassetid://10921148939'
                        animate.jump.JumpAnim.AnimationId = 'rbxassetid://10921242013'
                        animate.idle.Animation1.AnimationId = 'rbxassetid://10921344533'
                        animate.idle.Animation2.AnimationId = 'rbxassetid://10921345304'
                        animate.Disabled = false
                    elseif flags['animations-select'] == 'Toy' and vars.animations.animation ~= 'Toy' then
                        animate.Disabled = true
                        vars.animations.animation = 'Toy'
                        utility.stop_animation(player)
                        animate.walk.WalkAnim.AnimationId = 'rbxassetid://10921312010'
                        animate.run.RunAnim.AnimationId = 'rbxassetid://10921306285'
                        animate.fall.FallAnim.AnimationId = 'rbxassetid://10921148939'
                        animate.jump.JumpAnim.AnimationId = 'rbxassetid://10921242013'
                        animate.idle.Animation1.AnimationId = 'rbxassetid://10921301576'
                        animate.idle.Animation2.AnimationId = 'rbxassetid://10921302207'
                        animate.Disabled = false
                    elseif flags['animations-select'] == 'Vampire' and vars.animations.animation ~= 'Vampire' then
                        animate.Disabled = true
                        vars.animations.animation = 'Vampire'
                        utility.stop_animation(player)
                        animate.walk.WalkAnim.AnimationId = 'rbxassetid://10921326949'
                        animate.run.RunAnim.AnimationId = 'rbxassetid://10921320299'
                        animate.fall.FallAnim.AnimationId = 'rbxassetid://10921148939'
                        animate.jump.JumpAnim.AnimationId = 'rbxassetid://10921242013'
                        animate.idle.Animation1.AnimationId = 'rbxassetid://10921315373'
                        animate.idle.Animation2.AnimationId = 'rbxassetid://10921316709'
                        animate.Disabled = false
                    elseif flags['animations-select'] == 'Custom' and vars.animations.animation ~= 'Custom' then
                        animate.Disabled = true
                        vars.animations.animation = 'Custom'
                        utility.stop_animation(player)
                        animate.walk.WalkAnim.AnimationId = 'rbxassetid://616168032'
                        animate.run.RunAnim.AnimationId = 'rbxassetid://616163682'
                        animate.fall.FallAnim.AnimationId = 'rbxassetid://10921148939'
                        animate.jump.JumpAnim.AnimationId = 'rbxassetid://10921242013'
                        animate.idle.Animation1.AnimationId = 'rbxassetid://10921315373'
                        animate.idle.Animation2.AnimationId = 'rbxassetid://10921316709'
                        animate.Disabled = false
                    elseif flags['animations-select'] == 'Custom2' and vars.animations.animation ~= 'Custom2' then
                        animate.Disabled = true
                        vars.animations.animation = 'Custom2'
                        utility.stop_animation(player)
                        animate.walk.WalkAnim.AnimationId = 'rbxassetid://616168032'
                        animate.run.RunAnim.AnimationId = 'rbxassetid://616163682'
                        animate.fall.FallAnim.AnimationId = 'rbxassetid://10921148939'
                        animate.jump.JumpAnim.AnimationId = 'rbxassetid://10921242013'
                        animate.idle.Animation1.AnimationId = 'rbxassetid://133806214992291'
                        animate.idle.Animation2.AnimationId = 'rbxassetid://94970088341563'
                        animate.Disabled = false
                    elseif flags['animations-select'] == 'Bold' and vars.animations.animation ~= 'Bold' then
                        animate.Disabled = true
                        vars.animations.animation = 'Bold'
                        utility.stop_animation(player)
                        animate.walk.WalkAnim.AnimationId = 'rbxassetid://16738340646'
                        animate.run.RunAnim.AnimationId = 'rbxassetid://16738337225'
                        animate.fall.FallAnim.AnimationId = 'rbxassetid://10921148939'
                        animate.jump.JumpAnim.AnimationId = 'rbxassetid://10921242013'
                        animate.idle.Animation1.AnimationId = 'rbxassetid://16738333868'
                        animate.idle.Animation2.AnimationId = 'rbxassetid://16738334710'
                        animate.Disabled = false
                    elseif flags['animations-select'] == 'Elder' and vars.animations.animation ~= 'Elder' then
                        animate.Disabled = true
                        vars.animations.animation = 'Elder'
                        utility.stop_animation(player)
                        animate.walk.WalkAnim.AnimationId = 'rbxassetid://10921111375'
                        animate.run.RunAnim.AnimationId = 'rbxassetid://10921104374'
                        animate.fall.FallAnim.AnimationId = 'rbxassetid://10921148939'
                        animate.jump.JumpAnim.AnimationId = 'rbxassetid://10921242013'
                        animate.idle.Animation1.AnimationId = 'rbxassetid://10921101664'
                        animate.idle.Animation2.AnimationId = 'rbxassetid://10921102574'
                        animate.Disabled = false
                    end
                end)
            else
                if vars.animations.connection then
                    vars.animations.connection:Disconnect()
                    vars.animations.connection = nil
                end
            end
        end
    }),

    animations_select = sections.visuals2:dropdown({
        text = 'Animations',
        values = {'Zombie', 'Toy', 'Vampire', 'Elder', 'Bold', 'Custom', 'Custom2'},
        flag = 'animations-select',
        callback = function(selected) end
    }),

    headless = sections.visuals2:toggle({
        text = 'Headless',
        state = false,
        flag = 'headless',
        callback = function(bool)
            local connection = nil
            if bool then
                local player = Services.Players.LocalPlayer
                local head = player.Character:WaitForChild('Head', 10)
                local face = head:FindFirstChildOfClass('Decal')
                
                connection = utility.new_connection(player.CharacterAdded, function(character) 
                    head = character:WaitForChild('Head', 10)
                    face = head:FindFirstChildOfClass('Decal')
    
                    if head and face then
                        head.Transparency = 1
                        face.Transparency = 1
                    end
                end)
    
                if head and face then
                    head.Transparency = 1
                    face.Transparency = 1
                end
    
                if not bool then
                    if head and face then
                        head.Transparency = 0
                        face.Transparency = 0
                    end
                end 
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end
    }),

    skybox = sections.visuals1:toggle({
        text = 'Skybox',
        state = false,
        flag = 'skybox',
        callback = function(bool)
            local World = {
                Sky = Instance.new('Sky'),
                BloomEffect = Instance.new('BloomEffect'),
                ColorCorrectionEffect = Instance.new('ColorCorrectionEffect'),
                SunRaysEffect = Instance.new('SunRaysEffect')
            }
            if bool then
                vars.skybox.connection = utility.new_connection(Services.RunService.Heartbeat, function()            
                    Services.Lighting.Brightness = 2.25
                    Services.Lighting.ExposureCompensation = 0.1
                    Services.Lighting.ClockTime = 17.55
            
                    World.Sky.MoonAngularSize = 11
                    World.Sky.SkyboxBk = 'http://www.roblox.com/asset/?id=' .. tostring(skyboxes[flags['skyboxes']][1])
                    World.Sky.SkyboxDn = 'http://www.roblox.com/asset/?id=' .. tostring(skyboxes[flags['skyboxes']][2])
                    World.Sky.SkyboxFt = 'http://www.roblox.com/asset/?id=' .. tostring(skyboxes[flags['skyboxes']][3])
                    World.Sky.SkyboxLf = 'http://www.roblox.com/asset/?id=' .. tostring(skyboxes[flags['skyboxes']][4])
                    World.Sky.SkyboxRt = 'http://www.roblox.com/asset/?id=' .. tostring(skyboxes[flags['skyboxes']][5])
                    World.Sky.SkyboxUp = 'http://www.roblox.com/asset/?id=' .. tostring(skyboxes[flags['skyboxes']][6])
                    World.Sky.StarCount = 3000
                    World.Sky.SunAngularSize = 11
                    World.Sky.Parent = Services.Lighting
            
                    World.BloomEffect.Intensity = 1
                    World.BloomEffect.Size = 24
                    World.BloomEffect.Threshold = 2
                    World.BloomEffect.Parent = Services.Lighting
            
                    World.ColorCorrectionEffect.Brightness = 0
                    World.ColorCorrectionEffect.Contrast = 0.1
                    World.ColorCorrectionEffect.Saturation = 0.25
                    World.ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
                    World.ColorCorrectionEffect.Parent = Services.Lighting
            
                    World.SunRaysEffect.Intensity = 0.01
                    World.SunRaysEffect.Spread = 0.1
                    World.SunRaysEffect.Parent = Services.Lighting
                end)
            else
                if vars.skybox.connection then
                    vars.skybox.connection:Disconnect()
                    vars.skybox.connection = nil
                    for i,v in pairs(Services.Lighting:GetChildren()) do
                        v:Destroy()
                    end
                    Services.Lighting.Brightness = 2
                    Services.Lighting.ExposureCompensation = 0
                end
            end
        end
    }),

    skyboxes = sections.visuals1:dropdown({
        text = 'Skyboxes',
        values = {'MilkyWay', 'Purple', 'Red', 'Blue', 'Pink', 'Minecraft', 'SpingleBoob'},
        flag = 'skyboxes',
        callback = function(selected) end
    }),

    -- misc
    item_sorter = sections.misc1:toggle({
        text = 'Item Sorter',
        state = false,
        flag = 'item-sorter',
        callback = function(bool) end
    }),
    
    item_sorter_key = sections.misc1:keybind({
        text = 'Item Sorter Key',
        flag = 'item-sorter-key',
        mode = 'hold',
        bind = 'None',
        callback = function(key)

        end
    }),

    auto_buy_armor = sections.misc1:toggle({
        text = 'Auto Armor',
        state = false,
        flag = 'auto-armor',
        callback = function(bool) end 
    }),

    auto_knife = sections.misc1:toggle({
        text = 'Buy Knife',
        state = false,
        flag = 'buy-knife',
        callback = function(bool)
            if bool then
                local player = Services.Players.LocalPlayer
                vars.buyknife.connection = utility.new_connection(player.CharacterAdded, function(character)
                    task.wait(1)
                    utility.auto_buy(items.guns["Knife"], 'gun', 1)
                end)
            else
                if vars.buyknife.connection then
                    vars.buyknife.connection:Disconnect()
                    vars.buyknife.connection = nil
                end
            end
        end
    }),

    chat_spy = sections.misc1:toggle({
        text = 'Chat Spy',
        state = false,
        flag = 'chat-spy',
        callback = function(bool)
            if is_game then
                local chat = Services.Players.LocalPlayer.PlayerGui.Chat.Frame
                if bool then
                    chat.ChatChannelParentFrame.Visible = true
                    chat.ChatBarParentFrame.Position = chat.ChatChannelParentFrame.Position +UDim2.new(UDim.new(),chat.ChatChannelParentFrame.Size.Y)
                else
                    chat.ChatChannelParentFrame.Visible = false
                    chat.ChatBarParentFrame.Position = UDim2.new(0,0,0,2)
                end 
            end
        end
    }),

    cash_aura = sections.misc1:toggle({
        text = 'Cash Aura',
        state = false,
        flag = 'cash-aura',
        callback = function(bool)
            if bool then
                vars.cashaura.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    pcall(
                        function()
                            for _, v in pairs(Services.Workspace.Ignored.Drop:GetChildren()) do
                                if v.Name == 'MoneyDrop' and (v.Position - Services.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 15 then
                                    if (v.Position - Services.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 15 then
                                        fireclickdetector(v.ClickDetector)
                                    end
                                end
                            end
                        end
                    )
                end)
            else
                if vars.cashaura.connection then
                    vars.cashaura.connection:Disconnect()
                    vars.cashaura.connection = nil
                end
            end
        end
    }),

    auto_farm = sections.misc1:toggle({
        text = 'Auto Farm',
        state = false,
        flag = 'auto-farm',
        risky = true,
        callback = function(bool)
            if bool then
                autofarm:start()
            else
                autofarm:stop()
            end
        end
    }),

    drop_cash = sections.misc1:toggle({
        text = 'Drop Cash',
        state = false,
        flag = 'drop-cash',
        callback = function(bool)
            if bool then
                vars.cashdrop.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local player = Services.Players.LocalPlayer
                    local DropAm = 15000
                    if player.DataFolder.Currency.Value >= 15000 then
                        DropAm = '15000'
                    else
                        DropAm = tostring(player.DataFolder.Currency.Value)
                    end
                    local args = {'DropMoney', DropAm}
                    Services.ReplicatedStorage.MainEvent:FireServer(unpack(args))
                end)
            else
                if vars.cashdrop.connection then
                    vars.cashdrop.connection:Disconnect()
                    vars.cashdrop.connection = nil
                end
            end
        end
    }),

    disable_seats = sections.misc1:toggle({
        text = 'Disable Seats',
        state = false,
        flag = 'disable-seats',
        callback = function(bool)
            if bool then
                utility.toggle_seats(false)
            else
                utility.toggle_seats(true)
            end
        end
    }),

    lettuce = sections.misc1:button({
        enabled = true,
        text = 'Lettuce',
        flag = 'lettuce',
        callback = function(bool)
            local player = Services.Players.LocalPlayer
    
            local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')
            local LettuceTool = Instance.new('Tool', player.Backpack)
            LettuceTool.RequiresHandle = false
            LettuceTool.CanBeDropped = true
            LettuceTool.Name = 'Lettuce'

            local function eat()
                local Food = player.Backpack:FindFirstChild('[Lettuce]')
                if Food and player.Character.BodyEffects.Attacking.Value == false then
                    Humanoid:EquipTool(Food)
                    player.Character:FindFirstChildWhichIsA('Tool'):Activate()
                    repeat wait() until player.Character.BodyEffects.Attacking.Value == false
                    Humanoid:EquipTool(LettuceTool)
                end
            end

            utility.new_connection(LettuceTool.Activated, function() eat() end)
            utility.new_connection(LettuceTool.Equipped, function()
                vars.lettuce.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    while player.Character:FindFirstChild('Lettuce') do
                        wait()
                        local pathto = Services.Workspace.Ignored.Shop['[Lettuce] - $5'].Head
                        local HRP = player.Character:FindFirstChild('HumanoidRootPart')
                        if HRP and player.Character:FindFirstChild('Lettuce') then
                            local Away = (HRP.Position - pathto.Position).Magnitude
                            if Away <= 30 then
                                for i, v in pairs(player.Backpack:GetChildren()) do
                                    if v.Name == '[Lettuce]' then
                                        v.Parent = player.Character
                                    end
                                end
                                fireclickdetector(pathto.Parent:FindFirstChild('ClickDetector'))
                            end
                        end
                    end
                end)
            end)
        end
    }),

    emote = sections.misc2:toggle({
        text = 'Emote',
        state = false,
        flag = 'emote',
        callback = function(bool) end
    }),
    
    emote_key = sections.misc2:keybind({
        text = 'Emote Key',
        flag = 'emote-key',
        mode = 'hold',
        bind = 'None',
        callback = function(key)
            if key  and flags['emote'] then
                local player = Services.Players.LocalPlayer
                if utility.validate_player(player) then
                    utility.play_animation(emotes[flags['emotes']], math.huge, 1, player, true) 
                end
            end
        end
    }),

    emotes = sections.misc2:dropdown({
        text = 'Emotes',
        flag = 'emotes',
        values = {'Yungblud Happier Jump', 'Sturdy Dance - Ice Spice', 'Elton John - Rock Out', 'Elton John - Heart Shuffle', 'Xaviers Dance'},
        callback = function(selected)
            
        end
    }),

    void = sections.misc2:toggle({
        text = 'Void',
        state = false,
        flag = 'void',
        callback = function(bool) end
    }),
    
    void_key = sections.misc2:keybind({
        text = 'Void Key',
        flag = 'void-key',
        mode = 'hold',
        bind = 'None',
        callback = function(key) end
    }),

    anti_void = sections.misc2:toggle({
        text = 'Anti Void',
        flag = 'anti-void',
        callback = function(value)
            if value then
                vars.antivoid.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    Services.Workspace.FallenPartsDestroyHeight = -9e9
                    wait(2)
                end)
            else
                if vars.antivoid.connection then
                    vars.antivoid.connection:Disconnect()
                    vars.antivoid.connection = nil
                    Services.Workspace.FallenPartsDestroyHeight = -500
                end
            end
        end
    }),

    rocket_teleport = sections.misc2:toggle({
        text = 'Rocket Teleport',
        flag = 'rocket-tp',
        state = false,
        callback = function(value) end
    }),

    auto_buy = sections.misc3:dropdown({
        text = 'Weapons',
        flag = 'auto-buy', 
        values = items_values.guns,
        callback = function(selected)

        end
    }),

    auto_armor = sections.misc3:dropdown({
        text = 'Armor',
        flag = 'armor', 
        values = items_values.armor,
        callback = function(selected)

        end
    }),

    buy_guns = sections.misc3:button ({
        text = 'Buy Gun',
        flag = 'buy-gun',
        callback = function(bool)
            utility.auto_buy(items.guns[flags['auto-buy']], 'gun', 1)
        end
    }),

    buy_ammo = sections.misc3:button ({
        text = 'Buy Ammo',
        flag = 'buy-ammo',
        callback = function(bool)
            utility.auto_buy(items.ammo[flags['auto-buy']], 'ammo', 5)
        end
    }),

    buy_armor = sections.misc3:button ({
        text = 'Buy Armor',
        flag = 'buy-Armor',
        callback = function(bool)
            utility.auto_buy(items.armor[flags['armor']], 'armor', 1)
        end
    }),

    --playerlist
    playerlist = sections.players1:dropdown({
        text = 'Players',
        values = {},
        flag = 'players',
        max = 100,
        callback = function(selected) end
    }),

    loopkill = sections.players2:toggle({
        text = 'Loop Kill',
        flag = 'loop-kill',
        callback = function(bool) end
    }),    

    spectate = sections.players2:toggle({
        text = 'Spectate',
        flag = 'spectate',
        callback = function(bool)
            if bool then
                vars.spectate.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local selectedDisplayName = flags['players']
                    local selectedPlayer = nil
                    for _, player in ipairs(Services.Players:GetPlayers()) do
                        if player.DisplayName == selectedDisplayName then
                            selectedPlayer = player
                            break
                        end
                    end

                    if not utility.validate_player(selectedPlayer) then return  end
                    Services.Workspace.CurrentCamera.CameraSubject = selectedPlayer.Character
                end)
            else
                if vars.spectate.connection then
                    vars.spectate.connection:Disconnect()
                    vars.spectate.connection = nil
                    Services.Workspace.CurrentCamera.CameraSubject = Services.Players.LocalPlayer.Character
                end
            end
        end
    }),

    headsit = sections.players2:toggle({
        text = 'Head Sit',
        flag = 'head-sit',
        callback = function(bool)
            if bool then
                vars.headsit.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local selectedDisplayName = flags['players']
                    local localPlayer = Services.Players.LocalPlayer
                    local selectedPlayer = nil
                    for _, player in ipairs(Services.Players:GetPlayers()) do
                        if player.DisplayName == selectedDisplayName then
                            selectedPlayer = player
                            break
                        end
                    end

                    if not utility.validate_player(selectedPlayer) then return  end
                    local targethead = selectedPlayer.Character.Head
					localPlayer.Character.Humanoid.Sit = true
					localPlayer.Character.HumanoidRootPart.CFrame = targethead.CFrame * CFrame.new(0,2,0)
					localPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                end)
            else
                if vars.headsit.connection then
                    vars.headsit.connection:Disconnect()
                    vars.headsit.connection = nil
                    Services.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
            end        
        end
    }),

    bang = sections.players2:toggle({
        text = 'Bang',
        flag = 'bang',
        callback = function(bool)
            if bool then
                vars.bang.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local selectedDisplayName = flags['players']
                    local localPlayer = Services.Players.LocalPlayer
                    local selectedPlayer = nil
                    for _, player in ipairs(Services.Players:GetPlayers()) do
                        if player.DisplayName == selectedDisplayName then
                            selectedPlayer = player
                            break
                        end
                    end

                    if not utility.validate_player(selectedPlayer) then return  end
                    if not vars.bang.once then
                        utility.play_animation(5918726674, 0, 1, localPlayer, false)
                        vars.bang.once = true
                    end
                    local targetRoot = selectedPlayer.Character.HumanoidRootPart
					localPlayer.Character.HumanoidRootPart.CFrame = targetRoot.CFrame * CFrame.new(0,0,1.1)
					localPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                end)
            else
                if vars.bang.connection then
                    vars.bang.connection:Disconnect()
                    vars.bang.connection = nil
                    Services.Players.LocalPlayer.Character.Humanoid.Sit = false
                    utility.stop_animation(Services.Players.LocalPlayer)
                    vars.bang.once = false
                end
            end             
        end
    }),

    fling = sections.players2:toggle({
        text = 'Fling',
        flag = 'fling',
        callback = function(bool)
            if bool then    
                vars.fling.connection = utility.new_connection(Services.RunService.Heartbeat, function()
                    local localPlayer = Services.Players.LocalPlayer
                    local character = localPlayer.Character
                    local humanoid = character and character:FindFirstChild('Humanoid')
                    if not character or not character:FindFirstChild('HumanoidRootPart') then return end

                    local selectedDisplayName = flags['players']
                    local selectedPlayer = nil
    
                    for _, player in ipairs(Services.Players:GetPlayers()) do
                        if player.DisplayName == selectedDisplayName and player ~= localPlayer then
                            selectedPlayer = player
                            break
                        end
                    end
    
                    if utility.validate_player(selectedPlayer) then
                        local targetRoot = selectedPlayer.Character.HumanoidRootPart
                        local HumanoidRootPart = character.HumanoidRootPart
                        HumanoidRootPart.Velocity = Vector3.new(2500, 2500, 2500)
                        if vars.fling.switch then
                            HumanoidRootPart.CFrame = targetRoot.CFrame * CFrame.new(0, -0.3, 0)
                        else
                            HumanoidRootPart.CFrame = targetRoot.CFrame * CFrame.new(0, -50000, 0)
                        end
                    end
                end)
            else
                if vars.fling.connection then
                    vars.fling.connection:Disconnect()
                    vars.fling.connection = nil
                    local localPlayer = Services.Players.LocalPlayer
                    local character = localPlayer.Character
                    character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end
            end             
        end
    }),

    teleport = sections.players2:button({
        text = 'Telport To',
        flag = 'tp-to',
        callback = function(state)
            local selectedDisplayName = flags['players']
            local selectedPlayer = nil
            for _, player in ipairs(Services.Players:GetPlayers()) do
                if player.DisplayName == selectedDisplayName then
                    selectedPlayer = player
                    break
                end
            end
            if not utility.validate_player(selectedPlayer) then return end
            local player = Services.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame
        end
    }), 

    bring = sections.players2:button({
        text = 'Bring',
        flag = 'bring',
        callback = function(state)
            local selectedDisplayName = flags['players']
            local selectedPlayer = nil
            for _, player in ipairs(Services.Players:GetPlayers()) do
                if player.DisplayName == selectedDisplayName then
                    selectedPlayer = player
                    break
                end
            end
            if not utility.validate_player(selectedPlayer) and not utility.is_grabbed(selectedPlayer) then return end
            local player = Services.Players.LocalPlayer
            local StartTime = tick()
            local gun = utility.get_gun(player)
            local Pos = CFrame.new(selectedPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 0) + (selectedPlayer.Character.Humanoid.MoveDirection*math.random(0.12,0.57)*selectedPlayer.Character.Humanoid.WalkSpeed)) * CFrame.new(selectedPlayer.Character.Humanoid.MoveDirection * 5)
            Pos = (Pos * CFrame.Angles(math.rad(90),0,math.rad(180))) - Vector3.new(0,25,0)
            vars.bring.old = player.Character.HumanoidRootPart.CFrame
            
            repeat task.wait()
                if gun then
                    player.Character.HumanoidRootPart.CFrame = Pos
                    utility.shoot_gun(selectedPlayer.Name, gun.tool, 'Head')
                else
                    warn('[Error] Hold out gun')
                end                
            until not utility.is_knocked(selectedPlayer, true) or not utility.is_grabbed(selectedPlayer, true) or tick() - StartTime >= 2

            for i = 1, 15 do
                player.Character.HumanoidRootPart.CFrame = CFrame.new(selectedPlayer.Character.UpperTorso.Position) * CFrame.new(0, 1, 0)
                task.wait(0.1)
            end

            Services.ReplicatedStorage.MainEvent:FireServer("Grabbing")
            task.wait(0.3)
            player.Character.HumanoidRootPart.CFrame = vars.bring.old
            task.wait(0.2)
            Services.ReplicatedStorage.MainEvent:FireServer("Grabbing", false)
        end
    }), 
}

local getClosestToCrosshair = function(fov, checks)
	local shortestDistance = fov
    local localPlayer = Services.Players.LocalPlayer
	local closestPlayer = nil
	local mousePosition = Services.UserInputService.GetMouseLocation(Services.UserInputService)
	local part = 'Head'

	for _, player in next, Services.Players.GetPlayers(Services.Players) do
		if player ~= localPlayer 
        and utility.is_alive(player) 
        and utility.is_player_behind_a_wall(player, checks[1]) 
        and utility.is_friends(player, checks[2]) 
        and utility.is_grabbed(player, checks[3]) 
        and utility.is_on_vehicle(player, checks[4]) 
        and utility.is_knocked(player, checks[5])
        and utility.is_forcefield(player, checks[6]) then
            
			local onScreenPosition, isOnScreen = Services.Workspace.CurrentCamera.WorldToViewportPoint(Services.Workspace.CurrentCamera, player.Character[part].Position)
			local distance = (Vector2.new(onScreenPosition.X, onScreenPosition.Y) - mousePosition).Magnitude

			if distance < shortestDistance and isOnScreen == true then
				closestPlayer = player
				shortestDistance = distance
			end
		end
	end
	return closestPlayer
end

if is_game then
    utility.new_connection(Services.Workspace.Ignored.ChildAdded, function(object)
        local isValidTarget = vars.camlock.target and vars.camlock.target.Character
        local isRocketTpEnabled = flags['rocket-tp']
        local isRelevantObject = object.Name == 'Model' or object.Name == 'GrenadeLauncherAmmo'
    
        if isValidTarget and isRocketTpEnabled and isRelevantObject then
            local target = vars.camlock.target
            local part = object:WaitForChild('Launcher')
    
            part.CFrame = CFrame.new(100, 100, 100)
            part.BodyVelocity:Destroy()
            part.TouchInterest:Destroy()
    
            local connection
            connection = utility.new_connection(Services.RunService.Heartbeat, function()
                if vars.camlock.target and vars.camlock.target.Character then
                    part.CFrame = target.Character.HumanoidRootPart.CFrame
                    part.Velocity = Vector3.new(0, 0.001, 0)
                end
            end)
    
            utility.new_connection(object.Destroying, function()
                connection:Disconnect()
            end)
        end
    end) 
end

utility.new_connection(Services.RunService.RenderStepped, function(delta_time)
    if flags['item-sorter'] and flags['item-sorter-key'].active then
        local temp = {}
        local player = Services.Players.LocalPlayer
        local backpack = player.Backpack

        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA('Tool') then
                table.insert(temp, tool)
                tool.Parent = game
            end
        end

        local allowedItems = {
            '[Double-Barrel SG]', 
            '[Revolver]', 
            '[TacticalShotgun]', 
            '[Knife]'
        }

        for _, itemName in ipairs(allowedItems) do
            local lowerItemName = string.lower(itemName)
    
            for i = #temp, 1, -1 do
                local tool = temp[i]
                if string.sub(string.lower(tool.Name), 1, string.len(lowerItemName)) == lowerItemName then
                    tool.Parent = backpack
                    table.remove(temp, i)
                    task.wait(0.105)
                end
            end
        end

        for _, tool in ipairs(temp) do
            tool.Parent = backpack
            task.wait()
        end
    end

    if flags['target-aim'] then 
        local fov = flags['fov-target-aim'] > 0 and flags['fov-target-aim'] or math.huge
        vars.targetaim.target = getClosestToCrosshair(fov, {
            [1] = table.find(flags['target-aim-checks'], 'Visible'),
            [2] = table.find(flags['target-aim-checks'], 'Friend'),
            [3] = table.find(flags['target-aim-checks'], 'Grabbed'),
            [4] = table.find(flags['target-aim-checks'], 'Vehicle'),
            [5] = table.find(flags['target-aim-checks'], 'Knocked'),
            [6] = table.find(flags['target-aim-checks'], 'ForceField'),
        })

        if flags['target-aim-circle'] and flags['fov-target-aim'] > 0 then
            local mousePos = Services.UserInputService:GetMouseLocation()
            vars.targetaim.circle.Position = mousePos
            vars.targetaim.circle.Visible = true
        else
            vars.targetaim.circle.Visible = false
        end
    
        if utility.validate_player(vars.targetaim.target) then
            local targetPart = vars.targetaim.target.Character:FindFirstChild(flags['aim-part-target-aim'])
            local localplayer = Services.Players.LocalPlayer
            local gun = utility.get_gun(localplayer)

            if targetPart and flags['target-aim-key'].active then    
                if gun and gun.tool and localplayer then 
                    if utility.get_ammo(localplayer, gun.tool.Name) > 0 then
                        utility.shoot_gun(vars.targetaim.target.Name, gun.tool, flags['aim-part-target-aim'])
                    else
                        utility.reload_gun(gun.tool) 
                    end
                end
            end

            if flags['target-aim-tracer'] then
                local screenPos, onScreen = Services.Workspace.CurrentCamera:WorldToViewportPoint(targetPart.Position)
                local mousePos = Services.UserInputService:GetMouseLocation() -- Get Mouse Position

                if onScreen then
                    vars.targetaim.tracer.From = Vector2.new(mousePos.X, mousePos.Y) -- Start from mouse
                    vars.targetaim.tracer.To = Vector2.new(screenPos.X, screenPos.Y)  -- End at target
                    vars.targetaim.tracer.Visible = true
                else
                    vars.targetaim.tracer.Visible = false
                end
            else
                vars.targetaim.tracer.Visible = false
            end
        else
            vars.targetaim.tracer.Visible = false
        end
    else
        vars.targetaim.target = nil 
        vars.targetaim.circle.Visible = false
        vars.targetaim.tracer.Visible = false
    end

    if flags['cam-lock-key'].active and flags['cam-lock'] then 
        if not vars.camlock.target then
            vars.camlock.target = getClosestToCrosshair(flags['fov-camlock'], {
                [1] = table.find(flags['camlock-checks'], 'Visible'),
                [2] = table.find(flags['camlock-checks'], 'Friend'),
                [3] = table.find(flags['camlock-checks'], 'Grabbed'),
                [4] = table.find(flags['camlock-checks'], 'Vehicle'),
                [5] = table.find(flags['camlock-checks'], 'Knocked'),
                [6] = table.find(flags['camlock-checks'], 'ForceField'),
            })
        end
        if utility.validate_player(vars.camlock.target) then
            local targetPart = vars.camlock.target.Character[flags['aim-part-camlock']]
            local camera = Services.Workspace.CurrentCamera

            local currentCFrame = camera.CFrame
            local targetCFrame = CFrame.new(currentCFrame.Position, targetPart.Position)
            local smoothingSpeed = flags['camlock-smoothing-speed'] or 0.1

            if flags['camlock-smoothing'] then
                camera.CFrame = currentCFrame:Lerp(targetCFrame, math.clamp(smoothingSpeed * delta_time, 0, 1))
                Services.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
            else
                camera.CFrame = targetCFrame
            end

            if flags['camlock-look-at'] then
                Services.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
                Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position, Vector3.new(vars.camlock.target.Character.HumanoidRootPart.CFrame.X, Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, vars.camlock.target.Character.HumanoidRootPart.CFrame.Z)) 
            else
                Services.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
            end
        end
        if not vars.camlock.notify and vars.camlock.target then
            if flags["cam-lock-notify"] then
                lib:notification({text = string.format('Cam-lock Targeting: %s, At the : %s', vars.camlock.target.DisplayName, flags['aim-part-camlock'])})  
            end
            vars.camlock.notify = true
        end
    else
        if vars.camlock.notify then
            vars.camlock.notify = false
            Services.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
            vars.camlock.target = nil 
        end
    end

    if flags['mouse-lock-key'].active and flags['mouse-lock'] then 
        if not vars.mouselock.target then
            vars.mouselock.target = getClosestToCrosshair(flags['fov-mouselock'], {
                [1] = table.find(flags['mouselock-checks'], 'Visible'),
                [2] = table.find(flags['mouselock-checks'], 'Friend'),
                [3] = table.find(flags['mouselock-checks'], 'Grabbed'),
                [4] = table.find(flags['mouselock-checks'], 'Vehicle'),
                [5] = table.find(flags['mouselock-checks'], 'Knocked'),
                [6] = table.find(flags['mouselock-checks'], 'ForceField'),
            })
        end
        if utility.validate_player(vars.mouselock.target) then
            local targetPart = vars.mouselock.target.Character[flags['aim-part-mouselock']]
            local screen = utility.world_to_screen(targetPart.Position)
            local smoothingSpeed = flags['mouselock-smoothing-speed'] or 1.1

            if flags['mouselock-smoothing'] then
                if screen.onScreen then
                    utility.move_mouse(screen.pos, smoothingSpeed, smoothingSpeed)
                end
            else
                if screen.onScreen then
                    utility.move_mouse(screen.pos, 1, 1)
                end
            end

            if flags['mouselock-look-at'] then
                Services.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
                Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position, Vector3.new(vars.mouselock.target.Character.HumanoidRootPart.CFrame.X, Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, vars.mouselock.target.Character.HumanoidRootPart.CFrame.Z)) 
            else
                Services.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
            end
        end
        if not vars.mouselock.notify and vars.mouselock.target then
            if flags["mouse-lock-notify"] then
                lib:notification({text = string.format('Mouse-lock Targeting: %s, At the : %s', vars.mouselock.target.DisplayName, flags['aim-part-mouselock'])}) 
            end
            vars.mouselock.notify = true
        end
    else
        if vars.mouselock.notify then
            vars.mouselock.notify = false
            Services.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
            vars.mouselock.target = nil 
        end
    end
end)

utility.new_connection(Services.RunService.Heartbeat, function(delta_time)
    local player = Services.Players.LocalPlayer

    if flags['auto-armor'] then 
        if not player.Character or not player.Character:FindFirstChild('BodyEffects') or not player.Character.BodyEffects:FindFirstChild('Armor') then return end
        local armor = player.Character.BodyEffects.Armor

        if not vars.armor.connection then
            vars.armor.connection = utility.new_connection(armor:GetPropertyChangedSignal("Value"), function()
                if flags['auto-armor'] and armor.Value < 130 then
                    utility.auto_buy(items.armor['High'], 'armor', 1)
                end
            end)
        end
    end

    if flags['cframe-speed-key'].active and flags['cframe-speed'] then
        local speed = flags['cframe-amount']
        local root_part = player.Character.HumanoidRootPart
        local humanoid = player.Character.Humanoid

        root_part.CFrame = root_part.CFrame + humanoid.MoveDirection * speed
    end
    
    if flags['target-strafe-key'].active and flags['target-strafe'] then
        local cframe

        if utility.validate_player(vars.camlock.target) then
            if (vars.camlock.target and vars.camlock.target.Character and vars.camlock.target.Character:FindFirstChild('HumanoidRootPart')) then
                local ctick = tick()
                cframe = vars.camlock.target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, 2 * math.pi * ctick * flags['target-strafe-speed'] % (2 * math.pi), 0) * CFrame.new(0, flags['target-strafe-height'], flags['target-strafe-distance'])
            
                player.Character.HumanoidRootPart.CFrame = cframe
            end
        end
    end
    
    if flags['fly-key'].active and flags['fly'] then
        local MoveDirection = player.Character.Humanoid.MoveDirection
        local HumanoidRootPart = player.Character.HumanoidRootPart

        local add = Vector3.new(0, (Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) and flags['fly-speed'] /  8 or Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and -flags['fly-speed'] / 8) or 0, 0)

        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + (MoveDirection * delta_time) * flags['fly-speed'] * 10
        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + add
        HumanoidRootPart.Velocity = (HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)) + Vector3.new(0, 1.9, 0)
    end

    if tick() - vars.anticheat.tick > 1 and player.Character then 
        vars.anticheat.tick = tick() 
        for _, v in pairs(player.Character:GetChildren()) do
            if v:IsA('Script') and v.Name ~= 'Health' and v.Name ~= 'Sound' and v:FindFirstChild('LocalScript') and is_game then
                v:Destroy()
            end
        end
    end

    if flags['loop-kill'] then
        local selectedPlayerName = flags['players']
        local humanoidRootPart = player.Character and player.Character:FindFirstChild('HumanoidRootPart')
        local camera = Services.Workspace.CurrentCamera
        local gun = utility.get_gun(player)
        vars.loopkill.enabled = (not gun or not gun.tool or not humanoidRootPart)

        if vars.loopkill.enabled then return end
        
        -- Find target player
        vars.loopkill.target = nil
        for _, player in ipairs(Services.Players:GetPlayers()) do
            if player.DisplayName == selectedPlayerName then
                vars.loopkill.target = player
                break
            end
        end
        
        local target = vars.loopkill.target
        if not target or not target.Character then return end

        local targetHumanoidRootPart = target.Character:FindFirstChild('HumanoidRootPart')
        local targetUpperTorso = target.Character:FindFirstChild('UpperTorso')
        local targetHead = target.Character:FindFirstChild('Head')
        local isKnocked = utility.is_knocked(target, true)
        local isDead = utility.is_dead(target, true)
        local ctick = tick()

        if targetHead and isKnocked and isDead then
            vars.loopkill.stage = 1
            humanoidRootPart.CFrame = targetHumanoidRootPart.CFrame * CFrame.Angles(0, 2 * math.pi * ctick * flags['target-strafe-speed'] % (2 * math.pi), 0) * CFrame.new(0, flags['target-strafe-height'], flags['target-strafe-distance'])
            if gun.tool.Name == '[Rifle]' or utility.is_forcefield(target, true) then
                if utility.get_ammo(player, gun.tool.Name) > 0 then
                    utility.shoot_gun(target.Name, gun.tool, 'Head')
                else
                    utility.reload_gun(gun.tool)
                end
            end
        elseif not isKnocked and isDead then
            vars.loopkill.stage = 2
            if targetUpperTorso then
                
                humanoidRootPart.CFrame = CFrame.new(targetUpperTorso.Position) * CFrame.new(0,1.2,0) * CFrame.Angles(math.rad(90),0,math.rad(180))
                humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                humanoidRootPart.AssemblyAngularVelocity = Vector3.zero 
                humanoidRootPart.Velocity = Vector3.zero 
                
                Services.ReplicatedStorage.MainEvent:FireServer('Stomp')
            end
            utility.reload_gun(gun.tool)
        elseif not isDead then
            vars.loopkill.stage = 3
            humanoidRootPart.CFrame = CFrame.new(9e9, 9e9, 9e9)
            utility.reload_gun(gun.tool)
        else
            vars.loopkill.target = nil
        end
    else
        vars.loopkill.target = nil
    end

    if flags['void'] and flags['void-key'].active then
        local character = player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        vars.void.old = rootPart.CFrame
        
        if not vars.void.clone then
            vars.void.clone, vars.void.cloneconnection = utility.create_clone(character)
            Services.Workspace.CurrentCamera.CameraSubject = vars.void.clone
            
            for _, obj in ipairs(character:GetChildren()) do
                if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
                    obj.Transparency = 1
                elseif obj:IsA('Accessory') or obj:IsA('Hat') then
                    local handle = obj:FindFirstChild('Handle')
                    if handle then handle.Transparency = 1 end
                end
            end
        end
        
        vars.void.clone.HumanoidRootPart.CFrame = vars.void.old
        local origin = rootPart
        rootPart.CFrame = origin.CFrame * CFrame.new(9e9, 9e9, 9e9)
        game:GetService('RunService').RenderStepped:Wait()
        rootPart.CFrame = vars.void.old
    else
        if vars.void.clone then
            local character = player.Character
            for _, obj in ipairs(character:GetChildren()) do
                if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
                    obj.Transparency = 0
                elseif obj:IsA('Accessory') or obj:IsA('Hat') then
                    local handle = obj:FindFirstChild('Handle')
                    if handle then handle.Transparency = 0 end
                end
            end
            
            Services.Workspace.CurrentCamera.CameraSubject = character
            vars.void.clone:Destroy()
            vars.void.clone = nil
        end
        
        if vars.void.cloneconnection then
            vars.void.cloneconnection:Disconnect()
            vars.void.cloneconnection = nil
        end
    end    

    if flags['desync'] and flags['desync-key'].active then
        local character = player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        vars.desync.old = rootPart.CFrame
        
        if not vars.desync.clone then
            vars.desync.clone, vars.desync.cloneconnection = utility.create_clone(character)
            Services.Workspace.CurrentCamera.CameraSubject = vars.desync.clone
            
            for _, obj in ipairs(character:GetChildren()) do
                if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
                    obj.Transparency = 1
                elseif obj:IsA('Accessory') or obj:IsA('Hat') then
                    local handle = obj:FindFirstChild('Handle')
                    if handle then handle.Transparency = 1 end
                end
            end
        end
        
        vars.desync.clone.HumanoidRootPart.CFrame = vars.desync.old
        
        local target = (flags['attach-target'] and vars.camlock.target and vars.camlock.target.Character and vars.camlock.target.Character:FindFirstChild("HumanoidRootPart")) or rootPart
        local randomRange = flags['desync-random-range']
        vars.desync.radians += flags['desync-strafe-speed']
        
        local calculatedPositions = {
            ['Random'] = (CFrame.new(target.Position) + Vector3.new(math.random(-randomRange, randomRange), math.random(-randomRange, randomRange), math.random(-randomRange, randomRange))) * CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180))),
            ['Roll'] = target.CFrame * CFrame.new(0, -4 ,0) * CFrame.Angles(0, math.rad(math.random(1, 360)), math.rad(-180)),
            ['Target Strafe'] = target.CFrame * CFrame.Angles(0, math.rad(vars.desync.radians), 0) * CFrame.new(0, flags['desync-strafe-height'], flags['desync-strafe-radius']),
            ['Custom'] = target.CFrame * CFrame.new(flags['desync-x'], flags['desync-y'], flags['desync-z']) * CFrame.Angles(math.rad(flags['rotation-x']), math.rad(flags['rotation-y']), math.rad(flags['rotation-z'])), 
            ['Destroy Cheaters'] = target.CFrame * (vars.desync.switch and CFrame.new(9e9, 9e9, 9e9) or (CFrame.Angles(0, math.rad(vars.desync.radians), 0) * CFrame.new(0, flags['desync-strafe-height'], flags['desync-strafe-radius'])))
        }    
        
        if not vars.desync.fake then
            vars.desync.fake = utility.create_fake('Desync', Services.Workspace)
        end

        if flags['visualize-desync'] and vars.desync.fake then
            vars.desync.fake.HumanoidRootPart.CFrame = calculatedPositions[flags['desync-type']]
            vars.desync.fake.Visualize.FillColor = flags['visualize-color'].Color
            vars.desync.fake.Visualize.OutlineColor = flags['visualize-color'].Color
        end

        rootPart.CFrame = calculatedPositions[flags['desync-type']]
        game:GetService('RunService').RenderStepped:Wait()
        rootPart.CFrame = vars.desync.old
    else
        if vars.desync.clone then
            local character = player.Character
            for _, obj in ipairs(character:GetChildren()) do
                if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
                    obj.Transparency = 0
                elseif obj:IsA('Accessory') or obj:IsA('Hat') then
                    local handle = obj:FindFirstChild('Handle')
                    if handle then handle.Transparency = 0 end
                end
            end
            
            Services.Workspace.CurrentCamera.CameraSubject = character
            vars.desync.clone:Destroy()
            vars.desync.clone = nil
        end
        if vars.desync.fake then
            vars.desync.fake:Destroy()
            vars.desync.fake = nil
        end
        if vars.desync.cloneconnection then
            vars.desync.cloneconnection:Disconnect()
            vars.desync.cloneconnection = nil
        end
    end
end)

utility.new_connection(Services.Players.LocalPlayer.CharacterRemoving, function()
    for _, mode in ipairs({'desync', 'void'}) do
        if vars[mode].cloneconnection then
            vars[mode].cloneconnection:Disconnect()
            vars[mode].cloneconnection = nil
        end
        if vars[mode].clone then
            vars[mode].clone:Destroy()
            vars[mode].clone = nil
        end
    end
end)

local add_esp = function(player)
    local bbg = Instance.new('BillboardGui', Services.CoreGui)
    bbg.Name = player.Name
    bbg.AlwaysOnTop = true
    bbg.Size = UDim2.new(4, 0, 5.4, 0)
    bbg.ClipsDescendants = false

    -- Create the frame for the ESP box
    local espFrame = Instance.new('Frame', bbg)
    espFrame.Size = UDim2.new(1, 0, 1, 0)
    espFrame.BackgroundTransparency = 1
    espFrame.BorderSizePixel = 0

    -- Main ESP Box Stroke (Colored)
    local espBox = Instance.new('UIStroke', espFrame)
    espBox.Thickness = 1
    espBox.Color = flags['esp-color'].Color or Color3.fromRGB(255, 0, 0)
    espBox.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual -- Ensures it's above the outline

    -- Create health bar for player
    local forhealth = Instance.new('BillboardGui', bbg)
    forhealth.Name = 'forhealth'
    forhealth.Size = UDim2.new(5, 0, 6, 0)
    forhealth.AlwaysOnTop = true
    forhealth.ClipsDescendants = false

    local healthbar = Instance.new('Frame', forhealth)
    healthbar.Name = 'healthbar'
    healthbar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    healthbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    healthbar.Size = UDim2.new(0.007, 1, 0.9, 0)
    healthbar.Position = UDim2.new(0, 0, 0.05, 0)

    local bar = Instance.new('Frame', healthbar)
    bar.Name = 'bar'
    bar.BorderSizePixel = 0
    bar.BackgroundColor3 = Color3.fromRGB(94, 255, 69)
    bar.AnchorPoint = Vector2.new(0, 1)
    bar.Position = UDim2.new(0, 0, 1, 0)
    bar.Size = UDim2.new(1, 0, 1, 0)

    -- Create Nametag ESP
    local nametag = Instance.new('BillboardGui')
    nametag.Name = 'nametag'
    nametag.Size = UDim2.new(3, 0, 0, 54)
    nametag.StudsOffset = Vector3.new(0, 2.5, 0)
    nametag.AlwaysOnTop = true
    nametag.ClipsDescendants = false
    nametag.Parent = bbg

    local nameLabel = Instance.new('TextLabel', nametag)
    nameLabel.Name = 'nameLabel'
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextSize = 12
    nameLabel.Size = UDim2.new(1, 0, 0, 24)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.Text = player.DisplayName

    -- Coroutine to continuously update the ESP for the player
    local update = coroutine.create(function()
        while wait(0.1) do
            if player.Character and player.Character:FindFirstChild('HumanoidRootPart') and flags['esp'] then
                local health = player.Character:FindFirstChild('Humanoid') and player.Character.Humanoid.Health or 0
                local maxHealth = player.Character:FindFirstChild('Humanoid') and player.Character.Humanoid.MaxHealth or 1
                local healthPercentage = health / maxHealth
                local healthColor = Color3.fromHSV(healthPercentage * 0.33, 1, 1)

                bbg.Adornee = player.Character.HumanoidRootPart
                forhealth.Adornee = player.Character.HumanoidRootPart
                nametag.Adornee = player.Character.HumanoidRootPart
                espFrame.Visible = table.find(flags['esp-types'], 'Box')
                healthbar.Visible = table.find(flags['esp-types'], 'Health')
                nameLabel.Visible = table.find(flags['esp-types'], 'Name')
                espBox.Color = flags['esp-color'].Color
                healthbar.bar.BackgroundColor3 = healthColor
                healthbar.bar.Size = UDim2.new(1, 0, healthPercentage, 0)
            else
                espFrame.Visible = false
                healthbar.Visible = false
                nameLabel.Visible = false
            end

            if not Services.Players:FindFirstChild(player.Name) or not flags['esp'] then
                Services.CoreGui:FindFirstChild(player.Name):Destroy()
                coroutine.yield()
            end
        end
    end)

    coroutine.resume(update)
end

for _, v in pairs(Services.Players:GetChildren()) do
    if not (v.Name == Services.Players.LocalPlayer.Name) then
        if not (Services.CoreGui:FindFirstChild(v.Name)) then
            add_esp(v)
        end
    end
end

task.spawn(function()
    while true do
        vars.fling.switch = not vars.fling.switch
        vars.desync.switch = not vars.desync.switch
        task.wait(0.1)
    end
end)

task.spawn(function()
    while wait(5) do
        for _, v in pairs(Services.Players:GetChildren()) do
            if v.Name ~= Services.Players.LocalPlayer.Name then
                if not Services.CoreGui:FindFirstChild(v.Name) then
                    add_esp(v)
                end
            end
        end
    end
end)

local on_chatted = function(p, msg)
    msg = msg:gsub('[\n\r]', ''):gsub('\t', ' '):gsub('[ ]+', ' ')
    local conn = utility.new_connection(Services.ReplicatedStorage:WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('OnMessageDoneFiltering').OnClientEvent, function(event, channel)
            if event.SpeakerUserId == p.UserId and event.Message ==
                msg:sub(#msg - #event.Message + 1) and
                (channel == 'All' or (channel == 'Team' and Services.Players[event.FromSpeaker].Team == Services.Players.LocalPlayer.Team)) then
            end
        end)
    wait(1)
    conn:Disconnect()
end

local initialize_players = function()
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player.Name ~= Services.Players.LocalPlayer.DisplayName then
            ui.playerlist:add_value(player.DisplayName)
        end
        utility.new_connection(player.Chatted, function(msg) on_chatted(player, msg) end)
    end
end

utility.new_connection(Services.Players.LocalPlayer.CharacterAdded, function(character)
    if vars.armor.connection then
        vars.armor.connection:Disconnect()
        vars.armor.connection = nil
    end
    vars.animations.animation = 'None'
end)

utility.new_connection(Services.Players.PlayerAdded, function(player)
    ui.playerlist:add_value(player.DisplayName)
    utility.new_connection(player.Chatted, function(msg) on_chatted(player, msg) end)
end)

utility.new_connection(Services.Players.PlayerRemoving, function(player)
    ui.playerlist:remove_value(player.DisplayName)
end)

lib:notification({text = string.format('Welcome, %s to Aurora.', Services.Players.LocalPlayer.DisplayName)})

ui.setup_desync()
initialize_players()
tabs.aimbot:open_tab()
