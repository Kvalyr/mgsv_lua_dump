-- DOBUILD: 1
--InfMenuCommands.lua
local this={}
--tex lines kinda blurry between Commands and Ivars, currently commands arent saved/have no gvar associated
--NOTE: tablesetup at end sets up every table in this with an OnChange as a menu command
--localopt
local NULL_ID=GameObject.NULL_ID
local GetGameObjectId=GameObject.GetGameObjectId

--menu menu items
this.menuOffItem={
  OnChange=function()
    InfMenu.MenuOff()
    InfMenu.currentIndex=1
  end,
}
this.resetSettingsItem={
  OnChange=function()
    InfMenu.ResetSettingsDisplay()
    InfMenu.MenuOff()
  end,
}
this.resetAllSettingsItem={
  OnChange=function()
    InfMenu.PrintLangId"setting_all_defaults"
    InfMenu.ResetSettings()
    Ivars.PrintNonDefaultVars()
    InfMenu.PrintLangId"done"
    InfMenu.MenuOff()
  end,
}
this.goBackItem={
  settingNames="set_goBackItem",
  OnChange=function()
    InfMenu.GoBackCurrent()
  end,
}

--commands
this.showPosition={
  OnChange=function()
    TppUiCommand.AnnounceLogView(string.format("%.2f,%.2f,%.2f | %.2f",vars.playerPosX,vars.playerPosY,vars.playerPosZ,vars.playerRotY))
  end,
}

this.showMissionCode={
  OnChange=function()
    TppUiCommand.AnnounceLogView("MissionCode: "..vars.missionCode)--ADDLANG
  end,
}

this.showMbEquipGrade={
  OnChange=function()
    local soldierGrade = TppMotherBaseManagement.GetMbsClusterSecuritySoldierEquipGrade{}
    local infGrade = InfMain.GetMbsClusterSecuritySoldierEquipGrade()
    TppUiCommand.AnnounceLogView("Security Grade: "..soldierGrade)--ADDLANG
    TppUiCommand.AnnounceLogView("Inf Grade: "..soldierGrade)--ADDLANG
  end,
}

this.showLangCode={
  OnChange=function()
    local languageCode=AssetConfiguration.GetDefaultCategory"Language"
    TppUiCommand.AnnounceLogView(InfMenu.LangString"language_code"..": "..languageCode)
  end,
}

this.showQuietReunionMissionCount={
  OnChange=function()
    TppUiCommand.AnnounceLogView("quietReunionMissionCount: "..gvars.str_quietReunionMissionCount)
  end,
}

this.loadMission={
  OnChange=function()
    local settingStr=Ivars.manualMissionCode.settings[Ivars.manualMissionCode:Get()+1]
    InfMenu.DebugPrint("TppMission.Load "..settingStr)
    --TppMission.Load( tonumber(settingStr), vars.missionCode, { showLoadingTips = false } )
    --TppMission.RequestLoad(tonumber(settingStr),vars.missionCode,{force=true,showLoadingTips=true})--,ignoreMtbsLoadLocationForce=mvars.mis_ignoreMtbsLoadLocationForce})
    --TppMission.RequestLoad(10036,vars.missionCode,{force=true,showLoadingTips=true})--,ignoreMtbsLoadLocationForce=mvars.mis_ignoreMtbsLoadLocationForce})
    gvars.mis_nextMissionCodeForMissionClear=tonumber(settingStr)
    mvars.mis_showLoadingTipsOnMissionFinalize=false
    --mvars.heli_missionStartRoute
    --mvars.mis_nextLayoutCode
    --mvars.mis_nextClusterId
    --mvars.mis_ignoreMtbsLoadLocationForce

    TppMission.ExecuteMissionFinalize()
  end,
}

this.ogrePointChange=999999
this.setDemon={
  OnChange=function(self)
    --TppMotherBaseManagement.SetOgrePoint{ogrePoint=99999999}
    TppHero.SetOgrePoint(this.ogrePointChange)
    InfMenu.Print("-"..this.ogrePointChange .. InfMenu.LangString"set_demon")
  end,
}
this.removeDemon={
  OnChange=function(self)
    --TppMotherBaseManagement.SetOgrePoint{ogrePoint=1}
    --TppMotherBaseManagement.SubOgrePoint{ogrePoint=-999999999}
    TppHero.SetOgrePoint(-this.ogrePointChange)
    InfMenu.Print(this.ogrePointChange .. InfMenu.LangString"removed_demon")
  end,
}

this.returnQuiet={
  settingNames="set_quiet_return",
  OnChange=function()
    if not TppBuddyService.CheckBuddyCommonFlag(BuddyCommonFlag.BUDDY_QUIET_LOST)then
      InfMenu.PrintLangId"quiet_already_returned"--"Quiet has already returned."
    else
      --InfPatch.QuietReturn()
      TppStory.RequestReunionQuiet()
    end
  end,
}

