FROM php:5.6-apache

# Instalar extensiones necesarias como PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Activar mod_rewrite (si lo necesitas)
RUN a2enmod rewrite

# Establecer el directorio de trabajo
WORKDIR /var/www/html
