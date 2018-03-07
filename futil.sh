#!/bin/bash

chkInt='^[0-9]+$'

if [[ $1 == "biggest-files" ]]; then
	if [[ -d $3 ]]; then
		if [[ $2 =~ $chkInt ]]; then
			echo -e "Rank\tSize\t        Path"
			find $3 -type f -printf "%s\t%p\n" | sort -rn | awk '{ printf "%7.2f %s\t%s\n",$1/(1024^2),"MB",$2; }'| head -$2 | nl --number-format=rz --number-width=1
		else
			echo "Error: value for number of files is not a valid integer" 2>/dev/null; exit 1
		fi
	else
	    echo "$3 is not a valid directory"
	    exit 1
	fi

elif [[ $1 == "sbe" ]]; then
	if [[ -d $2 ]]; then
		if [[ -d $3 ]]; then
			src=${2%/}
			dst=${3%/}
			for file in $src/*.*[!.]; do
				if [ -L $file ]; then
					continue;
				fi

				ext=${file##*.}
				if [[ $ext == "desktop" ]]; then
					continue;
				fi

				if ! [[ -d "$dst/$ext" ]]; then
					mkdir -p -- "$dst/$ext"
				fi

				mv -- "$file" "$dst/$ext"
			done
		else
			echo "$3 is not a valid directory"
			exit 1
		fi
	else
		echo "$2 is not a valid directory"
	fi
fi