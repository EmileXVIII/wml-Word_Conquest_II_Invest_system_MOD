--<<
function wesnoth.wml_actions.wc2_invest_start_units(cfg)
	local u = wesnoth.get_units({ side = cfg.side, canrecruit = true })[1]
	print(u)
	if u then
        u:add_modification("advancement", { wc2_scenario.experience_penalty() })
        u:add_modification("trait", wc2_heroes.trait_heroic )
        u.hitpoints = u.max_hitpoints
        u.moves = u.max_moves
        for i = 1, wml.variables["difficulty.heroes"] do
            wesnoth.wml_actions.wc2_random_hero {
                x = u.x,
                y = u.y,
                side = u.side,
            }
        end
    end
end
-->>