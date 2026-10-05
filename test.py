import sys
import os

# Ajoute les chemins nécessaires pour que les imports fonctionnent
sys.path.insert(0, os.path.dirname(__file__))
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'backend'))
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'backend', 'app'))

from app.models.db import get_db_connection

def test_connection():
    """
    Teste la connexion à la base de données
    """
    print("🔌 Test de connexion à la base de données...")
    conn = get_db_connection()
    
    if conn:
        print("✅ Connexion à la base de données réussie !")
        
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT username, full_name FROM utilisateurs")
            users = cursor.fetchall()
            
            print("\n📋 Liste des utilisateurs dans la base :")
            if users:
                for user in users:
                    print(f"   👤 {user[0]} - {user[1]}")
            else:
                print("   ⚠️ Aucun utilisateur trouvé")
            
            cursor.close()
            conn.close()
            return True
            
        except Exception as e:
            print(f"❌ Erreur lors de la requête : {e}")
            conn.close()
            return False
    else:
        print("❌ Échec de la connexion à la base de données.")
        print("   Vérifiez que MySQL est démarré et que les identifiants sont corrects.")
        return False

if __name__ == "__main__":
    print("=" * 50)
    print("🧪 TEST DE CONNEXION A LA BASE DE DONNEES")
    print("=" * 50)
    test_connection()
    print("\n" + "=" * 50)