this.resetRevenge={
  OnChange=function()
    TppRevenge.ResetRevenge()
    TppRevenge._SetUiParameters()
    InfMenu.PrintLangId("revenge_reset")
  end,
}

this.pullOutHeli={
  OnChange=function()
    local gameObjectId=GameObject.GetGameObjectId("TppHeli2", "SupportHeli")
    if gameObjectId~=nil and gameObjectId~=GameObject.NULL_ID then
      GameObject.SendCommand(gameObjectId,{id="PullOut",forced=true})
    end
  end
}

--game progression unlocks

this.unlockPlayableAvatar={
  OnChange=function()
    if vars.isAvatarPlayerEnable==1 then
      InfMenu.PrintLangId"allready_unlocked"
    else
      vars.isAvatarPlayerEnable=1
    end
  end,
}
this.unlockWeaponCustomization={
  OnChange=function()
    if vars.mbmMasterGunsmithSkill==1 then
      InfMenu.PrintLangId"allready_unlocked"
    else
      vars.mbmMasterGunsmithSkill=1
    end
  end,
}

--
--this.resetCameraSettings={--CULL
--  OnChange=function()
--    InfMain.ResetCamPosition()
--    InfMenu.PrintLangId"cam_settings_reset"
--  end,
--}
--
this.doEnemyReinforce={--WIP
  OnChange=function()
  --TODO: GetClosestCp
  --  _OnRequestLoadReinforce(reinforceCpId)--NMC game message "RequestLoadReinforce"

  --or

  --  TppReinforceBlock.LoadReinforceBlock(reinforceType,reinforceCpId,reinforceColoringType)
  end,
}

--
this.printSightFormParameter={
  OnChange=function()
    InfSoldierParams.ApplySightIvarsToSoldierParams()
    --local sightFormStr=InfInspect.Inspect(InfSoldierParams.soldierParameters.sightFormParameter)
    --InfMenu.DebugPrint(sightFormStr)
    InfSoldierParams.PrintSightForm()
  end,
}

this.printHearingTable={
  OnChange=function()
    InfSoldierParams.ApplyHearingIvarsToSoldierParams()
    local ins=InfInspect.Inspect(InfSoldierParams.soldierParameters.hearingRangeParameter)
    InfMenu.DebugPrint(ins)
  end,
}

this.printHealthTableParameter={
  OnChange=function()
    InfSoldierParams.ApplyHealthIvarsToSoldierParams()
    local sightFormStr=InfInspect.Inspect(InfSoldierParams.lifeParameterTable)
    InfMenu.DebugPrint(sightFormStr)
  end,
}

this.printCustomRevengeConfig={
  OnChange=function()
    local revengeConfig=InfRevenge.CreateCustomRevengeConfig()
    local ins=InfInspect.Inspect(revengeConfig)
    InfMenu.DebugPrint(ins)
  end
}

--debug commands

this.printCurrentAppearance={
  OnChange=function()
    InfMenu.Print("playerType: " .. tostring(vars.playerType))
    InfMenu.Print("playerCamoType: " .. tostring(vars.playerCamoType))
    InfMenu.Print("playerPartsType: " .. tostring(vars.playerPartsType))
    InfMenu.Print("playerFaceEquipId: " .. tostring(vars.playerFaceEquipId))
    InfMenu.Print("playerFaceId: " .. tostring(vars.playerFaceId))
    InfMenu.Print("playerHandType: " .. tostring(vars.playerHandType))
  end,
}

this.forceAllQuestOpenFlagFalse={
  OnChange=function()
    for n,questIndex in ipairs(TppDefine.QUEST_INDEX)do
      gvars.qst_questOpenFlag[questIndex]=false
      gvars.qst_questActiveFlag[questIndex]=false
    end
    TppQuest.UpdateActiveQuest()
    InfMenu.PrintLangId"done"
  end,
}

--
this.warpPlayerCommand={--WIP
  OnChange=function()
    --    local playerId={type="TppPlayer2",index=0}
    --    local position=Vector3(9,.8,-42.5)
    --    GameObject.SendCommand(playerId,{id="Warp",position=position})

    --local pos={8.647,.8,-28.748}
    --local rotY=-25
    --pos,rotY=mtbs_cluster.GetPosAndRotY("Medical","plnt0",pos,rotY)
    local rotY=0
    --local pos={9,.8,-42.5}--command helipad
    local pos={-139,-3.20,-975}


    TppPlayer.Warp{pos=pos,rotY=rotY}
    --Player.RequestToSetCameraRotation{rotX=0,rotY=rotY}

    --TppPlayer.SetInitialPosition(pos,rotY)
  end,
}

