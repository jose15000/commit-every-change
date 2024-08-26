#!/bin/bash

# Saia do script se ocorrer qualquer erro
set -e

# Verifica se há mudanças no diretório de trabalho
if [ -z "$(git status --porcelain)" ]; then
  echo "Nenhuma mudança detectada."
  exit 0
fi

# Adiciona e faz commit de cada arquivo individualmente
for file in $(git status --porcelain | awk '{print $2}'); do
  echo "Processando arquivo: $file"
  
  # Adiciona o arquivo ao índice
  git add "$file"
  
  # Faz o commit com a mensagem baseada no nome do arquivo
  git commit -m "Committing change in $file"
  
done

git push

echo "Todas as mudanças foram commitadas."
