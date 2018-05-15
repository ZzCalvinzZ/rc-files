tmuxinator_sessions='home dotfiles fr smapply-ui gamedevtv leagion scratch calvinkcollins'
for session in $tmuxinator_sessions; do
	echo starting session $session
	tmuxinator start --attach=false $session
done