this.warpToCamPos={
  OnChange=function()
    local warpPos=InfCamera.ReadPosition"FreeCam"
    InfMenu.DebugPrint("warp pos:".. warpPos:GetX()..",".. warpPos:GetY().. ","..warpPos:GetZ())
    TppPlayer.Warp{pos={warpPos:GetX(),warpPos:GetY(),warpPos:GetZ()},rotY=vars.playerCameraRotation[1]}
  end,
}

this.warpToUserMarker={
  OnChange=function()
    InfInspect.TryFunc(function()
      -- InfMenu.DebugPrint"Warping to newest marker"
      local lastMarkerIndex=InfUserMarker.GetLastAddedUserMarkerIndex()
      if lastMarkerIndex==nil then
        InfMenu.DebugPrint("lastMarkerIndex==nil")
      else
        InfUserMarker.PrintUserMarker(lastMarkerIndex)
        InfUserMarker.WarpToUserMarker(lastMarkerIndex)
      end
    end)
  end
}


this.printUserMarkers={
  OnChange=function()InfUserMarker.PrintUserMarkers() end,
}

this.printLatestUserMarker={
  OnChange=function()
    InfInspect.TryFunc(function()
      local lastMarkerIndex=InfUserMarker.GetLastAddedUserMarkerIndex()
      if lastMarkerIndex==nil then
        InfMenu.DebugPrint("lastMarkerIndex==nil")
      else
        InfUserMarker.PrintUserMarker(lastMarkerIndex)
        InfUserMarker.PrintMarkerGameObject(lastMarkerIndex)
      end
    end)
  end
}

this.setSelectedCpToMarkerObjectCp={
  OnChange=function()
    InfInspect.TryFunc(function()
      local lastMarkerIndex=InfUserMarker.GetLastAddedUserMarkerIndex()
      if lastMarkerIndex==nil then
        InfMenu.DebugPrint("lastMarkerIndex==nil")
        return
      end
      --      InfMain.PrintUserMarker(lastMarkerIndex)
      --      InfMain.PrintMarkerGameObject(lastMarkerIndex)
      local gameId=vars.userMarkerGameObjId[lastMarkerIndex]

      if gameId==nil then
        InfMenu.DebugPrint"gameId==nil"
        return
      end
      local soldierName,cpName=InfMain.SoldierNameForGameId(gameId)
      if cpName==nil then
        InfMenu.DebugPrint"cpName==nil"
        return
      end

      for n,currentName in pairs(mvars.ene_cpList)do
        --InfMenu.DebugPrint(tostring(n).." "..tostring(currentName))
        if currentName==cpName then
          Ivars.selectedCp:Set(n)
          InfMenu.DebugPrint("selectedCp set to "..n..":"..cpName)
          return
        end
      end

      InfMenu.DebugPrint(cpName.." not found in ene_cpList")
      local ins=InfInspect.Inspect(mvars.ene_cpList)
      InfMenu.DebugPrint(ins)

    end)
  end
}


this.printBodyInfo={
  OnChange=function()
    InfFova.GetCurrentFovaTable(true)
  end
}

---
local toggle1=false
this.DEBUG_SomeShiz={
  OnChange=function()
    InfInspect.TryFunc(function()
      --DEBUGNOW
      local moraleAmount=1
      InfMenu.DebugPrint("IncrementAllStaffMorale:"..moraleAmount)
      TppMotherBaseManagement.IncrementAllStaffMorale{morale=moraleAmount}



      --local pos,rotQuat=Tpp.GetLocatorByTransform(identifier,key)

      --      local cpName=mvars.ene_cpList[Ivars.selectedCp:Get()]
      --      if cpName==nil then
      --        InfMenu.DebugPrint"selectedCp cpName==nil"
      --      else
      --        local gameId=GetGameObjectId("TppCommandPost2",cpName)
      --        if gameId==NULL_ID then
      --          InfMenu.DebugPrint("Could not find cp "..cpName)
      --          return
      --        end
      --        local cpPos=GameObject.SendCommand(gameId,{id="GetPosition"})
      --        if cpPos==nil then
      --          InfMenu.DebugPrint"cpPos==nil"
      --        else
      --          InfMenu.DebugPrint("cpPos:".. cpPos:GetX()..",".. cpPos:GetY().. ","..cpPos:GetZ())
      --        end

      -- end
    end)
  end
}



local index2=1
this.DEBUG_SomeShiz2={
  OnChange=function()
    InfInspect.TryFunc(function()

      end)
  end
}

local index3=1
this.DEBUG_SomeShiz3={
  OnChange=function()
    InfInspect.TryFunc(function()


      end)
  end
}

