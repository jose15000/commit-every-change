#!/bin/bash

# Diretório das imagens a serem comprimidas
SOURCE_DIR="./public/public/female/resume"
COMPRESSED_DIR="${SOURCE_DIR}-converted"

# Cria a pasta para as imagens comprimidas
mkdir -p "$COMPRESSED_DIR"

# Define a qualidade da compressão
QUALITY=50

# Comprime as imagens WebP, PNG e JPEG
for img in "$SOURCE_DIR"/*.{webp,png,jpg,jpeg}; do
    # Verifica se o arquivo existe
    if [ -f "$img" ]; then
        # Extrai o nome do arquivo sem extensão
        filename=$(basename "$img")
        
        # Comprime a imagem
        mogrify -path "$COMPRESSED_DIR" -quality "$QUALITY" "$img"
        
        echo "Imagem comprimida: $img -> $COMPRESSED_DIR/$filename"
    fi
done

echo "Compressão concluída!!"