tmuxinator_sessions='home dotfiles fr smapply-ui scratch playground'
for session in $tmuxinator_sessions; do
	echo starting session $session
	tmuxinator start --attach=false $session
done

tmuxinator home
