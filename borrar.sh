#/!bin/bash
cd /home/
mkdir papelera
ls -lh
sleep 3
echo "introduce el nombre archivo a borrar"
read archivo
mv $archivo /home/papelera/
echo "se ha movido a la papelera de reciclaje"
