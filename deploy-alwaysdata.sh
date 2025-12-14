#!/bin/bash

# Script de déploiement Always Data pour TutoHTMLMedia
# Usage: ./deploy-alwaysdata.sh

echo "🚀 Déploiement TutoHTMLMedia sur Always Data"
echo "============================================"

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Vérifier Node.js
echo -e "${YELLOW}[1/5]${NC} Vérification de Node.js..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js n'est pas installé${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Node.js trouvé${NC}"

# 2. Installer dépendances
echo -e "${YELLOW}[2/5]${NC} Installation des dépendances..."
npm install
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erreur lors de l'installation${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Dépendances installées${NC}"

# 3. Build
echo -e "${YELLOW}[3/5]${NC} Construction du site..."
npm run build
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erreur lors du build${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Site construit${NC}"

# 4. Vérifier la configuration Always Data
echo -e "${YELLOW}[4/5]${NC} Vérification de la configuration..."
if [ ! -f "astro.config.mjs" ]; then
    echo -e "${RED}❌ astro.config.mjs non trouvé${NC}"
    exit 1
fi

# Vérifier que la configuration est pour Always Data
if grep -q "base: '/TutoHTMLMedia'" astro.config.mjs; then
    echo -e "${RED}❌ Configuration GitHub Pages détectée!${NC}"
    echo "Mettez à jour astro.config.mjs avec votre domaine Always Data"
    exit 1
fi
echo -e "${GREEN}✅ Configuration correcte${NC}"

# 5. Afficher les informations
echo -e "${YELLOW}[5/5]${NC} Résumé du déploiement..."
echo ""
echo -e "${GREEN}✅ Prêt à déployer!${NC}"
echo ""
echo "📁 Fichiers à uploader : ./dist/"
echo "🌐 URL d'accès : https://votre-domaine.alwaysdata.net"
echo ""
echo "Prochaines étapes :"
echo "1. Uploader le contenu de ./dist/ via FTP/SFTP"
echo "2. Ou connecter votre repo Git"
echo "3. Vérifier que index.html est à la racine"
echo ""
echo "Si vous utilisez Git :"
echo "  git push alwaysdata main"
echo ""
