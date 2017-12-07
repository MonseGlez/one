opciones="Configurar Ejecutar Mostrar Salir"
#comprobamos si el archivo de configuración existe, si no, lo creamos.
if [ -s "datosred.txt" ] ; then 
    datosred="OK"
else    
    touch datosred.txt
    datosred="WRONG"
fi


#menú de selección.
echo opciones $opciones
select opt in $opciones ; do
#configurar la red.
if [ "$opt" = "Configurar" ] ; then
    echo -n "Nombre de dispositivo:"
    read disp
    echo -n "Dirección IP:"
    read ip
    echo -n "Mascara de subred:"
    read mask
    echo -n "Puerta de enlace:"
    read gateway
    echo -n "DNS:"
    read dns
    echo -e "Dispositivo:$disp\nIP:$ip\nMascara:$mask\nPuerta de Enlace:$gateway\nDNS:$dns" > datosred.txt
    datosred="OK"
fi

#ejecutar la configuración.
if [ "$opt" = "Ejecutar" ] ; then 
 #se recogen los datos del archivo de configuración.
 disp=$(grep Dis datosred.txt | cut -d: -f2)
 ip=$(grep IP datosred.txt | cut -d: -f2)
 mask=$(grep Mascara datosred.txt | cut -d: -f2)
 gateway=$(grep Puerta datosred.txt | cut -d: -f2)
 dns=$(grep DNS datosred.txt | cut -d: -f2)
 echo "$disp, $ip, $gateway, $dns" 
 #se aplica la configuración.
 ip addr "$disp" "$ip" netmask "$mask"
 route add -net 0.0.0.0 netmask 0.0.0.0 gw "$gateway"
 sudo echo "nameserver: $dns" > /etc/resolv.conf
 #se inicia el servicio de red
 service network restart

fi 

#mostrar la configuración.
if [ "$opt" = "Mostrar" ] ; then
    if [ "$datosred" = "OK" ] ; then
      cat datosred.txt
    else
      echo "El archivo de configuración esta vacio."
    fi
fi

#salir del script.
if [ "$opt" = "Salir" ] ; then 
  exit
fi
done

