local ClubboxFunctions = include("ClubboxFunctions")
local performerDimmingTargets = {
  "prop_performer_Amalee",
  "prop_performer_Riff",
  "prop_performer_Monculus",
  "prop_performer_Poewk",
  "prop_performer_Dwumrohl"
}

local function updatePerformerDimming()
  local clubbox = game.clubboxContext()
  if clubbox then
    local controller = clubbox:controller()
    if controller then
      local prop = controller:getPropByName("prop_center_stage")
      if prop then
        local tintMin = Vector3(0.6, 0.6, 0.6)
        if prop:getCurVariant() == 1 then
          tintMin = Vector3(0.8, 0.6, 0.6)
        elseif prop:getCurVariant() == -1 then
          tintMin = Vector3(0.6, 0.6, 0.8)
        end
        for _, v in ipairs(performerDimmingTargets) do
          game.clubboxContext():GetDimmer():setPropTintMin(v, tintMin)
        end
      end
    end
  end
end

local function getWubCamTarget()
  local clubbox = game.clubboxContext()
  if clubbox then
    local controller = clubbox:controller()
    if controller then
      local prop, propIndex = ClubboxFunctions.GetClubboxProp("prop_moshpit_screen")
      if prop and propIndex and not clubbox:propUnlocked(propIndex) then
        return "prop_moshpit_no_critter_screen"
      end
    end
  end
  return "prop_moshpit_screen"
end

