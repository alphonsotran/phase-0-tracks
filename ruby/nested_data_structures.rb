technology_owned = {
  portable: {
    switch: [
      "TLOZ",
      "MK8"
    ],
    iphone: []
  },
  console: {
    ps4: [
      "Uncharted 4",
      "FFXV",
      "The Last Guardian"
    ],
    xbox: "GOW4"
  },
  vr: {
    vrheadsets: 2,
    htc: true,
    rift: true

  }
}


#accessing array nested in double hashes
p technology_owned[:portable][:switch]
p technology_owned[:console][:ps4][-1]

#reversing list
p technology_owned[:console][:ps4].reverse

#reversing list and choosing the first item on the list
p technology_owned[:console][:ps4].reverse.first

#adding item to the back of the list
technology_owned[:portable][:iphone].push("Mario Run", "GTA:SA")
p technology_owned[:portable][:iphone]

#updating values in nested data structure
technology_owned[:vr][:htc] = false
p technology_owned[:vr][:htc]

#adding item to front of list
technology_owned[:portable][:switch].unshift("PuyoPuyo")
p technology_owned[:portable][:switch]

#choosing items from range
p technology_owned[:console][:ps4][0...2]
