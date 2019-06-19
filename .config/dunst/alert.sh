#!/bin/sh
APP=$1
SUMMARY=$2
DESC=$3
ICON=$4
URGENCY=$5

logger $APP

NORMAL_SOUNDLIST=( \
    "normal/link_whistle.wav" \
    "normal/link_fairy.wav" \
    "normal/link_rupee.wav" \
    "normal/smb_coin.wav" \
)
CRIT_SOUNDLIST=( \
    "critical/link_menu_erase.wav" \
)

if [[ $URGENCY = "LOW" ]]; then
	:
elif [[ $URGENCY = "NORMAL" ]]; then
	if [[ $APP = "Kitty" ]]; then
		SOUND="normal/link_get_heart.wav"
	elif [[ $APP = "Slack" ]]; then
		SOUND="normal/link_whistle.wav"
	elif [[ $APP = "claws-mail" ]]; then
		SOUND="normal/ally-create.wav"
	else
		SOUND="normal/link_fairy.wav"
	fi
	#statements
elif [[ $URGENCY = "CRITICAL" ]]; then
	if [[ $APP = "Kitty" ]]; then
		SOUND="critical/link_error.wav"
	else
		SOUND=${CRIT_SOUNDLIST[ $(( RANDOM % ${#CRIT_SOUNDLIST[@]} )) ]}
	fi
fi

if [[ -n $SOUND ]]; then
	paplay ~/.config/sounds/$SOUND
fi
