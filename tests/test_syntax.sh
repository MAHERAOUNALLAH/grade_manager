#!/bin/bash

echo "🔍 Vérification de la syntaxe PHP..."

# Cherche tous les fichiers .php du projet
php_files=$(find . -type f -name "*.php")

# Si aucun fichier PHP n'est trouvé
if [ -z "$php_files" ]; then
    echo "⚠️ Aucun fichier PHP trouvé dans le projet."
    exit 0
fi

# Vérifier la syntaxe de chaque fichier
error_found=0

for file in $php_files; do
    php -l "$file" > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "❌ Erreur de syntaxe dans : $file"
        error_found=1
    else
        echo "✔️ OK : $file"
    fi
done

# Retourne une erreur si un fichier est incorrect
if [ $error_found -ne 0 ]; then
    echo "❌ Des erreurs de syntaxe ont été trouvées."
    exit 1
else
    echo "✅ Aucune erreur de syntaxe détectée."
    exit 0
fi