this.DEBUG_PrintHeliPos={
  OnChange=function()
    InfInspect.TryFunc(function()
      InfNPCHeli.PrintHeliPos()
    end)
  end
}

local routeIndex=1
local StrCode32=Fox.StrCode32
this.heliRoute=nil
local heliRoutes={}
this.DEBUG_CycleHeliRoutes={
  OnChange=function()
    InfInspect.TryFunc(function()
      local heliName="EnemyHeli0000"
      local heliIndex=1
      local heliObjectId = GetGameObjectId(heliName)
      if heliObjectId==NULL_ID then
      --InfMenu.DebugPrint(heliName.."==NULL_ID")--DEBUG
      else
        if #heliRoutes==0 then
          --heliRoutes=this.ResetLzPool()
          heliRoutes=InfMain.ResetPool(InfNPCHeli.heliRoutes.afgh)
        end
        --InfInspect.PrintInspect(heliRoutes)--DEBUG
        this.heliRoute=StrCode32(heliRoutes[routeIndex])
        routeIndex=routeIndex+1
        if routeIndex>#heliRoutes then
          routeIndex=1
        end

        InfNPCHeli.SetRoute(this.heliRoute,heliIndex)
        --InfMenu.DebugPrint(heliName.." setting route: "..tostring(InfLZ.str32LzToLz[this.heliRoute]))--DEBUG
        --GameObject.SendCommand(heliObjectId,{id="SetForceRoute",route=this.heliRoute,point=0,warp=true})
      end
      local groundStartPosition=InfLZ.groundStartPositions[this.heliRoute]
      if groundStartPosition==nil then
        InfMenu.DebugPrint" groundStartPosition==nil"
      else
        InfMenu.DebugPrint("warped to "..tostring(InfLZ.str32LzToLz[this.heliRoute]))--DEBUG
        TppPlayer.Warp{pos={groundStartPosition.pos[1],groundStartPosition.pos[2],groundStartPosition.pos[3]},rotY=vars.playerCameraRotation[1]}
      end
    end)
  end
}

local fovaIndex=1
this.DEBUG_FovaTest={
  OnChange=function()
    InfInspect.TryFunc(function()
      Player.SetPartsInfoAtInstanceIndex("/Assets/tpp/parts/chara/sna/sna1_main0_def_v00.parts")
      --Player.RequestToUnloadAllPartsBlock()
      --Player.RequestToLoadPartsBlock("PLTypeHospital")
    end)
  end
}

this.DEBUG_DropItem={
  OnChange=function()

    local downposition=Vector3(vars.playerPosX,vars.playerPosY+1,vars.playerPosZ)
    --  TppPickable.DropItem{
    --    equipId =  TppEquip.EQP_IT_DevelopmentFile,
    --    number = TppMotherBaseManagementConst.DESIGN_2006,
    --    position = downposition,
    --    rotation = Quat.RotationY( 0 ),
    --    linearVelocity = Vector3(0,2,0),--Vector3( 0, 2, 0 ),
    --    angularVelocity = Vector3(0,2,0),--Vector3( 0, 2, 0 )
    --  }

    local linearMax=2
    local angularMax=14
    TppPickable.DropItem{
      equipId =  TppEquip.EQP_SWP_SmokeGrenade_G01,--EQP_SWP_C4_G04,
      number = 65535,
      position = downposition,
      rotation = Quat.RotationY( 0 ),
      linearVelocity = Vector3(math.random(-linearMax,linearMax),math.random(-linearMax,linearMax),math.random(-linearMax,linearMax)),
      angularVelocity = Vector3(math.random(-angularMax,angularMax),math.random(-angularMax,angularMax),math.random(-angularMax,angularMax)),
    }

  end
}

this.DEBUG_PrintVarsClock={
  OnChange=function()
    InfMenu.DebugPrint("vars.clock:"..vars.clock)
  end,
}

this.DEBUG_PrintPrologueTrapVars={
  OnChange=function()
    InfMenu.DebugPrint("playerInCorridorDemoTrap:"..mvars.playerInCorridorDemoTrap.." ishmaelInCorridorDemoTrap:"..mvars.ishmaelInCorridorDemoTrap)
  end,
}

this.DEBUG_PrintFultonSuccessInfo={
  OnChange=function()
    local mbFultonRank=TppMotherBaseManagement.GetSectionFuncRank{sectionFuncId=TppMotherBaseManagementConst.SECTION_FUNC_ID_SUPPORT_FULTON}
    local mbSectionSuccess=TppPlayer.mbSectionRankSuccessTable[mbFultonRank]or 0

    InfMenu.DebugPrint("mbFultonRank:"..mbFultonRank.." mbSectionSuccess:"..mbSectionSuccess)

    --  local doFuncSuccess=TppTerminal.DoFuncByFultonTypeSwitch(gameId,RENAMEanimalId,r,staffOrReourceId,nil,nil,nil,this.GetSoldierFultonSucceedRatio,this.GetVolginFultonSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio,this.GetDefaultSucceedRatio)
    --
    --  if doFuncSuccess==nil then
    --    InfMenu.DebugPrint"doFuncSuccess nil, bumped to 100"
    --    doFuncSuccess=100
    --  end
    --  InfMenu.DebugPrint("doFuncSuccess:"..doFuncSuccess)

  end,
}

