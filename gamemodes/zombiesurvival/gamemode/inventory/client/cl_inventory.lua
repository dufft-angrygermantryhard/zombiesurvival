GM.ZSInventory = {}

INVCAT_TRINKETS = 1
INVCAT_COMPONENTS = 2
INVCAT_CONSUMABLES = 3

local meta = FindMetaTable("Player")
function meta:GetInventoryItems()
	return GAMEMODE.ZSInventory
end

function meta:HasInventoryItem(item)
	return GAMEMODE.ZSInventory[item] and GAMEMODE.ZSInventory[item] > 0
end

net.Receive("zs_inventoryitem", function()
	local item = net.ReadString()
	local count = net.ReadInt(5)
	local prevcount = GAMEMODE.ZSInventory[item] or 0

	GAMEMODE.ZSInventory[item] = count

	if GAMEMODE.InventoryMenu and GAMEMODE.InventoryMenu:IsValid() then
		if count > prevcount then
			GAMEMODE:InventoryAddGridItem(item, GAMEMODE:GetInventoryItemType(item))
		else
			GAMEMODE:InventoryRemoveGridItem(item)
		end
	end

	if MySelf and MySelf:IsValid() then
		MySelf:ApplyTrinkets()
	end
end)

net.Receive("zs_wipeinventory", function()
	GAMEMODE.ZSInventory = {}

	if GAMEMODE.InventoryMenu and GAMEMODE.InventoryMenu:IsValid() then
		GAMEMODE:InventoryWipeGrid()
	end

	MySelf:ApplyTrinkets()
end)

function CanCraftWithComponent(craftIndex, curInv)
	local curWeapon = LocalPlayer():GetActiveWeapon():GetClass()
	local craftTbl = {}
	craftTbl = table.Copy(GAMEMODE.Assemblies[craftIndex]["Recipes"])
	
	for item, count in pairs(curInv) do
		if count > 0 then
			
			if GAMEMODE.Assemblies[craftIndex]["Weapon"] and 
			not string.find(GAMEMODE.Assemblies[craftIndex]["Weapon"], curWeapon) then return false end
			
			for k, i in pairs(GAMEMODE.Assemblies[craftIndex]["Recipes"]) do
				if string.find(item, k) and count >= i then
					craftTbl[k] = nil
					if table.IsEmpty(craftTbl) then return true end
				end
			end
		end
	end
	
	return false
end

function GetMissingComponents(craftIndex, curInv)
	local inventory = curInv
	local curWeapon = LocalPlayer():GetActiveWeapon():GetClass()
	local missingTbl = {}
	for k, i in pairs(GAMEMODE.Assemblies[craftIndex]["Recipes"]) do
	
		if GAMEMODE.Assemblies[craftIndex]["Weapon"] and not LocalPlayer():HasWeapon(GAMEMODE.Assemblies[craftIndex]["Weapon"]) then 
			table.insert(missingTbl, string.sub(GAMEMODE.Assemblies[craftIndex]["Weapon"], 11)) 
		end
		
		if table.IsEmpty(inventory) then
			table.insert(missingTbl, string.sub(k, 6))
		else
			for item, count in pairs(inventory) do
				if string.find(item, k) then break end
				table.insert(missingTbl, string.sub(k, 6))
			end
		end
	end

	return missingTbl
end

function CanCraftWithIngredients(cookIndex)
	local curFoods = LocalPlayer():GetWeapons()
	local cookTbl = {}
	cookTbl = table.Copy(GAMEMODE.Cooking[cookIndex]["Recipes"])
	
	for count, item in pairs(curFoods) do
			
		if GAMEMODE.Cooking[cookIndex]["Weapon"] and 
		not string.find(GAMEMODE.Cooking[cookIndex]["Weapon"], curWeapon) then return false end
		
		for k, i in pairs(GAMEMODE.Cooking[cookIndex]["Recipes"]) do
			if string.find(item:GetClass(), k)then
				cookTbl[k] = nil
				if table.IsEmpty(cookTbl) then return true end
			end
		end
	end
	
	return false
