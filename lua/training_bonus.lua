--<<
function wesnoth.effects.training_bonus(u, cfg)
	local amount = cfg.amount
    -- helper.wml_error("here training_bonus")
    new_cfg = helper.parsed(helper.get_child(cfg, "wc2_random_training"))
	if not amount == nil and type(amount) == "number" then
        for i = 1,amount,1 
        do
            wesnoth.wml_actions.wc2_give_random_training(new_cfg)
        end
    else
        -- default is 1
        wesnoth.wml_actions.wc2_give_random_training(new_cfg)
	end
end
-->>