this.DEBUG_ShowRevengeConfig={
  OnChange=function()
    --InfMenu.DebugPrint("RevRandomValue: "..gvars.rev_revengeRandomValue)
    InfMenu.DebugPrint("RevengeType:")
    local revengeType=InfInspect.Inspect(mvars.revenge_revengeType)
    InfMenu.DebugPrint(revengeType)

    InfMenu.DebugPrint("RevengeConfig:")
    local revengeConfig=InfInspect.Inspect(mvars.revenge_revengeConfig)
    InfMenu.DebugPrint(revengeConfig)
  end,
}

this.DEBUG_PrintSoldierDefine={
  OnChange=function()
    InfMenu.DebugPrint("SoldierDefine:")
    local soldierDefine=InfInspect.Inspect(mvars.ene_soldierDefine)
    InfMenu.DebugPrint(soldierDefine)
  end,
}


this.DEBUG_PrintSoldierIDList={
  OnChange=function()
    InfMenu.DebugPrint("SoldierIdList:")
    local soldierIdList=InfInspect.Inspect(mvars.ene_soldierIDList)
    InfMenu.DebugPrint(soldierIdList)
  end,
}


this.DEBUG_PrintReinforceVars={
  OnChange=function()
    InfMenu.DebugPrint("reinforce_activated: "..tostring(mvars.reinforce_activated))
    InfMenu.DebugPrint("reinforceType: "..mvars.reinforce_reinforceType)
    InfMenu.DebugPrint("reinforceCpId: "..mvars.reinforce_reinforceCpId)
    InfMenu.DebugPrint("isEnabledSoldiers: "..tostring(mvars.reinforce_isEnabledSoldiers))
    InfMenu.DebugPrint("isEnabledVehicle: "..tostring(mvars.reinforce_isEnabledVehicle))
  end,
}

this.DEBUG_PrintVehicleTypes={
  OnChange=function()
    InfMenu.DebugPrint("Vehicle.type.EASTERN_LIGHT_VEHICLE="..Vehicle.type.EASTERN_LIGHT_VEHICLE)
    InfMenu.DebugPrint("Vehicle.type.WESTERN_LIGHT_VEHICLE="..Vehicle.type.WESTERN_LIGHT_VEHICLE)
    InfMenu.DebugPrint("Vehicle.type.EASTERN_TRUCK="..Vehicle.type.EASTERN_TRUCK)
    InfMenu.DebugPrint("Vehicle.type.WESTERN_TRUCK="..Vehicle.type.WESTERN_TRUCK)
    InfMenu.DebugPrint("Vehicle.type.EASTERN_WHEELED_ARMORED_VEHICLE="..Vehicle.type.EASTERN_WHEELED_ARMORED_VEHICLE)
    InfMenu.DebugPrint("Vehicle.type.WESTERN_WHEELED_ARMORED_VEHICLE="..Vehicle.type.WESTERN_WHEELED_ARMORED_VEHICLE)
    InfMenu.DebugPrint("Vehicle.type.EASTERN_TRACKED_TANK="..Vehicle.type.EASTERN_TRACKED_TANK)
    InfMenu.DebugPrint("Vehicle.type.WESTERN_TRACKED_TANK="..Vehicle.type.WESTERN_TRACKED_TANK)
  end,
}

this.DEBUG_PrintVehiclePaint={
  OnChange=function()
    InfMenu.DebugPrint("Vehicle.class.DEFAULT="..Vehicle.class.DEFAULT)
    InfMenu.DebugPrint("Vehicle.class.DARK_GRAY="..Vehicle.class.DARK_GRAY)
    InfMenu.DebugPrint("Vehicle.class.OXIDE_RED="..Vehicle.class.OXIDE_RED)
    InfMenu.DebugPrint("Vehicle.paintType.NONE="..Vehicle.paintType.NONE)
    InfMenu.DebugPrint("Vehicle.paintType.FOVA_0="..Vehicle.paintType.FOVA_0)
    InfMenu.DebugPrint("Vehicle.paintType.FOVA_1="..Vehicle.paintType.FOVA_1)
    InfMenu.DebugPrint("Vehicle.paintType.FOVA_2="..Vehicle.paintType.FOVA_2)
  end,
}

