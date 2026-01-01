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
        "rect": [ 51.0, 87.0, 1312.0, 973.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "fontsize": 28.0,
                    "id": "obj-108",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 848.0, 87.0, 411.0, 38.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 60.0, 21.0, 444.7916496992111, 38.0 ],
                    "text": "Onset Detector Example Patch"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 734.0, 501.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 577.0, 354.5, 96.0, 20.0 ],
                    "text": "Onset Detected"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 625.0, 145.0, 204.0, 33.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 891.0, 152.0, 204.0, 33.0 ],
                    "text": "Note: Current settings are optimized for percussion / drum material"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 916.0, 242.5, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 916.0, 211.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 699.0, 199.0, 201.0, 60.0 ],
                    "presentation": 1,
                    "presentation_linecount": 4,
                    "presentation_rect": [ 697.5, 75.0, 201.0, 60.0 ],
                    "text": "Note: After changing parameter values, toggle 'Reset' on/off while Onset Detection enabled in order for changes to take effect."
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 699.0, 395.0, 150.0, 33.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 849.0, 259.0, 150.0, 33.0 ],
                    "text": "<---- double-click to view RNBO patch"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 971.0, 321.5, 63.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 915.0, 187.0, 63.0, 20.0 ],
                    "text": "ODF Type"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 503.0, 797.0, 74.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 322.0, 341.0, 74.0, 47.0 ],
                    "text": "Enable Audio Output",
                    "textjustification": 2
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 396.5, 396.0, 126.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 227.0, 496.0, 89.0, 47.0 ],
                    "text": "Direct Input\nOnsetDetect\nSend Level",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 274.0, 207.0, 81.0, 22.0 ],
                    "text": "loadmess -22"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 558.25, 554.0, 81.0, 22.0 ],
                    "text": "loadmess -20"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 596.0, 623.0, 57.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 392.0, 496.0, 57.0, 47.0 ],
                    "text": "Test Synth Output",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 255.0, 622.0, 106.0, 60.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 27.0, 418.0, 110.0, 47.0 ],
                    "text": "Direct Input Level\n(Use headphones\nto avoid feedback!)",
                    "textjustification": 2
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 139.0, 312.0, 64.0, 33.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 67.0, 206.0, 61.0, 33.0 ],
                    "text": "Sample\n Level",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 282.5, 231.5, 127.0, 33.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 209.0, 284.0, 124.0, 33.0 ],
                    "text": "Sample OnsetDetect Send Level",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 33.0, 75.0, 135.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 60.0, 81.0, 135.0, 20.0 ],
                    "text": "1. Load Audio Sample"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 283.0, 34.0, 126.0, 33.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 237.0, 91.5, 126.0, 33.0 ],
                    "text": "2. Start Sample Playback"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 388.0, 568.0, 81.0, 22.0 ],
                    "text": "loadmess -70"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 498.0, 199.0, 201.0, 60.0 ],
                    "presentation": 1,
                    "presentation_linecount": 4,
                    "presentation_rect": [ 490.0, 241.0, 191.0, 60.0 ],
                    "text": "Note: Higher Thresh needs less input attenuation (and vice versa)\n(e.g. 0.9 thresh only needs approx.  -7dB input atten.)"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 361.0, 603.0, 68.0, 97.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 127.0, 393.0, 68.0, 97.0 ],
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
                    "id": "obj-50",
                    "linecount": 6,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 341.0, 280.0, 115.0, 87.0 ],
                    "presentation": 1,
                    "presentation_linecount": 6,
                    "presentation_rect": [ 305.0, 184.0, 115.0, 87.0 ],
                    "text": "Note: Attenuating\ninput the right amount improves onset detection \n(e.g. -22 dB w/ default settings)"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 204.0, 275.0, 68.0, 97.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 127.0, 179.0, 68.0, 97.0 ],
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
                    "id": "obj-48",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 388.0, 453.0, 68.0, 97.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 237.0, 393.0, 68.0, 97.0 ],
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
                    "id": "obj-46",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 274.0, 269.0, 68.0, 97.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 237.0, 179.0, 68.0, 97.0 ],
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
                    "id": "obj-43",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 252.0, 34.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 206.0, 96.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-38",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 265.0, 102.0, 56.0, 22.0 ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 206.0, 87.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 252.0, 69.0, 31.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 102.0, 48.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 60.0, 102.0, 48.0, 22.0 ],
                    "text": "replace"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 853.0, 285.5, 63.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 824.0, 152.0, 63.0, 47.0 ],
                    "text": "MedSpan (0 - 256, 11)"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 878.0, 344.5, 29.5, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 849.0, 211.0, 29.5, 22.0 ],
                    "text": "11"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 797.0, 285.5, 60.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 768.0, 152.0, 60.0, 47.0 ],
                    "text": "MinGap (0 - 256, 20)"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 818.0, 344.5, 29.5, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 789.0, 211.0, 29.5, 22.0 ],
                    "text": "20"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 734.0, 285.5, 61.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 705.0, 152.0, 61.0, 47.0 ],
                    "text": "Floor\n(0.0 - 1.0,\n0.1)"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 749.0, 344.5, 29.5, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 720.0, 211.0, 29.5, 22.0 ],
                    "text": "0.1"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 60.0, 133.0, 119.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 60.0, 133.0, 119.0, 22.0 ],
                    "text": "buffer~ sampleBuf_1"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 206.0, 133.0, 174.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 206.0, 133.0, 174.0, 22.0 ],
                    "text": "groove~ sampleBuf_1 @loop 1"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 227.5, 408.5, 121.0, 20.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 84.0, 341.0, 53.0, 47.0 ],
                    "text": "Enable Audio Input",
                    "textjustification": 2
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 535.0, 262.0, 59.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 610.0, 93.0, 89.0, 33.0 ],
                    "text": "Reset Onset Detection"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 474.0, 275.0, 63.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 429.0, 91.5, 103.0, 33.0 ],
                    "text": "3. Enable Onset Detection"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 547.0, 469.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 603.0, 435.0, 50.0, 22.0 ],
                    "text": "select 1"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 454.0, 799.0, 45.0, 45.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 398.0, 342.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 526.0, 598.0, 68.0, 97.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 386.5, 393.0, 68.0, 97.0 ],
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
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 512.0, 558.0, 29.5, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 488.0, 511.0, 44.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "", "" ],
                    "patching_rect": [ 547.0, 511.0, 89.0, 22.0 ],
                    "text": "adsr~ 0 90 0. 0"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 658.0, 285.5, 74.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 629.0, 152.0, 74.0, 47.0 ],
                    "text": "Relax Time (0.0 - 4.0, 1.0)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 680.25, 344.5, 29.5, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 651.0, 211.0, 29.5, 22.0 ],
                    "text": "1."
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.25, 285.5, 73.0, 47.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 554.0, 152.0, 73.0, 47.0 ],
                    "text": "Threshold (0.0 -1.0, 0.5)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 605.0, 344.5, 29.5, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 576.0, 211.0, 29.5, 22.0 ],
                    "text": "0.5"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 954.0, 294.5, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "items": [ "Power", ",", "Magsum", ",", "Complex", ",", "RComplex", ",", "Phase", ",", "WPhase", ",", "MKL" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 954.0, 343.5, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 898.0, 209.0, 100.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 971.0, 381.5, 49.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 545.0, 321.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 584.0, 96.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 511.0, 321.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 398.0, 95.5, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 662.0, 478.0, 66.0, 66.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 506.0, 331.5, 66.0, 66.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "ezadc~",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 349.5, 396.0, 45.0, 45.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 342.0, 45.0, 45.0 ]
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
                                "comment": "Enable"
                            },
                            {
                                "type": "event",
                                "index": 3,
                                "tag": "in3",
                                "comment": "Init"
                            },
                            {
                                "type": "event",
                                "index": 4,
                                "tag": "in4",
                                "comment": "Threshold (0.0 - 1.0)"
                            },
                            {
                                "type": "event",
                                "index": 5,
                                "tag": "in5",
                                "comment": "Relax Time (0.0 - 4.0)"
                            },
                            {
                                "type": "event",
                                "index": 6,
                                "tag": "in6",
                                "comment": "Floor (0.0 - 1.0)"
                            },
                            {
                                "type": "event",
                                "index": 7,
                                "tag": "in7",
                                "comment": "MinGap (0 - 256)"
                            },
                            {
                                "type": "event",
                                "index": 8,
                                "tag": "in8",
                                "comment": "MedSpan (0 - 256)"
                            },
                            {
                                "type": "event",
                                "index": 9,
                                "tag": "in9",
                                "comment": "ODF Type (0 - 6): Power, Magsum, Complex, RComplex, Phase, WPhase, MKL"
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
                    "numinlets": 10,
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
                        "rect": [ 974.0, 430.0, 485.0, 732.0 ],
                        "default_fontname": "Lato",
                        "title": "untitled",
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-1",
                                    "linecount": 7,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 212.0, 153.0, 181.0, 107.0 ],
                                    "text": "FFT size @arg \n(64, 128, 256, 512, 1024)\n• this should usually be left at 64 for lowest latency\n• all other parameter values are reset to default after changing FFT size arg"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "newobj",
                                    "numinlets": 9,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 79.0, 146.0, 131.0, 23.0 ],
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
                                    "rnbo_uniqueid": "p_obj-18",
                                    "rnboinfo": {
                                        "needsInstanceInfo": 1,
                                        "argnames": {
                                            "enable": {
                                                "attrOrProp": 1,
                                                "digest": "enable",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
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
                                            "thresh": {
                                                "attrOrProp": 1,
                                                "digest": "thresh",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "relaxtime": {
                                                "attrOrProp": 1,
                                                "digest": "relaxtime",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "floor": {
                                                "attrOrProp": 1,
                                                "digest": "floor",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "mingap": {
                                                "attrOrProp": 1,
                                                "digest": "mingap",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "medspan": {
                                                "attrOrProp": 1,
                                                "digest": "medspan",
                                                "isalias": 0,
                                                "aliases": [],
                                                "settable": 1,
                                                "attachable": 1,
                                                "isparam": 0,
                                                "deprecated": 0,
                                                "touched": 0,
                                                "type": "number"
                                            },
                                            "odftype": {
                                                "attrOrProp": 1,
                                                "digest": "odftype",
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
                                                "displayName": "Enable",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in3",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in3",
                                                "displayName": "Init",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in4",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in4",
                                                "displayName": "Threshold (0.0 - 1.0)",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in5",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in5",
                                                "displayName": "Relax Time (0.0 - 4.0)",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in6",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in6",
                                                "displayName": "Floor (0.0 - 1.0)",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in7",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in7",
                                                "displayName": "MinGap (0 - 256)",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in8",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in8",
                                                "displayName": "MedSpan (0 - 256)",
                                                "hot": 1,
                                                "docked": 0
                                            },
                                            {
                                                "name": "in9",
                                                "type": [ "bang", "number", "list" ],
                                                "digest": "in9",
                                                "displayName": "ODF Type (0 - 6): Power, Magsum, Complex, RComplex, Phase, WPhase, MKL",
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
                                            }
                                        ],
                                        "helpname": "patcher",
                                        "aliasOf": "rnbo",
                                        "classname": "p",
                                        "operator": 0,
                                        "versionId": 426236520,
                                        "changesPatcherIO": 0
                                    },
                                    "text": "p @file Onset @args 64"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-87",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 346.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "ODF Type (0 - 6): Power, Magsum, Complex, RComplex, Phase, WPhase, MKL"
                                    },
                                    "rnbo_serial": 1,
                                    "rnbo_uniqueid": "in_obj-87",
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
                                                "digest": "value from inlet with index 9",
                                                "displayName": "ODF Type (0 - 6): Power, Magsum, Complex, RComplex, Phase, WPhase, MKL",
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
                                    "text": "in 9"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 307.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "MedSpan (0 - 256)"
                                    },
                                    "rnbo_serial": 2,
                                    "rnbo_uniqueid": "in_obj-84",
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
                                                "digest": "value from inlet with index 8",
                                                "displayName": "MedSpan (0 - 256)",
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
                                    "text": "in 8"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-73",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 270.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "MinGap (0 - 256)"
                                    },
                                    "rnbo_serial": 3,
                                    "rnbo_uniqueid": "in_obj-73",
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
                                                "digest": "value from inlet with index 7",
                                                "displayName": "MinGap (0 - 256)",
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
                                    "text": "in 7"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-72",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 232.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Floor (0.0 - 1.0)"
                                    },
                                    "rnbo_serial": 4,
                                    "rnbo_uniqueid": "in_obj-72",
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
                                                "digest": "value from inlet with index 6",
                                                "displayName": "Floor (0.0 - 1.0)",
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
                                    "text": "in 6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-71",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 189.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Relax Time (0.0 - 4.0)"
                                    },
                                    "rnbo_serial": 5,
                                    "rnbo_uniqueid": "in_obj-71",
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
                                                "digest": "value from inlet with index 5",
                                                "displayName": "Relax Time (0.0 - 4.0)",
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
                                    "text": "in 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-70",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 151.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Threshold (0.0 - 1.0)"
                                    },
                                    "rnbo_serial": 6,
                                    "rnbo_uniqueid": "in_obj-70",
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
                                                "displayName": "Threshold (0.0 - 1.0)",
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
                                    "id": "obj-69",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 114.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Init"
                                    },
                                    "rnbo_serial": 7,
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
                                                "displayName": "Init",
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
                                    "id": "obj-68",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 72.0, 50.0, 28.0, 23.0 ],
                                    "rnbo_classname": "in",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": "Enable"
                                    },
                                    "rnbo_serial": 8,
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
                                                "displayName": "Enable",
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
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 79.0, 195.0, 57.0, 23.0 ],
                                    "rnbo_classname": "out",
                                    "rnbo_extra_attributes": {
                                        "meta": "",
                                        "comment": ""
                                    },
                                    "rnbo_serial": 1,
                                    "rnbo_uniqueid": "out_obj-4",
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
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 22.0, 50.0, 35.0, 23.0 ],
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
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "midpoints": [ 31.5, 99.0, 88.5, 99.0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 1 ],
                                    "midpoints": [ 81.5, 99.0, 102.5, 99.0 ],
                                    "source": [ "obj-68", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 2 ],
                                    "midpoints": [ 123.5, 99.0, 116.5, 99.0 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 3 ],
                                    "midpoints": [ 160.5, 90.0, 130.5, 90.0 ],
                                    "source": [ "obj-70", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 4 ],
                                    "midpoints": [ 198.5, 95.0, 144.5, 95.0 ],
                                    "source": [ "obj-71", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 5 ],
                                    "midpoints": [ 241.5, 105.0, 158.5, 105.0 ],
                                    "source": [ "obj-72", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 6 ],
                                    "midpoints": [ 279.5, 115.0, 172.5, 115.0 ],
                                    "source": [ "obj-73", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 7 ],
                                    "midpoints": [ 316.5, 124.0, 186.5, 124.0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 8 ],
                                    "midpoints": [ 355.5, 134.0, 200.5, 134.0 ],
                                    "source": [ "obj-87", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 570.0, 395.0, 124.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 720.0, 259.0, 124.0, 22.0 ],
                    "rnboattrcache": {
                        "p_obj-18/mingap": {
                            "label": "mingap",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/thresh": {
                            "label": "thresh",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/enable": {
                            "label": "enable",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/relaxtime": {
                            "label": "relaxtime",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/floor": {
                            "label": "floor",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/medspan": {
                            "label": "medspan",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/needs_init": {
                            "label": "needs_init",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/fftsize": {
                            "label": "fftsize",
                            "isEnum": 0,
                            "parsestring": ""
                        },
                        "p_obj-18/odftype": {
                            "label": "odftype",
                            "isEnum": 1,
                            "parsestring": "\"power\" \"magsum\" \"complex\" \"rcomplex\" \"phase\" \"wphase\" \"mkl\""
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
                        "uuid": "933c1a87-0b16-11ef-9a87-563714c44999"
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
                                "p_obj-18": {
                                    "fftsize": {
                                        "value": 64.0
                                    },
                                    "odftype": {
                                        "value": 1.0
                                    },
                                    "medspan": {
                                        "value": 11.0
                                    },
                                    "mingap": {
                                        "value": 20.0
                                    },
                                    "relaxtime": {
                                        "value": 1.0
                                    },
                                    "enable": {
                                        "value": 0.0
                                    },
                                    "thresh": {
                                        "value": 0.5
                                    },
                                    "needs_init": {
                                        "value": 1.0
                                    },
                                    "floor": {
                                        "value": 0.1
                                    }
                                }
                            },
                            "__presetid": "933c1a87-0b16-11ef-9a87-563714c44999"
                        },
                        "snapshotlist": {
                            "current_snapshot": 0,
                            "entries": [
                                {
                                    "filetype": "C74Snapshot",
                                    "version": 2,
                                    "minorversion": 0,
                                    "name": "untitled",
                                    "origin": "933c1a87-0b16-11ef-9a87-563714c44999",
                                    "type": "rnbo",
                                    "subtype": "",
                                    "embed": 1,
                                    "snapshot": {
                                        "__sps": {
                                            "p_obj-18": {
                                                "fftsize": {
                                                    "value": 64.0
                                                },
                                                "odftype": {
                                                    "value": 1.0
                                                },
                                                "medspan": {
                                                    "value": 11.0
                                                },
                                                "mingap": {
                                                    "value": 20.0
                                                },
                                                "relaxtime": {
                                                    "value": 1.0
                                                },
                                                "enable": {
                                                    "value": 0.0
                                                },
                                                "thresh": {
                                                    "value": 0.5
                                                },
                                                "needs_init": {
                                                    "value": 1.0
                                                },
                                                "floor": {
                                                    "value": 0.1
                                                }
                                            }
                                        },
                                        "__presetid": "933c1a87-0b16-11ef-9a87-563714c44999"
                                    },
                                    "fileref": {
                                        "name": "untitled",
                                        "filename": "untitled_20251207.maxsnap",
                                        "filepath": "~/Documents/Max 9/Snapshots",
                                        "filepos": -1,
                                        "snapshotfileid": "cde6e409d34ccc09d4344bdd166da919"
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
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 8 ],
                    "order": 1,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 1 ],
                    "order": 0,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 535.5, 786.0, 489.5, 786.0 ],
                    "order": 0,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 535.5, 774.0, 463.5, 774.0 ],
                    "order": 1,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 5 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "order": 0,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "order": 1,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 3 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 4 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "midpoints": [ 397.5, 591.0, 375.0, 591.0, 375.0, 453.0, 397.5, 453.0 ],
                    "order": 0,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "order": 1,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 6 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "order": 0,
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "order": 1,
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "midpoints": [ 938.5, 335.0625, 789.0, 335.0625, 789.0, 339.0, 758.5, 339.0 ],
                    "order": 2,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "midpoints": [ 938.5, 335.4765625, 612.80859375, 335.4765625, 612.80859375, 339.0, 614.5, 339.0 ],
                    "order": 4,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "midpoints": [ 938.5, 335.63671875, 726.0, 335.63671875, 726.0, 335.203125, 689.75, 335.203125 ],
                    "order": 3,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "midpoints": [ 938.5, 336.59765625, 827.5, 336.59765625 ],
                    "order": 1,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "midpoints": [ 938.5, 334.84375, 887.5, 334.84375 ],
                    "order": 0,
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "midpoints": [ 925.5, 267.0, 579.0, 267.0, 579.0, 314.23046875, 554.5, 314.23046875 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 7 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 397.5, 560.0, 474.0, 560.0, 474.0, 453.0, 555.0, 453.0, 555.0, 390.0, 579.5, 390.0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 213.5, 730.0, 489.5, 730.0 ],
                    "order": 0,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 213.5, 740.0, 463.5, 740.0 ],
                    "order": 1,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "midpoints": [ 520.5, 367.0, 591.1666666666666, 367.0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "midpoints": [ 370.5, 707.0, 489.5, 707.0 ],
                    "order": 0,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 370.5, 714.0, 463.5, 714.0 ],
                    "order": 1,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 2 ],
                    "midpoints": [ 554.5, 358.0, 602.8333333333334, 358.0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 1 ],
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-1": [ "rnbo~", "rnbo~", 0 ],
            "obj-16": [ "live.gain~", "live.gain~", 0 ],
            "obj-46": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-48": [ "live.gain~[2]", "live.gain~", 0 ],
            "obj-49": [ "live.gain~[3]", "live.gain~", 0 ],
            "obj-51": [ "live.gain~[4]", "live.gain~", 0 ],
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}