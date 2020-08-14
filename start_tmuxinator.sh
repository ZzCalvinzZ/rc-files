tmuxinator_sessions='home approuter globaltemplates smpackages smweb'
for session in $tmuxinator_sessions; do
	echo starting session $session
	tmuxinator start --attach=false $session
done
