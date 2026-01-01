{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 794.0, 397.0, 1374.0, 664.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 527.0, 635.0, 105.20832931995392, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 415.0, 457.0, 105.20832931995392, 20.0 ],
                    "text": "Running Average"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-18",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 526.0, 605.0, 107.29166257381439, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 415.0, 431.0, 107.29166257381439, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 513.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "int" ],
                    "patching_rect": [ 538.0, 557.0, 39.0, 22.0 ],
                    "text": "mean"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 845.979160964489, 328.0, 189.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 608.4062164723873, 155.87500154972076, 189.0, 22.0 ],
                    "text": "Spectral Centroid Controls"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "float" ],
                    "patching_rect": [ 158.0, 107.5, 29.5, 22.0 ],
                    "text": "t b f"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 158.0, 79.0, 59.0, 22.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 158.0, 136.0, 79.0, 22.0 ],
                    "text": "220."
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 158.0, 52.0, 59.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.20832359790802, 127.24999594688416, 46.0, 21.0 ],
                    "text": "220"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 158.5, 19.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1021.0, 158.0, 141.0, 114.0 ],
                    "presentation": 1,
                    "presentation_linecount": 4,
                    "presentation_rect": [ 536.9999723434448, 78.0, 236.0, 60.0 ],
                    "text": "For example: can be used as a simple kind of percussion timbre analyzer (e.g. detect \"Kick\" (low centroid value) vs. \"Snare\" (high centroid value) sounds, etc..."
                }
            },
            {
                "box": {
                    "fontsize": 28.0,
                    "id": "obj-108",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 878.0, 84.0, 333.0, 69.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 68.74999737739563, 37.499998569488525, 444.7916496992111, 38.0 ],
                    "text": "Spectral Centroid Example Patch"
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 226.0, 52.5, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 255.20832359790802, 127.24999594688416, 38.54166519641876, 20.0 ],
                    "text": "Hz"
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 598.0, 265.0, 81.0, 114.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 457.29164922237396, 195.45833337306976, 81.0, 114.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[4]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[4]"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 413.0, 179.0, 74.0, 22.0 ],
                    "text": "loadmess -6"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 413.0, 274.0, 81.0, 114.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 358.5416513681412, 195.45833337306976, 81.0, 114.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[3]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[3]"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 722.0, 298.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 867.0, 414.0, 186.4583262205124, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 634.9999723434448, 225.0, 186.4583262205124, 20.0 ],
                    "text": "Poll (once) - for synced output"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 839.0, 410.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 606.9999723434448, 220.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-95",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 667.0, 604.5, 107.29166257381439, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 471.58331084251404, 377.0833189487457, 107.29166257381439, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 878.0, 469.5, 150.0, 33.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 650.9999723434448, 260.0, 150.0, 33.0 ],
                    "text": "<---- double-click to view RNBO patch"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 521.0, 470.0, 52.58335089683533, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 392.41664719581604, 347.9166533946991, 52.58335089683533, 20.0 ],
                    "text": "Reset"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 96.0, 59.3749977350235, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 390.6249850988388, 156.87500154972076, 59.3749977350235, 20.0 ],
                    "text": "\"Snare\""
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 785.0, 91.0, 44.25000548362732, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 498.95831429958344, 156.87500154972076, 44.25000548362732, 20.0 ],
                    "text": "\"Kick\""
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 811.0, 300.0, 137.64582365751266, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 634.083304643631, 186.4583262205124, 137.64582365751266, 20.0 ],
                    "text": "Enable (Continuous I/O)"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 791.0, 586.0, 298.95832192897797, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 606.9999723434448, 407.2916511297226, 298.95832192897797, 20.0 ],
                    "text": "Spectral Centroid"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 663.0, 634.5, 116.66666221618652, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 471.58331084251404, 404.1666512489319, 116.66666221618652, 20.0 ],
                    "text": "Running Maximum"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 397.0, 635.0, 105.20832931995392, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 359.08331513404846, 404.1666512489319, 105.20832931995392, 20.0 ],
                    "text": "Running Minimum"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 752.0, 89.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 466.6666488647461, 154.7916682958603, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 752.0, 123.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 845.0, 183.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "", "" ],
                    "patching_rect": [ 845.0, 220.0, 96.0, 22.0 ],
                    "text": "adsr~ 4 120 0. 0"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 785.0, 258.0, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 763.0, 220.0, 60.0, 22.0 ],
                    "text": "cycle~ 90"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 529.0, 94.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 360.41665291786194, 154.7916682958603, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 532.0, 127.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 578.0, 148.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "", "" ],
                    "patching_rect": [ 578.0, 191.0, 89.0, 22.0 ],
                    "text": "adsr~ 0 90 0. 0"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 526.0, 230.0, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 526.0, 191.0, 44.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 492.0, 474.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 364.29164826869965, 348.95832002162933, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-41",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 406.0, 605.0, 96.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 363.2499816417694, 377.0833189487457, 96.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 696.0, 500.5, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "float", "int", "int" ],
                    "patching_rect": [ 667.0, 559.5, 48.0, 22.0 ],
                    "text": "peak 0."
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 443.0, 501.0, 42.0, 22.0 ],
                    "text": "20000"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "float", "int", "int" ],
                    "patching_rect": [ 406.0, 560.0, 56.0, 22.0 ],
                    "text": "trough 1."
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 336.0, 219.0, 81.0, 22.0 ],
                    "text": "loadmess -76"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 222.0, 501.0, 45.0, 45.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 164.29166114330292, 354.0833189487457, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 278.0, 274.0, 81.0, 114.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 244.79165732860565, 195.45833337306976, 81.0, 114.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[2]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[2]"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 260.0, 219.0, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 255.20832359790802, 155.87500154972076, 60.0, 22.0 ],
                    "text": "saw~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-13",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 791.0, 557.0, 143.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 606.9999723434448, 378.12498557567596, 96.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 165.0, 276.0, 84.0, 110.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 144.79166114330292, 197.45833337306976, 84.0, 110.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[1]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[1]"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 226.0, 174.0, 31.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 165.0, 219.0, 43.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 153.79166114330292, 156.24999403953552, 66.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 76.0, 278.0, 83.0, 109.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.24999785423279, 198.5, 83.0, 109.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 76.0, 219.0, 44.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.74999785423279, 156.24999403953552, 44.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 811.0, 322.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 608.0416389703751, 184.37499296665192, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "autosave": 1,
                    "id": "obj-1",
                    "inletInfo": {
                        "IOInfo": [
                            {
                                "type": "signal",
                                "index": 1,
                                "tag": "in1",
                                "comment": ""
                            },
                            {
                                "type": "event",
                                "index": 2,
                                "tag": "in2",
                                "comment": "Enable (Continuous I/O)"
                            },
                            {
                                "type": "event",
                                "index": 3,
                                "tag": "in3",
                                "comment": "Reset"
                            },
                            {
                                "type": "event",
                                "index": 4,
                                "tag": "in4",
                                "comment": "Poll (Once)"
                            },
                            {
                                "type": "midi",
                                "index": -1,
                                "tag": "",
                                "comment": ""
                            }
                        ]
                    },
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 2,
                    "outletInfo": {
                        "IOInfo": [
                            {
                                "type": "event",
                                "index": 1,
                                "tag": "out1",
                                "comment": ""
                            }
                        ]
                    },
                    "outlettype": [ "", "list" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 1,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "rnbo",
                        "rect": [ 1100.0, 200.0, 679.0, 912.0 ],
                        "default_fontname": "Lato",
                        "title": "untitled",
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 273.0, 47.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Poll (Once)"
                                    },
                                    "rnbo_serial": 1,
                                    "rnbo_uniqueid": "in_obj-14",
                                    "rnboinfo": {
                                        "needsInstanceInfo": 1,
                                        "argnames": {
                                            "index": {
                                                "attrOrProp": 2,
                                                "digest": "inlet number",
                                                "defaultarg": 1,
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number",
                                                "mandatory": 1
                                            },
                                            "comment": {
                                                "attrOrProp": 2,
                                                "digest": "mouse over comment",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol"
                                            },
                                            "meta": {
                                                "attrOrProp": 2,
                                                "digest": "A JSON formatted string containing metadata for use by the exported code",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "defaultValue": "",
                                                "label": "Metadata",
                                                "displayorder": 3
                                            }
                                        },
                                        "inputs": [],
                                        "outputs": [
                                            {
                                                "name": "out1",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "value from inlet with index 4",
                                                "displayName": "Poll (Once)",
                                                "docked": 0
                                            }
                                        ],
                                        "helpname": "in",
                                        "aliasOf": "in",
                                        "classname": "in",
                                        "operator": 0,
                                        "versionId": 475235762,
                                        "changesPatcherIO": 1
                                    },
                                    "text": "in 4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "linecount": 10,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 264.0, 123.0, 401.0, 150.0 ],
                                    "text": "<---double-click to see SpectralCentroid RNBO patch abstraction\n\nFFT size @arg \n(64, 128, 256, 512, 1024)\n• recommend 1024 for improved accuracy (regardless of what Max's vector size is set to)\n• 512 and lower provides slightly lower latency, but less accuracy\n• all other parameter values are reset to default after changing FFT size arg\n• due to Max's implementation, FFT size @arg has to be const int defined at compile time"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 55.5, 123.0, 201.0, 23.0 ],
                                    "rnbo_classname": "p",
                                    "rnbo_extra_attributes": {
                                        "receivemode": "local",
                                        "exposevoiceparams": 0,
                                        "uidstyle": "auto",
                                        "notecontroller": 0,
                                        "polyphony": -1.0,
                                        "voicecontrol": "simple"
                                    },
                                    "rnbo_serial": 1,
                                    "rnbo_uniqueid": "p_obj-13",
                                    "rnboinfo": {
                                        "needsInstanceInfo": 1,
                                        "argnames": {
                                            "needs_init": {
                                                "attrOrProp": 1,
                                                "digest": "needs_init",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "fftsize": {
                                                "attrOrProp": 1,
                                                "digest": "fftsize",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "target": {
                                                "attrOrProp": 1,
                                                "digest": "target",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 0,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number",
                                                "defaultValue": "0"
                                            },
                                            "mute": {
                                                "attrOrProp": 1,
                                                "digest": "mute",
                                                "isalias": 0,
                                                "aliases": [],
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "in1": {
                                                "attrOrProp": 1,
                                                "digest": "in1",
                                                "isalias": 0,
                                                "aliases": [],
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "inlet": 1,
                                                "type": "signal"
                                            },
                                            "__probingout1": {
                                                "attrOrProp": 1,
                                                "digest": "__probingout1",
                                                "isalias": 0,
                                                "aliases": [],
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "signal"
                                            },
                                            "polyphony": {
                                                "attrOrProp": 2,
                                                "digest": "Polyphony of the subpatcher.",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number",
                                                "defaultValue": "-1"
                                            },
                                            "exposevoiceparams": {
                                                "attrOrProp": 2,
                                                "digest": "Expose per voice versions of the contained parameters (only valid in polyphonic subpatchers).",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "bool",
                                                "defaultValue": "false"
                                            },
                                            "title": {
                                                "attrOrProp": 2,
                                                "digest": "Title of the subpatcher",
                                                "defaultarg": 1,
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "doNotShowInMaxInspector": 1
                                            },
                                            "file": {
                                                "attrOrProp": 2,
                                                "digest": "rnbo file to load",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "doNotShowInMaxInspector": 1
                                            },
                                            "voicecontrol": {
                                                "attrOrProp": 2,
                                                "digest": "Chooses the way that polyphonic voices are controlled. 'simple' (or 'midi') will automatically allocate voices for \tincoming MIDI notes. Setting it to 'user' (or 'none') will switch off MIDI \tvoice allocation and start with all voices unmuted.",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "enum": [ "simple", "user" ],
                                                "type": "enum",
                                                "defaultValue": "simple"
                                            },
                                            "notecontroller": {
                                                "attrOrProp": 2,
                                                "digest": "DEPRECATED. Use voicecontrol instead.",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "doNotShowInMaxInspector": 1
                                            },
                                            "receivemode": {
                                                "attrOrProp": 2,
                                                "digest": "Do receive~ objects get the signal from a send~ inside the patcher directly (without latency), or compensated (with latency, aligned with all other voices).",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "enum": [ "local", "compensated" ],
                                                "type": "enum",
                                                "defaultValue": "local"
                                            },
                                            "args": {
                                                "attrOrProp": 2,
                                                "digest": "Replacement args for the subpatcher, everything named #1, #2 etc. will be replaced with the according argument.",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "doNotShowInMaxInspector": 1
                                            },
                                            "uidstyle": {
                                                "attrOrProp": 2,
                                                "digest": "Behavior of #0 unique ID. auto (default) means abstractions get a local UID, local: start a new local UID, parent: use the one from the parent patcher",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "enum": [ "auto", "local", "parent", "global" ],
                                                "type": "enum",
                                                "defaultValue": "auto"
                                            }
                                        },
                                        "inputs": [
                                            {
                                                "name": "in1",
                                                "type": "signal",
                                                "digest": "in1",
                                                "displayName": "",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in2",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in2",
                                                "displayName": "Enable (Continuous I/O)",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in3",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in3",
                                                "displayName": "Reset",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in4",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in4",
                                                "displayName": "Poll (Once)",
                                                "hot": 1,
                                                "docked": 0
                                            }
                                        ],
                                        "outputs": [
                                            {
                                                "name": "out1",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "out1",
                                                "displayName": "",
                                                "docked": 0
                                            },
                                            {
                                                "name": "out2",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "out2",
                                                "displayName": "Poll Delay (ms)",
                                                "docked": 0
                                            }
                                        ],
                                        "helpname": "patcher",
                                        "aliasOf": "rnbo",
                                        "classname": "p",
                                        "operator": 0,
                                        "versionId": 426236520,
                                        "changesPatcherIO": 0
                                    },
                                    "text": "p @file SpectralCentroid @args 1024"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-69",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 212.5, 36.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Reset"
                                    },
                                    "rnbo_serial": 2,
                                    "rnbo_uniqueid": "in_obj-69",
                                    "rnboinfo": {
                                        "needsInstanceInfo": 1,
                                        "argnames": {
                                            "index": {
                                                "attrOrProp": 2,
                                                "digest": "inlet number",
                                                "defaultarg": 1,
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number",
                                                "mandatory": 1
                                            },
                                            "comment": {
                                                "attrOrProp": 2,
                                                "digest": "mouse over comment",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol"
                                            },
                                            "meta": {
                                                "attrOrProp": 2,
                                                "digest": "A JSON formatted string containing metadata for use by the exported code",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "defaultValue": "",
                                                "label": "Metadata",
                                                "displayorder": 3
                                            }
                                        },
                                        "inputs": [],
                                        "outputs": [
                                            {
                                                "name": "out1",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "value from inlet with index 3",
                                                "displayName": "Reset",
                                                "docked": 0
                                            }
                                        ],
                                        "helpname": "in",
                                        "aliasOf": "in",
                                        "classname": "in",
                                        "operator": 0,
                                        "versionId": 475235762,
                                        "changesPatcherIO": 1
                                    },
                                    "text": "in 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 55.5, 176.0, 36.0, 23.0 ],
                                    "rnbo_classname": "out",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": ""
                                    },
                                    "rnbo_serial": 1,
                                    "rnbo_uniqueid": "out_obj-8",
                                    "rnboinfo": {
                                        "needsInstanceInfo": 1,
                                        "argnames": {
                                            "index": {
                                                "attrOrProp": 2,
                                                "digest": "outlet number",
                                                "defaultarg": 1,
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number",
                                                "mandatory": 1
                                            },
                                            "comment": {
                                                "attrOrProp": 2,
                                                "digest": "mouse over comment",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol"
                                            },
                                            "meta": {
                                                "attrOrProp": 2,
                                                "digest": "A JSON formatted string containing metadata for use by the exported code",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "defaultValue": "",
                                                "label": "Metadata",
                                                "displayorder": 3
                                            }
                                        },
                                        "inputs": [
                                            {
                                                "name": "in1",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "value sent to outlet with index 1",
                                                "displayName": "",
                                                "hot": 1,
                                                "docked": 0
                                            }
                                        ],
                                        "outputs": [],
                                        "helpname": "out",
                                        "aliasOf": "out",
                                        "classname": "out",
                                        "operator": 0,
                                        "versionId": 1131826829,
                                        "changesPatcherIO": 1
                                    },
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 1496.0, 472.0, 150.0, 21.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-68",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 134.0, 36.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Enable (Continuous I/O)"
                                    },
                                    "rnbo_serial": 3,
                                    "rnbo_uniqueid": "in_obj-68",
                                    "rnboinfo": {
                                        "needsInstanceInfo": 1,
                                        "argnames": {
                                            "index": {
                                                "attrOrProp": 2,
                                                "digest": "inlet number",
                                                "defaultarg": 1,
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number",
                                                "mandatory": 1
                                            },
                                            "comment": {
                                                "attrOrProp": 2,
                                                "digest": "mouse over comment",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol"
                                            },
                                            "meta": {
                                                "attrOrProp": 2,
                                                "digest": "A JSON formatted string containing metadata for use by the exported code",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "defaultValue": "",
                                                "label": "Metadata",
                                                "displayorder": 3
                                            }
                                        },
                                        "inputs": [],
                                        "outputs": [
                                            {
                                                "name": "out1",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "value from inlet with index 2",
                                                "displayName": "Enable (Continuous I/O)",
                                                "docked": 0
                                            }
                                        ],
                                        "helpname": "in",
                                        "aliasOf": "in",
                                        "classname": "in",
                                        "operator": 0,
                                        "versionId": 475235762,
                                        "changesPatcherIO": 1
                                    },
                                    "text": "in 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 56.0, 36.0, 35.0, 23.0 ],
                                    "rnbo_classname": "in~",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": ""
                                    },
                                    "rnbo_serial": 1,
                                    "rnbo_uniqueid": "in~_obj-3",
                                    "rnboinfo": {
                                        "needsInstanceInfo": 1,
                                        "argnames": {
                                            "out1": {
                                                "attrOrProp": 1,
                                                "digest": "signal from inlet with index 1",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 0,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "outlet": 1,
                                                "type": "signal"
                                            },
                                            "index": {
                                                "attrOrProp": 2,
                                                "digest": "inlet number",
                                                "defaultarg": 1,
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number",
                                                "mandatory": 1
                                            },
                                            "comment": {
                                                "attrOrProp": 2,
                                                "digest": "mouse over comment",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol"
                                            },
                                            "meta": {
                                                "attrOrProp": 2,
                                                "digest": "A JSON formatted string containing metadata for use by the exported code",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 0,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "symbol",
                                                "defaultValue": "",
                                                "label": "Metadata",
                                                "displayorder": 3
                                            }
                                        },
                                        "inputs": [],
                                        "outputs": [
                                            {
                                                "name": "out1",
                                                "type": "signal",
                                                "digest": "signal from inlet with index 1",
                                                "displayName": "",
                                                "docked": 0
                                            }
                                        ],
                                        "helpname": "in~",
                                        "aliasOf": "in~",
                                        "classname": "in~",
                                        "operator": 0,
                                        "versionId": -1654556303,
                                        "changesPatcherIO": 1
                                    },
                                    "text": "in~ 1"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 3 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 1 ],
                                    "source": [ "obj-68", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 2 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 791.0, 468.0, 78.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 604.9999723434448, 260.0, 40.0, 22.0 ],
                    "rnboattrcache": {
                        "p_obj-13/needs_init": {
                            "label": "needs_init",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-13/fftsize": {
                            "label": "fftsize",
                            "isEnum": 0,
                            "parsestring": ""
                        }
                    },
                    "rnboversion": "1.4.2",
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "rnbo~",
                            "parameter_modmode": 0,
                            "parameter_shortname": "rnbo~",
                            "parameter_type": 3
                        }
                    },
                    "saved_object_attributes": {
                        "optimization": "O1",
                        "parameter_enable": 1,
                        "uuid": "1bfac79d-8f0f-11ef-879d-563714c44999"
                    },
                    "snapshot": {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "snapshotlist",
                        "origin": "rnbo~",
                        "type": "list",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                            "__sps": {
                                "p_obj-13": {
                                    "fftsize": {
                                        "value": 1024.0
                                    },
                                    "needs_init": {
                                        "value": 1.0
                                    }
                                }
                            },
                            "__presetid": "1bfac79d-8f0f-11ef-879d-563714c44999"
                        },
                        "snapshotlist": {
                            "current_snapshot": 0,
                            "entries": [
                                {
                                    "filetype": "C74Snapshot",
                                    "version": 2,
                                    "minorversion": 0,
                                    "name": "untitled",
                                    "origin": "1bfac79d-8f0f-11ef-879d-563714c44999",
                                    "type": "rnbo",
                                    "subtype": "",
                                    "embed": 1,
                                    "snapshot": {
                                        "__sps": {
                                            "p_obj-13": {
                                                "fftsize": {
                                                    "value": 1024.0
                                                },
                                                "needs_init": {
                                                    "value": 1.0
                                                }
                                            }
                                        },
                                        "__presetid": "1bfac79d-8f0f-11ef-879d-563714c44999"
                                    },
                                    "fileref": {
                                        "name": "untitled",
                                        "filename": "untitled_20260102.maxsnap",
                                        "filepath": "~/Documents/Max 9/Snapshots",
                                        "filepos": -1,
                                        "snapshotfileid": "d7ebb8c32c092b3607ee1c2406a64658"
                                    }
                                }
                            ]
                        }
                    },
                    "text": "rnbo~",
                    "varname": "rnbo~"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "midpoints": [ 800.5, 543.0, 588.0, 543.0, 588.0, 552.0, 547.5, 552.0 ],
                    "order": 2,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 800.5, 544.2916668653488, 415.5, 544.2916668653488 ],
                    "order": 3,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "midpoints": [ 800.5, 544.2916668653488, 676.5, 544.2916668653488 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "order": 0,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "order": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 0,
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 422.5, 486.2916668653488, 257.5, 486.2916668653488 ],
                    "order": 1,
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 422.5, 477.2916668653488, 231.5, 477.2916668653488 ],
                    "order": 2,
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "order": 1,
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "midpoints": [ 422.5, 211.29166686534882, 511.7500078678131, 211.29166686534882, 511.7500078678131, 256.2916668653488, 607.5, 256.2916668653488 ],
                    "order": 0,
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 0,
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 607.5, 458.2916668653488, 257.5, 458.2916668653488 ],
                    "order": 1,
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 607.5, 452.2916668653488, 231.5, 452.2916668653488 ],
                    "order": 2,
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 174.5, 401.75000071525574, 800.5, 401.75000071525574 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 174.5, 423.2916668653488, 257.5, 423.2916668653488 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 174.5, 433.2916668653488, 231.5, 433.2916668653488 ],
                    "order": 2,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 287.5, 438.2500002384186, 800.5, 438.2500002384186 ],
                    "order": 0,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 287.5, 446.2916668653488, 257.5, 446.2916668653488 ],
                    "order": 1,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 287.5, 438.2916668653488, 231.5, 438.2916668653488 ],
                    "order": 2,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 1,
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 0,
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 2,
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 1 ],
                    "source": [ "obj-25", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 1 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 1,
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "order": 2,
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "order": 0,
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "midpoints": [ 535.5, 259.54166662693024, 422.5, 259.54166662693024 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "midpoints": [ 554.5, 184.54166662693024, 731.5, 184.54166662693024 ],
                    "order": 0,
                    "source": [ "obj-55", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "order": 1,
                    "source": [ "obj-55", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "midpoints": [ 541.5, 178.37109375, 708.0, 178.37109375, 708.0, 398.01171875, 848.5, 398.01171875 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "order": 1,
                    "source": [ "obj-58", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "order": 0,
                    "source": [ "obj-58", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "midpoints": [ 761.5, 160.65234375, 1010.56640625, 160.65234375, 1010.56640625, 285.0, 1041.8828125, 285.0, 1041.8828125, 405.0, 848.5, 405.0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 85.5, 412.00000047683716, 800.5, 412.00000047683716 ],
                    "order": 0,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 85.5, 485.2916668653488, 257.5, 485.2916668653488 ],
                    "order": 1,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 85.5, 493.2916668653488, 231.5, 493.2916668653488 ],
                    "order": 2,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 1 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 3 ],
                    "source": [ "obj-97", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-1": [ "rnbo~", "rnbo~", 0 ],
            "obj-104": [ "live.gain~[3]", "live.gain~", 0 ],
            "obj-106": [ "live.gain~[4]", "live.gain~", 0 ],
            "obj-12": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-15": [ "live.gain~[2]", "live.gain~", 0 ],
            "obj-6": [ "live.gain~", "live.gain~", 0 ],
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}