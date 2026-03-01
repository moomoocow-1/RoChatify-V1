--Services
local playerService = game:GetService("Players")
local PolicyService = game:GetService("PolicyService") --Used to check for age under 13

--Config
local ChatForUsersUnder13 = true --Allows users under the age of 13 to chat (true = can Chat, false = cant Chat)
local LessExtemeChatWordBan = true --When set to true words like "Hell" "Crap" "Damn", etc will be banned
local messageTime = 10 --How long the message is shown above the players head

--Other Required Modules
local ChatFilterModule = require(script.ChatFilter)
local BannedUsersModule = require(script.BannedUsers) 

local RoChatify = {}

--Set up a player for chat
function RoChatify.SetupUser(player)
	local playerCanChat = Instance.new("BoolValue", player)
	playerCanChat.Name = "UserCanChat"
	playerCanChat.Value = true
	
	if ChatForUsersUnder13 == false then
		--Checks if player is above the age 13 based on if they can see ads (Kinda reliable idrk tbh)
		local success, policyInfo = pcall(function()
			return PolicyService:GetPolicyInfoForPlayerAsync(player)
		end)

		if success then
			if policyInfo.AreAdsAllowed == false then
				playerCanChat.Value = false
			end
		else
			--Praying ts doesnt happen
			warn("Failed to get policy info for", player.Name)
		end
	end	
end

function RoChatify.Chat(player, message)
	if LessExtemeChatWordBan == true then
		--Less Extreme Check (Bans words like Suck Damn or Hell etc)
		local checkMessage = ChatFilterModule.CheckLessExtreme(message)
		if checkMessage then
			message = "[Message Filtered]"
			local GUICLONE = script.MessageGUI:Clone() 
			GUICLONE.Parent = player.Character.Head
			GUICLONE.ChatMessage.Text = message
			task.delay(messageTime, function()
				GUICLONE:Destroy()
			end)
		else
			local GUICLONE = script.MessageGUI:Clone() 
			GUICLONE.Parent = player.Character.Head
			GUICLONE.ChatMessage.Text = message
			task.delay(messageTime, function()
				GUICLONE:Destroy()
			end)
		end
	else
		--Regular chat filter
		local checkMessage = ChatFilterModule.CheckMessage(message)
		if checkMessage then
			message = "[Message Filtered]"
			local GUICLONE = script.MessageGUI:Clone() 
			GUICLONE.Parent = player.Character.Head
			GUICLONE.ChatMessage.Text = message
			task.delay(messageTime, function()
				GUICLONE:Destroy()
			end)
		else
			local GUICLONE = script.MessageGUI:Clone() 
			GUICLONE.Parent = player.Character.Head
			GUICLONE.ChatMessage.Text = message
			
			task.delay(messageTime, function()
				GUICLONE:Destroy()
			end)
		end
	end
end

function RoChatify.FilterMessage(player, message)
	local checkMessage = ChatFilterModule.CheckMessage(message)
end

return RoChatify
