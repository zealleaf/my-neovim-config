local status, dashboard = pcall(require, "dashboard")
if not status then
	return
end

dashboard.setup({
	theme = "hyper",
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
		shortcut = {
			{
				desc = " Open projects",
				action = "Telescope projects",
				key = "o",
			},
			{
				desc = "  Run current",
				action = "ene!",
				key = "r",
			},
			{
				desc = " Edit dotfiles",
				action = "edit ~/.config/nvim/lua/zealleaf/init.lua",
				key = "e",
			},
		},
		packages = { enable = false },
		footer = {
			[[]],
			[[]],
			[[code as life]],
		},
	},
})