end

function GetMissingIngredients(cookIndex)

	local missingTbl = {}
	for k, i in pairs(GAMEMODE.Cooking[cookIndex]["Recipes"]) do

		if not LocalPlayer():HasWeapon(k) then
			table.insert(missingTbl, string.sub(k, 13)) 
		end
	end

	return missingTbl
end


function TryCraftWithComponent(me)
	net.Start("zs_trycraft")
		net.WriteTable(me)
	net.SendToServer()
end

function TryCookWithIngedients(me)
	net.Start("zs_trycook")
		net.WriteTable(me)
	net.SendToServer()
end

local function ItemPanelDoClick(self)
	local item = self.Item
	if not item then return end

	local category, sweptable = self.Category
	if category == INVCAT_WEAPONS then
		sweptable = weapons.Get(item)
	else
		sweptable = GAMEMODE.ZSInventoryItemData[item]
	end

	local viewer = GAMEMODE.m_InvViewer
	local screenscale = BetterScreenScale()

	if self.On then
		if viewer and viewer:IsValid() then
			viewer:SetVisible(false)
		end

		self.On = false

		GAMEMODE.InventoryMenu.SelInv = false
		GAMEMODE:DoAltSelectedItemUpdate()
		return
	else
		for _, v in pairs(self:GetParent():GetChildren()) do
			v.On = false
		end
		self.On = true

		GAMEMODE.InventoryMenu.SelInv = item
		GAMEMODE:DoAltSelectedItemUpdate()
	end

	GAMEMODE:CreateInventoryInfoViewer()

	viewer = GAMEMODE.m_InvViewer
	viewer.m_Title:SetText(sweptable.PrintName)
	viewer.m_Title:PerformLayout()

	local desctext = sweptable.Description or ""
	if category == INVCAT_WEAPONS then
		viewer.ModelPanel:SetModel(sweptable.WorldModel)
		local mins, maxs = viewer.ModelPanel.Entity:GetRenderBounds()
		viewer.ModelPanel:SetCamPos(mins:Distance(maxs) * Vector(1.15, 0.75, 0.5))
		viewer.ModelPanel:SetLookAt((mins + maxs) / 2)
		viewer.m_VBG:SetVisible(true)

		if sweptable.NoDismantle then
			desctext = desctext .. "\nCannot be dismantled for scrap."
		end

		viewer.m_Desc:MoveBelow(viewer.m_VBG, 8)
		viewer.m_Desc:SetFont("ZSBodyTextFont")

		local canammo = false
		if sweptable.Primary then
			local ammotype = sweptable.Primary.Ammo
			if GAMEMODE.AmmoToPurchaseNames[ammotype] then
				canammo = true
			end
		end

		if canammo and GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)] then
			viewer.m_AmmoType:SetText(GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)])
			viewer.m_AmmoType:PerformLayout()
		else
			viewer.m_AmmoType:SetText("")
		end
	else
		viewer.ModelPanel:SetModel("")
		viewer.m_VBG:SetVisible(false)

		viewer.m_Desc:MoveBelow(viewer.m_Title, 20)
		viewer.m_Desc:SetFont("ZSBodyTextFontBig")

		viewer.m_AmmoType:SetText("")
	end
	viewer.m_Desc:SetText(desctext)

	GAMEMODE:ViewerStatBarUpdate(viewer, category ~= INVCAT_WEAPONS, sweptable)

	for i = 1, 3 do
		local crab, cral = viewer.m_CraftBtns[i][1], viewer.m_CraftBtns[i][2]

		crab:SetVisible(false)
		cral:SetVisible(false)
	end

	--local assembles = {}
	--for k,v in pairs(GAMEMODE.Assemblies) do
	--	if v[1] == item then
	--		assembles[v[2]] = k
	--	end
	--end
	--[[
	local count = 0
	for k,v in pairs(assembles) do
		count = count + 1

		local crab, cral = viewer.m_CraftBtns[count][1], viewer.m_CraftBtns[count][2]
		local iitype = GAMEMODE:GetInventoryItemType(k) ~= -1

		crab.Item = item
		crab.WeaponCraft = k
		crab:SetPos(viewer:GetWide() / 2 - crab:GetWide() / 2, (viewer:GetTall() - 33 * screenscale) - (count - 1) * 33 * screenscale)
		crab:SetVisible(true)

		cral:SetText((iitype and GAMEMODE.ZSInventoryItemData[k] or weapons.Get(k)).PrintName)
		cral:SetPos(crab:GetWide() / 2 - cral:GetWide() / 2, (crab:GetTall() * 0.5 - cral:GetTall() * 0.5))
		cral:SetContentAlignment(5)
		cral:SetVisible(true)
	end

	if count > 0 then
		viewer.m_CraftWith:SetPos(viewer:GetWide() / 2 - viewer.m_CraftWith:GetWide() / 2, (viewer:GetTall() - 33 * screenscale) - 33 * count * screenscale)
		viewer.m_CraftWith:SetContentAlignment(5)
		viewer.m_CraftWith:SetVisible(true)
	else
		viewer.m_CraftWith:SetVisible(false)
	end
	--]]