this.DEBUG_RandomizeCp={--CULL only for debug purpose with a print in the function
  OnChange=function()
    InfMain.RandomizeCpSubTypeTable()
  end,
}

this.DEBUG_PrintRealizedCount={
  OnChange=function()
    InfMenu.DebugPrint("MAX_REALIZED_COUNT:"..EnemyFova.MAX_REALIZED_COUNT)
  end,
}
this.DEBUG_PrintEnemyFova={
  OnChange=function()
    local infene=InfInspect.Inspect(EnemyFova)
    InfMenu.DebugPrint(infene)
    local infenemeta=InfInspect.Inspect(getmetatable(EnemyFova))
    InfMenu.DebugPrint(infenemeta)
  end,
}

this.DEBUG_PrintPowersCount={
  OnChange=function()
    --local ins=InfInspect.Inspect(mvars.ene_soldierPowerSettings)
    --InfMenu.DebugPrint(ins)
    local totalPowerSettings={}

    local totalSoldierCount=0
    local armorCount=0
    local lrrpCount=0
    for soldierId, powerSettings in pairs(mvars.ene_soldierPowerSettings) do
      totalSoldierCount=totalSoldierCount+1
      for powerType,setting in pairs(powerSettings)do
        if totalPowerSettings[powerType]==nil then
          totalPowerSettings[powerType]=0
        end

        totalPowerSettings[powerType]=totalPowerSettings[powerType]+1
      end
    end
    InfMenu.DebugPrint("totalSoldierCount:"..totalSoldierCount)
    local ins=InfInspect.Inspect(totalPowerSettings)
    InfMenu.DebugPrint(ins)
  end
}

this.DEBUG_PrintCpPowerSettings={
  OnChange=function()
    --local ins=InfInspect.Inspect(mvars.ene_soldierPowerSettings)
    -- InfMenu.DebugPrint(ins)
    if Ivars.selectedCp:Is()>0 then
      local soldierList=mvars.ene_soldierIDList[Ivars.selectedCp:Get()]
      if soldierList then
        for soldierId,n in pairs(soldierList)do
          local ins=InfInspect.Inspect(mvars.ene_soldierPowerSettings[soldierId])
          InfMenu.DebugPrint(ins)
        end
      end
    end
  end
}

this.DEBUG_PrintCpSizes={
  OnChange=function()
    local cpTypesCount={
      cp=0,
      ob=0,
      lrrp=0,
    }
    local cpTypesTotal={
      cp=0,
      ob=0,
      lrrp=0,
    }
    local cpTypesAverage={
      cp=0,
      ob=0,
      lrrp=0,
    }

    local cpSizes={}
    for cpName,soldierList in pairs(mvars.ene_soldierDefine)do
      local soldierCount=0


      for key,value in pairs(soldierList)do
        if type(value)=="string" then
          soldierCount=soldierCount+1
        end
      end

      if soldierCount~=0 then
        if string.find(cpName, "_cp")~=nil then
          cpTypesCount.cp=cpTypesCount.cp+1
          cpTypesTotal.cp=cpTypesTotal.cp+soldierCount
        elseif string.find(cpName, "_ob")~=nil then
          cpTypesCount.ob=cpTypesCount.cp+1
          cpTypesTotal.ob=cpTypesTotal.ob+soldierCount
        elseif string.find(cpName, "_lrrp")~=nil then
          cpTypesCount.lrrp=cpTypesCount.lrrp+1
          cpTypesTotal.lrrp=cpTypesTotal.lrrp+soldierCount
        end

        cpSizes[cpName]=soldierCount
      end
    end

    for cpType,total in pairs(cpTypesTotal)do
      if cpTypesCount[cpType]~=0 then
        cpTypesAverage[cpType]=total/cpTypesCount[cpType]
      end
    end

    local ins=InfInspect.Inspect(cpSizes)
    InfMenu.DebugPrint(ins)

    local ins=InfInspect.Inspect(cpTypesAverage)
    InfMenu.DebugPrint(ins)
  end
}

this.DEBUG_ChangePhase={
  OnChange=function()
    InfMenu.DebugPrint("Changephase b")
    for cpName,soldierList in pairs(mvars.ene_soldierDefine)do
      InfMain.ChangePhase(cpName,Ivars.maxPhase:Get())
    end
    InfMenu.DebugPrint("Changephase e")
  end
}

this.DEBUG_KeepPhaseOn={
  OnChange=function()
    InfMenu.DebugPrint("DEBUG_KeepPhaseOn b")
    for cpName,soldierList in pairs(mvars.ene_soldierDefine)do
      InfMain.SetKeepAlert(cpName,true)
    end
    InfMenu.DebugPrint("DEBUG_KeepPhaseOn e")
  end
}

