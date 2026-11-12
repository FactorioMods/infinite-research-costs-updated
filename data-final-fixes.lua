for techname, tech in pairs(data.raw["technology"]) do
    if tech.unit then
        -- Check if the technology has a count_formula (indicating infinite research)
        if tech.unit.count_formula ~= nil then
            if string.find(tech.unit.count_formula, "%^") ~= nil then
                -- Found non-linear (exponential) scaling, modify it
                log("Found non-linear infinite tech: " .. techname)
                log("Original cost formula: " .. tech.unit.count_formula)

                -- Apply the new cost formula for non-linear scaling
                tech.unit.count_formula = "1000 + (L - 1) * 1000"

                log("New cost formula: " .. tech.unit.count_formula)
            else
                -- If the formula does not contain a "^", assume it's linear and leave it as is
                log("Linear scaling tech detected, skipping modification: " .. techname)
            end
        end
    end
end