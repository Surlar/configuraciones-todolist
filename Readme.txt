# Gestor de Tareas (TO DO LIST APP)

Una aplicación web para gestionar tareas personales. Permite crear, editar, eliminar y finalizar tareas de forma rápida y visualmente atractiva.

---

## Requisitos para levantar el proyecto localmente

	### Backend
		- Java 21
		- PostgreSQL 17 (con una base de datos configurada para el proyecto)
		- Spring Boot 3.3.10
		- Maven 3.9.9

	### Frontend
		- Node.js 20.9.0
		- Angular CLI 17+

---

## Detalle de Tecnologías Usadas

	### Backend
		- **Java 21**
		- **Spring Boot 3.3.10**
		- Arquitectura basada en **microservicios**
		- Exposición de APIs RESTful
		- Conexión a base de datos **PostgreSQL 17**
		- Manejo de peticiones asíncronas y control de errores
		- integración con herramientas de seguridad (JWT, OAuth2)

	### Frontend
		- **Angular 17**
		- **Node.js 20.9.0**
		- Angular Material y Bootstrap para UI y experiencia de usuario
		- Observables (RxJS) para manejo reactivo de datos
		- Formularios reactivos, validaciones y manejo de errores
		- Responsive Design

	### Base de datos
		- **PostgreSQL 17**
		- Esquema relacional con entidades de tareas
		- Nomarlizacion de base de datos
		- Conexión a través de JPA/Hibernate (Spring Data)

---

## Arquitectura general
	- Microservicios backend
	- APIs RESTful consumidas desde Angular
	- Persistencia de datos en **PostgreSQL 17**
	- Separación clara entre lógica de negocio (backend) y presentación (frontend)
	- Buenas prácticas de experiencia de usuario: validación de formularios, carga asíncrona con spinners, mensajes de confirmación

---

## Características
	- Crear usurios nuevo
	- Validar autenticacion de usuarios
	- Crear nuevas tareas
	- Editar tareas existentes
	- Eliminar tareas con confirmación
	- Finalizar tareas
	- Filtrar tareas por estado (pendientes o finalizadas)
	- Interfaz responsive

---

## Instalación

1. repositorio GIT:
	### URL BACKEND
		https://github.com/Surlar/to-do-list-app-backend

	### URL FRONTEND
		https://github.com/Surlar/to-do-list-app-frontend

	### URL SCRIPTS BASE DE DATOS
		https://github.com/Surlar/configuraciones-todolist/blob/main/DDL_DCL_DML.sql

	## URL README
		https://github.com/Surlar/configuraciones-todolist/blob/main/Readme.txt


2. clone proyect.
git clone https://github.com/Surlar/to-do-list-app-backend.git
git clone https://github.com/Surlar/to-do-list-app-frontend.git
