return {
	"glepnir/dashboard-nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
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
						icon = " ",
						desc = "Open projects",
						action = "Telescope projects",
						key = "p",
					},
					{
						icon = " ",
						desc = "Recent files",
						action = "Telescope oldfiles",
						key = "f",
					},
					{
						icon = " ",
						desc = "Run current",
						action = "ene!",
						key = "c",
					},
					{
						icon = " ",
						desc = "Edit bindings",
						action = "edit ~/.config/nvim/lua/zealleaf/bind.lua",
						key = "b",
					},
					{
						icon = " ",
						desc = "Edit projects history",
						action = "edit ~/.local/share/nvim/project_nvim/project_history",
						key = "s",
					},
				},
				footer = { [[]], [[]], [[code as life]] },
			},
		})
	end,
}
