local config = {}

config.keyboard = {
	"q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
	"a", "s", "d", "f", "g", "h", "j", "k", "l", ";",
	"z", "x", "c", "v", "b", "n", "m", ",", ".", "/"
}

config.onset_map = {
	"p", "c", "t",  "k",  nil, nil, "ng", "j", nil, nil,
	"b", "z", "d",  "g",  "",  "h", "w",  "n", "l", nil,
	"f", "s", "kw", "gw", nil, nil, "m"
}

config.group_map = {
	nil, "a", "a", nil, "k", nil, nil, "n", "n", nil,
	"a", "a", "a", "a", "k", nil, "n", "n", "n", "n",
	nil, "k", "k", "k", "k"
}

config.rime_maps = {
	a = {
		nil, "ui","eoi","aai",nil,nil,"ai","ei","oi",nil,
		"yu","u", "i",  "aa", nil,nil,"a", "e", "o","oe",
		nil, "",  "iu", "aau",nil,nil,"au","eu","ou"
	},
	n = {
		"yung","ung","ing","aang",nil,"eong","ang","eng","ong","oeng",
		"yun", "un", "in", "aan", nil,"eon", "an", "en", "on", "oen",
		"yum", "um", "im", "aam", nil,"eom", "am", "em", "om", "oem"
	},
	k = {
		"yuk","uk","ik","aak",nil,"eok","ak","ek","ok","oek",
		"yut","ut","it","aat",nil,"eot","at","et","ot","oet",
		"yup","up","ip","aap",nil,"eop","ap","ep","op","oep"
	}
}

config.fallback_rime_map = {
	"yu","u", "i",  "aa", nil,"eo","a", "e", "o","oe",
	"yu","u", "i",  "aa", nil,"eo","a", "e", "o","oe",
	"yu","u", "i",  "aa", nil,"eo","a", "e", "o","oe"
}

config.tone_map = {
	nil, "5", "4", nil, "2", nil, nil, "4", "5", nil,
	"2", "6", "3", "1", "4", nil, "1", "3", "6", "2",
	nil, "6", "3", "1", "5"
}

return config
