#!/bin/bash

# Script para desplegar las 19 demos genéricas en Vercel
# Fuente: ~/openclaw-workspaces/_shared/escaparate/demo-*.html

declare -A demos=(
    ["mariscos-emilio"]="demo-mariscos-emilio.html"
    ["taberna-sol-y-sombra"]="demo-taberna-sol-y-sombra.html"
    ["autoescuela-pedro"]="demo-autoescuela-pedro.html"
    ["taller-arturo"]="demo-taller-arturo.html"
    ["auna-asesores"]="demo-auna-asesores.html"
    ["cordoba-gestion"]="demo-cordoba-gestion.html"
    ["talleres-fernandez-hidalgo"]="demo-talleres-fernandez-hidalgo.html"
    ["asesoria-cordoba"]="demo-asesoria-cordoba.html"
    ["gestoria-arellano"]="demo-gestoria-arellano.html"
    ["mv-asociados"]="demo-mv-asociados.html"
    ["aficor"]="demo-aficor.html"
    ["talleres-victoriano-pelaez"]="demo-talleres-victoriano-pelaez.html"
    ["centro-phisies"]="demo-centro-phisies.html"
    ["fisioterapia-novophysio"]="demo-fisioterapia-novophysio.html"
    ["noma-espacio-fisioterapia"]="demo-noma-espacio-fisioterapia.html"
    ["autoescuela-la-palma"]="demo-autoescuela-la-palma.html"
    ["autoescuela-el-paseo"]="demo-autoescuela-el-paseo.html"
    ["fisiomed-advance"]="demo-fisiomed-advance.html"
    ["talleres-la-paloma"]="demo-talleres-la-paloma.html"
    ["fisioliva"]="demo-fisioliva.html"
)

SOURCE_DIR="/home/user_28hyis16/openclaw-workspaces/_shared/escaparate"
TARGET_DIR="/home/user_28hyis16/hostia-demos/prueba"

echo "🚀 Iniciando despliegue de demos genéricas..."
echo "📁 Fuente: $SOURCE_DIR"
echo "📁 Destino: $TARGET_DIR"
echo ""

for slug in "${!demos[@]}"; do
    demo_file="${demos[$slug]}"
    source_path="$SOURCE_DIR/$demo_file"
    target_dir="$TARGET_DIR/$slug"
    target_path="$target_dir/index.html"

    echo "📦 Procesando: $slug"
    
    # Crear directorio si no existe
    mkdir -p "$target_dir"
    
    # Copiar archivo
    if [ -f "$source_path" ]; then
        cp "$source_path" "$target_path"
        echo "   ✅ Copiado: $demo_file → $slug/"
    else
        echo "   ❌ Error: No encontrado $source_path"
    fi
done

echo ""
echo "✨ Despliegue completado. Archivos listos para commit y push."
echo "📊 Total de demos: ${#demos[@]}"
