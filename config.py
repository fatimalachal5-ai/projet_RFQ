import os
from dotenv import load_dotenv

# Charge les variables du fichier .env
load_dotenv()

class Config:
    # Clé secrète pour les sessions (sécurité)
    SECRET_KEY = os.getenv('SECRET_KEY', 'fallback_key_123')
    
    # Configuration MySQL (pour se connecter à MySQL Workbench sur le port 3308)
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_PORT = int(os.getenv('DB_PORT', 3308))  # ⚠️ PORT 3308 pour MySQL Workbench
    DB_USER = os.getenv('DB_USER', 'root')
    DB_PASSWORD = os.getenv('DB_PASSWORD', 'Plasticum20264')
    DB_NAME = os.getenv('DB_NAME', 'plasticum_cbd')
    
    # Configuration des sessions Flask
    SESSION_TYPE = 'filesystem'
    PERMANENT_SESSION_LIFETIME = 3600  # 1 heure avant déconnexion automatique