end

local categorycolors = {
	[INVCAT_TRINKETS] = {COLOR_RED, COLOR_DARKRED},
	[INVCAT_COMPONENTS] = {COLOR_BLUE, COLOR_DARKBLUE},
	[INVCAT_CONSUMABLES] = {COLOR_YELLOW, COLOR_DARKYELLOW}
}
local colBG = Color(10, 10, 10, 252)
local colBGH = Color(200, 200, 200, 5)
local function ItemPanelPaint(self, w, h)
	draw.RoundedBox(2, 0, 0, w, h, (self.Depressed or self.On) and categorycolors[self.Category][1] or categorycolors[self.Category][2])
	draw.RoundedBox(2, 2, 2, w - 4, h - 4, colBG)
	if self.On or self.Hovered then
		draw.RoundedBox(2, 2, 2, w - 4, h - 4, colBGH)
	end

	return true
end

function GM:CreateInventoryInfoViewer()
	if self.m_InvViewer and self.m_InvViewer:IsValid() then
		self.m_InvViewer:SetVisible(true)
		return
	end

	local leftframe = self.InventoryMenu
	local viewer = vgui.Create("DFrame")

	local screenscale = BetterScreenScale()

	viewer:SetDeleteOnClose(false)
	viewer:SetTitle(" ")
	viewer:SetDraggable(false)
	if viewer.btnClose and viewer.btnClose:IsValid() then viewer.btnClose:SetVisible(false) end
	if viewer.btnMinim and viewer.btnMinim:IsValid() then viewer.btnMinim:SetVisible(false) end
	if viewer.btnMaxim and viewer.btnMaxim:IsValid() then viewer.btnMaxim:SetVisible(false) end

	viewer:SetSize(leftframe:GetWide() / 1.25, leftframe:GetTall())
	viewer:MoveRightOf(leftframe, 32)
	viewer:MoveAbove(leftframe, -leftframe:GetTall())
	self.m_InvViewer = viewer

	self:CreateItemViewerGenericElems(viewer)

	local craftbtns = {}
	for i = 1, 3 do
		local craftb = vgui.Create("DButton", viewer)
		craftb:SetText("")
		craftb:SetSize(viewer:GetWide() / 1.15, 27 * screenscale)
		craftb:SetVisible(false)

		local namelab = EasyLabel(craftb, "...", "ZSBodyTextFont", COLOR_WHITE)
		namelab:SetWide(craftb:GetWide())
		namelab:SetVisible(false)

		craftbtns[i] = {craftb, namelab}
	end
	viewer.m_CraftBtns = craftbtns

	local craftwith = EasyLabel(viewer, "Craft with...", "ZSBodyTextFontBig", COLOR_WHITE)
	craftwith:SetSize(viewer:GetWide() / 1.15, 27 * screenscale)
	craftwith:SetVisible(false)
	viewer.m_CraftWith = craftwith
