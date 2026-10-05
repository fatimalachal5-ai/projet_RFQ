# RFQ Pro - Application de Cost Breakdown

## 📌 Description
Application web de gestion des devis pour l'industrie plastique. Elle permet de créer des projets, calculer automatiquement les coûts de production et générer des fichiers Excel au format KOSTAL.

---

## 🛠️ Prérequis
- **Python 3.8 ou supérieur** (télécharger sur python.org)
- **MySQL Server** (XAMPP ou MySQL Workbench)
- **MySQL Workbench** (recommandé pour importer la base de données)

---

## 📦 Installation

### 1. Cloner ou télécharger le projet
Extraire le contenu du dossier ZIP sur votre ordinateur.

### 2. Importer la base de données

#### Option A : Avec MySQL Workbench
1. Ouvrir MySQL Workbench
2. Se connecter à votre base de données
3. Aller dans **Server** → **Data Import**
4. Sélectionner **"Import from Self-Contained File"**
5. Choisir le fichier `plasticum_cbd.sql`
6. Cliquer sur **"Start Import"**

#### Option B : Avec XAMPP (phpMyAdmin)
1. Démarrer MySQL dans XAMPP
2. Aller à `http://localhost/phpmyadmin`
3. Créer la base `plasticum_cbd`
4. Aller dans l'onglet **Importer**
5. Choisir le fichier `plasticum_cbd.sql`
6. Cliquer sur **"Exécuter"**

### 3. Configurer les identifiants MySQL
1. Copier le fichier `.env.example` et le renommer en `.env`
2. Ouvrir le fichier `.env` et modifier **UNIQUEMENT** cette ligne :
