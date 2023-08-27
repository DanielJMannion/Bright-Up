extends Node

var dictionary = {
	"level_1_1": false,
	"level_1_2": false,
	"level_1_3": false,
	"level_1_4": false,
	"level_1_5": false,
	"level_2_1": false,
	"level_2_2": false,
	"level_2_3": false,
	"level_2_4": false,
	"level_2_5": false,
	"level_3_1": false,
	"level_3_2": false,
	"level_3_3": false,
	"level_3_4": false,
	"level_3_5": false,
	"level_4_1": false,
	"level_4_2": false,
	"level_4_3": false,
	"level_4_4": false,
	"level_4_5": false,
	"level_5_1": false,
	"level_5_2": false,
	"level_5_3": false,
	"level_5_4": false,
	"level_5_5": false
}

func beatLevel(level):
	dictionary[level] = true

func returnIfBeat(level):
	return dictionary[level]