end

local NumToRomanNumeral = {
	"I", "II", "III", "IV", "V", "VI"
}

function GM:InventoryAddGridItem(item, category)
	local screenscale = BetterScreenScale()
	local grid = self.InventoryMenu.Grid

	local itempan = vgui.Create("DButton")
	itempan:SetText("")
	itempan:SetSize(64 * screenscale, 64 * screenscale)
	itempan.Paint = ItemPanelPaint
	itempan.DoClick = ItemPanelDoClick
	itempan.Item = item
	itempan.Category = category

	grid:AddItem(itempan)
	grid:SortByMember("Category")

	local mdlframe = vgui.Create("DPanel", itempan)
	mdlframe:SetSize(60 * screenscale, 30 * screenscale)
	mdlframe:Center()
	mdlframe:SetMouseInputEnabled(false)
	mdlframe.Paint = function() end

	local trintier = EasyLabel(itempan, "", "ZSHUDFontSmaller", COLOR_WHITE)
	trintier:CenterHorizontal(0.8)
	trintier:CenterVertical(0.8)

	if category == INVCAT_TRINKETS then
		local tier = GAMEMODE.ZSInventoryItemData[item].Tier or 1
		trintier:SetText(NumToRomanNumeral[tier])
		trintier:SizeToContents()
		trintier:CenterHorizontal(0.8)
		trintier:CenterVertical(0.8)
	end

	local kitbl = killicon.Get(category == INVCAT_TRINKETS and "weapon_zs_trinket" or "weapon_zs_craftables")
	if kitbl then
		self:AttachKillicon(kitbl, itempan, mdlframe)
	end
end

function GM:InventoryRemoveGridItem(item)
	local grid = self.InventoryMenu.Grid
	for k, v in pairs(grid:GetChildren()) do
		if v.Item == item then
			grid:RemoveItem(v)
			break
		end
	end
	grid:SortByMember("Category")

	if self.InventoryMenu.SelInv == item then
		if self.m_InvViewer and self.m_InvViewer:IsValid() and self.InventoryMenu.SelInv then
			self.m_InvViewer:SetVisible(false)
		end

		self.InventoryMenu.SelInv = nil
		self:DoAltSelectedItemUpdate()
	end
end

function GM:InventoryWipeGrid()
	local grid = self.InventoryMenu.Grid
	for k, v in pairs(grid:GetChildren()) do
		grid:RemoveItem(v)
	end

	if self.m_InvViewer and self.m_InvViewer:IsValid() then
		self.m_InvViewer:SetVisible(false)
	end

	self.InventoryMenu.SelInv = nil
	self:DoAltSelectedItemUpdate()
end

function GM:OpenInventory()
	if self.InventoryMenu and self.InventoryMenu:IsValid() then
		self.InventoryMenu:SetVisible(true)

		if self.m_InvViewer and self.m_InvViewer:IsValid() and self.InventoryMenu.SelInv then
			self.m_InvViewer:SetVisible(true)
		end
		return
	end

	local screenscale = BetterScreenScale()
	local wid, hei = math.max(400, math.min(ScrW(), 400) * screenscale), math.min(ScrH(), 370) * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetSize(wid, hei)
	frame:CenterHorizontal(0.385)
	frame:CenterVertical(0.25)
	frame:SetDeleteOnClose(false)
	frame:SetTitle(" ")
	frame:SetDraggable(false)

	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible(false) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible(false) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible(false) end

	self.InventoryMenu = frame

	local topspace = vgui.Create("DPanel", frame)
	topspace:SetWide(wid - 16)

	local title = EasyLabel(topspace, "Inventory", "ZSHUDFontSmall", COLOR_WHITE)
	title:CenterHorizontal()

	local _, y = title:GetPos()
	topspace:SetTall(y + title:GetTall() + 2)
	topspace:AlignTop(8)
	topspace:CenterHorizontal()

	local invListPanel = vgui.Create("DScrollPanel", frame)
	invListPanel:Dock( FILL )
	local sbar = invListPanel:GetVBar()
	sbar.Enabled = true
	invListPanel:DockMargin(0, topspace:GetTall() + 8, 0, 0)
	invListPanel:InvalidateParent(true)

	local invgrid = vgui.Create("DGrid", invListPanel)
	invgrid:SetSize(invListPanel:GetWide() - sbar:GetWide(), invListPanel:GetTall())
	invgrid:SetCols(5)
	invgrid:SetColWide((70 + (invgrid:GetWide() - 70*5) / 4) * screenscale)
	invgrid:SetRowHeight(70 * screenscale)
	frame.Grid = invgrid

	for item, count in pairs(self.ZSInventory) do
		if count > 0 then
			for i = 1, count do
				self:InventoryAddGridItem(item, self:GetInventoryItemType(item))
			end
		end
	end
	invgrid:SortByMember("Category")

	frame:MakePopup()
