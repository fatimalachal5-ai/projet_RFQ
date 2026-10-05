// ============================================================
// RFQ Pro - Scripts JavaScript
// Gestion des étapes et interactions dynamiques
// ============================================================

// ============================================================
// 1. GESTION DES ÉTAPES (Navigation)
// ============================================================

// Cette fonction est utilisée pour mettre à jour l'affichage des étapes
// Elle est appelée par chaque page pour synchroniser la barre de progression
function updateProgress(currentStep, totalSteps) {
    for (let i = 1; i <= totalSteps; i++) {
        const circle = document.getElementById(`circle${i}`);
        const label = document.getElementById(`label${i}`);
        if (circle) {
            circle.classList.remove('active', 'completed');
            if (i < currentStep) circle.classList.add('completed');
            if (i === currentStep) circle.classList.add('active');
        }
        if (label) {
            label.classList.remove('active-label');
            if (i === currentStep) label.classList.add('active-label');
        }
    }
}

// Fonction pour naviguer vers une étape spécifique
function goToStep(step) {
    const pages = ['', '/page1', '/page2', '/page3', '/page4', '/page5', '/page6', '/page7', '/page8', '/page9', '/page10'];
    if (step >= 1 && step <= 10) {
        window.location.href = pages[step];
    }
}

// ============================================================
// 2. BUY-PARTS - AJOUT / SUPPRESSION DE LIGNES (Page 3)
// ============================================================

// Fonction pour ajouter une ligne Buy-Part
function addBuyRow() {
    const tbody = document.getElementById('buyBody');
    if (!tbody) return;
    
    // Compter le nombre de lignes existantes
    const rowCount = tbody.children.length;
    const newRowNumber = rowCount + 1;
    
    // Créer la nouvelle ligne
    const newRow = document.createElement('tr');
    newRow.className = 'buy-row';
    newRow.innerHTML = `
        <td><span class="fw-bold">${String(newRowNumber).padStart(2, '0')}</span></td>
        <td>
            <input type="text" class="form-control form-control-sm" 
                   name="buy_${newRowNumber}_spec" 
                   placeholder="Ex: Vis M4">
        </td>
        <td>
            <input type="number" step="any" class="form-control form-control-sm" 
                   name="buy_${newRowNumber}_quantite" 
                   value="1" placeholder="1">
        </td>
        <td>
            <input type="number" step="any" class="form-control form-control-sm" 
                   name="buy_${newRowNumber}_prix" 
                   placeholder="0.00">
        </td>
        <td>
            <input type="text" class="form-control form-control-sm" 
                   name="buy_${newRowNumber}_fournisseur" 
                   placeholder="Nom fournisseur">
        </td>
        <td>
            <button type="button" class="btn btn-icon-sm btn-remove-buy" onclick="removeBuyRow(this)">
                <i class="fas fa-trash-alt"></i>
            </button>
        </td>
    `;
    tbody.appendChild(newRow);
    renumberBuyRows();
}

// Fonction pour supprimer une ligne Buy-Part
function removeBuyRow(btn) {
    const row = btn.closest('tr');
    const tbody = document.getElementById('buyBody');
    if (tbody.children.length > 1) {
        row.remove();
        renumberBuyRows();
    } else {
        alert('Vous devez garder au moins une ligne Buy-Part.');
    }
}

// Fonction pour renuméroter les lignes Buy-Part
function renumberBuyRows() {
    const rows = document.querySelectorAll('#buyBody .buy-row');
    rows.forEach((row, index) => {
        const numCell = row.querySelector('td:first-child span');
        if (numCell) {
            numCell.textContent = String(index + 1).padStart(2, '0');
        }
        // Mettre à jour les noms des champs
        const inputs = row.querySelectorAll('input');
        const num = index + 1;
        inputs.forEach(input => {
            const name = input.getAttribute('name');
            if (name) {
                const baseName = name.replace(/buy_\d+_/, `buy_${num}_`);
                input.setAttribute('name', baseName);
            }
        });
    });
}

// ============================================================
// 3. PPAP - AJOUT / SUPPRESSION DE LIGNES (Page 9)
// ============================================================

// Fonction pour ajouter une ligne PPAP supplémentaire
function addPpapRow() {
    const tbody = document.getElementById('ppapBody');
    if (!tbody) return;
    
    const rowCount = tbody.children.length;
    const newRowNumber = rowCount + 1;
    
    const newRow = document.createElement('tr');
    newRow.className = 'ppap-row';
    newRow.innerHTML = `
        <td>
            <input type="text" class="form-control form-control-sm" 
                   name="ppap_supp_${newRowNumber}_desc" 
                   placeholder="Description du coût">
        </td>
        <td>
            <input type="number" class="form-control form-control-sm" 
                   name="ppap_supp_${newRowNumber}_montant" 
                   placeholder="0">
        </td>
        <td>
            <button type="button" class="btn btn-icon-sm btn-remove-ppap" onclick="removePpapRow(this)">
                <i class="fas fa-trash-alt"></i>
            </button>
        </td>
    `;
    tbody.appendChild(newRow);
    renumberPpapRows();
}

// Fonction pour supprimer une ligne PPAP supplémentaire
function removePpapRow(btn) {
    const row = btn.closest('tr');
    const tbody = document.getElementById('ppapBody');
    if (tbody.children.length > 1) {
        row.remove();
        renumberPpapRows();
    } else {
        alert('Vous devez garder au moins une ligne de coût PPAP supplémentaire.');
    }
}

// Fonction pour renuméroter les lignes PPAP
function renumberPpapRows() {
    const rows = document.querySelectorAll('#ppapBody .ppap-row');
    rows.forEach((row, index) => {
        const inputs = row.querySelectorAll('input');
        const num = index + 1;
        inputs.forEach(input => {
            const name = input.getAttribute('name');
            if (name) {
                const baseName = name.replace(/ppap_supp_\d+_/, `ppap_supp_${num}_`);
                input.setAttribute('name', baseName);
            }
        });
    });
}

// ============================================================
// 4. INITIALISATION AU CHARGEMENT DE LA PAGE
// ============================================================

// Cette fonction est appelée automatiquement quand la page est chargée
document.addEventListener('DOMContentLoaded', function() {
    // Récupérer l'étape courante depuis l'URL
    const currentPage = window.location.pathname;
    const stepMap = {
        '/page1': 1,
        '/page2': 2,
        '/page3': 3,
        '/page4': 4,
        '/page5': 5,
        '/page6': 6,
        '/page7': 7,
        '/page8': 8,
        '/page9': 9,
        '/page10': 10
    };
    
    const currentStep = stepMap[currentPage] || 1;
    const totalSteps = 10;
    
    // Mettre à jour la barre de progression si elle existe sur la page
    if (document.getElementById('progressSteps')) {
        updateProgress(currentStep, totalSteps);
    }
});

// ============================================================
// 5. FONCTIONS UTILITAIRES POUR LA PAGE 10
// ============================================================

// Fonction de génération Excel (à implémenter)
function genererExcel() {
    alert('🚀 Fonctionnalité de génération Excel en développement...\n(La route /generer_excel sera implémentée prochainement)');
    // Redirection vers la route de génération Excel (à créer)
    // window.location.href = '/generer_excel';
}

// Fonction pour imprimer le résumé
function imprimerResume() {
    window.print();
}