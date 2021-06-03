tmuxinator_sessions='home carrot buffet unata-frontend unata-infrastructure unata-offers enterprise-configs unata-releases'
for session in $tmuxinator_sessions; do
	echo starting session $session
	tmuxinator start --attach=false $session
done
