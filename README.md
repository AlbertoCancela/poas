# POAS

Módulo para la gestión de **POA's (Planes Operativos Anuales)** de la Universidad Hipócrates.  
El proyecto combina **PHP**, **MySQL**, **TailwindCSS** y **Docker** para ofrecer una aplicación modular, portable y fácil de desplegar.

---

## 📂 Estructura del Proyecto

```
poas/
├── db/                  # Scripts y recursos de base de datos
├── dist/                # Archivos compilados (Tailwind CSS, assets)
├── public/              # Archivos públicos y puntos de entrada
├── src/                 # Archivos fuente (Tailwind, JS, CSS)
├── test/                # Archivos de prueba
├── views/               # Vistas en PHP/HTML
├── BDSISCUH.sql         # Esquema principal de la base de datos
├── BDSISCUH_backup.sql  # Respaldo de la base de datos
├── Dockerfile           # Definición de la imagen Docker
├── docker-compose.yml   # Configuración multi-contenedor
├── tailwind.config.js   # Configuración de TailwindCSS
└── package.json         # Dependencias y scripts del proyecto
```

---

## 🛠️ Tecnologías Utilizadas

- **PHP** → Backend y vistas dinámicas  
- **JavaScript** → Lógica del frontend  
- **TailwindCSS** → Estilos de la interfaz  
- **Docker & Docker Compose** → Entorno de despliegue y portabilidad  
- **MySQL** → Base de datos relacional  

---

## 🚀 Instalación y Configuración

```bash
# Clonar el repositorio
git clone https://github.com/AlbertoCancela/poas.git
cd poas

# Instalar dependencias
npm install

# Compilar Tailwind
npx tailwindcss -i ./src/input.css -o ./dist/output.css --watch

# Levantar el entorno con Docker
docker-compose up --build
```

---

## 📖 Uso

1. Acceder a la aplicación desde el entrypoint definido en la carpeta `public/`.
2. Importar el esquema de base de datos:

```bash
mysql -u usuario -p nombre_bd < BDSISCUH.sql
```

(De forma opcional también se puede usar `BDSISCUH_backup.sql` como respaldo).

3. Ejecutar la aplicación y probar las vistas ubicadas en `views/`.

---

## 📦 Scripts Disponibles

```bash
# Compilar CSS
npm run build

# Ejecutar Tailwind en modo observador
npx tailwindcss -i ./src/input.css -o ./dist/output.css --watch
```

---

## 👨‍💻 Autor

**Alberto Cancela**  
🔗 [GitHub Profile](https://github.com/AlbertoCancela)

---
