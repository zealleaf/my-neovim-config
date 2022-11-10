local status, db = pcall(require, "dashboard")
if not status then
	return
end

db.custom_header = {
	[[                                            ,--,    ,--,                                       ]],
	[[                                          ,--.'|  ,--.'|                           .--.,       ]],
	[[              ,----,                      |  | :  |  | :                         ,--.'  \      ]],
	[[            .'   .`|                      :  : '  :  : '                         |  | /\/      ]],
	[[         .'   .'  .'   ,---.     ,--.--.  |  ' |  |  ' |      ,---.     ,--.--.  :  : :        ]],
	[[       ,---, '   ./   /     \   /       \ '  | |  '  | |     /     \   /       \ :  | |-       ]],
	[[       ;   | .'  /   /    /  | .--.  .-. ||  | :  |  | :    /    /  | .--.  .-. ||  : :/|      ]],
	[[       `---' /  ;--,.    ' / |  \__\/: . .'  : |__'  : |__ .    ' / |  \__\/: . .|  |  .'      ]],
	[[         /  /  / .`|'   ;   /|  ," .--.; ||  | '.'|  | '.'|'   ;   /|  ," .--.; |'  : '        ]],
	[[       ./__;     .' '   |  / | /  /  ,.  |;  :    ;  :    ;'   |  / | /  /  ,.  ||  | |        ]],
	[[       ;   |  .'    |   :    |;  :   .'   \  ,   /|  ,   / |   :    |;  :   .'   \  : \        ]],
	[[       `---'         \   \  / |  ,     .-./---`-'  ---`-'   \   \  / |  ,     .-./  |,'        ]],
	[[                      `----'   `--`---'                      `----'   `--`---'   `--'          ]],
	[[]],
	[[]],
	[[]],
}

db.custom_center = {
	{
		icon = "                         ",
		desc = "Projects                            ",
		action = "Telescope projects",
	},
	{
		icon = "                         ",
		desc = "Recently files                      ",
		action = "Telescope oldfiles",
	},
	{
		icon = "                         ",
		desc = "Edit keybindings                    ",
		action = "edit ~/.config/nvim/lua/zealleaf/core/keymaps.lua",
	},
	{
		icon = "                         ",
		desc = "Edit projects history               ",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
}

db.custom_footer = {
	[[]],
	[[]],
	[[code as life]],
}