end


function GM:OpenCraftMenu()
	if self.CraftInterface and self.CraftInterface:IsValid() then
		self.CraftInterface:SetVisible(true)
		return
	end

	local screenscale = BetterScreenScale()
	local wid, hei = math.min(ScrW(), 900) * screenscale, math.min(ScrH(), 800) * screenscale
	local tabhei = 18 * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetSize(wid, hei)
	frame:Center()
	frame:SetDeleteOnClose(false)
	frame:SetTitle(" ")
	frame:SetDraggable(false)
	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible(false) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible(false) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible(false) end
	frame.CenterMouse = MenuCenterMouse
	frame.Think = CraftMenuThink
	self.CraftInterface = frame

	local topspace = vgui.Create("DPanel", frame)
	topspace:SetWide(wid - 16)

	local title = EasyLabel(topspace, "Crafting Station", "ZSHUDFontSmall", COLOR_WHITE)
	title:CenterHorizontal()
	local subtitle = EasyLabel(topspace, "Be Creative!", "ZSHUDFontTiny", COLOR_WHITE)
	subtitle:CenterHorizontal()
	subtitle:MoveBelow(title, 4)

	local _, y = subtitle:GetPos()
	topspace:SetTall(y + subtitle:GetTall() + 4)
	topspace:AlignTop(8)
	topspace:CenterHorizontal()
	
	local invListPanel = vgui.Create("DScrollPanel", frame)
	invListPanel:Dock( FILL )
	local sbar = invListPanel:GetVBar()
	sbar.Enabled = true
	invListPanel:DockMargin(0, topspace:GetTall() + 8, 0, 0)
	invListPanel:InvalidateParent(true)
	
	local itemLayout = vgui.Create("DIconLayout", invListPanel)
	itemLayout:SetPos(0, 0)
	itemLayout:SetSize(wid, hei)
	itemLayout:SetSpaceY(5)
	itemLayout:SetSpaceX(3)

	local crftIndex = 0
	for k, v in pairs(GAMEMODE.Assemblies) do
		crftIndex = crftIndex + 1
		local craftBtn = itemLayout:Add("DImageButton")
		craftBtn:SetImage(v["Icon"])
		craftBtn:SetSize(78, 64)
		craftBtn:SetToolTip(v["Name"] .. "\n" .. v["Desc"])
		craftBtn.index = crftIndex
		
		craftBtn.Think = function(pnl)
			if CanCraftWithComponent(pnl.index, self.ZSInventory) then
				craftBtn:SetAlpha(255)
			else
				craftBtn:SetAlpha(25)
			end
		end
		
		craftBtn.DoClick = function(pnl)
		
			if not CanCraftWithComponent(pnl.index, self.ZSInventory) then
				local missingItems = GetMissingComponents(pnl.index, self.ZSInventory)
				for k, missed in pairs(missingItems) do
					self:CenterNotify(COLOR_RED, "You are missing: " .. missed)
				end
				surface.PlaySound("buttons/button10.wav")
				return 
			end

			local me = {}
			for p, l in pairs(GAMEMODE.Assemblies[pnl.index]["Recipes"]) do
				table.insert(me, p)
			end
			
			if v["Weapon"] then
				me.Weapon = LocalPlayer():GetActiveWeapon():GetClass()
			end
			
			if v["Reward"] then
				me.Reward = v["Reward"]
			end
			
			TryCraftWithComponent(me)
		end
	end
	frame:MakePopup()
