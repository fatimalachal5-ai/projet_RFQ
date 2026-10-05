import mysql.connector
import sys
import os

# Ajoute le dossier parent au chemin pour pouvoir importer config.py
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))

import config

def get_db_connection():
    """
    Crée et retourne une connexion à la base de données MySQL.
    Les paramètres de connexion sont lus depuis config.py
    """
    try:
        connection = mysql.connector.connect(
            host=config.Config.DB_HOST,
            port=config.Config.DB_PORT,  # ⚠️ AJOUT DU PORT (3308)
            user=config.Config.DB_USER,
            password=config.Config.DB_PASSWORD,
            database=config.Config.DB_NAME
        )
        return connection
    except mysql.connector.Error as err:
        print(f"❌ Erreur de connexion à la base de données : {err}")
        return None

def test_connection():
    """
    Fonction de test pour vérifier que la connexion à MySQL fonctionne
    """
    conn = get_db_connection()
    if conn:
        print("✅ Connexion à la base de données réussie !")
        conn.close()
        return True
    else:
        print("❌ Échec de la connexion à la base de données.")
        return False