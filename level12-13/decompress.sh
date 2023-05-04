#!/bin/bash
INPUT=$(xxd -r $1 | tr -d '\0')


DECOMPRESS="$(touch XXXX | echo XXXX)"
echo "$INPUT" > "$DECOMPRESS"
while [[ $(file "$DECOMPRESS" | grep ASCII; echo -n $?) ]]; do
	COMMAND="gzip -d -c -f"	
	if [[ $(file "$DECOMPRESS" | grep "gzip"; echo -n $?) == "0" ]]; then
		COMMAND="gzip -d -c -f"	
	fi
	
	if [[ $(file "$DECOMPRESS" | grep "bzip2"; echo -n $?) == "0" ]]; then
		COMMAND="bzip2 -d -c -f"	
	fi
	
	if [[ $(file "$DECOMPRESS" | grep "tar"; echo -n $?) == "0" ]]; then 
		COMMAND="tar -xf"	
	fi

	#gzip
	#tar
	#bzip2
	echo $(file "$DECOMPRESS")
	echo $(file "$DECOMPRESS" | grep "gzip"; echo -n $?) 
	echo $(file "$DECOMPRESS" | grep "bzip2"; echo -n $?)

	echo command is $COMMAND
	
	commando="$COMMAND $DECOMPRESS > $DECOMPRESS"
	
	sleep 3
	eval "$commando"
done

cat "$DECOMPRESS"

