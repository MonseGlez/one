#!/bin/bash
echo -n "SCRIPT PARA CREAR USUARIOS"
#if [ "id -u" != 0 ] ; then
#echo -e "\n"
#echo "Necesito tener permisos de root para ejecutar mis tareas,"
#exit 1
#fi
#echo -e "\n"
echo -e "\n"
echo "Ingrese el nombre del nuevo usuario: "
read nombre
if [ "$nombre" == "" ] ; then
clear
echo -e "\n"
echo "El nombre no puede estar vacío"
echo -e "\n"
exit 1
fi
echo -e "\n"
echo "Ingrese el home directoy (default /home/$nombre): "
read home
if [ "$home" == "" ] ; then
home="/home/$nombre"
fi
echo "Ingrese el grupo (default 1000): "
read grupo

if [ "$grupo" == "" ] ; then
grupo=1000
fi

echo "Ingrese el shell a utilizar (default /bin/bash): "
read shell
if [ "$shell" == "" ] ; then
shell="/bin/bash"
fi
clear
echo "Los datos ingresados son los siguientes:"
echo "****"
echo -e "\n"
echo "Nombre del usuario: $nombre"
echo "Shell por defecto : $shell"
echo "Directorio home: $home"
echo "Grupo del usuario: $grupo"
echo "-------------------------------------------"
echo "Si los datos son correctos pulse una tecla,"
echo "de lo contrario pulse Ctrl+C para cancelar"
read
useradd -d /home/$nombre -g $grupo -m -s $shell $nombre
if [ "$?" != 0 ] ; then
echo -e "\n"
echo "Ha ocurrido un error, asegurese de que los datos ingresados son correctos."
exit 1
fi
echo -e "\n"
echo "Ingrese una contraseña para $nombre"
passwd $nombre
echo -e "\n"
echo "El usuario '$nombre' fue creado satisfactoriamente"
