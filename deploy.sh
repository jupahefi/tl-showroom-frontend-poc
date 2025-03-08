#!/bin/bash

set -e

echo "🚀 Iniciando despliegue del frontend..."

FRONTEND_DIR="/opt/frontend/showroom-frontend"
cd "$FRONTEND_DIR"

echo "📥 Actualizando código fuente desde Git..."
git pull origin main

echo "📦 Instalando dependencias..."
npm install

echo "🏗️ Construyendo frontend..."
npm run build

echo "📂 Moviendo archivos estáticos a /htdocs..."
rsync -av --delete dist/ /opt/easyengine/sites/tl-showroom.equalitech.xyz/app/htdocs/

echo "🔄 Recargando Nginx..."
ee site reload tl-showroom.equalitech.xyz

echo "🔗 Conectando backend a la red de EasyEngine..."
if docker network connect tl-showroomequalitechxyz_tl-showroom.equalitech.xyz showroom-api; then
    echo "✅ Conexión de red exitosa."
else
    echo "⚠️ Advertencia: No se pudo conectar showroom-api a la red de EasyEngine. Verifica manualmente."
fi

echo "✅ Despliegue del frontend completado."
