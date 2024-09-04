<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/user-attachments/assets/825259a5-6541-41a5-bca8-17c579a46380">
    <img src="https://github.com/user-attachments/assets/825259a5-6541-41a5-bca8-17c579a46380" alt="Logo" width="350" height="250" style="border-radius:15px;">
  </a>

  <h3 align="center"> Kanbanate IT · Online task manager </h3>

  <p align="center">
    Este proyecto es un sistema de gestión de tareas al estilo Kanban de forma online con sistema de cuentas y mensajes para los usuarios.
    <br />
    <!--<a href="https://br1-o.github.io/bakery-store"><strong> Ver sitio en producción »</strong></a> -->
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Tabla de contenido </summary>
  <ol>
    <li><a href="#about"> Sobre el proyecto</a></li>
    <li><a href="#develop-with">Desarrollado con</a></li>
    <li><a href="#project-structure">Estructura del proyecto </a></li>
    <!--
    <li><a href="#design">Diseño </a></li>
    <li><a href="#preview">Vista previa </a></li>
    <li><a href="#getting-started"> Cómo instalarlo</a></li>
    -->
  </ol>
</details>


<a id="about"></a>
<!-- ABOUT THE PROJECT -->
## Sobre este proyecto

Este proyecto se trata de un sistema de gestión de tareas al estilo Kanban, implementando un tablero de tareas común para los participantes del grupo, un sistema de mensajería, y un sistema de cuentas.<br><br>
En el tablero podrán asignarse nuevas tareas a los usuarios. Los usuarios podrán visualizar datos de la tarea y modificar su status en base al avance en la misma.
<br><br>
Originalmente se desarrolló este proyecto bajo el marco de un trabajo integrador para el curso de Desarrollador Fullstack, brindado por [CILSA](https://www.cilsa.org/).

<p align="right">(<a href="#readme-top">Volver al inicio</a>)</p>

<a id="develop-with"></a>
## Desarrollado con:

Para este proyecto se usaron las siguientes técnologias<!--, lenguajes y librerias:-->.

#### Desarrollo en general:

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL_Workbench-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Lucip.app](https://img.shields.io/badge/Lucip.app-FFAB00?style=for-the-badge&logo=data:image/svg+xml;base64,<BASE64_ENCODED_LOGO_HERE>&logoColor=white)

<!--#### Desarrollo en general:

* [![JavaScript][JavaScript.com]][JavaScript-url]
* [![CSS][CSS.com]][CSS-url]
* [![HTML][HTML.com]][HTML-url]
* [![Bootstrap][Bootstrap.com]][Bootstrap-url]

#### Librerias para funcionalidades:

[![AOS][AOS.com]][AOS-url]
[![SweetAlert][SweetAlert.com]][SweetAlert-url]
-->

#### Control de versionado: 
<!--y deploy de demo:-->

[![GitHub][GitHub.com]][GitHub-url]
[![Git][Git.com]][Git-url]
<!--
[![GitHub Pages][GitHubPages.com]][GitHubPages-url]
-->

#### Personalmente se optó para el desarrollo de este proyecto el uso de:

[![VSCode][VSCode.com]][VSCode-url]
<!-- [![LiveServer][LiveServer.com]][LiveServer-url] -->

<p align="right">(<a href="#readme-top">Volver al inicio</a>)</p>

<a id="project-structure"></a>
## Estructura de la base de datos

La estructura de la base de datos para el proyecto está organizada de la siguiente manera:

![DB_Kanban](https://github.com/user-attachments/assets/eddc9555-ab9f-497e-9324-99a7f53af68b)

  **Tablas de entidades:**
- Areas
- Tasks
- Groups
- Employees
- Users
- Messages

  **Tablas de relaciones:**
- rel_Areas_Tasks
- rel_Groups_Tasks
- rel_Groups_Employees
- rel_Users_Tasks
- rel_Users_Actions

  **Tablas de estatus, tipos de relaciones y acciones:**
- Status_area
- Status_task
- Status_group
- Status_employee
- Relation_types
- Actions

<!--
```plaintext

└── 
    └── 
        └── 
            ├── 
            |    └── 
            ├── 
            |      └── 
            ├── 
            |  └── 
            |
            ├── 
            └── 
```
-->

<p align="right">(<a href="#readme-top">Volver al inicio</a>)</p>

<!--
<a id="design"></a>
## Diseño

## Paleta de colores

La paleta de colores usada para este proyecto fue:

![Main Color](https://img.shields.io/badge/Main%20Color-rgb(0%2C%200%2C%200)-black) <br>
![Secondary Color](https://img.shields.io/badge/Secondary%20Color-rgb(67%2C%2075%2C%2082)-darkgrey) <br>
![Font Primary Color](https://img.shields.io/badge/Font%20Primary%20Color-rgb(237%2C%20236%2C%20238)-lightgrey) <br>
![Font Secondary Color](https://img.shields.io/badge/Font%20Secondary%20Color-rgb(81%2C%2080%2C%2080)-grey) <br>
![Footer Background Color](https://img.shields.io/badge/Footer%20Background%20Color-rgb(17%2C%2017%2C%2017)-black) <br>

## Font

El font usado para este proyecto fue: 
* ![Font: Josefin Sans](https://img.shields.io/badge/Font-Josefin%20Sans-blue)

## Logotipo

El logo fue creado usando las herramientas de generación de imagenes de ![Gemini](https://img.shields.io/badge/Gemini-purple)

<a id="preview"></a>
## Vista previa

#### Pagina Principal (path: '/')

<a href="https://github.com/user-attachments/assets/60427fe9-9a30-4a34-8dad-bd6b9ce6b439" target="_blank">
  <img src="https://github.com/user-attachments/assets/60427fe9-9a30-4a34-8dad-bd6b9ce6b439" alt="documentation-main1" width="800"/>
</a>
<a href="https://github.com/user-attachments/assets/9d748898-bf71-4f81-aabf-661218c24f29" target="_blank">
  <img src="https://github.com/user-attachments/assets/9d748898-bf71-4f81-aabf-661218c24f29" alt="documentation-main2" width="800"/>
</a>

#### Tienda (path: '/#tienda')

<a href="https://github.com/user-attachments/assets/e15435fc-9514-49d5-b75f-a07d16e287f4" target="_blank">
  <img src="https://github.com/user-attachments/assets/e15435fc-9514-49d5-b75f-a07d16e287f4" alt="documentation-shop1" width="800"/>
</a>
<a href="https://github.com/user-attachments/assets/26a1b725-3d66-4b36-8d92-c443ba03805e" target="_blank">
  <img src="https://github.com/user-attachments/assets/26a1b725-3d66-4b36-8d92-c443ba03805e" alt="documentation-shop3" width="800"/>
</a>

#### Producto (path: '/#tienda/[categoria]/[nombre-del-producto]')

<a href="https://github.com/user-attachments/assets/167787e9-65dc-4f9e-9182-917a361a346e" target="_blank">
  <img src="https://github.com/user-attachments/assets/167787e9-65dc-4f9e-9182-917a361a346e" alt="documentation-producto1" width="800"/>
</a>
<a href="https://github.com/user-attachments/assets/43a9ccf5-4f4b-44f1-86c7-640481555d54" target="_blank">
  <img src="https://github.com/user-attachments/assets/43a9ccf5-4f4b-44f1-86c7-640481555d54" alt="documentation-producto2" width="800"/>
</a>

#### Contacto (path: '/#contacto')

<a href="https://github.com/user-attachments/assets/c1357b49-cb57-4be3-a15d-f7350ce04192" target="_blank">
  <img src="https://github.com/user-attachments/assets/c1357b49-cb57-4be3-a15d-f7350ce04192" alt="documentation-contact1" width="800"/>
</a>
<a href="https://github.com/user-attachments/assets/5299db71-c33f-4387-8c81-1558b19dbcf4" target="_blank">
  <img src="https://github.com/user-attachments/assets/5299db71-c33f-4387-8c81-1558b19dbcf4" alt="documentation-contact2" width="800"/>
</a>

#### No encontrado (path: '/[no-válido]')

<a href="https://github.com/user-attachments/assets/5f35193f-e7e0-4a9d-beb1-2af650cdef21" target="_blank">
  <img src="https://github.com/user-attachments/assets/5f35193f-e7e0-4a9d-beb1-2af650cdef21" alt="documentation-notFound" width="800"/>
</a>

<a id="getting-started"></a>
-->

<!-- GETTING STARTED -->
<!--
## Cómo comenzar a utilizarlo

Si se desea, se puede descargar este proyecto y usarlo de forma local siguiendo los siguientes pasos:

### Pre requisitos

No se requiere tener ningún tipo de software especial instalado, bastando con un simple navegador web. 
<br>
Aunque sí se recomienda el uso de algún IDE, programa especializado para facilitar el desarrollo y visualización de código.
<br>

### Instalación

A continuación se muestran los pasos a seguir para instalar este proyecto.

#### Usando Git

> 1. Navegar al directorio donde deseas instalar el proyecto
   ```sh
   cd /ruta/donde/deseas/instalar
   ```

> 2. Clonar el repositorio
   ```sh
   git clone https://github.com/Br1-O/bakery-store
   ```

 > 3. Navegar al directorio del proyecto
   ```sh
  cd bakery-store
   ```

> 4. Abrir el archivo index.html en tu navegador web preferido

#### Descarga manual desde Github

> 1. Descargar el archivo .zip desde GitHub: [Link de descarga](https://github.com/Br1-O/bakery-store/archive/refs/heads/main.zip)

> 2. Descomprimir el archivo .zip
   ```sh
   unzip bakery-store-main.zip
   ```

 > 3. Navegar al directorio donde fue descomprimido
   ```sh
  cd bakery-store-main
   ```
> 4. Abrir el archivo index.html en tu navegador web preferido

<p align="right">(<a href="#readme-top">Volver al inicio</a>)</p>

-->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png

[JavaScript.com]: https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=white&style=for-the-badge
[JavaScript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript

[CSS.com]: https://img.shields.io/badge/CSS-1572B6?logo=css3&logoColor=white&style=for-the-badge
[CSS-url]: https://developer.mozilla.org/en-US/docs/Web/CSS

[HTML.com]: https://img.shields.io/badge/HTML-E34F26?logo=html5&logoColor=white&style=for-the-badge
[HTML-url]: https://developer.mozilla.org/en-US/docs/Web/HTML

[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?logo=bootstrap&logoColor=white&style=for-the-badge
[Bootstrap-url]: https://getbootstrap.com

[AOS.com]: https://img.shields.io/badge/AOS-000000?logo=aos&logoColor=white&style=for-the-badge
[AOS-url]: https://michalsnik.github.io/aos/

[SweetAlert.com]: https://img.shields.io/badge/SweetAlert-0078D7?logo=sweetalert&logoColor=white&style=for-the-badge
[SweetAlert-url]: https://sweetalert.js.org/

[GitHub.com]: https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white&style=for-the-badge
[GitHub-url]: https://github.com/

[Git.com]: https://img.shields.io/badge/Git-F05032?logo=git&logoColor=white&style=for-the-badge
[Git-url]: https://git-scm.com/

[GitHubPages.com]: https://img.shields.io/badge/GitHub_Pages-222?logo=github&logoColor=white&style=for-the-badge
[GitHubPages-url]: https://pages.github.com/

[VSCode.com]: https://img.shields.io/badge/VSCode-007ACC?logo=visual-studio-code&logoColor=white&style=for-the-badge
[VSCode-url]: https://code.visualstudio.com/

[LiveServer.com]: https://img.shields.io/badge/LiveServer-4993CD?logo=visual-studio-code&logoColor=white&style=for-the-badge
[LiveServer-url]: https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer
