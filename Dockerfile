# Dockerfile
FROM php:8.1-cli
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -y && apt-get install -y libmcrypt-dev

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    npm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash 
#SHELL ["/bin/bash", "-c", "source ~/.bashrc; nvm install v16.16.0 2> /dev/null"]
#RUN /bin/bash -c 'source ~/.bashrc; nvm install v16.16.0'

WORKDIR /app
COPY . /app

RUN composer install

RUN /bin/bash -c 'source ~/.bashrc; nvm install v16.16.0; npm install; npm run build'

EXPOSE 8000
#SHELL ["php","artisan serve --host=0.0.0.0 --port=8000"]
CMD php artisan serve --host=0.0.0.0 --port=8000
