-- DOBUILD: 1
--InfEneFova.lua

local this={}

this.ddBodyInfo={
  SNEAKING_SUIT={
    maleBodyId=TppEnemyBodyId.dds4_enem0_def,
    femaleBodyId=TppEnemyBodyId.dds4_enef0_def,
    partsPath="/Assets/tpp/parts/chara/sna/sna4_enem0_def_v00.parts",
    extendPartsInfo={type=1,path="/Assets/tpp/parts/chara/sna/sna4_enef0_def_v00.parts"},
    missionPackPath=TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_SNEAKING,--"/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_sneak.fpk",
    soldierSubType="DD_FOB",
  },
  BATTLE_DRESS={
    maleBodyId=TppEnemyBodyId.dds5_enem0_def,
    femaleBodyId=TppEnemyBodyId.dds5_enef0_def,
    partsPath="/Assets/tpp/parts/chara/sna/sna5_enem0_def_v00.parts",
    extendPartsInfo={type=1,path="/Assets/tpp/parts/chara/sna/sna5_enef0_def_v00.parts"},
    missionPackPath=TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_BTRDRS,--"/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_btdrs.fpk",
    soldierSubType="DD_FOB",
  },
  PFA_ARMOR={
    maleBodyId=TppEnemyBodyId.pfa0_v00_a,
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath=TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_ARMOR,--"/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_armor.fpk",
    isArmor=true,
    helmetOnly=true,
    noDDHeadgear=true,
    hasArmor=true,
    soldierSubType="DD_FOB",
  },
  TIGER={
    maleBodyId=TppEnemyBodyId.dds5_main0_v00,
    femaleBodyId=TppEnemyBodyId.dds6_main0_v00,
    partsPath="/Assets/tpp/parts/chara/dds/dds5_enem0_def_v00.parts",
    extendPartsInfo={type=1,path="/Assets/tpp/parts/chara/dds/dds6_enef0_def_v00.parts"},
    missionPackPath=TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_ATTACKER,--"/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_attack.fpk",
    soldierSubType="DD_FOB",
  },
  DRAB={--?? mother base default
    maleBodyId=TppEnemyBodyId.dds3_main0_v00,
    femaleBodyId=TppEnemyBodyId.dds8_main0_v00,
    extendPartsInfo={type=1,path="/Assets/tpp/parts/chara/dds/dds8_main0_def_v00.parts"},
    missionPackPath=TppDefine.MISSION_COMMON_PACK.DD_SOLDIER_WAIT,
    soldierSubType="DD_FOB",
  },
  XOF={--tex Test: when XOF mission fpk loaded it stops salute morale from working?
    maleBodyId=TppEnemyBodyId.wss4_main0_v00,--wss4_main0_v01,wss4_main0_v02
    partsPath="/Assets/tpp/parts/chara/wss/wss4_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_xof_soldier.fpk",
    hasFace=true,
    hasHelmet=true,
    soldierSubType="SKULL_AFGH",
  },
  SOVIET_A={
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    noDDHeadgear=true,
    soldierSubType="SOVIET_A",
    hasArmor=true,
  },
  SOVIET_B={
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    noDDHeadgear=true,
    soldierSubType="SOVIET_B",
    hasArmor=true,
  },
  PF_A={
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    noDDHeadgear=true,
    soldierSubType="PF_A",
    hasArmor=true,
  },
  PF_B={
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    noDDHeadgear=true,
    soldierSubType="PF_B",
    hasArmor=true,
  },
  PF_C={
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    noDDHeadgear=true,
    soldierSubType="PF_C",
    hasArmor=true,
  },
  GZ={
    maleBodyId=TppEnemyBodyId.dds0_main1_v00,--,TppEnemyBodyId.dds0_main1_v01
    partsPath="/Assets/tpp/parts/chara/dds/dds0_main2_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_dd_soldier_gz.fpk",
  },
  MSF={--tex WIP shows, but combined with whatever other fpk is loaded, need to find right parts file?
    maleBodyId=TppEnemyBodyId.pfs0_dds0_v00,--svs0_dds0_v00,--pfs0_dds0_v00,
  --partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
  --missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
  --    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
  --    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
  --soldierSubType="PF_A",
  },
  SOVIET_BERETS={
    maleBodyId={
      TppEnemyBodyId.svs0_unq_v010,
      TppEnemyBodyId.svs0_unq_v020,
      TppEnemyBodyId.svs0_unq_v070,
      TppEnemyBodyId.svs0_unq_v071,
      TppEnemyBodyId.svs0_unq_v072,
      TppEnemyBodyId.svs0_unq_v009,
    },
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    noDDHeadgear=true,
    noHelmet=true,--tex TODO: just do a whole equip allowed/disallowed
  --soldierSubType="SOVIET_B",
  },
  SOVIET_HOODIES={
    maleBodyId={
      TppEnemyBodyId.svs0_unq_v060,
      TppEnemyBodyId.svs0_unq_v100,
      TppEnemyBodyId.svs0_unq_v420,
    },
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    noDDHeadgear=true,
  --soldierSubType="SOVIET_B",
  },
  SOVIET_ALL={
    maleBodyId={
      TppEnemyBodyId.svs0_rfl_v00_a,
      TppEnemyBodyId.svs0_rfl_v01_a,
      TppEnemyBodyId.svs0_rfl_v02_a,
      TppEnemyBodyId.svs0_mcg_v00_a,
      TppEnemyBodyId.svs0_mcg_v01_a,
      TppEnemyBodyId.svs0_mcg_v02_a,
      TppEnemyBodyId.svs0_snp_v00_a,
      TppEnemyBodyId.svs0_rdo_v00_a,
      TppEnemyBodyId.svs0_rfl_v00_b,
      TppEnemyBodyId.svs0_rfl_v01_b,
      TppEnemyBodyId.svs0_rfl_v02_b,
      TppEnemyBodyId.svs0_mcg_v00_b,
      TppEnemyBodyId.svs0_mcg_v01_b,
      TppEnemyBodyId.svs0_mcg_v02_b,
      TppEnemyBodyId.svs0_snp_v00_b,
      TppEnemyBodyId.svs0_rdo_v00_b,
      TppEnemyBodyId.sva0_v00_a,
      TppEnemyBodyId.svs0_unq_v010,
      TppEnemyBodyId.svs0_unq_v080,
      TppEnemyBodyId.svs0_unq_v020,
      TppEnemyBodyId.svs0_unq_v040,
      TppEnemyBodyId.svs0_unq_v050,
      TppEnemyBodyId.svs0_unq_v060,
      TppEnemyBodyId.svs0_unq_v100,
      TppEnemyBodyId.svs0_unq_v070,
      TppEnemyBodyId.svs0_unq_v071,
      TppEnemyBodyId.svs0_unq_v072,
      TppEnemyBodyId.svs0_unq_v420,
      TppEnemyBodyId.svs0_unq_v009,
      TppEnemyBodyId.svs0_unq_v421,
    },
    partsPath="/Assets/tpp/parts/chara/svs/svs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_afgh.fpk",
    noDDHeadgear=true,
  --soldierSubType="SOVIET_B",
  },
  PF_MISC={
    maleBodyId={
      TppEnemyBodyId.pfs0_unq_v210,--black beret, glases, black vest, red shirt, tan pants
      TppEnemyBodyId.pfs0_unq_v250,--black beret, white coyote tshirt, black pants
      TppEnemyBodyId.pfs0_unq_v360,--red long sleeve shirt, black pants
      TppEnemyBodyId.pfs0_unq_v280,--black suit, white shirt, red white striped tie
      TppEnemyBodyId.pfs0_unq_v150,--green beret, brown leather top, light tan muddy pants
      TppEnemyBodyId.pfs0_unq_v140,--cap, glases, badly clipping medal, brown leather top, light tan muddy pants
      TppEnemyBodyId.pfs0_unq_v241,--brown leather top, light tan muddy pants
      --TppEnemyBodyId.pfs0_unq_v242,--brown leather top, light tan muddy pants, cant tell any difference?
      TppEnemyBodyId.pfs0_unq_v450,--red beret, brown leather top, light tan muddy pants
      TppEnemyBodyId.pfs0_unq_v440,--red beret, black leather top, black pants
    },
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    noDDHeadgear=true,
  --soldierSubType="PF_C",
  },
  PF_ALL={
    maleBodyId={
      TppEnemyBodyId.pfs0_rfl_v00_a,
      TppEnemyBodyId.pfs0_rfl_v01_a,
      TppEnemyBodyId.pfs0_mcg_v00_a,
      TppEnemyBodyId.pfs0_snp_v00_a,
      TppEnemyBodyId.pfs0_rdo_v00_a,
      TppEnemyBodyId.pfs0_rfl_v00_b,
      TppEnemyBodyId.pfs0_rfl_v01_b,
      TppEnemyBodyId.pfs0_mcg_v00_b,
      TppEnemyBodyId.pfs0_snp_v00_b,
      TppEnemyBodyId.pfs0_rdo_v00_b,
      TppEnemyBodyId.pfs0_rfl_v00_c,
      TppEnemyBodyId.pfs0_rfl_v01_c,
      TppEnemyBodyId.pfs0_mcg_v00_c,
      TppEnemyBodyId.pfs0_snp_v00_c,
      TppEnemyBodyId.pfs0_rdo_v00_c,
      TppEnemyBodyId.pfa0_v00_b,
      TppEnemyBodyId.pfa0_v00_c,
      TppEnemyBodyId.pfa0_v00_a,
      TppEnemyBodyId.pfs0_unq_v210,
      TppEnemyBodyId.pfs0_unq_v250,
      TppEnemyBodyId.pfs0_unq_v360,
      TppEnemyBodyId.pfs0_unq_v280,
      TppEnemyBodyId.pfs0_unq_v150,
      TppEnemyBodyId.pfs0_unq_v220,
      TppEnemyBodyId.pfs0_unq_v140,
      TppEnemyBodyId.pfs0_unq_v241,
      TppEnemyBodyId.pfs0_unq_v242,
      TppEnemyBodyId.pfs0_unq_v450,
      TppEnemyBodyId.pfs0_unq_v440,
      TppEnemyBodyId.pfs0_unq_v155,
    },
    partsPath="/Assets/tpp/parts/chara/pfs/pfs0_main0_def_v00.parts",
    missionPackPath="/Assets/tpp/pack/mission2/common/mis_com_mafr.fpk",
    noDDHeadgear=true,
  --soldierSubType="PF_C",
  },
}

