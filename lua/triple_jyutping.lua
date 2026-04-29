local config = require("tri_jyutping_config")

local maps = {}
maps.ind_of_key = {}
maps.key2onset = {}
maps.key2group = {}
maps.key2tone = {}
maps.rime_maps = config.rime_maps
for i, key in ipairs(config.keyboard) do
	maps.ind_of_key[key] = i
	maps.key2onset[key] = config.onset_map[i]
	maps.key2group[key] = config.group_map[i]
	maps.key2tone[key] = config.tone_map[i]
end

local function divide_string(s, n)
	local slices = {}
	local len = #s
	for i = 1, len, n do
		table.insert(slices, s:sub(i, i+n-1))
	end
	return slices
end

local function decode_syllable(code, maps)
	local onset = maps.key2onset[code:sub(1,1)] or ""

	local rime_map = maps.rime_maps[maps.key2group[code:sub(3,3)]]
	rime_map = rime_map or config.fallback_rime_map or {}
	local rime = rime_map[maps.ind_of_key[code:sub(2,2)]] or ""

	local tone = maps.key2tone[code:sub(3,3)] or ""

	return onset..rime..tone
end

local T = {}

function T.init(env)
	local schema = Schema(env.engine.schema.schema_id or "")
	env.tran = Component.Translator(env.engine, schema, "translator", "script_translator")
end

function T.fini(env)
end

function T.func(input, seg, env)
	local codes = divide_string(input, 3)
	local sound = ""

	for i, code in ipairs(codes) do
		if #code == 1 then
			code = code.."XX"
		elseif #code == 2 then
			code = code.."X"
		end

		local success, syllable = pcall(decode_syllable, code, maps)
		if not success or syllable == "" then break end

		sound = sound.." "..syllable
	end

	if sound == "" then return end
	sound = sound:gsub("^ ", "")

	local t = env.tran:query(sound, seg)

	if not t then
		yield(Candidate("jyutping", seg.start, seg._end, sound, " "))
		return
	end

	for c in t:iter() do
		c.preedit = sound
		c._start = seg.start
		c._end = seg._end
		yield(c)
	end
end

return { tran=T }
