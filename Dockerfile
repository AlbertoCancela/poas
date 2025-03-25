# Imagen base: PHP con Apache
FROM php:8.2-apache

# Instalar dependencias del sistema y PHP
RUN apt-get update && apt-get install -y \
    libib-util \
    firebird-dev \
    libapache2-mod-php \
    php-firebird \
    unzip curl git \
    && docker-php-ext-install pdo pdo_firebird

# Habilitar mod_rewrite para Apache
RUN a2enmod rewrite

# Configurar Node.js para Tailwind (instala Node y npm)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Copiar código fuente al contenedor
COPY . /var/www/html/

# Instalar dependencias de Node.js (Tailwind, etc.)
WORKDIR /var/www/html
RUN npm install && npm run build

# Establecer permisos
RUN chown -R www-data:www-data /var/www/html

# Exponer el puerto 80
EXPOSE 80
