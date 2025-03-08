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

echo "✅ Despliegue del frontend completado."
