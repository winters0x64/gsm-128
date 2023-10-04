get_cover() {
	# COVER_URL=$1
	mkdir -p "eww_covers"
	cd "eww_covers" || exit

	IMGPATH="cover_art"
	echo '{"image": "null", "color": {"alpha":"100","colors":{"color0":"null","color1":"null","color10":"null","color11":"null","color12":"null","color13":"null","color14":"null","color15":"null","color2":"null","color3":"null","color4":"null","color5":"null","color6":"null","color7":"null","color8":"null","color9":"null"},"special":{"background":"null","cursor":"null","foreground":"null"},"wallpaper":"~/.config/eww/eww_covers/cover_art","source":"󱛟"},"materialcolor":{"onPrimary":"null","onPrimaryContainer":"null","onSecondaryContainer":"null","primary":"null","primaryContainer":"null","secondaryContainer":"null"}}'
	# echo '{"image": "eww_covers/cover_art_default","source":"󱛟"}}'

	playerctl -F metadata mpris:artUrl 2>/dev/null | while read -r COVER_URL; do
		music_source='󰐍'
		COVER_URL=${COVER_URL//blob:/}
		COVER_URL=${COVER_URL//file:\/\//}
		COVER_URL=${COVER_URL//%20/ }
		if [[ "$COVER_URL" = *"https"* ]]; then
			music_source='󰖟'
			coverurl="$(playerctl metadata mpris:artUrl)"
			coverurl_highres_yt="$(echo $coverurl | sed 's/hqdefault/maxresdefault/g')"
			coverurl_highres_soundcloud="$(echo $coverurl | sed 's/80x80/500x500/g')"
			# SoundCloud
			if [[ "$coverurl" == *"sndcdn"* ]]; then
				music_source='󰓀'
				curl --silent --output "$IMGPATH""_soundcloud" "$coverurl_highres_soundcloud" -q –read-timeout=0.1
				cp "$IMGPATH""_soundcloud" "$IMGPATH"
				imgsize=$(echo $(du -b ~/.config/eww/eww_covers/cover_art | tr '\t' '\n' | grep -v 'cover_art'))	
			# Youtube
			elif [[ "$coverurl" == *"ytimg"* ]]; then
				music_source='󰗃'
				curl --silent --output "$IMGPATH""_yt" "$coverurl_highres_yt" -q –read-timeout=0.1
				cp "$IMGPATH""_yt" "$IMGPATH"
				imgsize=$(echo $(du -b ~/.config/eww/eww_covers/cover_art | tr '\t' '\n' | grep -v 'cover_art'))
			# Likely YT Music
			elif [[ "$coverurl" == *"googleusercontent"* ]]; then
				music_source=''
				curl --silent --output "$IMGPATH""_other" "$coverurl" -q –read-timeout=0.1
				cp "$IMGPATH""_other" "$IMGPATH"
				imgsize=$(echo $(du -b ~/.config/eww/eww_covers/cover_art | tr '\t' '\n' | grep -v 'cover_art'))
			elif [[ "$coverurl" == *"spotify"* ]]; then
				music_source='󰓇'
				curl --silent --output "$IMGPATH""_other" "$coverurl" -q –read-timeout=0.1
				cp "$IMGPATH""_other" "$IMGPATH"
				imgsize=$(echo $(du -b ~/.config/eww/eww_covers/cover_art | tr '\t' '\n' | grep -v 'cover_art'))
			# Any other
			else
				curl --silent --output "$IMGPATH""_other" "$coverurl" -q –read-timeout=0.1
				cp "$IMGPATH""_other" "$IMGPATH"
				imgsize=$(echo $(du -b ~/.config/eww/eww_covers/cover_art | tr '\t' '\n' | grep -v 'cover_art'))
			fi
			# Fallback
			if [ "$imgsize" == "0" ] || [ ! "$(diff ~/.config/eww/eww_covers/cover_art ~/.config/eww/eww_covers/cover_art_error)" ]; then
				curl --silent --output "$IMGPATH""_lowres" "$coverurl" -q –read-timeout=0.1
				cp "$IMGPATH""_lowres" "$IMGPATH"
			fi

			cd ..
			cd "eww_covers"
		elif [ "$COVER_URL" = "" ]; then
		    echo '{"image": "", "color": "$bg"}'
		else
			music_source='󱛟'
			cp "$COVER_URL"  "$IMGPATH"
			
			cd ..
			cd "eww_covers"
		fi
	done
}

get_cover