---



this.ddSuitToDDBodyInfo={
  [TppEnemy.FOB_DD_SUIT_SNEAKING]="SNEAKING_SUIT",
  [TppEnemy.FOB_DD_SUIT_BTRDRS]="BATTLE_DRESS",
  [TppEnemy.FOB_PF_SUIT_ARMOR]="PFA_ARMOR",
  [TppEnemy.FOB_DD_SUIT_ATTCKER]="TIGER",
}

--tex see TppEnemyFaceId
this.ddHeadGearInfo={
  --HMT=DD greentop
  --tex OFF till I put selection in
  --  svs_balaclava={--550,  --[M][---][---][---] Balaclava
  --    MALE=true,
  --  },
  --  pfs_balaclava={--551,  --[M][---][---][---] Balaclava
  --    MALE=true,
  --  },
  dds_balaclava0={--552, --[M][---][---][HMT] DD
    MALE=true,
    HELMET=true,
  },
  dds_balaclava1={--553, --[M][---][---][---] DD blacktop  - some oddness here this shows as helmet/greentop (like 552) when player face set to this, so is the fova for player not set right? TODO:
    MALE=true,
  },
  dds_balaclava2={--554, --[M][---][---][---] DD no blacktop - same issue as above
    MALE=true,
  },
  dds_balaclava3={--555, --[F][---][---][HMT] DD
    FEMALE=true,
    HELMET=true,
  },
  dds_balaclava4={--556, --[F][---][---][---] DD blacktop - same issue as above (but shows as equivalent 555)
    FEMALE=true,
  },
  dds_balaclava5={--557, --[F][---][---][---] DD blacktop - same issue as above
    FEMALE=true,
  },
  dds_balaclava6={--558, --[M][GAS][---][---] DD open clava
    MALE=true,
    GAS_MASK=true,
  },
  dds_balaclava7={--559, --[F][GAS][---][---] DD open clava
    FEMALE=true,
    GAS_MASK=true,
  },
  dds_balaclava8={--560, --[M][GAS][---][---] DD clava and blacktop
    MALE=true,
    GAS_MASK=true,
  },
  dds_balaclava9={--561, --[M][GAS][---][HMT] DD
    MALE=true,
    GAS_MASK=true,
    HELMET=true,
  },
  dds_balaclava10={--562,--[F][GAS][---][---] DD clava and blacktop
    FEMALE=true,
    GAS_MASK=true,
  },
  dds_balaclava11={--563,--[F][GAS][---][HMT] DD
    FEMALE=true,
    GAS_MASK=true,
    HELMET=true,
  },
  dds_balaclava12={--564,--[M][---][NVG][HMT] DD
    MALE=true,
    NVG=true,
    HELMET=true,
  },
  dds_balaclava13={--565,--[M][GAS][NVG][HMT] DD
    MALE=true,
    GAS_MASK=true,
    NVG=true,
    HELMET=true,
  },
  dds_balaclava14={--566,--[F][---][NVG][HMT] DD
    FEMALE=true,
    NVG=true,
    HELMET=true,
  },
  dds_balaclava15={--567,--[F][GAS][NVG][HMT] DD
    FEMALE=true,
    GAS_MASK=true,
    NVG=true,
    HELMET=true,
  },
}

