local lamb = {}

-- functional utility function reduce
function lamb.reduce(table, callback, state)
    local memo = state or {}
    for k, value in pairs(table) do
        memo = callback(memo, value, k, table)
    end
    return memo
end

-- functional utility function flow
function lamb.chain(actions)
    return reduce(actions, function(action)
        return action()
    end, {})
end

-- functional utility find
function lamb.find(table, predicate)
    for k, value in pairs(table) do
        if predicate(value) then
            return value
        end
    end
    return nil
end

function lamb.findIndex(table, predicate)
    for k, value in pairs(table) do
        if predicate(value) then
            return k
        end
    end
    return -1
end

-- Functional utility function filter
function lamb.filter(table, predicate)
    local output = {}
    for k, value in pairs(table) do
        if predicate(value) then
            output[#output + 1] = value
        end
    end
    return output
end

-- Functional utility function concat
function lamb.concat(table1, table2)
    local output = {}
    for k, value in pairs(table1) do
        output[#output + 1] = value
    end

    for k, value in pairs(table2) do
        output[#output + 1] = value
    end
    return output
end

-- Functional utility function forEach
function lamb.forEach(table, callback)
    for k,v in pairs(table) do
        callback(v, k)
    end
end

-- Functional utility function extend
function lamb.extend(table1, table2)
    for k,v in pairs(table2) do
        if type(table1[k]) == 'table' and type(v) == 'table' then
            extend(table1[k], v)
        else
            table1[k] = v
        end
    end
    return table1
end

-- Functional utility function map
function lamb.map(table, callback)
    local output = {}
    for k, value in pairs(table) do
        output[#output + 1] = callback(value)
    end
    return output
end

function lamb.last(table)
    return table[#table]
end

function lamb.push(table, member)
    table[#table + 1] = member
end

function lamb.diffByKey(table1, table2)
    local output = {}
    for key, value in pairs(table2) do
        local match = false
        for oKey, oValue in pairs(table1) do
            if key == oKey then
                match = true
            end
        end

        if not match then
            output[key] = value
        end
    end
    return output
end

return lamb
