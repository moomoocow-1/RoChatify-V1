--[[

 ___       __   ________  ________  ________   ___  ________   ________     
|\  \     |\  \|\   __  \|\   __  \|\   ___  \|\  \|\   ___  \|\   ____\    
\ \  \    \ \  \ \  \|\  \ \  \|\  \ \  \\ \  \ \  \ \  \\ \  \ \  \___|    
 \ \  \  __\ \  \ \   __  \ \   _  _\ \  \\ \  \ \  \ \  \\ \  \ \  \  ___  
  \ \  \|\__\_\  \ \  \ \  \ \  \\  \\ \  \\ \  \ \  \ \  \\ \  \ \  \|\  \ 
   \ \____________\ \__\ \__\ \__\\ _\\ \__\\ \__\ \__\ \__\\ \__\ \_______\
    \|____________|\|__|\|__|\|__|\|__|\|__| \|__|\|__|\|__| \|__|\|_______|
                                                                            
                                                                                                                                             
Removing any of the words from the words list could get your game banned off of roblox 
Use this system carefuly!

IF ANY WORDS GET THROUGH PLEASE MESSAGE ME ON DISCORD @sillydeveloper._. or send me an email @ gecko1234yt@gmail.com OR DM ME ON ROBLOX @Biroblox4321 

-Thanks
Biroblox

]]--

local wordsList = {
	"dick",
	"fuck",
	"shit",
	"bitch",
	"nigger",
	"faggot",
	"dyke",
	"beaner",
	"jew",
	"epstien",
	"stine",
	"stein",
		
}

local LessExtremeWordsList = {
	"suck",
	"damn",
	"hell",
	"crap"
}

local ChatFilter = {}

function ChatFilter.CheckMessage(message)
	--LowerCase
	local loweredMessage = string.lower(message)
	
	--Remove all except letters
	local cleanedMessage = loweredMessage:gsub("[^a-z]", "")
	
	--Cross reference the message against the banned words
	for _, word in ipairs(wordsList) do
		if cleanedMessage:find(word, 1, true) then
			print("Message Filtered")
			return true
		end
	end

	return false --clean
end

function ChatFilter.CheckLessExtreme(message)
	--LowerCase
	local loweredMessage = string.lower(message)

	--Remove all except letters
	local cleanedMessage = loweredMessage:gsub("[^a-z]", "")

	--Cross reference the message against the banned words
	for _, word in ipairs(LessExtremeWordsList) do
		if cleanedMessage:find(word, 1, true) then
			print("Message Filtered")
			return true
		end
	end

	for _, word in ipairs(wordsList) do
		if cleanedMessage:find(word, 1, true) then
			print("Message Filtered")
			return true
		end
	end

	return false --clean
end

return ChatFilter
