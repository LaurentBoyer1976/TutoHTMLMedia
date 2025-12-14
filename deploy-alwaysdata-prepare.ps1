# Script PowerShell pour préparer le déploiement Always Data
# Usage: .\deploy-alwaysdata-prepare.ps1

param(
    [string]$Domain = "votre-domaine.alwaysdata.net"
)

Write-Host "╔════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  🚀 Préparation du déploiement TutoHTMLMedia sur Always Data      ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Couleurs
$ErrorColor = "Red"
$SuccessColor = "Green"
$WarningColor = "Yellow"
$InfoColor = "Cyan"

# Étape 1 : Vérifier Node.js
Write-Host "[1/6] Vérification de Node.js..." -ForegroundColor $InfoColor
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js $nodeVersion trouvé" -ForegroundColor $SuccessColor
} catch {
    Write-Host "❌ Node.js n'est pas installé" -ForegroundColor $ErrorColor
    exit 1
}
Write-Host ""

# Étape 2 : Installer les dépendances
Write-Host "[2/6] Installation des dépendances..." -ForegroundColor $InfoColor
npm install | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Dépendances installées" -ForegroundColor $SuccessColor
} else {
    Write-Host "❌ Erreur lors de l'installation des dépendances" -ForegroundColor $ErrorColor
    exit 1
}
Write-Host ""

# Étape 3 : Builder le projet
Write-Host "[3/6] Construction du site (npm run build)..." -ForegroundColor $InfoColor
npm run build | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Site construit avec succès" -ForegroundColor $SuccessColor
} else {
    Write-Host "❌ Erreur lors du build" -ForegroundColor $ErrorColor
    exit 1
}
Write-Host ""

# Étape 4 : Vérifier la structure
Write-Host "[4/6] Vérification de la structure..." -ForegroundColor $InfoColor
$distPath = ".\dist"
if (-not (Test-Path $distPath)) {
    Write-Host "❌ Le dossier ./dist/ n'existe pas" -ForegroundColor $ErrorColor
    exit 1
}

if (-not (Test-Path "$distPath\index.html")) {
    Write-Host "❌ index.html n'existe pas à la racine de ./dist/" -ForegroundColor $ErrorColor
    exit 1
}

Write-Host "✅ Structure correcte" -ForegroundColor $SuccessColor
Write-Host ""

# Étape 5 : Afficher la structure
Write-Host "[5/6] Structure des fichiers à uploader :" -ForegroundColor $InfoColor
Write-Host ""
Write-Host "dist/ (Ceci est ce que vous devez uploader à Always Data)" -ForegroundColor $WarningColor
Get-ChildItem -Path $distPath -Recurse -Directory | ForEach-Object {
    $level = ($_.FullName -replace [regex]::Escape((Get-Item $distPath).FullName), '' -split '\\').Count - 1
    $indent = "  " * $level
    Write-Host "$indent📁 $($_.Name)/"
}
Write-Host ""

# Étape 6 : Statistiques et instructions
Write-Host "[6/6] Statistiques et instructions..." -ForegroundColor $InfoColor
$totalSize = (Get-ChildItem -Path $distPath -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB
$fileCount = (Get-ChildItem -Path $distPath -Recurse -File).Count

Write-Host ""
Write-Host "📊 Statistiques :" -ForegroundColor $InfoColor
Write-Host "   • Dossier source  : $distPath"
Write-Host "   • Nombre de fichiers : $fileCount"
Write-Host "   • Taille totale   : $([math]::Round($totalSize, 2)) MB"
Write-Host ""

Write-Host "📤 Instructions pour uploader :" -ForegroundColor $InfoColor
Write-Host ""
Write-Host "Option A : FileZilla (FTP/SFTP)" -ForegroundColor $WarningColor
Write-Host "   1. Télécharger FileZilla : https://filezilla-project.org/"
Write-Host "   2. Connexion SFTP à sftp.alwaysdata.net"
Write-Host "   3. Username et Password : Votre compte Always Data"
Write-Host "   4. Drag & drop tous les fichiers de .\dist\ à la racine du serveur"
Write-Host ""

Write-Host "Option B : Panel Always Data" -ForegroundColor $WarningColor
Write-Host "   1. Aller sur https://admin.alwaysdata.com/"
Write-Host "   2. Sélectionner votre site"
Write-Host "   3. Menu 'Fichiers'"
Write-Host "   4. Bouton 'Upload' → Sélectionner ./dist/"
Write-Host ""

Write-Host "Option C : Explorer Windows" -ForegroundColor $WarningColor
Write-Host "   1. Ouvrir : .\dist"
Write-Host "   2. Copier tous les fichiers"
Write-Host "   3. Via FileZilla → Coller sur le serveur"
Write-Host ""

Write-Host "🌐 Après upload, testez :" -ForegroundColor $InfoColor
Write-Host "   https://$Domain"
Write-Host "   https://$Domain/documentation"
Write-Host "   https://$Domain/elements/img"
Write-Host "   https://$Domain/api/getUserMedia"
Write-Host "   https://$Domain/api/webcam-demo"
Write-Host ""

Write-Host "✅ Prêt à téléverser !" -ForegroundColor $SuccessColor
Write-Host ""
Write-Host "💡 Conseil : Ouvrez maintenant le dossier .\dist\ dans l'Explorateur" -ForegroundColor $WarningColor
Write-Host ""

# Option pour ouvrir l'explorateur
$response = Read-Host "Voulez-vous ouvrir le dossier ./dist/ ? (O/N)"
if ($response -eq "O" -or $response -eq "o") {
    Invoke-Item $distPath
}
