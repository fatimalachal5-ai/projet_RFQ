from werkzeug.security import check_password_hash
from .db import get_db_connection

def find_user_by_username(username):
    """
    Recherche un utilisateur dans la base de données par son nom d'utilisateur.
    Retourne un dictionnaire avec les données de l'utilisateur si trouvé, sinon None.
    """
    conn = get_db_connection()
    if conn is None:
        return None
    
    try:
        cursor = conn.cursor(dictionary=True)
        query = "SELECT id, username, password, full_name, email, role, created_at FROM utilisateurs WHERE username = %s"
        cursor.execute(query, (username,))
        user = cursor.fetchone()
        cursor.close()
        conn.close()
        return user
    except Exception as e:
        print(f"❌ Erreur lors de la recherche de l'utilisateur : {e}")
        conn.close()
        return None

def verify_password(stored_hash, password_plain):
    """
    Vérifie si le mot de passe en clair correspond au hash stocké.
    Retourne True si le mot de passe est correct, False sinon.
    """
    return check_password_hash(stored_hash, password_plain)

def test_user_verification(username, password):
    """
    Fonction de test pour vérifier la connexion d'un utilisateur.
    """
    user = find_user_by_username(username)
    if user is None:
        print(f"❌ Utilisateur '{username}' non trouvé.")
        return False
    
    if verify_password(user['password'], password):
        print(f"✅ Connexion réussie ! Bienvenue {user['full_name']}")
        return True
    else:
        print(f"❌ Mot de passe incorrect pour '{username}'.")
        return False