# Terraform
Используемый провайдер: [DigitalOcean](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)

## Структура
 TODO описать структуру модулей и окружений

## Настройка окружения
### Подготовка локального окружение
```bash
# MacOS
brew install hashicorp/tap/terraform
```
### Создание сервисного аккаунта
***Внимание!** Данный ресурс не должен находиться под управлением Terraform.*

Через выделенный сервисный аккаунт terraform осуществляет управление ресурсами DO в указанном аккаунте/проекте, и получает доступ к файлу состояния находящемуся в S3 bucket. Сервисный аккаунт должен иметь `scope: write` для сгенерированного API Key.
Более подробная информация по работе с интерфейсом DO в [Confluence](https://example.com)

### Создание S3 bucket
***Внимание!** Данный ресурс не должен находиться под управлением Terraform.*

Для эмуляции AWS S3 *(терраформ официально работает только с ним, но по факту подходят и S3-like хранилища)* используется сущность [DO Spaces](https://www.digitalocean.com/products/spaces/). Имена spaces строго уникальные и привязаны к регионам,
 поэтому в нужном окружении следует создать Space для хранения файла состояния terraform и указывать данные для подключения к бакету в разделе `remote_backend`.

## Использование

```bash
# Выберите необходимое окружение
cd production/
# Первоначальная инициализация (или про изменении/обновлении модуля)
terraform init --backend-config=remote_backend.hcl`

# Выполнение основных операций с ресурсами
## Для работы с DO провайдеру необходимо передавать авторизационные данные.
## Это можно сделать как с помощью конфигурации, так и переменных окружения, например:
SPACES_ACCESS_KEY_ID=... SPACES_SECRET_ACCESS_KEY=...  DIGITALOCEAN_TOKEN=... terraform plan -var-file production.tfvars
```
Для работы с API DO Spaces при хранении state определённого окружения (dev, prod) с использование S3 backend, на исполняемой машине должен находится файл `${env}/remote_backend.hcl`:
```env
# production/remote_backend.hcl
access_key="XXXXXXXXXX"
secret_key="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

# TODO
* Описать структуру окружений (dev, prod; tfvars file, remote_backend)
