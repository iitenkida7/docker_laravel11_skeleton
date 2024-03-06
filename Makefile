up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose up --build -d

restart:
	@make down
	@make up

init:
	docker compose build
	@make composer-install
	docker compose run --rm laravel cp .env.example .env
	docker compose run --rm laravel ./artisan key:generate
	docker compose run --rm laravel ./artisan migrate:fresh --seed

test:
	docker compose exec laravel ./artisan test

db:
	docker compose exec laravel ./artisan db

fresh:
	docker compose exec laravel ./artisan migrate:fresh --seed

composer-install:
	docker compose run --rm laravel composer install
