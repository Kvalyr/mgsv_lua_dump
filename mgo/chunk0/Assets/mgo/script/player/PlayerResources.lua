local a={}a.PlayerTypes={[PlayerType.MGO_MALE]={parts={[PlayerPartsType.NORMAL]={fpk="/Assets/mgo/pack/player/parts/plparts_bse0_main2.fpk",file="/Assets/mgo/parts/chara/base/bse0_main0_def_v02.parts"}}},[PlayerType.MGO_FEMALE]={parts={[PlayerPartsType.NORMAL]={fpk="/Assets/mgo/pack/player/parts/plparts_bse0_main2_f.fpk",file="/Assets/mgo/parts/chara/base/bse0_main0_def_v02_f.parts"}}},[PlayerType.AVATAR]={parts={[PlayerPartsType.AVATAR_EDIT_MAN]={fpk="/Assets/mgo/pack/player/parts/plparts_avatar_man.fpk",file="/Assets/tpp/parts/chara/avm/avm0_main0_def_v00.parts"},[PlayerPartsType.AVATAR_EDIT_WOMAN]={fpk="/Assets/mgo/pack/player/parts/plparts_avatar_woman.fpk",file="/Assets/mgo/parts/chara/avm/avf0_main0_def_v00.parts"}}},[PlayerType.MGO_SNAKE]={parts={[PlayerPartsType.NORMAL]={fpk="/Assets/mgo/pack/player/parts/plparts_sna0_main.fpk",file="/Assets/mgo/parts/chara/sna/sna0_main4_def_v00.parts"}}},[PlayerType.MGO_OCELOT]={parts={[PlayerPartsType.NORMAL]={fpk="/Assets/mgo/pack/player/parts/plparts_oce0_main.fpk",file="/Assets/mgo/parts/chara/oce/oce0_main0_def_v00.parts"}}},[PlayerType.MGO_QUIET]={parts={[PlayerPartsType.NORMAL]={fpk="/Assets/mgo/pack/player/parts/plparts_qui1_main.fpk",file="/Assets/mgo/parts/chara/qui/qui0_main0_mgo_v00.parts"}}},[PlayerType.MGO_KAZ]={parts={[PlayerPartsType.NORMAL]={fpk="/Assets/mgo/pack/player/parts/plparts_kaz0_main.fpk",file="/Assets/mgo/parts/chara/kaz/kaz1_main0_mgo_v01.parts"}}}}function a.GetPartsFpkPath(e,p)local s
pcall(function()s=a.PlayerTypes[e].parts[p].fpk
end)return s
end
function a.GetPartsFilePath(p,e)local s
pcall(function()s=a.PlayerTypes[p].parts[e].file
end)return s
end
function a.GetFaceFpkPath(p,s,e)local s
pcall(function()s=a.PlayerTypes[p].faces[e+1].fpk
end)return s
end
function a.GetFaceFilePath(e,s,p)local s
pcall(function()s=a.PlayerTypes[e].faces[p+1].file
end)return s
end
return a