end
function GM:OpenStoveMenu()
	if self.CookInterface and self.CookInterface:IsValid() then
		self.CookInterface:SetVisible(true)
		return
	end

	local screenscale = BetterScreenScale()
	local wid, hei = math.min(ScrW(), 900) * screenscale, math.min(ScrH(), 800) * screenscale
	local tabhei = 18 * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetSize(wid, hei)
	frame:Center()
	frame:SetDeleteOnClose(false)
	frame:SetTitle(" ")
	frame:SetDraggable(false)
	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible(false) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible(false) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible(false) end
	frame.CenterMouse = MenuCenterMouse
	frame.Think = CookMenuThink
	self.CookInterface = frame

	local topspace = vgui.Create("DPanel", frame)
	topspace:SetWide(wid - 16)

	local title = EasyLabel(topspace, "Cooking Stove", "ZSHUDFontSmall", COLOR_WHITE)
	title:CenterHorizontal()
	local subtitle = EasyLabel(topspace, "Give your RAAAAW talent in cooking", "ZSHUDFontTiny", COLOR_WHITE)
	subtitle:CenterHorizontal()
	subtitle:MoveBelow(title, 4)

	local _, y = subtitle:GetPos()
	topspace:SetTall(y + subtitle:GetTall() + 4)
	topspace:AlignTop(8)
	topspace:CenterHorizontal()
	
	local invListPanel = vgui.Create("DScrollPanel", frame)
	invListPanel:Dock( FILL )
	local sbar = invListPanel:GetVBar()
	sbar.Enabled = true
	invListPanel:DockMargin(0, topspace:GetTall() + 8, 0, 0)
	invListPanel:InvalidateParent(true)
	
	local itemLayout = vgui.Create("DIconLayout", invListPanel)
	itemLayout:SetPos(0, 0)
	itemLayout:SetSize(wid, hei)
	itemLayout:SetSpaceY(5)
	itemLayout:SetSpaceX(3)
	
	local cookIndex = 0
	for k, v in pairs(GAMEMODE.Cooking) do
		cookIndex = cookIndex + 1
		local cookBtn = itemLayout:Add("DImageButton")
		cookBtn:SetImage(v["Icon"])
		cookBtn:SetSize(78, 64)
		cookBtn:SetToolTip(v["Name"] .. "\n" .. v["Desc"])
		cookBtn.index = cookIndex
		
		cookBtn.Think = function(pnl)
			if CanCraftWithIngredients(pnl.index, self.ZSInventory) then
				cookBtn:SetAlpha(255)
			else
				cookBtn:SetAlpha(25)
			end
		end
		
		cookBtn.DoClick = function(pnl)
		
			if not CanCraftWithIngredients(pnl.index, self.ZSInventory) then
				local missingItems = GetMissingIngredients(pnl.index, self.ZSInventory)
				for k, missed in pairs(missingItems) do
					self:CenterNotify(COLOR_RED, "You are missing: " .. missed)
				end
				surface.PlaySound("buttons/button10.wav")
				return 
			end

			local me = {}
			
			for p, l in pairs(GAMEMODE.Cooking[pnl.index]["Recipes"]) do
				table.insert(me, p)
			end
			
			
			me.Cooked = v["Result"]
			
			if v["Reward"] then
				me.Reward = v["Reward"]
			end
			
			TryCookWithIngedients(me)
		end
	end
	
	frame:MakePopup()
end

