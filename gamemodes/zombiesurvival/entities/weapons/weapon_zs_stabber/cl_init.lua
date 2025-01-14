INC_CLIENT()

SWEP.ViewModelFlip = false
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelFOV = 48

SWEP.HUD3DBone = "v_weapon.g3sg1_Parent"
SWEP.HUD3DPos = Vector(-1.5, -5.5, -5)
SWEP.HUD3DAng = Angle(0, 0, 0)
SWEP.HUD3DScale = 0.015

SWEP.VElements = {
	["base+++++"] = { type = "Model", model = "models/props_c17/substation_transformer01c.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, -0.494, 12.083), angle = Angle(0, 0, -26.507), size = Vector(0.014, 0.012, 0.012), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++++++"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 1.2, 13.8), angle = Angle(-97.014, -85.325, 127.402), size = Vector(0.1, 0.079, 0.09), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base++++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 2.157, 13.34), angle = Angle(176.8, 90, 90), size = Vector(0.101, 0.115, 0.342), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++++++++++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 0, 0.5), angle = Angle(0, 0, 90), size = Vector(0.039, 0.07, 0.07), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++"] = { type = "Model", model = "models/props_combine/combine_booth_short01a.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, -0.091, 11.701), angle = Angle(0, 90, 0), size = Vector(0.012, 0.009, 0.026), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(-0.151, 1.45, -15.332), angle = Angle(-90, -26.883, 90), size = Vector(0.2, 0.2, 0.2), color = Color(180, 180, 200, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["base+++++++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(-0.172, 1.807, 13.182), angle = Angle(-180, 90, 90), size = Vector(0.039, 0.035, 0.075), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++++++++++"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(-0.151, 1.45, -6.753), angle = Angle(0, 54.935, 180), size = Vector(0.2, 0.2, 0.2), color = Color(180, 180, 200, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["sight+++++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, -0.5, -11.948), angle = Angle(-90, 90, 0), size = Vector(0.15, 0.019, 0.029), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight+++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.301, -0.5, -11.948), angle = Angle(0, 10, 0), size = Vector(0.05, 0.059, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight++++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0.3, -0.5, -11.948), angle = Angle(0, -10, 0), size = Vector(0.05, 0.059, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, -0.431, 9.47), angle = Angle(0, 90, 90), size = Vector(0.453, 0.246, 0.291), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++++++++++++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 0, -6.753), angle = Angle(0, 0, 90), size = Vector(0.035, 0.07, 0.07), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0.3, -0.75, 12.8), angle = Angle(0, 0, -90), size = Vector(0.15, 0.15, 0.15), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++"] = { type = "Model", model = "models/props_pipes/concrete_pipe001a.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, -0.401, -10.212), angle = Angle(90, 0, 0), size = Vector(0.056, 0.009, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 0.402, -7.619), angle = Angle(0, 180, 180), size = Vector(0.4, 0.4, 0.045), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 0.972, 6), angle = Angle(94.675, -87.705, -53.169), size = Vector(0.2, 0.1, 0.1), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base+++++++++++++++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 0, 6.752), angle = Angle(0, 0, 90), size = Vector(0.035, 0.07, 0.07), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, -1.3, 12.8), angle = Angle(180, 0, -90), size = Vector(0.009, 0.009, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, -0.5, -11.948), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++"] = { type = "Model", model = "models/props_combine/combine_booth_short01a.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, -0.826, 10.39), angle = Angle(-180, 90, 0), size = Vector(0.009, 0.009, 0.019), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight+++"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, -0.5, -11.948), angle = Angle(0, -12.551, 0), size = Vector(0.012, 0.012, 0.012), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight+"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.301, -0.75, 12.8), angle = Angle(180, 0, -90), size = Vector(0.15, 0.15, 0.15), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++"] = { type = "Model", model = "models/gibs/hgibs_spine.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0, 1.36, 16.593), angle = Angle(180, -180, -175), size = Vector(0.791, 0.791, 0.56), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base++++++++++"] = { type = "Model", model = "models/gibs/helicopter_brokenpiece_03.mdl", bone = "v_weapon.g3sg1_Parent", rel = "base", pos = Vector(0.115, 4, 23), angle = Angle(96.25, -87.705, -53.169), size = Vector(0.158, 0.119, 0.119), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", bone = "v_weapon.g3sg1_Parent", rel = "", pos = Vector(0, -4.553, -14.992), angle = Angle(0, 0, 0), size = Vector(0.043, 0.078, 0.307), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["base+++++"] = { type = "Model", model = "models/props_c17/substation_transformer01c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.494, 12.083), angle = Angle(0, 0, -26.507), size = Vector(0.014, 0.012, 0.012), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++++++"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 1.2, 13.8), angle = Angle(-97.014, -85.325, 127.402), size = Vector(0.1, 0.079, 0.09), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["sight+++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.301, -0.5, -11.948), angle = Angle(0, 10, 0), size = Vector(0.05, 0.059, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++++++++++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 0.5), angle = Angle(0, 0, 90), size = Vector(0.039, 0.07, 0.07), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++++++++++++"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 1.2, 13.8), angle = Angle(-97.014, -99.351, 127.402), size = Vector(0.1, 0.079, 0.09), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base++++"] = { type = "Model", model = "models/props_combine/combine_booth_short01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.091, 11.701), angle = Angle(0, 90, 0), size = Vector(0.012, 0.009, 0.026), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.151, 1.45, -15.332), angle = Angle(-90, -26.883, 90), size = Vector(0.2, 0.2, 0.2), color = Color(180, 180, 200, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["base++++++++++++++++++"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.3, 1.2, 13.8), angle = Angle(-97.014, -111.04, 101.688), size = Vector(0.1, 0.079, 0.09), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(18.819, 0.592, -6.157), angle = Angle(0, 90, -79.468), size = Vector(0.043, 0.078, 0.307), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["sight+++++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.5, -11.948), angle = Angle(-90, 90, 0), size = Vector(0.15, 0.019, 0.029), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.172, 1.807, 13.182), angle = Angle(-180, 90, 90), size = Vector(0.039, 0.035, 0.075), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 2.157, 13.34), angle = Angle(176.8, 90, 90), size = Vector(0.101, 0.115, 0.342), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight++++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.3, -0.5, -11.948), angle = Angle(0, -10, 0), size = Vector(0.05, 0.059, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.431, 9.47), angle = Angle(0, 90, 90), size = Vector(0.453, 0.246, 0.291), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++++++++++++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -6.753), angle = Angle(0, 0, 90), size = Vector(0.035, 0.07, 0.07), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.3, -0.75, 12.8), angle = Angle(0, 0, -90), size = Vector(0.15, 0.15, 0.15), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++"] = { type = "Model", model = "models/gibs/hgibs_spine.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 1.36, 16.593), angle = Angle(180, -180, -175), size = Vector(0.791, 0.791, 0.56), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base+++++++"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0.402, -7.619), angle = Angle(0, 180, 180), size = Vector(0.4, 0.4, 0.045), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0.972, 6), angle = Angle(94.675, -87.705, -53.169), size = Vector(0.2, 0.1, 0.1), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base+++++++++++++++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 6.752), angle = Angle(0, 0, 90), size = Vector(0.035, 0.07, 0.07), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight++"] = { type = "Model", model = "models/props_vehicles/carparts_tire01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -1.3, 12.8), angle = Angle(180, 0, -90), size = Vector(0.009, 0.009, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight++++"] = { type = "Model", model = "models/props_c17/gravestone003a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.5, -11.948), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base++++++"] = { type = "Model", model = "models/props_combine/combine_booth_short01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.826, 10.39), angle = Angle(-180, 90, 0), size = Vector(0.009, 0.009, 0.019), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight+++"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.5, -11.948), angle = Angle(0, -12.551, 0), size = Vector(0.012, 0.012, 0.012), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["sight+"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.301, -0.75, 12.8), angle = Angle(180, 0, -90), size = Vector(0.15, 0.15, 0.15), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} },
	["base+++++++++++++++++"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.151, 1.45, -6.753), angle = Angle(0, 54.935, 180), size = Vector(0.2, 0.2, 0.2), color = Color(180, 180, 200, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["base++++++++++"] = { type = "Model", model = "models/gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.115, 4, 23), angle = Angle(96.25, -87.705, -53.169), size = Vector(0.158, 0.119, 0.119), color = Color(165, 100, 0, 255), surpresslightning = false, material = "models/props_wasteland/wood_fence01a", skin = 0, bodygroup = {} },
	["base++"] = { type = "Model", model = "models/props_pipes/concrete_pipe001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.401, -10.212), angle = Angle(90, 0, 0), size = Vector(0.056, 0.009, 0.009), color = Color(130, 158, 180, 255), surpresslightning = false, material = "models/props_pipes/guttermetal01a", skin = 0, bodygroup = {} }
}

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(2.371, 2.433, 0) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-6.566, -10.653, 3.877) },
	["ValveBiped.Bip01_R_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(19.531, 0.202, -5.178) },
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-32.656, -1.759, -3.086) }
}

