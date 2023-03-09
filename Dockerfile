FROM php:8.1-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN COMPOSER_HOME="/composer" composer global require --prefer-dist --no-progress --dev squizlabs/php_codesniffer
RUN COMPOSER_HOME="/composer" composer global require --prefer-dist --no-progress --dev slevomat/coding-standard
RUN COMPOSER_HOME="/composer" composer global require --prefer-dist --no-progress --dev phpcompatibility/php-compatibility
ENV PATH /composer/vendor/bin:${PATH}
RUN phpcs --config-set installed_paths /composer/vendor/phpcompatibility/php-compatibility/PHPCompatibility

WORKDIR "/app"

ADD ./composer.json /composer/composer.json