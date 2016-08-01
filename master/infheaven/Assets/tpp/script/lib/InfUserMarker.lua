-- DOBUILD: 1
--InfUserMarker.lua
local this={}
--localopt
local NULL_ID=GameObject.NULL_ID
local GetTypeIndex=GameObject.GetTypeIndex

--usermarkers
local alphaTable={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
function this.PrintUserMarker(index)
  --NMC 5 user markers, 0 indexed, compacted on adds and removes ('unset' have valid zeroed/default values) so max is vars.userMarkerSaveCount
  --userMarkerAddFlag maps to alphabet from 1 and is reused/wraps

  local x=vars.userMarkerPosX[index]
  local y=vars.userMarkerPosY[index]
  local z=vars.userMarkerPosZ[index]
  local addFlag=vars.userMarkerAddFlag[index]
  local letter=alphaTable[addFlag]
  local gameId=vars.userMarkerGameObjId[index]
  local posString=string.format("%.2f,%.2f,%.2f",x,y,z)
  InfMenu.DebugPrint("userMarker "..index.." : pos="..posString..", addFlag="..tostring(addFlag)..", letter="..tostring(letter)..", gameId="..tostring(gameId))
  --InfMenu.DebugPrint("userMarker "..index.." : pos="..tostring(x)..","..tostring(y)..","..tostring(z)..", addFlag="..tostring(addFlag)..", letter="..tostring(letter)..", gameId="..tostring(gameId))
end
function this.PrintUserMarkers()
  --NMC 5 user markers, 0 indexed, compacted on adds and removes ('unset' have valid zeroed/default values) so max is vars.userMarkerSaveCount
  --userMarkerAddFlag maps to alphabet from 1 and is reused/wraps
  local maxMarkers=5--tex TODO VERIFY
  for index=0,maxMarkers-1 do
    this.PrintUserMarker(index)
  end

  InfMenu.DebugPrint("userMarkerLocationId:"..vars.userMarkerLocationId)
  InfMenu.DebugPrint("userMarkerSaveCount:"..vars.userMarkerSaveCount)
end
function this.PrintMarkerGameObject(index)
  local gameId=vars.userMarkerGameObjId[index]
  if gameId==NULL_ID then
    InfMenu.DebugPrint"gameId==NULL_ID"
    return
  end
  local typeIndex=GetTypeIndex(gameId)
  local typeStr=InfMain.gameObjectTypeToString[typeIndex]
  local soldierName,cpName=InfMain.SoldierNameForGameId(gameId)
  InfMenu.DebugPrint(soldierName)
  InfMenu.DebugPrint(gameId.."="..typeStr)
  InfMenu.DebugPrint("cpName:"..tostring(cpName))
end
function this.GetLastAddedUserMarkerIndex()
  if vars.userMarkerSaveCount==0 then
    return
  end

  --tex find 'last added' in repect to how userMarker works described in above notes
  --there may be a better way to do this, but I b bad math
  --grab all the markerFlags
  local addMarkerFlags={}
  for index=0,vars.userMarkerSaveCount-1 do
    local addFlag=vars.userMarkerAddFlag[index]
    table.insert(addMarkerFlags,{addFlag=addFlag,index=index})
  end

  --sort
  local SortFunc=function(a,b)
    if a.addFlag<b.addFlag then
      return true
    end
    return false
  end
  table.sort(addMarkerFlags,SortFunc)


  --figure this shit out
  local highestMarkerIndex=nil

  local flagMax=26--tex maps to alphabet so Z=26

  local startFlag=addMarkerFlags[1].addFlag
  local endFlag=addMarkerFlags[#addMarkerFlags].addFlag

  if vars.userMarkerSaveCount==1 then
    return addMarkerFlags[1].index
  elseif endFlag==flagMax and startFlag==1 then--tex a marker hit the end and markers have wrapped
    local previousFlag=startFlag
    for n,info in ipairs(addMarkerFlags)do
      if info.addFlag~=previousFlag and info.addFlag-1~=previousFlag then --tex GOTCHA(not actually) this method would fail if number of markers was max, think of a snake earing it's tail (snake? snake? snaaake!), but imagine trying to use 26 markers lol
        highestMarkerIndex=addMarkerFlags[n-1].index
        break
      else
        previousFlag=info.addFlag
      end
    end
  else
    highestMarkerIndex=addMarkerFlags[#addMarkerFlags].index
  end

  return highestMarkerIndex
end

function this.WarpToUserMarker(index)
  if vars.userMarkerSaveCount==0 then
    return
  end

  local markerPos=Vector3(0,0,0)
  local gameId=vars.userMarkerGameObjId[index]


  if gameId==NULL_ID then
    markerPos=Vector3(vars.userMarkerPosX[index],vars.userMarkerPosY[index]+1,vars.userMarkerPosZ[index])
  else
    markerPos=GameObject.SendCommand(gameId,{id="GetPosition"})
  end


  InfMenu.DebugPrint("warped to marker "..index..":".. markerPos:GetX()..",".. markerPos:GetY().. ","..markerPos:GetZ())
  TppPlayer.Warp{pos={markerPos:GetX(),markerPos:GetY(),markerPos:GetZ()},rotY=vars.playerCameraRotation[1]}
end


return this