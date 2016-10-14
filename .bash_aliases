#	--	 Alias - functions Meh
#	--	 DQV


# Require msi-keyboard : On / Off + keyColor $value
alias keyOn='sudo nodejs  ~/.msi-klm/msi-keyboard-CLI.js -k on'
alias keyOff='sudo nodejs  ~/.msi-klm/msi-keyboard-CLI.js -k off'
keyColor() 
{
sudo nodejs  ~/.msi-klm/msi-keyboard-CLI.js -c $1

}
