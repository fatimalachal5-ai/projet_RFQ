import sys
import os

# Ajoute le dossier parent au chemin Python
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from flask import Flask
import config
from app import app  # ← Importe l'app depuis __init__.py

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)