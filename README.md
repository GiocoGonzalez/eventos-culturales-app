# 📱 Eventos Culturales App

Aplicación móvil multiplataforma (Flutter) y backend en Java Spring Boot para consultar, filtrar y gestionar eventos culturales gratuitos en distintas ciudades.

---

## 🚀 Tecnologías utilizadas

- *Frontend*: Flutter (Dart)
- *Backend*: Java 17 + Spring Boot
- *Base de datos*: MySQL (con Docker)
- *Comunicación*: API RESTful
- *Herramientas extra*: Docker Desktop, Postman

---

## 🎯 Funcionalidades principales

- Listar eventos culturales gratuitos.
- Filtrar eventos por ciudad o categoría.
- Crear nuevos eventos desde la app.
- Marcar eventos como favoritos (fase futura).
- Sistema de registro/login (fase futura).
- Responsive para Android y Web (opcional).

---

## 🧩 Arquitectura del proyecto

### Backend (Spring Boot + MySQL)

- GET /api/eventos/traer: Obtener lista completa de eventos.
- GET /api/eventos/traer?ciudad=Madrid: Obtener eventos filtrados por ciudad.
- POST /api/eventos: Crear un nuevo evento.

> Entidades actuales: *Evento* (id, título, ciudad, categoría).

---

### Frontend (Flutter)

- Página de inicio con todos los eventos.
- Filtro por ciudad para buscar eventos específicos.
- Detalle de cada evento.
- Crear nuevos eventos desde la app.

---

## 📦 Estado actual del proyecto

| Tarea | Estado |
|:------|:-------|
| Backend corriendo en Docker | ✅ |
| API funcional y probada | ✅ |
| App Flutter funcionando | ✅ |
| Conexión Flutter → API Spring Boot | ✅ |
| Filtrado de eventos por ciudad | ✅ |
| Funcionalidades extra (favoritos, login, etc.) | 🔜 Próximamente |

---

## 🚦 Cómo ejecutar el proyecto

1. *Backend*:
   - Tener Docker y MySQL corriendo en localhost:3307.
   - Arrancar el backend desde Spring Boot.
   - API disponible en http://localhost:8080/api/eventos/traer.

2. *Frontend (Flutter)*:
   - Ejecutar flutter pub get.
   - Correr la app con flutter run.

---

## ✨ Próximas mejoras

- Gestión de usuarios (login/registro).
- Marcar eventos como favoritos.
- Enviar notificaciones push.
- Mejoras visuales (estilos Material Design más avanzados).

---

## 👨‍💻 Autor

- Gioconda González ([@GiocoGonzalez](https://github.com/GiocoGonzalez))

---