local ghostlerp = 0
function SWEP:CalcViewModelView(vm, oldpos, oldang, pos, ang)
	local owner = self:GetOwner()
	if self:IsSwinging() then
		local rot = self.SwingRotation
		local offset = self.SwingOffset
		local armdelay = owner:GetMeleeSpeedMul()
		local swingtime = self.SwingTime * (owner.MeleeSwingDelayMul or 1) * armdelay

		ang = Angle(ang.pitch, ang.yaw, ang.roll) -- Copy

		local swingend = self:GetSwingEnd()
		local delta = swingtime - math.Clamp(swingend - CurTime(), 0, swingtime)
		local power = CosineInterpolation(0, 1, delta / swingtime)

		if power >= 0.9 then
			power = (1 - power) ^ 0.4 * 2
		end

		pos = pos + offset.x * power * ang:Right() + offset.y * power * ang:Forward() + offset.z * power * ang:Up()

		ang:RotateAroundAxis(ang:Right(), rot.pitch * power)
		ang:RotateAroundAxis(ang:Up(), rot.yaw * power)
		ang:RotateAroundAxis(ang:Forward(), rot.roll * power)
	elseif CurTime() < self:GetNextSecondaryFire() then
		local rot = -self.SwingRotation * 0.6
		local offset = -self.SwingOffset * 0.5
		local swingtime = 0.2

		ang = Angle(ang.pitch, ang.yaw, ang.roll) -- Copy

		local swingend = self:GetNextSecondaryFire() - 1.25
		local delta = swingtime - math.Clamp(swingend - CurTime(), 0, swingtime)
		local power = math.Clamp(delta / swingtime, 0, 1)

		if power >= 0.85 then
			power = (1 - power) ^ 0.4 * 2
		end

		pos = pos + offset.x * power * ang:Right() + offset.y * power * ang:Forward() + offset.z * power * ang:Up()

		ang:RotateAroundAxis(ang:Right(), rot.pitch * power)
		ang:RotateAroundAxis(ang:Up(), rot.yaw * power)
		ang:RotateAroundAxis(ang:Forward(), rot.roll * power)
	end

	if self:GetOwner():GetBarricadeGhosting() then
		ghostlerp = math.min(1, ghostlerp + FrameTime() * 4)
	elseif self:GetReloadFinish() > 0 then
		ghostlerp = math.min(1, ghostlerp + FrameTime() * 1.2)
	elseif ghostlerp > 0 then
		ghostlerp = math.max(0, ghostlerp - FrameTime() * 4)
	end

	if ghostlerp > 0 and self:GetReloadFinish() > 0 then
		ang:RotateAroundAxis(ang:Right(), -16 * ghostlerp)
	elseif ghostlerp > 0 then
		ang:RotateAroundAxis(ang:Right(), -30 * ghostlerp)
	end

	return pos, ang
end
