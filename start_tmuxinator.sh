tmuxinator_sessions='home dotfiles fr gamedevtv leagion scratch'
for session in $tmuxinator_sessions; do
	echo starting session $session
	tmuxinator start --attach=false $session
done