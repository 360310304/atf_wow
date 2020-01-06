---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by hydra.
--- DateTime: 2020-01-05 14:36
---
local addonName, L = ...

local busy_state_context = {
  ["samples"] = {
    {["sample_ts"]=0, ["water"]=0, ["bread"]=0}
  },
  ["is_busy"] = false,
}

local threshold_busy_low = 12
local threshold_busy_high = 20
local sample_interval = 45
local sample_size = 5


local function get_last_sample()
    return busy_state_context.samples[#busy_state_context.samples]
end


local function sample_busy()
    if GetTime() - get_last_sample().sample_ts >= sample_interval then
        table.insert(busy_state_context.samples, {
            ["sample_ts"] = GetTime(),
            ["water"] = L.F.get_water_count(),
            ["bread"] = L.F.get_bread_count(),
        })
    end
end


local function cleanup_sample()
    while #busy_state_context.samples > sample_size or (
        busy_state_context.samples[1]
        and
        GetTime() - busy_state_context.samples[1].sample_ts > (sample_interval + 3) * sample_size
    ) do
        table.remove(busy_state_context.samples, 1)
    end
end


function L.F.drive_busy_state()
    sample_busy()
    cleanup_sample()
    if #busy_state_context.samples >= sample_size - 1 then
        if busy_state_context.is_busy then
            for _, value in ipairs(busy_state_context.samples) do
                if value.water + value.bread < threshold_busy_high then
                    return
                end
            end
            -- all water+bread >= threshold_busy_high
            print("Exit busy state")
            busy_state_context.is_busy = false
            table.insert(BusyHistory, {["busy"]=false, ["time"]=date("%x %X")})
        else
            for _, value in ipairs(busy_state_context.samples) do
                if value.water + value.bread > threshold_busy_low then
                    return
                end
            end
            -- all water+bread <= threshold_busy_low
            print("Enter busy state")
            busy_state_context.is_busy = true
            table.insert(BusyHistory, {["busy"]=true, ["time"]=date("%x %X")})
        end
    end
end


function L.F.get_busy_state()
    return busy_state_context.is_busy
end
