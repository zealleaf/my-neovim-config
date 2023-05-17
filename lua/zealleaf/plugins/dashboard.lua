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
				key = "p",
			},
			{
				desc = "  Run current",
				action = "ene!",
				key = "c",
			},
			{
				desc = " Edit dotfiles",
				action = "edit ~/.config/nvim/init.lua",
				key = "d",
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
