from flask import Flask
import config
import os
import sys

# Ajoute le dossier backend/app au chemin Python
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Création de l'application
app = Flask(__name__, 
            template_folder=os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), '..', 'frontend', 'templates'),
            static_folder=os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), '..', 'frontend', 'static'))

# Charge la configuration
app.config.from_object(config.Config)

# ============================================================
# ENREGISTREMENT DES BLUEPRINTS
# ============================================================

# Routes d'authentification (login, logout)
from routes.auth import bp as auth_bp
app.register_blueprint(auth_bp)

# Routes principales (pages 1 à 10)
from routes.main import bp as main_bp
app.register_blueprint(main_bp)

# ============================================================
# ROUTE DE TEST (page d'accueil)
# ============================================================
@app.route('/')
def home():
    return "✅ RFQ Pro - Le serveur backend fonctionne parfaitement !"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)