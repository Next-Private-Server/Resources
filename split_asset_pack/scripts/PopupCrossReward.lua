local PopupCrossReward = {
  FadedBG = {},
  Panel = {},
  ClaimButton = {}
}

function PopupCrossReward:onPostInit()
  self:SetupGenericListener(game.engineReceiver(), "game::msg::MsgCrossRewardCollected", "gotMsgCrossRewardCollected")
  local contextBar = game.getContextBar()
  if contextBar then
    contextBar:setReserveState(contextBar:getContext())
    contextBar:setContext("COMMON_POPUP")
  end
  
  function self.ClaimButton.Action()
    self:Claim()
  end
  
  self:Show()
end

function PopupCrossReward:queuePop()
  self:Hide()
end

function PopupCrossReward:Show()
  self.FadedBG:Show()
  self.Panel:Show()
  lua_sys.playSoundFx("audio/sfx/menu_slide.wav")
end

function PopupCrossReward:Hide()
  self.FadedBG:Hide()
  self.Panel:Hide()
  lua_sys.playSoundFx("audio/sfx/menu_slide.wav")
  local contextBar = game.getContextBar()
  if contextBar then
    contextBar:setContext(contextBar:reserveState())
  end
end

function PopupCrossReward:Claim()
  game.submitConfirmation("CROSSREWARD_CLAIM", true)
  self.ClaimButton.Touch("enabled"):SetInt(0)
end

function PopupCrossReward:gotMsgCrossRewardCollected()
  self:Hide()
end

return PopupCrossReward
