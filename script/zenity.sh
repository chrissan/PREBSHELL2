#!/bin/bash
#interfaces con zenity

mpg123=$(apt list --installed | grep "mpg123");

if [[ $mpg123 == NULL ]]; then
	echo Instalando mpg123...
	echo
	echo Espere un momento...
	$(sudo apt-get install -y $mpg123)
	echo Instalado con exito
	echo
	echo Bienvenido
fi


while [[ opc != 0 ]]
clear
do

opc=$(zenity --width=500 --height=250 --title=PREBEPLAYER --entry --text=" Introduce una opción
	1) Reproducir Musica en otra carpeta
	2) Reproducir musica en carpeta actual
	3)Controles
	0) Salir "
	)
case $opc in
	"1")
			carpeta=$(zenity --entry --text "Ingresa la ruta de tu carpeta")
			cd $carpeta;
			(
			mpg123 -vC *.mp3
			)|
			$(zenity --width=500 --height=250 --title=PREBEPLAYER --text=" Para salir ingrese 'q' para pausar ingrese 's'")
			
				;;
	"2")
		(
		mpg123 -vzC *.mp3
		)|
		zenity --progress --auto-close --list --column "Controles"
		"f. siguiente"
		;;

	"0")
		zenity --notification --text "Que tenga un buen dia"
			exit 0
		;;
esac
done
