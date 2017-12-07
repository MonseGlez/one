#/!bin/bash
mkdir /home/papelera
cd /home/papelera
ls
sleep 2
echo "que archivo quieres recuperar?"
read archivo
mv $archivo /home
echo "se ha recuperado en la carpeta home"
