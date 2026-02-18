## Apuntes HTML 

### Que es un form:

>El elemento HTML form (```<form>```) representa una sección de un documento que contiene controles interactivos que permiten a un usuario enviar información a un servidor web.

### Que es un Input: 

> El elemento HTML ```<input>``` se usa para crear controles interactivos para formularios basados en la web con el fin de recibir datos del usuario.Hay disponible una amplia variedad de tipos de datos de entrada y widgets de control, que dependen del dispositivo y el agente de usuario (user agent).El elemento ```<input>``` es uno de los más potentes y complejos en todo HTML debido a la gran cantidad de combinaciones de tipos y atributos de entrada.

### Que es un label: 

> La etiqueta ```<label>``` en HTML define un título o descripción para un elemento de formulario (como ```<input>, <textarea>``` o ```<select>```), mejorando la accesibilidad y la usabilidad. Permite vincular texto con campos específicos, lo que hace que al hacer clic en el texto, el campo se seleccione automáticamente. 

#### Tipos de metodos en HTML

* El method post: es para enviar los datos a nuestra url 

* El method get: que seria para resiverlos 

### Para nuestra clase vimos 

> Como realizar una formularios en html con inputs y labels que es necesarios 

```html 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="get">
        <p>
            Nombre: <input type="text" name="name_control" required />
        </p>      
        <p>
            Correo: <input type="email" name="email_control" autofocus required />
        </p>
        <p>
            URL <input type="url" name="url_control" placeholder="Escribe laURL de tu página web personal" />
        </p>
        <p>
            Fecha: <input type="date" name="date_control" />
        </p>
        <p>
            Tiempo: <input type="time" name="time_control" />
        </p>
        <p>
            Fecha y hora: <input type="datetime-local" name="datetime_control" />
        </p>
        <p>
            Mes: <input type="month" name="month_control" />
        </p>
        <p>
            Semana: <input type="week" name="week_control" />
        </p>
        <p>
            Número (min -10, max 10): <input type="number" name="number_control" min="-10" max="10" value="0" />
        </p>
        <p>
            Color favorito: <input type="color" name="color_control" />
        </p>
        <p>
            <input type="submit" value="Enviar" />
        </p>
    </form>
</body>
</html>
```

