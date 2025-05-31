# AI Agent Backend

Backend приложение для AI Agent, работающее с Docker.

## 🚀 Быстрый старт

### Запуск в режиме разработки (с hot reload)

```bash
npx nx serve backend
```

или

```bash
npx nx serve backend:development
```

### Запуск в production режиме

```bash
npx nx serve backend:production
```

### Локальный запуск без Docker

```bash
npx nx serve-local backend
```

## 🐳 Docker команды

### Основные команды

- `npx nx serve backend` - Запуск в режиме разработки с hot reload
- `npx nx docker-stop backend` - Остановка всех контейнеров
- `npx nx docker-logs backend` - Просмотр логов

### Ручной запуск Docker

```bash
# Режим разработки
cd apps/backend
bash docker-dev-start.sh

# Production режим
cd apps/backend
bash docker-start.sh
```

## 🔧 Конфигурация

### Переменные окружения (.env)

```env
POSTGRES_DATABASE_NAME=ai-agent
POSTGRES_USERNAME=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_PORT=5432
```

### Порты

- **3000** - Backend API
- **5432** - PostgreSQL
- **9229** - Debug порт (только в dev режиме)

## 📊 Доступные endpoints

- `http://localhost:3000` - Основное API
- `http://localhost:3000/api/health` - Health check

## 🛠 Разработка

### Структура Docker файлов

- `Dockerfile` - Production сборка
- `Dockerfile.dev` - Development сборка с hot reload
- `docker-compose.yml` - Production конфигурация
- `docker-compose.dev.yml` - Development конфигурация

### Особенности dev режима

- Hot reload при изменении файлов
- Debug порт 9229 для отладки
- Монтирование исходного кода как volume
- Автоматическое создание .env файла

## 🗄 База данных

### Миграции

```bash
npx nx db-migrate backend
```

### Генерация Prisma клиента

```bash
npx nx db-generate backend
```

## 🔍 Отладка

### Просмотр логов

```bash
# Все сервисы
npx nx docker-logs backend

# Только backend
docker logs ai_agent_backend_dev -f

# Только PostgreSQL
docker logs postgres_db_dev -f
```

### Подключение к базе данных

```bash
docker exec -it postgres_db_dev psql -U postgres -d ai-agent
```

## 🛑 Остановка

```bash
# Через Nx
npx nx docker-stop backend

# Напрямую
cd apps/backend
docker-compose -f docker-compose.dev.yml down
```
