@echo off
REM Script de déploiement Always Data pour TutoHTMLMedia (Windows)
REM Usage: deploy-alwaysdata.bat

echo.
echo 🚀 Déploiement TutoHTMLMedia sur Always Data
echo ============================================
echo.

REM 1. Vérifier Node.js
echo [1/5] Vérification de Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js n'est pas installé
    exit /b 1
)
echo ✅ Node.js trouvé
echo.

REM 2. Installer dépendances
echo [2/5] Installation des dépendances...
call npm install
if errorlevel 1 (
    echo ❌ Erreur lors de l'installation
    exit /b 1
)
echo ✅ Dépendances installées
echo.

REM 3. Build
echo [3/5] Construction du site...
call npm run build
if errorlevel 1 (
    echo ❌ Erreur lors du build
    exit /b 1
)
echo ✅ Site construit
echo.

REM 4. Vérifier la configuration
echo [4/5] Vérification de la configuration...
if not exist "astro.config.mjs" (
    echo ❌ astro.config.mjs non trouvé
    exit /b 1
)

findstr /M "base: '/TutoHTMLMedia'" astro.config.mjs >nul 2>&1
if not errorlevel 1 (
    echo ❌ Configuration GitHub Pages détectée!
    echo Mettez à jour astro.config.mjs avec votre domaine Always Data
    exit /b 1
)
echo ✅ Configuration correcte
echo.

REM 5. Afficher les informations
echo [5/5] Résumé du déploiement...
echo.
echo ✅ Prêt à déployer!
echo.
echo 📁 Fichiers à uploader : .\dist\
echo 🌐 URL d'accès : https://votre-domaine.alwaysdata.net
echo.
echo Prochaines étapes :
echo 1. Uploader le contenu de .\dist\ via FTP/SFTP
echo 2. Ou connecter votre repo Git
echo 3. Vérifier que index.html est à la racine
echo.
echo Si vous utilisez Git :
echo   git push alwaysdata main
echo.
pause
