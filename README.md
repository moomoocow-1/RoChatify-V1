# RoChatify 💬

RoChatify is a Roblox text chat service designed to provide developers with an easy and customizable way to implement chat functionality in their games. With RoChatify, you can handle player messages, commands, and chat formatting efficiently, making multiplayer interactions smoother and more engaging. Its lightweight design ensures minimal performance impact while offering flexibility for different game styles.

# 
# Get it here!

https://create.roblox.com/store/asset/86431178592225/RoChatify

# 
# Documentation
RoChatify is super easy to use to be honest. The following are all of RoChatifys Must use functions and how they work
# 
RoChatify.SetupUser(Player)

When a player is passed into this function it adds the "UserCanChat" value to their player this value is only set to true or false if ChatForUsersUnder13 is set to false
# 
RoChatify.Chat(Player, Message)
 
When this function is called it checks if the message sent is safe then shows up the message above the players head for the set duration (Default 10 seconds)
# 
RoChatify.FilterMessage(Player, message)

Check a message through the filter returns false if clean and true if not!


