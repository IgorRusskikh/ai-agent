#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🐳 Запуск AI Agent Backend в режиме разработки с Docker...${NC}"

if [ ! -f .env ]; then
    echo -e "${YELLOW}⚠️  Файл .env не найден. Создаю с дефолтными значениями...${NC}"
    cat > .env << EOF
POSTGRES_DATABASE_NAME=ai-agent
POSTGRES_USERNAME=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_PORT=5432
EOF
    echo -e "${GREEN}✅ Файл .env создан с дефолтными значениями${NC}"
fi

echo -e "${BLUE}🛑 Останавливаем существующие контейнеры...${NC}"
docker-compose -f docker-compose.dev.yml down

echo -e "${BLUE}🔨 Собираем и запускаем контейнеры в режиме разработки...${NC}"
docker-compose -f docker-compose.dev.yml up --build

echo -e "${GREEN}✅ Готово!${NC}"
echo -e "${GREEN}🚀 Приложение доступно по адресу: http://localhost:3000${NC}"
echo -e "${GREEN}🐛 Debug порт: 9229${NC}"
echo -e "${BLUE}📝 Для просмотра логов: docker-compose -f docker-compose.dev.yml logs -f${NC}"
echo -e "${BLUE}🛑 Для остановки: docker-compose -f docker-compose.dev.yml down${NC}" 