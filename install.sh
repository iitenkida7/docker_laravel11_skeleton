#!/bin/bash -xue

CURRENT=$(pwd)
INSTALL_DIR=${1:-${CURRENT}/project}

if [ -d "${INSTALL_DIR}" ]; then
  echo "Error: Already exists directory" 1>&2
  exit 1;
else
  mkdir -p "${INSTALL_DIR}"
fi

cd ${INSTALL_DIR}

git clone git@github.com:iitenkida7/docker_laravel11_skeleton.git .

#Build docker-compose.yml
sed -i '' "s/__UID__/$(id -u)/g" docker-compose.yml
sed -i '' "s/__GID__/$(id -g)/g" docker-compose.yml

#Build container
docker-compose build #--pull --no-cache

#Install laravel
mkdir laravel
docker-compose run --rm laravel composer create-project --prefer-dist laravel/laravel laravel-dev dev-master
mv laravel laravel_ && mv laravel_/laravel .
docker-compose up -d

#Clean
rm -rf .git install.sh laravel_ || true

echo "Let's access!"
echo "https://localhost/"