this.ddHeadGearSelection={
  {--[---][---][---] Balaclava
    maleId="svs_balaclava",
    femaleId="dds_balaclava5",--tex no direct match so fallback to something similar
  },
  {--[---][---][---] Balaclava
    maleId="pfs_balaclava",
    femaleId="dds_balaclava4",--tex no direct match so fallback to something similar
  },
  {--[---][---][HMT] DD
    maleId="dds_balaclava0",
    femaleId="dds_balaclava3",
  },
  {--[---][---][---] DD blacktop
    maleId="dds_balaclava1",
    femaleId="dds_balaclava4",
  },
  {--[---][---][---] DD no blacktop
    maleId="dds_balaclava2",
    femaleId="dds_balaclava5",
  },
  {--[GAS][---][---] DD open clava
    maleId="dds_balaclava6",
    femaleId="dds_balaclava7",
  },
  {--[GAS][---][---] DD clava and blacktop
    maleId="dds_balaclava8",
    femaleId="dds_balaclava10",
  },
  {--[GAS][---][HMT] DD
    maleId="dds_balaclava9",
    femaleId="dds_balaclava11",
  },
  {--[---][NVG][HMT] DD
    maleId="dds_balaclava12",
    femaleId="dds_balaclava14",
  },
  {--[GAS][NVG][HMT] DD
    maleId="dds_balaclava13",
    femaleId="dds_balaclava15",
  },
}

