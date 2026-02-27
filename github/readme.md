### Git hub parte 2

mirar la rama de a la cual le realice el cambio o solo mirar la rama ````git hub git log --oneline ````


cambiar un comentario de git hub de una rama ````bash git commit  --amend -m "Tercer commit git hub Error " ````
````bash
$ git log --oneline
$ git commit index.html --amend -m "primer archivo index"
$ git commit  --amend -m "Tercer commit git hub Error"
````


eliminaciones se utiliza para eliminar una rama ```gihub git branch -b nombre-de-la-rama ```

cambiar mensaje de un commit se utiliza ```gihub git commit archivo --amend -m "nuevo mensaje" ```

git clean el comando actua en rchivos sin seguimiento, este tipo de archivos son aquellos que se enuentran en el directorio de trabajo, pero que aun no se han añadido al indeci de seguiemiento de repositorio con el comando ```add.``` 

## Fork

Fork en git Hub El fork es una de las opertivas comunes con el trabajo en git y gitHub Basicamente sirve para Crear Una copia de un Repositorio en tu cuenta de Usuario. 

* Para que sirve?

Un fork es una copia de un repositorio, pero ¿por qué no clonamos el repositorio que queremos copiar y listo 

si haces un clone normal de un repositorio, el espacio en GitHub de ese clon asociado al repositorio que has clonado. probablemente no los podras subir.

Obviamente, si clonas un repositorio que era tuyo, podras realizar cambios en local y subirlos a Github siempre que quieras


* Conclusion 


Los fork nos sirve para tomar un repositorio creado por otro usuario que tanga un repositorio publico porder hacer un "clonar" ese repositorio lo que diferencia un fork y clone es que el fork nos crea un repositorio dentro de nuestro repositorio de ese ropositorio ya creado para ahora si poder realizar cambios o bajarlo con el ````clone```` 


### Creación y Resolución de Conflictos en Git

## ¿Cómo crear un conflicto en Git?

Crear un conflicto en Git es un proceso sencillo. Un conflicto ocurre cuando dos ramas modifican la misma parte de un archivo y Git no puede determinar automáticamente cuál versión debe mantenerse.

### Pasos para generar un conflicto

1. Nos ubicamos en la rama principal:

```bash
git switch main

````

Realizamos un cambio en un archivo (puede ser de texto o diseño).

Guardamos los cambios y realizamos un commit:

````bash
git add .
git commit -m "Cambio realizado en main"
````
Creamos y cambiamos a una nueva rama:

````bash
git switch -c nombre-rama
````
En esta nueva rama, modificamos la misma parte del archivo que fue editada en main.

Guardamos los cambios y realizamos otro commit:

````bash
git add .
git commit -m "Cambio realizado en nombre-rama"
````
Finalmente, intentamos fusionar las ramas:

````bash
git switch main
git merge nombre-rama
````
¿Qué sucede después?

Si ambas ramas modificaron la misma línea o sección del archivo, Git generará un conflicto.

En editores como Visual Studio Code, se mostrará una interfaz que permite:

✅ Aceptar los cambios actuales.

✅ Aceptar los cambios entrantes.

✅ Aceptar ambos cambios.

Editar manualmente el contenido para resolver el conflicto.

Una vez resuelto el conflicto, debemos:

````bash
git add .
git commit -m "Conflicto resuelto" 
````

