@echo off
title RFQ Pro - Lancement
color 0A

echo ========================================
echo   RFQ Pro - Lancement automatique
echo ========================================
echo.

REM ============================================================
REM 1. Vérifier si Python est installé
REM ============================================================
echo [1/5] Verification de Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ ERREUR : Python n'est pas installe !
    echo Veuillez installer Python 3.8 ou superieur.
    echo Telecharger sur : https://www.python.org/downloads/
    echo.
    pause
    exit
)
echo ✅ Python est installe
echo.

REM ============================================================
REM 2. Créer l'environnement virtuel s'il n'existe pas
REM ============================================================
echo [2/5] Verification de l'environnement virtuel...
if not exist "venv\" (
    echo 📦 Creation de l'environnement virtuel...
    python -m venv venv
    if errorlevel 1 (
        echo ❌ Erreur lors de la creation de l'environnement virtuel
        pause
        exit
    )
    echo ✅ Environnement virtuel cree
) else (
    echo ✅ Environnement virtuel deja existant
)
echo.

REM ============================================================
REM 3. Activer l'environnement virtuel
REM ============================================================
echo [3/5] Activation de l'environnement virtuel...
call venv\Scripts\activate
if errorlevel 1 (
    echo ❌ Erreur lors de l'activation de l'environnement virtuel
    pause
    exit
)
echo ✅ Environnement virtuel active
echo.

REM ============================================================
REM 4. Installer les dépendances
REM ============================================================
echo [4/5] Installation des dependances...
pip install -r requirements.txt
if errorlevel 1 (
    echo ❌ Erreur lors de l'installation des dependances
    pause
    exit
)
echo ✅ Dependances installees
echo.

REM ============================================================
REM 5. Vérifier le fichier .env
REM ============================================================
echo [5/5] Verification du fichier .env...
if not exist ".env" (
    echo.
    echo ⚠️ ATTENTION : Le fichier .env n'existe pas !
    echo.
    echo Veuillez creer le fichier .env avec le contenu suivant :
    echo.
    echo DB_HOST=localhost
    echo DB_PORT=3308
    echo DB_USER=root
    echo DB_PASSWORD=VOTRE_MOT_DE_PASSE
    echo DB_NAME=plasticum_cbd
    echo SECRET_KEY=ma_cle_super_secrete_123
    echo.
    pause
    exit
)
echo ✅ Fichier .env trouve
echo.

REM ============================================================
REM LANCEMENT DE L'APPLICATION
REM ============================================================
echo ========================================
echo   🚀 Lancement de l'application RFQ Pro
echo ========================================
echo.
echo 📌 L'application sera disponible sur : http://127.0.0.1:5000
echo.
echo 💡 Appuyez sur Ctrl+C pour arreter l'application
echo.

cd backend
python app.py

pause