function this.GetCurrentDDBodyInfo(isFemale)
  local suitName=nil
  if Ivars.mbDDSuit:Is"EQUIPGRADE" then
    local ddSuit=TppEnemy.GetDDSuit()
    suitName=this.ddSuitToDDBodyInfo[ddSuit]
    --0=OFF,EQUIPGRADE,..specific suits
  elseif Ivars.mbDDSuit:Is()>1 then
    if isFemale then
      suitName=Ivars.mbDDSuitFemale.settings[Ivars.mbDDSuitFemale:Get()+1]
    else
      suitName=Ivars.mbDDSuit.settings[Ivars.mbDDSuit:Get()+1]
    end
  else
    return nil
  end
  return this.ddBodyInfo[suitName]
end

--
this.femaleSuits={
  "SNEAKING_SUIT",
  "BATTLE_DRESS",
  "TIGER",
  "DRAB",
}

this.wildCardSuitName="SNEAKING_SUIT"
function this.GetCurrentWildCardBodyInfo(isFemale)
  return this.ddBodyInfo[this.wildCardSuitName]
end

this.wildCardBodiesAfgh={
  TppEnemyBodyId.svs0_unq_v010,
  TppEnemyBodyId.svs0_unq_v020,
  TppEnemyBodyId.svs0_unq_v070,
  TppEnemyBodyId.svs0_unq_v071,
  TppEnemyBodyId.svs0_unq_v072,
  TppEnemyBodyId.svs0_unq_v009,
  TppEnemyBodyId.svs0_unq_v060,
  TppEnemyBodyId.svs0_unq_v100,
  TppEnemyBodyId.svs0_unq_v420,
}

