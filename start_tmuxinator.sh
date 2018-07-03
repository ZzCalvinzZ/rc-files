tmuxinator_sessions='home dotfiles smapply-ui scratch playground smstack'
for session in $tmuxinator_sessions; do
	echo starting session $session
	tmuxinator start --attach=false $session
done

tmuxinator home