this.DEBUG_KeepPhaseOff={
  OnChange=function()
    InfMenu.DebugPrint("DEBUG_KeepPhaseOff b")
    for cpName,soldierList in pairs(mvars.ene_soldierDefine)do
      InfMain.SetKeepAlert(cpName,false)
    end
    InfMenu.DebugPrint("DEBUG_KeepPhaseOff e")
  end
}

this.printPlayerPhase={
  OnChange=function()
    InfMenu.DebugPrint("vars.playerPhase=".. vars.playerPhase ..":".. Ivars.phaseSettings[vars.playerPhase+1])
  end,
}

this.DEBUG_SetPlayerPhaseToIvar={
  OnChange=function()
    vars.playerPhase=Ivars.maxPhase:Get()
  end,
}

this.DEBUG_ShowPhaseEnums={
  OnChange=function()
    for n, phaseName in ipairs(Ivars.maxPhase.settings) do
      InfMenu.DebugPrint(phaseName..":".. Ivars.maxPhase.settingsTable[n])
    end
  end,
}


this.DEBUG_Item2={
  OnChange=function()
    InfMenu.DebugPrint("EnemyTypes:")
    InfMenu.DebugPrint("TYPE_DD:"..EnemyType.TYPE_DD)
    InfMenu.DebugPrint("TYPE_SKULL:"..EnemyType.TYPE_SKULL )
    InfMenu.DebugPrint("TYPE_SOVIET:"..EnemyType.TYPE_SOVIET)
    InfMenu.DebugPrint("TYPE_PF:"..EnemyType.TYPE_PF )
    InfMenu.DebugPrint("TYPE_CHILD:".. EnemyType.TYPE_CHILD )
    --InfMenu.DebugPrint("bef")
    -- local strout=InfInspect.Inspect(gvars.soldierTypeForced)
    -- InfMenu.DebugPrint(strout)
    -- InfMenu.DebugPrint("aft")
  end,
}

this.DEBUG_InspectAllMenus={
  OnChange=function()
    --local instr=InfInspect.Inspect(InfMenuDefs.allMenus)
    --InfMenu.DebugPrint(instr)
    for n,menu in ipairs(InfMenuDefs.allMenus) do
      if menu==nil then
        InfMenu.DebugPrint("menu==nil at index "..n)
      elseif menu.name==nil then
        InfMenu.DebugPrint("menu.name==nil at index "..n)
      else
        InfMenu.DebugPrint(InfMenu.PrintLangId(menu.name))
      end
    end
  end,
}

this.DEBUG_ClearAnnounceLog={
  OnChange=function()
    --TppUiStatusManager.SetStatus("AnnounceLog","INVALID_LOG")--pretty sure this is disable
    TppUiStatusManager.ClearStatus"AnnounceLog"
  end,
}

local currentObject=1
this.DEBUG_WarpToObject={
  OnChange=function()


    --local objectList=InfMain.reserveSoldierNames

    --local objectList=InfMain.ene_wildCardSoldiers

    --    local objectList={
    --      "ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|sol_plnt0_0000",
    --      "ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|sol_plnt0_0001",
    --      "ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|sol_plnt0_0002",
    --      "ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|sol_plnt0_0003",
    --    }
    --local objectList={"sol_field_0002"}



    --local objectList={TppReinforceBlock.REINFORCE_DRIVER_SOLDIER_NAME}
    local objectList=TppReinforceBlock.REINFORCE_SOLDIER_NAMES

    --local objectList={"ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|TppOcelot2GameObjectLocator"}
    --local objectList={"WestHeli0001","WestHeli0000","WestHeli0002"}
    --local objectList={"EnemyHeli"}
    --local objectList={"ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|sol_plnt0_0000"}

    --local objectList={"ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|TppLiquid2GameObjectLocator"}

    --    local objectList={
    --      "veh_cl01_cl00_0000",
    --      "veh_cl02_cl00_0000",
    --      "veh_cl03_cl00_0000",
    --      "veh_cl04_cl00_0000",
    --      "veh_cl05_cl00_0000",
    --      "veh_cl06_cl00_0000",
    --      "veh_cl00_cl04_0000",
    --      "veh_cl00_cl02_0000",
    --      "veh_cl00_cl03_0000",
    --      "veh_cl00_cl01_0000",
    --      "veh_cl00_cl05_0000",
    --      "veh_cl00_cl06_0000",
    --    }

    local objectList={
      --  "WestHeli0000",
      --  "WestHeli0001",
      --  "WestHeli0002",
      --  "EnemyHeli",
      "EnemyHeli0000",
      "EnemyHeli0001",
      "EnemyHeli0002",
      "EnemyHeli0003",
      "EnemyHeli0004",
      "EnemyHeli0005",
      "EnemyHeli0006",
    }

    if objectList==nil then
      InfMenu.DebugPrint"objectList nil"
      return
    end

    if #objectList==0 then
      InfMenu.DebugPrint"objectList empty"
      return
    end

    local count=0
    local warpPos=Vector3(0,0,0)
    local objectName="NULL"
    local function Step()
      objectName=objectList[currentObject]
      local gameId=GameObject.GetGameObjectId(objectName)
      if gameId==GameObject.NULL_ID then
        InfMenu.DebugPrint"gameId==NULL_ID"
        warpPos=Vector3(0,0,0)
      else
        warpPos=GameObject.SendCommand(gameId,{id="GetPosition"})
        InfMenu.DebugPrint(currentObject..":"..objectName.." pos:".. warpPos:GetX()..",".. warpPos:GetY().. ","..warpPos:GetZ())
      end
      currentObject=currentObject+1
      if currentObject>#objectList then
        currentObject=1
      end
      count=count+1
    end

    Step()

    while (warpPos:GetX()==0 and warpPos:GetY()==0 and warpPos:GetZ()==0) and count<=#objectList do
      Step()
      --coroutine.yeild()
    end


    if warpPos:GetX()~=0 or warpPos:GetY()~=0 or warpPos:GetZ()~=0 then
      TppPlayer.Warp{pos={warpPos:GetX(),warpPos:GetY()+1,warpPos:GetZ()},rotY=vars.playerCameraRotation[1]}

      --DEBUG CULL
      --      local gameId=GameObject.GetGameObjectId("TppSoldier2",soldierName)
      --      if gameId==nil or  gameId==GameObject.NULL_ID then
      --        InfMenu.DebugPrint"gameId==NULL_ID"
      --      else
      --        GameObject.SendCommand(gameId,{id="SetEnabled",enabled=true})
      --        GameObject.SendCommand(gameId,{id="SetForceRealize"})
      --      end
    end



  end,
}

