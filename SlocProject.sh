#!/bin/bash
# ---------------------------------------------------------------------------
# Autoren:		Sandro Schmid, Daan de Dios
# Datum: 			2019-10-12
# Version:		1.3.0
# Sonstiges: 	Diese Script wurde in einer zweier Gruppe erstellt. (SS, DD)
# ---------------------------------------------------------------------------
# Typischer Aufruf des Scripts: 	./SlocProject.sh  /home/vmadmin/SlocOrder
# ---------------------------------------------------------------------------


# Prüfen ob einen einen Parameter angegebn wurde.
# Ja --> beginn des Scripts | Nein --> error Meldung!
# ----------------------------------------------------------
if [ "$#" -eq "1" ]

then
# ----------------------------------------------------------
# Pfade analysiren und lines of code entnehmen. (data)
# ----------------------------------------------------------
	DateiPfade[0]="$(find $1 -type f -name "*.c")" 
	DateiPfade[1]="$(find $1 -type f -name "*.cpp")"
	DateiPfade[2]="$(find $1 -type f -name "*.h")" 

	data=""

	for Dateien in "${DateiPfade[@]}"
	do
		if [ "$Dateien" != "" ]
		then
			data+="$(cat $Dateien)"
			data+="$(printf "\n\r")"
		fi
	done

# ----------------------------------------------------------
# Data analysieren
# ----------------------------------------------------------
	ohneSpace="$(echo "$data" | grep '.' | grep -v -P '^\s+$')"
	linienTotal="$(echo "$ohneSpace" | wc -l)"
	anzahlComments="$(echo "$ohneSpace" | grep -P '^ *//|^\t*//' | wc -l)"
	MultiLinesComments="$(echo "$ohneSpace" |  awk '/\/\*/,/\*\//')"
	anzahlMultiLinesComments="$(echo "$MultiLinesComments" | wc -l)"
# ----------------------------------------------------------

# ----------------------------------------------------------
# Output erstellen und ausgeben. (Total - Kommentare)
# ----------------------------------------------------------
	let "output = linienTotal - anzahlComments - anzahlMultiLinesComments"
	echo "Im Projekt wurden $output Source Lines of Code (SLOC) gezählt."
# ----------------------------------------------------------

else
# ----------------------------------------------------------
# Error Meldung wenn keine Parameter angegeben wurde!
# ----------------------------------------------------------
	echo "*************************************"
	echo "Es wurde keine Parameter mitgegeben!"
	echo "Bitte erneut starten mit einem Parameter!"
	echo "*************************************"
	echo
# ----------------------------------------------------------

# ende der IF ELSE Schleife!	
# ----------------------------------------------------------
fi
# ----------------------------------------------------------

# ende des Scripts !
# ----------------------------------------------------------
exit 0
# ----------------------------------------------------------