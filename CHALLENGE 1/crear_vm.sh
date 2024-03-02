#!/bin/bash

# Verificar que se hayan proporcionado todos los argumentos
if [ $# -ne 7 ]; then
    echo "Uso: $0 <nombre_vm> <tipo_sistema_operativo> <num_cpus> <memoria_gb> <vram_mb> <tamano_disco_gb> <nombre_controlador_sata>"
    exit 1
fi

# Extraer los argumentos
nombre_vm=$1
tipo_sistema_operativo=$2
num_cpus=$3
memoria_gb=$4
vram_mb=$5
tamano_disco_gb=$6
nombre_controlador_sata=$7

# Crear la máquina virtual
VBoxManage createvm --name "$nombre_vm" --ostype "$tipo_sistema_operativo" --register

# Configurar la cantidad de CPUs
VBoxManage modifyvm "$nombre_vm" --cpus "$num_cpus"

# Configurar la memoria RAM
VBoxManage modifyvm "$nombre_vm" --memory "$memoria_gb" --vram "$vram_mb"

# Crear y asociar un disco duro virtual
VBoxManage createhd --filename "$nombre_vm.vdi" --size "$tamano_disco_gb" --format VDI
VBoxManage storagectl "$nombre_vm" --name "SATAController" --add sata --controller IntelAhci
VBoxManage storageattach "$nombre_vm" --storagectl "SATAController" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"

# Crear y asociar un controlador IDE para CD/DVD
VBoxManage storagectl "$nombre_vm" --name "IDEController" --add ide

# Imprimir la configuración
echo "Configuración de la Máquina Virtual $nombre_vm:"
echo "  - Nombre: $nombre_vm"
echo "  - Tipo de Sistema Operativo: $tipo_sistema_operativo"
echo "  - Número de CPUs: $num_cpus"
echo "  - Memoria RAM: $memoria_gb GB"
echo "  - VRAM: $vram_mb MB"
echo "  - Tamaño del Disco Duro: $tamano_disco_gb GB"
echo "  - Controlador SATA: $nombre_controlador_sata"
echo "  - Controlador IDE: IDEController"
