#!/bin/sh
SOUNDLIST=( \
    "link_whistle.wav" \
    "link_fairy.wav" \
    "link_rupee.wav" \
)

SOUND=${SOUNDLIST[ $(( RANDOM % ${#SOUNDLIST[@]} )) ]}

paplay ~/.config/sounds/$SOUND
