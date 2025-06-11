local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
local placeId = game.PlaceId
local mm2 = 142823291
local sg = 7606564092
local yt = "https://youtube.com/@ykdaren"
local dc = "https://discord.gg/d8R3j4rJ3A"

local Window = MacLib:Window({
	Title = "strive | Loader",
	Subtitle = "v1 | ...",
	Size = UDim2.fromOffset(868, 650),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})

-- global settings
local globalSettings = {
	UIBlurToggle = Window:GlobalSetting({
		Name = "UI Blur",
		Default = Window:GetAcrylicBlurState(),
		Callback = function(bool)
			Window:SetAcrylicBlurState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
				Lifetime = 5
			})
		end,
	}),
	NotificationToggler = Window:GlobalSetting({
		Name = "Notifications",
		Default = Window:GetNotificationsState(),
		Callback = function(bool)
			Window:SetNotificationsState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " Notifications",
				Lifetime = 5
			})
		end,
	}),
	ShowUserInfo = Window:GlobalSetting({
		Name = "Show User Info",
		Default = Window:GetUserInfoState(),
		Callback = function(bool)
			Window:SetUserInfoState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Showing" or "Redacted") .. " User Info",
				Lifetime = 5
			})
		end,
	})
}

-- tabs and sections
local tabGroups = {
	TabGroup1 = Window:TabGroup()
}

local tabs = {
	Main = tabGroups.TabGroup1:Tab({ Name = "Games", Image = "rbxassetid://18821914323" }),
	Settings = tabGroups.TabGroup1:Tab({ Name = "Credits", Image = "rbxassetid://10734887072" }),
	Socials = tabGroups.TabGroup1:Tab({ Name = "Socials", Image = "rbxassetid://10734963940" })
}

local sections = {
	MainSection1 = tabs.Main:Section({ Side = "Left" }),
	Credits = tabs.Settings:Section({ Side = "Left" }),
	Social = tabs.Socials:Section({ Side = "Left" })
}

-- main section
sections.MainSection1:Header({
	Name = "Games"
})

sections.MainSection1:Button({
	Name = "strive | Murder Mystery 2",
	Callback = function()
		if placeId == mm2 then
			loadstring(game:HttpGet("https://rebrand.ly/dscripts-mm2"))()
		else
			Window:Notify({
				Title = "dscripts",
				Description = "you're not playing Murder Mystery 2, thus the script didn't load.",
				Lifetime = 5
			})
		end
	end
})

sections.MainSection1:Button({
	Name = "strive | Shrimp Game",
	Callback = function()
		if placeId == sg then
			loadstring(game:HttpGet("https://rebrand.ly/dscripts-sg"))()
		else
			Window:Notify({
				Title = "dscripts",
				Description = "you're not playing Shrimp Game, thus the script didn't load.",
				Lifetime = 5
			})
		end
	end
})

sections.MainSection1:Paragraph({
	Header = "Thank you!",
	Body = "More games coming to strive soon!"
})

-- socials
sections.Social:Header({
	Name = "Social Links"
})

sections.Social:Button({
	Name = "Youtube",
	Callback = function()
		setclipboard(yt)
		Window:Notify({
			Title = "Copied!",
			Description = "YouTube link copied to clipboard.",
			Lifetime = 5
		})
	end
})

sections.Social:Button({
	Name = "Discord",
	Callback = function()
		setclipboard(dc)
		Window:Notify({
			Title = "Copied!",
			Description = "Discord link copied to clipboard.",
			Lifetime = 5
		})
	end
})

sections.Social:Paragraph({
	Header = "Join these links!",
	Body = "Join these to know for more updates on dscripts!"
})

-- credits
sections.Credits:Header({
	Name = "Credits"
})

sections.Credits:Paragraph({
	Header = "Developers:",
	Body = "Maclib Developer: biggaboy212. strive developer: daren, dainstro, aquabearry and clowdy. strive owner: daren. temic owner: clowdy. temic developers: dainstro, timesecay, clowdy"
})

tabs.Main:Select()
