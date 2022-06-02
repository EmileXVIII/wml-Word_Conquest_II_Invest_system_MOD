--<<
function wesnoth.wml_actions.wc2_invest_fix_player_vars()
    local nb_sides = #wesnoth.get_sides()
    wml.variables["players"] = nb_sides
    local player_sides = wesnoth.get_sides { wml.tag.has_unit { canrecruit = true } }
    for i, side in ipairs(player_sides) do
        local side_num = side.side
        -- important: this creates the 'player' array.
        -- todo: maybe use a side variable instead ?
        local vname = "player[" .. side_num .. "].team_color"
        if wml.variables[vname] then
            wesnoth.set_side_id(side_num, nil, wml.variables[vname])
        else
            wml.variables[vname] = side.color
        end
    end
end
-->>