local ClubboxAct5 = {
  props = {
    prop_fog_left1 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_left1.bin",
      disablePicks = true
    },
    prop_fog_right1 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_right1.bin",
      disablePicks = true
    },
    prop_fire_09 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_09.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_09.bin"
        }
      }
    },
    prop_fire_08 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_08.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_08.bin"
        }
      }
    },
    prop_crowd00 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd00.bin",
      instrument = "club01_act05-prop_crowd00.bin"
    },
    prop_torch_4 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_torch_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_torch_gothic.bin"
        }
      }
    },
    prop_torch_3 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_torch_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_torch_gothic.bin"
        }
      }
    },
    prop_crowd01 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd01.bin",
      instrument = "club01_act05-prop_crowd01.bin"
    },
    prop_fire_10 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_10.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_10.bin"
        }
      }
    },
    prop_fire_07 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_07.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_07.bin"
        }
      }
    },
    prop_torch_5 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_torch_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_torch_gothic.bin"
        }
      }
    },
    prop_torch_2 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_torch_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_torch_gothic.bin"
        }
      }
    },
    prop_fog_left2 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_left2.bin",
      disablePicks = true
    },
    prop_fog_right2 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_right2.bin",
      disablePicks = true
    },
    prop_crowd02 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd02.bin",
      instrument = "club01_act05-prop_crowd02.bin"
    },
    prop_dj = {
      unlockId = 0,
      isMonster = 52,
      customizeIcon = "button_djepic",
      customizeSheet = "clubbox_customization_menu.xml",
      animFile = "xml_bin/club01-05_prop_dj.bin",
      instrument = "club01_act05-Backing_A.bin",
      instruments = {
        [1] = "club01_act05-Backing_B.bin",
        [3] = "club01_act05-Backing_C.bin",
        [9] = "club01_act05-Backing_D.bin"
      },
      onPick = ClubboxFunctions.OnPickDJ
    },
    prop_fire_11 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_11.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_11.bin"
        }
      }
    },
    prop_fire_06 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_06.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_06.bin"
        }
      }
    },
    prop_torch_1 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_torch_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_torch_gothic.bin"
        }
      }
    },
    prop_torch_6 = {
      unlockId = 15,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_torch_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 15,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_torch_gothic.bin"
        }
      }
    },
    prop_fog_left3 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_left3.bin",
      disablePicks = true
    },
    prop_fog_right3 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_right3.bin",
      disablePicks = true
    },
    prop_moshpit_over = {
      unlockId = 7,
      animFile = "xml_bin/club01-05_prop_moshpit_over.bin",
      instrument = "club01_act05-prop_moshpit.bin"
    },
    prop_moshpit_over_locked = {
      unlockId = 0,
      maxUnlockId = 7,
      animFile = "xml_bin/club01-05_prop_moshpit_over_locked.bin"
    },
    prop_critter = {
      unlockId = 20,
      animFile = "xml_bin/club01-05_prop_critter.bin",
      instrument = "club01_act05-prop_critter.bin"
    },
    prop_moshpit = {
      unlockId = 7,
      animFile = "xml_bin/club01-05_prop_moshpit.bin",
      instrument = "club01_act05-prop_moshpit.bin"
    },
    prop_moshpit_locked = {
      unlockId = 0,
      maxUnlockId = 7,
      animFile = "xml_bin/club01-05_prop_moshpit_locked.bin"
    },
    prop_crowd03 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd03.bin",
      instrument = "club01_act05-prop_crowd03.bin"
    },
    prop_crowd04 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd04.bin",
      instrument = "club01_act05-prop_crowd04.bin"
    },
    prop_entbrat_left = {
      unlockId = 7,
      animFile = "xml_bin/club01-05_prop_entbrat_left.bin",
      instrument = "club01_act05-prop_entbrat_left.bin"
    },
    prop_entbrat_right = {
      unlockId = 7,
      animFile = "xml_bin/club01-05_prop_entbrat_right.bin",
      instrument = "club01_act05-prop_entbrat_right.bin"
    },
    prop_fire_05 = {
      unlockId = 5,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_05.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 5,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_05.bin"
        }
      }
    },
    prop_fire_04 = {
      unlockId = 5,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_04.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 5,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_04.bin"
        }
      }
    },
    prop_fire_03 = {
      unlockId = 5,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_03.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 5,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_03.bin"
        }
      }
    },
    prop_fire_02 = {
      unlockId = 5,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_02.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 5,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_02.bin"
        }
      }
    },
    prop_fire_01 = {
      unlockId = 5,
      customizeIcon = "icon_deco_special_effects",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_pyrotechnics_fantasy.bin",
      instrument = "club01_act05-prop_fire_01.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 5,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 15,
          animFile = "xml_bin/club01-05_prop_pyrotechnics_gothic.bin",
          instrument = "club01_act05-prop_fire_01.bin"
        }
      }
    },
    prop_horn_right = {
      unlockId = 17,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_horn_fantasy.bin",
      instrument = "club01_act05-prop_horn_right.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 17,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 17,
          animFile = "xml_bin/club01-05_prop_horn_gothic.bin",
          instrument = "club01_act05-prop_horn_right.bin"
        }
      }
    },
    prop_horn_left = {
      unlockId = 17,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_horn_fantasy.bin",
      instrument = "club01_act05-prop_horn_left.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 17,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 17,
          animFile = "xml_bin/club01-05_prop_horn_gothic.bin",
          instrument = "club01_act05-prop_horn_left.bin"
        }
      }
    },
    prop_lights_middle = {
      unlockId = 6,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_lights_fantasy.bin",
      instrument = "club01_act05-prop_lights_middle.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 6,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_lights_gothic.bin",
          instrument = "club01_act05-prop_lights_middle.bin"
        }
      },
      disablePicks = true
    },
    prop_lights_right = {
      unlockId = 4,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_lights_fantasy.bin",
      instrument = "club01_act05-prop_lights_right.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 4,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_lights_gothic.bin",
          instrument = "club01_act05-prop_lights_right.bin"
        }
      },
      disablePicks = true
    },
    prop_lights_left = {
      unlockId = 2,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_lights_fantasy.bin",
      instrument = "club01_act05-prop_lights_left.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 2,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_lights_gothic.bin",
          instrument = "club01_act05-prop_lights_left.bin"
        }
      },
      disablePicks = true
    },
    prop_hanging_right = {
      unlockId = 17,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_hanging_fantasy.bin",
      instrument = "club01_act05-prop_hanging_right.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 17,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 17,
          animFile = "xml_bin/club01-05_prop_hanging_gothic.bin",
          instrument = "club01_act05-prop_hanging_right.bin"
        }
      }
    },
    prop_hanging_left = {
      unlockId = 17,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_hanging_fantasy.bin",
      instrument = "club01_act05-prop_hanging_left.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 17,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 17,
          animFile = "xml_bin/club01-05_prop_hanging_gothic.bin",
          instrument = "club01_act05-prop_hanging_left.bin"
        }
      }
    },
    prop_fog_left4 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_left4.bin",
      disablePicks = true
    },
    prop_fog_right4 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_right4.bin",
      disablePicks = true
    },
    prop_crowd05 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd05.bin",
      instrument = "club01_act05-prop_crowd05.bin"
    },
    prop_crowd06 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd06.bin",
      instrument = "club01_act05-prop_crowd06.bin"
    },
    prop_stage_ol = {
      unlockId = 3,
      customizeIcon = "icon_deco_front_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_stage_ol_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 3,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 13,
          animFile = "xml_bin/club01-05_prop_stage_ol_gothic.bin"
        }
      }
    },
    prop_performer_Amalee = {
      unlockId = 0,
      displayName = "BATTLE_COSTUME_VOC_06_1",
      isMonster = 1022,
      customizeIcon = "button_amalee",
      customizeSheet = "clubbox_customization_menu_act05.xml",
      animFile = "xml_bin/club01-05_monster_VOC_06.bin",
      costumeFile = "xml_bin/club01-05_costume_VOC_06_01.bin",
      costumeId = 635,
      instrument = "club01_act05-VOC_06_A.bin",
      variants = {
        [0] = {
          name = "gothic",
          unlockId = 18,
          displayName = "BATTLE_COSTUME_VOC_06_2",
          costumeId = 636,
          animFile = "xml_bin/club01-05_monster_VOC_06.bin",
          costumeFile = "xml_bin/club01-05_costume_VOC_06_02.bin",
          instrument = "club01_act05-VOC_06_B.bin"
        }
      }
    },
    prop_performer_Riff = {
      unlockId = 8,
      displayName = "BATTLE_COSTUME_ACDE_7",
      isMonster = 28,
      customizeIcon = "button_riff",
      customizeSheet = "clubbox_customization_menu_act05.xml",
      animFile = "xml_bin/club01-05_monster_ACDE.bin",
      costumeFile = "xml_bin/club01-05_costume_ACDE_07.bin",
      costumeId = 638,
      instrument = "club01_act05-ACDE_A.bin",
      variants = {
        [0] = {
          name = "gothic",
          unlockId = 14,
          displayName = "BATTLE_COSTUME_ACDE_8",
          costumeId = 639,
          animFile = "xml_bin/club01-05_monster_ACDE.bin",
          costumeFile = "xml_bin/club01-05_costume_ACDE_08.bin",
          instrument = "club01_act05-ACDE_B.bin"
        }
      }
    },
    prop_performer_Monculus = {
      unlockId = 6,
      displayName = "BATTLE_COSTUME_S12_1",
      isMonster = 661,
      customizeIcon = "button_monculus",
      customizeSheet = "clubbox_customization_menu_act05.xml",
      animFile = "xml_bin/club01-05_monster_S12.bin",
      costumeFile = "xml_bin/club01-05_costume_S12_01.bin",
      costumeId = 641,
      instrument = "club01_act05-S12_A.bin",
      variants = {
        [0] = {
          name = "gothic",
          unlockId = 16,
          displayName = "BATTLE_COSTUME_S12_2",
          costumeId = 642,
          animFile = "xml_bin/club01-05_monster_S12.bin",
          costumeFile = "xml_bin/club01-05_costume_S12_02.bin",
          instrument = "club01_act05-S12_B.bin"
        }
      }
    },
    prop_performer_Poewk = {
      unlockId = 4,
      displayName = "BATTLE_COSTUME_U03_1",
      isMonster = 127,
      customizeIcon = "button_poewk",
      customizeSheet = "clubbox_customization_menu_act05.xml",
      animFile = "xml_bin/club01-05_monster_U03.bin",
      costumeFile = "xml_bin/club01-05_costume_U03_01.bin",
      costumeId = 647,
      instrument = "club01_act05-U03_A.bin",
      variants = {
        [0] = {
          name = "gothic",
          unlockId = 10,
          displayName = "BATTLE_COSTUME_U03_2",
          costumeId = 648,
          animFile = "xml_bin/club01-05_monster_U03.bin",
          costumeFile = "xml_bin/club01-05_costume_U03_02.bin",
          instrument = "club01_act05-U03_B.bin"
        }
      }
    },
    prop_performer_Dwumrohl = {
      unlockId = 2,
      displayName = "BATTLE_COSTUME_U01_1",
      isMonster = 129,
      customizeIcon = "button_dwumrohl",
      customizeSheet = "clubbox_customization_menu_act05.xml",
      animFile = "xml_bin/club01-05_monster_U01.bin",
      costumeFile = "xml_bin/club01-05_costume_U01_01.bin",
      costumeId = 644,
      instrument = "club01_act05-U01_A.bin",
      variants = {
        [0] = {
          name = "gothic",
          unlockId = 12,
          displayName = "BATTLE_COSTUME_U01_2",
          costumeId = 645,
          animFile = "xml_bin/club01-05_monster_U01.bin",
          costumeFile = "xml_bin/club01-05_costume_U01_02.bin",
          instrument = "club01_act05-U01_B.bin"
        }
      }
    },
    prop_center_stage = {
      unlockId = 3,
      customizeIcon = "icon_deco_front_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_center_stage_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 3,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 13,
          animFile = "xml_bin/club01-05_prop_center_stage_gothic.bin"
        }
      },
      onChange = function()
        updatePerformerDimming()
      end
    },
    prop_center_stage_base = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_center_stage_base.bin"
    },
    prop_screen_open = {
      unlockId = 19,
      animFile = "xml_bin/club01-05_prop_screen_open.bin",
      instrument = "club01_act05-prop_screen_open.bin",
      onSetup = function()
        print("=== Setup Wub Screen")
        game.clubboxContext():SetSkyTint(Vector3(0, 0, 0))
        ClubboxFunctions.SetupWubScreen("prop_screen_open", "wubbox_screen_mask_NOTINT")
        local wubCam = game.clubboxContext():GetWubCam()
        wubCam:setAutoMode(false)
        wubCam:setZoomProperties(5, 2, 4)
        wubCam:acquireTarget(getWubCamTarget())
        wubCam:setOffset(Vector2(0, -32))
      end,
      onTrigger = function()
        local trigger = ClubboxFunctions.GetClubboxTrigger()
        if trigger then
          local wubCam = game.clubboxContext():GetWubCam()
          local triggered = false
          if trigger.note == 73 then
            print("Trigger 73!")
            triggered = true
            wubCam:setZoomProperties(5, 2, 4)
          elseif trigger.note == 74 then
            print("Trigger 74!")
            triggered = true
            wubCam:setZoomProperties(2, 5, 4)
          end
          if triggered then
            local target = getWubCamTarget()
            if target then
              wubCam:acquireTarget(target)
            end
          end
        end
      end
    },
    prop_screen_closed = {
      unlockId = 0,
      maxUnlockId = 19,
      animFile = "xml_bin/club01-05_prop_screen_closed.bin"
    },
    prop_stairs = {
      unlockId = 13,
      customizeIcon = "icon_deco_front_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_stairs_fantasy.bin",
      disablePicks = true,
      variants = {
        [0] = {
          name = "none",
          unlockId = 13,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 13,
          animFile = "xml_bin/club01-05_prop_stairs_gothic.bin"
        }
      }
    },
    prop_stage = {
      unlockId = 3,
      customizeIcon = "icon_deco_front_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_stage_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 3,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 13,
          animFile = "xml_bin/club01-05_prop_stage_gothic.bin"
        }
      }
    },
    prop_stage_base = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_stage_base.bin"
    },
    prop_wubboxarm_right = {
      unlockId = 19,
      animFile = "xml_bin/club01-05_prop_wubboxarm.bin"
    },
    prop_wubboxarm_left = {
      unlockId = 19,
      animFile = "xml_bin/club01-05_prop_wubboxarm.bin"
    },
    prop_fog_left5 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_left5.bin",
      disablePicks = true
    },
    prop_fog_right5 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_fog.bin",
      instrument = "club01_act05-prop_fog_right5.bin",
      disablePicks = true
    },
    prop_lamp_right = {
      unlockId = 13,
      customizeIcon = "icon_deco_front_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_lamp_fantasy.bin",
      instrument = "club01_act05-prop_lamp_right.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 13,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 13,
          animFile = "xml_bin/club01-05_prop_lamp_gothic.bin",
          instrument = "club01_act05-prop_lamp_right.bin"
        }
      }
    },
    prop_lamp_left = {
      unlockId = 13,
      customizeIcon = "icon_deco_front_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_lamp_fantasy.bin",
      instrument = "club01_act05-prop_lamp_left.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 13,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 13,
          animFile = "xml_bin/club01-05_prop_lamp_gothic.bin",
          instrument = "club01_act05-prop_lamp_left.bin"
        }
      }
    },
    prop_rocks_right = {
      unlockId = 1,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_rocks_fantasy.bin",
      instrument = "club01_act05-prop_rocks_right.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 1,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_rocks_gothic.bin",
          instrument = "club01_act05-prop_rocks_right.bin"
        }
      }
    },
    prop_rocks_left = {
      unlockId = 1,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_rocks_fantasy.bin",
      instrument = "club01_act05-prop_rocks_left.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 1,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_rocks_gothic.bin",
          instrument = "club01_act05-prop_rocks_left.bin"
        }
      }
    },
    prop_statue_right = {
      unlockId = 1,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_statue_fantasy.bin",
      instrument = "club01_act05-prop_statue_right.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 1,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_statue_gothic.bin",
          instrument = "club01_act05-prop_statue_right.bin"
        }
      }
    },
    prop_statue_left = {
      unlockId = 1,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_statue_fantasy.bin",
      instrument = "club01_act05-prop_statue_left.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 1,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_statue_gothic.bin",
          instrument = "club01_act05-prop_statue_left.bin"
        }
      }
    },
    prop_crowd07 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd07.bin",
      instrument = "club01_act05-prop_crowd07.bin"
    },
    prop_crowd08 = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_crowd08.bin",
      instrument = "club01_act05-prop_crowd08.bin"
    },
    prop_backwall = {
      unlockId = 11,
      customizeIcon = "icon_deco_back_stage",
      customizeSheet = "clubbox_customization_menu_act02.xml",
      animFile = "xml_bin/club01-05_prop_backwall_fantasy.bin",
      variants = {
        [0] = {
          name = "none",
          unlockId = 11,
          animFile = "xml_bin/club01-02_prop_off.bin"
        },
        [1] = {
          name = "gothic",
          unlockId = 11,
          animFile = "xml_bin/club01-05_prop_backwall_gothic.bin"
        }
      }
    },
    prop_backwall_base = {
      unlockId = 0,
      animFile = "xml_bin/club01-05_prop_backwall_base.bin"
    },
    prop_moshpit_no_critter_screen = {
      unlockId = 19,
      maxUnlockId = 20,
      animFile = "xml_bin/club01-05_prop_moshpit_no_critter_screen.bin",
      instrument = "club01_act05-prop_moshpit_screen.bin"
    },
    prop_moshpit_screen = {
      unlockId = 20,
      animFile = "xml_bin/club01-05_prop_moshpit_screen.bin",
      instrument = "club01_act05-prop_moshpit_screen.bin"
    },
    prop_fx_screenshake = {
      unlockId = 5,
      animFile = "xml_bin/club01-02_prop_off.bin",
      instrument = "club01_act05-fx_screenshake.bin",
      instruments = {
        [5] = "club01_act01-fx_screenshake_A.bin",
        [15] = "club01_act01-fx_screenshake_B.bin"
      },
      onTrigger = function()
        if not ClubboxFunctions:IsScreenFxEnabled() then
          return
        end
        local trigger = ClubboxFunctions.GetClubboxTrigger()
        if trigger then
          if trigger.note == 72 then
            local magnitude, damping, duration = 25 * (trigger.velocity / 100), 0.7, 1.5
            game.clubboxContext():ShakeCamera(magnitude, damping, duration)
          elseif trigger.note == 73 then
            local magnitude, damping, duration = 15 * (trigger.velocity / 100), 0.3, 0.5
            game.clubboxContext():ShakeCamera(magnitude, damping, duration)
          end
        end
      end
    },
    prop_fx_dimmer = {
      unlockId = 15,
      animFile = "xml_bin/club01-05_prop_moshpit_off.bin",
      instrument = "club01_act05-prop_fx_dimmer.bin",
      onSetup = function()
        print("Setting up Dimmer!")
        game.clubboxContext():InitDimmer()
        local exclusions = {
          "prop_moshpit",
          "prop_critter",
          "prop_moshpit_over",
          "prop_moshpit_screen",
          "prop_moshpit_no_critter_screen",
          "prop_crowd05",
          "prop_crowd06"
        }
        for _, v in ipairs(exclusions) do
          game.clubboxContext():GetDimmer():addExclusion(v)
        end
        game.clubboxContext():GetDimmer():setTintMin(Vector3(0.3, 0.3, 0.5))
        updatePerformerDimming()
      end,
      onTrigger = function()
        local trigger = ClubboxFunctions.GetClubboxTrigger()
        if trigger then
          if trigger.note == 73 or trigger.note == 72 then
            game.clubboxContext():GetDimmer():setBrightness(0.1, trigger.velocity)
          elseif trigger.note == 74 or trigger.note == 75 then
            game.clubboxContext():GetDimmer():setBrightness(1, trigger.velocity)
          end
        end
      end
    }
  }
}
return ClubboxAct5
