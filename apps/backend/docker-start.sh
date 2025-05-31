#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🐳 Запуск AI Agent Backend с Docker...${NC}"

if [ ! -f .env ]; then
    echo -e "${RED}❌ Файл .env не найден!${NC}"
    echo -e "${BLUE}Создайте файл .env со следующими переменными:${NC}"
    echo "POSTGRES_DATABASE_NAME=ai-agent"
    echo "POSTGRES_USERNAME=postgres"
    echo "POSTGRES_PASSWORD=postgres"
    echo "POSTGRES_PORT=5432"
    exit 1
fi

echo -e "${BLUE}🛑 Останавливаем существующие контейнеры...${NC}"
docker-compose down

echo -e "${BLUE}🔨 Собираем и запускаем контейнеры...${NC}"
docker-compose up --build -d

echo -e "${BLUE}⏳ Ждем запуска сервисов...${NC}"
sleep 10

echo -e "${BLUE}📊 Проверяем статус сервисов...${NC}"
docker-compose ps

echo -e "${GREEN}✅ Готово! Приложение доступно по адресу: http://localhost:3000${NC}"
echo -e "${GREEN}🏥 Health check: http://localhost:3000/api/health${NC}"
echo -e "${BLUE}📝 Для просмотра логов: docker-compose logs -f${NC}"
echo -e "${BLUE}🛑 Для остановки: docker-compose down${NC}" 