this.DEBUG_WarpToReinforceVehicle={
  OnChange=function()
    local vehicleId=GameObject.GetGameObjectId("TppVehicle2",TppReinforceBlock.REINFORCE_VEHICLE_NAME)
    local driverId=GameObject.GetGameObjectId("TppSoldier2",TppReinforceBlock.REINFORCE_DRIVER_SOLDIER_NAME)

    if vehicleId==GameObject.NULL_ID then
      InfMenu.DebugPrint"vehicleId==NULL_ID"
      return
    end
    local warpPos=GameObject.SendCommand(vehicleId,{id="GetPosition"})
    InfMenu.DebugPrint("reinforce vehicle pos:".. warpPos:GetX()..",".. warpPos:GetY().. ","..warpPos:GetZ())
    TppPlayer.Warp{pos={warpPos:GetX(),warpPos:GetY(),warpPos:GetZ()},rotY=vars.playerCameraRotation[1]}
  end,
}

this.DEBUG_PrintNonDefaultVars={
  OnChange=function()
    Ivars.PrintNonDefaultVars()
  end,
}

this.DEBUG_PrintSaveVarCount={
  OnChange=function()
    InfInspect.TryFunc(function()
      Ivars.PrintSaveVarCount()
    end)
  end,
}


this.HeliMenuOnTest={--CULL: UI system overrides it :(
  OnChange=function()
    local dvcMenu={
      {menu=TppTerminal.MBDVCMENU.MSN_HELI,active=true},
      {menu=TppTerminal.MBDVCMENU.MSN_HELI_RENDEZVOUS,active=true},
      {menu=TppTerminal.MBDVCMENU.MSN_HELI_ATTACK,active=true},
      {menu=TppTerminal.MBDVCMENU.MSN_HELI_DISMISS,active=true},
    }
    InfMenu.DebugPrint("blih")--DEBUG
    TppTerminal.EnableDvcMenuByList(dvcMenu)
    InfMenu.DebugPrint("bleh")--DEBUG
  end,
}

this.changeToIdleStateHeli={--tex seems to set heli into 'not called'/invisible/wherever it goes after it's 'left'
  OnChange=function()
    local gameObjectId=GameObject.GetGameObjectId("TppHeli2", "SupportHeli")
    if gameObjectId~=nil and gameObjectId~=GameObject.NULL_ID then
      GameObject.SendCommand(gameObjectId,{id="ChangeToIdleState"})
    end
  end
}

--TABLESETUP: MenuCommands
local IsTable=Tpp.IsTypeTable
local switchRange={max=1,min=0,increment=1}
for name,item in pairs(this) do
  if IsTable(item) then
    if item.OnChange then--TYPEID
      item.name=name
      item.default=item.default or 0
      item.setting=item.default
      item.range=item.range or switchRange
      item.settingNames=item.settingNames or "set_do"
    end
  end
end

return this
