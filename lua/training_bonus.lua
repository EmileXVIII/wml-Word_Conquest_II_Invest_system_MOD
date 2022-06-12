--<<
function wesnoth.effects.training_bonus(u, cfg)
    local current_bonus = u.variables["wc2.invest_mod.training_bonus.amount"] or 0
    new_cfg = helper.parsed(helper.get_child(cfg, "wc2_random_training"))
	local amount = new_cfg.amount or 1
    if not type(amount) == "number" then
        helper.wml_error("amount shoud be a number")
    end
    u.variables["wc2.invest_mod.training_bonus.amount"] = amount + current_bonus
    u.variables["wc2.invest_mod.training_bonus.among"] = new_cfg.among
end


function wc2_invest_process_training_advances(u)
    local counter=u.variables["wc2.invest_mod.training_bonus.amount"] or 0
    local applied_advances =  u.variables["wc2.invest_mod.training_bonus_applied"] or 0
    counter = counter - applied_advances
    if counter > 0 then
        new_cfg = {
            side = u.side,
            among = "2,3,4,5,6"
        }
        wesnoth.wml_actions.wc2_give_random_training(new_cfg)
        u.variables["wc2.invest_mod.training_bonus_applied"] = applied_advances + 1
    end
end

function wesnoth.wml_actions.wc2_process_training_advancements(cfg)
    local leaders = wesnoth.units.find_on_map{ canrecruit = true }
    for i=1,#leaders-1,1
    do
        u=leaders[i]
        wc2_invest_process_training_advances(u)
    end
end
-->>