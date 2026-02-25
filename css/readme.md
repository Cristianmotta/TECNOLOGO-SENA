
# 📘 CSS — Documentación Completa y Profesional

## Tabla de Contenidos

1. Introducción
2. Sintaxis
3. Formas de Aplicar CSS
4. Selectores
5. Especificidad y Cascada
6. Modelo de Caja (Box Model)
7. Propiedades Fundamentales
8. Colores y Unidades
9. Tipografía
10. Fondos y Bordes
11. Display y Posicionamiento
12. Flexbox
13. CSS Grid
14. Responsive Design
15. Pseudo-clases y Pseudo-elementos
16. Transiciones y Animaciones
17. Variables (Custom Properties)
18. Buenas Prácticas
19. Conclusión

---

## 1. Introducción

 CSS (Cascading Style Sheets) es el lenguaje utilizado para definir la presentación visual de documentos HTML.

Permite:
- Separar estructura de diseño
- Mejorar mantenibilidad
- Crear diseños modernos y responsivos

---

##  2. Sintaxis

```css
    selector {
        propiedad: valor;
    }

```

* Ejemplo:

```css
    p {
    color: blue;
    font-size: 16px;
    }
```

## 3. Formas de Aplicar CSS
* 3.1 En línea

````html
<p style="color:red;">Texto</p>

````
* 3.2 Interno

```html  
<style>
 p { color: blue; }
</style>
```

* 3.3 Externo (Recomendado)

````html
<link rel="stylesheet" href="styles.css">
````

## 4. Selectores

* 4.1 Selector de elemento
````css
    p { color: black; }
````

* 4.2 Clase

````css
    .contenedor { margin: 10px; }
````

* 4.3 ID

````css
    #principal { padding: 20px; }
````

* 4.4 Selectores combinados

````css
div p { color: red; }      /* descendiente */
div > p { color: blue; }   /* hijo directo */
````

## 5. Especificidad y Cascada

Orden de prioridad:

* Elemento

* Clase

* ID

* Inline

CSS sigue el principio de "última regla aplicada".

## 6. Modelo de Caja (Box Model)

Cada elemento está compuesto por:

* Content

* Padding

* Border

* Margin

````css
div {
  width: 200px;
  padding: 20px;
  border: 5px solid black;
  margin: 10px;
}

box-sizing
box-sizing: border-box;

````

## 7. Propiedades Fundamentales
* Margin
````css
margin: 10px;
````

* Padding
````css
padding: 20px;
````

*Border
````css
border: 2px solid black;

````

## 8. Colores y Unidades

* Colores

> Nombre: red

> Hexadecimal: #ff0000

> RGB: rgb(255,0,0)

> RGBA: rgba(255,0,0,0.5)

> HSL

> Unidades

> px

> %
 
> em

> rem

> vh

> vw

## 9. Tipografía
````css
p {
  font-family: Arial, sans-serif;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  line-height: 1.5;
}

````

## 10. Fondos y Bordes

````css
div {
  background-color: #f4f4f4;
  background-image: url("imagen.jpg");
  background-size: cover;
  border-radius: 10px;
}

````

## 11. Display y Posicionamiento
* Display
````css
    display: block;
    display: inline;
    display: inline-block;
    display: none;
````

* Position

````css
    position: static;
    position: relative;
    position: absolute;
    position: fixed;
    position: sticky;
````

## 12. Flexbox

* Sistema de diseño unidimensional.

````css
.contenedor {
  display: flex;
  justify-content: center;
  align-items: center;
}
````

* Propiedades principales:

> flex-direction

> justify-content

> align-items

> gap

## 13. CSS Grid

* Sistema de diseño bidimensional.

````css
.grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}
````

## 14. Responsive Design

* Uso de media queries.

````css
@media (max-width: 768px) {
  body {
    background-color: lightgray;
  }
}
````

## 15. Pseudo-clases y Pseudo-elementos

* Pseudo-clases

````css
    a:hover { color: red; }
    input:focus { border: 2px solid blue; }
    Pseudo-elementos
    p::first-letter { font-size: 2em; }
````

## 16. Transiciones y Animaciones

* Transiciones
````css
div {
  transition: all 0.3s ease;
}
````
* Animaciones
````css
@keyframes mover {
  from { transform: translateX(0); }
  to { transform: translateX(100px); }
}
````
## 17. Variables CSS
````css
:root {
  --color-principal: blue;
}

p {
  color: var(--color-principal);
}

````

## 18. Buenas Prácticas

> Usar archivos externos

> Mantener nombres descriptivos

> Evitar estilos inline

> Utilizar box-sizing: border-box

> Organizar el código por secciones

> Aplicar metodologías como BEM

## 19. Conclusión

* CSS es un lenguaje fundamental en el desarrollo web moderno.
Permite crear interfaces atractivas, funcionales y adaptables.

Dominar:

> Selectores

> Modelo de caja

> Especificidad

> Flexbox y Grid

> Responsive Design

Es esencial para convertirse en un desarrollador frontend profesional.

