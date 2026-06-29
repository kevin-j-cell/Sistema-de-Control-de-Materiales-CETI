# Sistema de Control de Inventario y Préstamo de Materiales

## Descripción del proyecto

Este proyecto consiste en el desarrollo de un sistema web para la administración de inventario y préstamos de materiales de un laboratorio. El sistema fue desarrollado bajo una arquitectura Cliente-Servidor, donde un frontend construido con Vue.js consume una API REST desarrollada con Node.js y Express, utilizando PostgreSQL como gestor de base de datos.

El objetivo principal es facilitar el registro y administración de usuarios, materiales y préstamos mediante una interfaz sencilla e intuitiva.

> **Nota:** Debido al tiempo disponible para el desarrollo del proyecto, algunas funcionalidades quedaron pendientes de implementación. Actualmente el sistema cumple con las operaciones CRUD principales de usuarios, materiales y préstamos. Las funcionalidades relacionadas con el detalle de los préstamos y el cambio de estado a "Entregado" fueron contempladas en el diseño, pero quedaron como trabajo futuro y pueden implementarse sin modificar la arquitectura existente.

---
# Video de Video de Demostración y Explicación
https://drive.google.com/file/d/1MU2Jkp2UHP4AQse9j5Q_h12HYj3A-TVj/view?usp=sharing

# Funcionalidades implementadas

Actualmente el sistema permite:

* Inicio de sesión de usuarios.
* CRUD completo de usuarios.
* CRUD completo de materiales.
* CRUD completo de préstamos.
* Comunicación entre frontend y backend mediante API REST.

## Funcionalidades pendientes

Las siguientes características quedaron planeadas para una versión futura:

* CRUD de detalles de préstamo.
* Asociación de múltiples materiales a un préstamo mediante el detalle.
* Marcar un préstamo como entregado.
* Actualización automática del inventario al entregar materiales.
* Consulta detallada de los materiales incluidos en cada préstamo.

La estructura de la base de datos y la arquitectura del sistema permiten agregar estas funcionalidades posteriormente sin afectar el funcionamiento actual.

---

# Arquitectura del proyecto

El sistema está dividido en dos componentes principales.

## Frontend

Desarrollado con **Vue.js**, encargado de proporcionar la interfaz gráfica para el usuario.

Funciones principales:

* Inicio de sesión.
* Administración de usuarios.
* Administración de materiales.
* Administración de préstamos.

El frontend consume la API REST mediante peticiones HTTP.

---

## Backend

Desarrollado con **Node.js** y **Express.js**.

Responsabilidades:

* Procesamiento de la lógica del sistema.
* Validación de datos.
* Conexión con PostgreSQL.
* Operaciones CRUD.
* Autenticación de usuarios.

Las respuestas del servidor son enviadas en formato JSON.

---

# Tecnologías utilizadas

| Tecnología |
| ---------- | 
| Node.js    | 
| Vue.js     | 
| Vite       | 
| PostgreSQL | 
| pg         | 
| cors       | 
| dotenv     | 
| Nodemon    | 

---

# Estructura del proyecto

```text
Proyecto/
│
├── backend/
│   ├── controllers/
│   ├── routes/
│   ├── models/
│   ├── config/
│   ├── server.js
│   └── package.json
│
├── frontend/
│   ├── src/
│   │   ├── services/
│   │   ├── router/
│   │   ├── views/
│   │   ├── components/
│   │   └── App.vue
│   ├── package.json
│   └── vite.config.js
│
└── README.md
```

---

# INSTALACION

## 1. Clonar el repositorio

```bash
git clone <https://github.com/kevin-j-cell/Sistema-de-Control-de-Materiales-CETI>
```
## 2.Instalación la base de datos

Crear una base de datos vacía en su Postgres (ej. CREATE DATABASE mi_proyecto;).

Importar el archivo ejecutando:

```bash
psql -U usuario_profe -d mi_proyecto -f database/estructura_y_datos.sql
```

## 3. Instalar dependencias del Backend

```bash
cd backend
npm install
```

## 4. Configurar variables de entorno

Crear un archivo `.env`:

```env
DB_HOST=localhost
DB_PORT=5432
DB_USER=SU_USUARIO
DB_PASSWORD=SU_CONTRASENIA
DB_NAME=NAME DE LA BASE DONDE IMPORTO (por ejemplo mi_proyecto)
PORT=3000
```

## 5. Ejecutar el Backend

```bash
npm run dev
```

Servidor:

```
http://localhost:3000
```

## 6. Instalar dependencias del Frontend

```bash
cd frontend
npm install
```

## 7. Ejecutar el Frontend

```bash
npm run dev
```

Aplicación:

```
http://localhost:5173
```

---

# Endpoints principales de la API

## Login

| Método | Endpoint     |
| ------ | ------------ |
| POST   | `/api/login` |

---

## Usuarios

| Método | Endpoint            |
| ------ | ------------------- |
| GET    | `/api/usuarios`     |
| GET    | `/api/usuarios/:id` |
| POST   | `/api/usuarios`     |
| PUT    | `/api/usuarios/:id` |
| DELETE | `/api/usuarios/:id` |

---

## Materiales

| Método | Endpoint              |
| ------ | --------------------- |
| GET    | `/api/materiales`     |
| GET    | `/api/materiales/:id` |
| POST   | `/api/materiales`     |
| PUT    | `/api/materiales/:id` |
| DELETE | `/api/materiales/:id` |

---

## Préstamos

| Método | Endpoint             |
| ------ | -------------------- |
| GET    | `/api/prestamos`     |
| GET    | `/api/prestamos/:id` |
| POST   | `/api/prestamos`     |
| PUT    | `/api/prestamos/:id` |
| DELETE | `/api/prestamos/:id` |

> **Importante:** Los endpoints correspondientes al detalle de préstamos y al cambio de estado a **Entregado** no fueron implementados en esta versión debido al tiempo disponible para el desarrollo. Sin embargo, fueron considerados desde el diseño inicial y pueden añadirse en futuras versiones.

---

# Base de datos

El sistema utiliza PostgreSQL como gestor de base de datos.

Las tablas implementadas son:

* `usuarios`
* `materiales`
* `prestamos`

La tabla `detalle_prestamo` fue contemplada dentro del diseño de la base de datos para futuras ampliaciones del sistema.

---

# Trabajo futuro

Como mejora del proyecto se propone implementar:

* CRUD de detalles de préstamo.
* Asociación de múltiples materiales por préstamo.
* Marcar préstamos como entregados.
* Descuento y devolución automática del inventario.
* Historial completo de movimientos de materiales.
* Validaciones adicionales y mejoras en la interfaz.

Estas funcionalidades pueden integrarse aprovechando la arquitectura actual sin realizar cambios significativos en el resto del sistema.

---

# Autor
Pérez Espina Kevin Emanuel
Proyecto desarrollado como parte de la materia de Tecnologías Web con fines académicos.
