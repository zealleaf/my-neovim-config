local status, dashboard = pcall(require, "dashboard")
if not status then
	return
end

dashboard.setup({
	theme = "doom",
	config = {
		header = {
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
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
		},
		center = {
			{
				icon = "                       ",
				desc = "Open Projects                       ",
				action = "Telescope projects",
			},
			{
				icon = "                       ",
				desc = "Recent files                        ",
				action = "Telescope oldfiles",
			},
			{
				icon = "                       ",
				desc = "Run current                         ",
				action = "ene!",
			},
			{
				icon = "                       ",
				desc = "Find Text                           ",
				action = "Telescope live_grep",
			},
			{
				icon = "                       ",
				desc = "Edit keybindings                    ",
				action = "edit ~/.config/nvim/lua/zealleaf/core/keymaps-base.lua",
			},
			{
				icon = "                       ",
				desc = "Edit projects history               ",
				action = "edit ~/.local/share/nvim/project_nvim/project_history",
			},
		},
		footer = {
			[[]],
			[[]],
			[[code as life]],
		},
	},
})
