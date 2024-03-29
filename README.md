Caso práctico 2: Automatización de despliegues en entornos Cloud

La rama para el desarrollo del código y las pruebas sera Develop
La rama donde se apliquen los cambios para llevarlos a producción sera la Master

El caso práctico 2 se enfoca en despliegues de aplicaciones sobre un
proveedor de Cloud mediante el uso de herramientas DevOps

Objetivos del Caso Práctico 2

• Crear infraestructura de forma automatizada en un proveedor de
  Cloud pública.
• Utilizar herramientas de gestión de la configuración para automatizar
  la instalación y configuración de servicios.
• Desplegar mediante un enfoque totalmente automatizado
  aplicaciones en forma de contenedor sobre el sistema operativo.
• Desplegar mediante un enfoque totalmente automatizado
  aplicaciones que hagan uso de almacenamiento persistente sobre
  una plataforma de orquestación de contenedores.

Planteamiento

Se debe crear la siguiente infraestructura de forma automática en
Azure utilizando Terraform:

• Un (1) repositorio de imágenes de contenedores sobre infraestructura de
  Microsoft Azure mediante el servicio Azure Container Registry (ACR).

• Una (1) máquina virtual con sistema operativo Linux.

• Un (1) cluster de Kubernetes como servicio gestionado en Microsoft Azure
  (AKS).

Planteamiento

Se debe realizar de forma automática mediante Ansible la instalación y
configuración de los siguientes elementos:

• Un (1) servidor Web desplegado en forma de contenedor de
  Podman sobre una máquina virtual en Azure.

• Una (1) aplicación con almacenamiento persistente sobre el
  cluster AKS.