this.wildCardBodiesMafr={
  TppEnemyBodyId.pfs0_unq_v210,--black beret, glases, black vest, red shirt, tan pants
  TppEnemyBodyId.pfs0_unq_v250,--black beret, white coyote tshirt, black pants
  TppEnemyBodyId.pfs0_unq_v360,--red long sleeve shirt, black pants
  TppEnemyBodyId.pfs0_unq_v280,--black suit, white shirt, red white striped tie
  TppEnemyBodyId.pfs0_unq_v150,--green beret, brown leather top, light tan muddy pants
  TppEnemyBodyId.pfs0_unq_v140,--cap, glases, badly clipping medal, brown leather top, light tan muddy pants
  TppEnemyBodyId.pfs0_unq_v241,--brown leather top, light tan muddy pants
  --TppEnemyBodyId.pfs0_unq_v242,--brown leather top, light tan muddy pants, cant tell any difference?
  TppEnemyBodyId.pfs0_unq_v450,--red beret, brown leather top, light tan muddy pants
  TppEnemyBodyId.pfs0_unq_v440,--red beret, black leather top, black pants
}
--tex non exhaustive, see face and body ids.txt
this.maleFaceIds={
  {min=0,max=303},
  {min=320,max=349},
}

this.femaleFaceIds={
  {min=350,max=399},--european
  {min=440,max=479},--african
  {min=500,max=519},--asian
}
--NOTE: make sure SetLevelRandomSeed is setup
function this.RandomFaceId(rangedFaceList)
  local type=rangedFaceList[math.random(#rangedFaceList)]
  return math.random(type.min,type.max)
end

--called from TppEnemyFova fovaSetupFuncs.Afghan/Africa
--IN/Out bodies
function this.WildCardFova(bodies)
  InfMain.SetLevelRandomSeed()
  local faces={}
  InfEneFova.inf_wildCardFaceList={}
  for i=1,InfMain.MAX_WILDCARD_FACES do--SYNC numfemales
    local faceId=this.RandomFaceId(this.femaleFaceIds)
    table.insert(faces,{faceId,1,1,0})--0,0,MAX_REALIZED_COUNT})--tex TODO figure this shit out, hint is in RegisterUniqueSetting since it builds one
    table.insert(InfEneFova.inf_wildCardFaceList,faceId)
  end
  TppSoldierFace.OverwriteMissionFovaData{face=faces,additionalMode=true}
  InfMain.ResetTrueRandom()

  this.wildCardSuitName=this.femaleSuits[math.random(#this.femaleSuits)]
  local bodyInfo=this.GetCurrentWildCardBodyInfo(true)--tex female
  if bodyInfo then
    if bodyInfo.femaleBodyId then
      TppEneFova.SetupBodies(bodyInfo.femaleBodyId,bodies)
    end
    if bodyInfo.soldierSubType then
      local bodyIdTable=TppEnemy.bodyIdTable[bodyInfo.soldierSubType]
      if bodyIdTable then
        for powerType,bodyTable in pairs(bodyIdTable)do
          TppEneFova.SetupBodies(bodyTable,bodies)
        end
      end
    end

    if bodyInfo.extendPartsInfo then
      TppSoldier2.SetExtendPartsInfo(bodyInfo.extendPartsInfo)
    end
  end
end

function this.GetHeadGearForPowers(powerSettings,faceId,hasHelmet)
  local validHeadGearIds={}
  if powerSettings then
    local gearPowerTypes={
      HELMET=true,
      GAS_MASK=true,
      NVG=true,
    }
    if hasHelmet then
      gearPowerTypes.HELMET=nil
    end

    local function IsFemale(faceId)
      local isFemale=TppSoldierFace.CheckFemale{face={faceId}}
      return isFemale and isFemale[1]==1
    end
    for headGearId, headGearInfo in pairs(this.ddHeadGearInfo)do
      local isMatch=true
      if IsFemale(faceId)==true then
        if not headGearInfo.FEMALE then
          isMatch=false
        end
      else
        if not headGearInfo.MALE then
          isMatch=false
        end
      end
      --      if hasHelmet and headGearInfo.HELMET then --CULL
      --        if powerSettings.HELMET and not (powerSettings.GAS_MASK or powerSettings.NVG) then--tex really only want to prevent DD helm+nothing
      --          isMatch=false
      --        end
      --      end
      if hasHelmet and (not headGearInfo.GAS_MASK and not headGearInfo.NVG) then
        isMatch=false
      end

      if isMatch then
        for powerType, bool in pairs(gearPowerTypes)do
          if powerSettings[powerType] and not headGearInfo[powerType] then
            isMatch=false
          end
          if headGearInfo[powerType] and not powerSettings[powerType] then
            isMatch=false
          end
        end
      end
      if isMatch then
        table.insert(validHeadGearIds,headGearId)
      end
    end
  end

  return validHeadGearIds
end

return this