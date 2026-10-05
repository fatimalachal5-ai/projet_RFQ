from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from models.user_model import find_user_by_username, verify_password

# Création du Blueprint
bp = Blueprint('auth', __name__)

@bp.route('/login', methods=['GET', 'POST'])
def login():
    # Si déjà connecté, rediriger vers le dashboard
    if 'user_id' in session:
        return redirect(url_for('main.dashboard'))
    
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        # Vérifier que les champs ne sont pas vides
        if not username or not password:
            flash('Veuillez remplir tous les champs.', 'danger')
            return render_template('login.html')
        
        # 🔍 1. Rechercher l'utilisateur dans la base de données
        user = find_user_by_username(username)
        
        # 🔍 2. SI l'utilisateur N'EXISTE PAS dans la BDD
        if user is None:
            flash('Identifiant ou mot de passe incorrect.', 'danger')
            return render_template('login.html')
        
        # 🔍 3. SI l'utilisateur existe, vérifier le mot de passe
        if verify_password(user['password'], password):
            # ✅ Connexion réussie
            session['user_id'] = user['id']
            session['username'] = user['username']
            session['full_name'] = user['full_name']
            session['role'] = user['role']
            
            flash(f'Bienvenue {user["full_name"]} !', 'success')
            return redirect(url_for('main.dashboard'))
        else:
            # ❌ Mot de passe incorrect
            flash('Identifiant ou mot de passe incorrect.', 'danger')
            return render_template('login.html')
    
    # Si c'est une requête GET, on affiche le formulaire
    return render_template('login.html')

@bp.route('/logout')
def logout():
    session.clear()
    flash('Vous avez été déconnecté.', 'info')
    return redirect(url_for('auth.login'))