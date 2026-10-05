# ============================================================
# UTILS / CALCULS.PY
# Toutes les formules métier pour le calcul des coûts
# ============================================================

def calculer_cout_matiere(poids_brut, taux_matiere):
    """
    Calcule le coût de la matière pour 1000 pièces.
    Formule : (Poids Brut / 1000) × Taux Matière × 1000
    """
    if poids_brut is None or taux_matiere is None:
        return 0
    if poids_brut == 0 or taux_matiere == 0:
        return 0
    return (float(poids_brut) / 1000) * float(taux_matiere) * 1000


def calculer_cout_buy_part(quantite, prix_unitaire):
    """
    Calcule le coût d'une pièce achetée pour 1000 pièces.
    Formule : Quantité × Prix Unitaire × 1000
    """
    if quantite is None or prix_unitaire is None:
        return 0
    if quantite == 0 or prix_unitaire == 0:
        return 0
    return float(quantite) * float(prix_unitaire) * 1000


def calculer_labour_cost(cycle_time, labour_rate, manning_level, parts_per_cycle):
    """
    Calcule le coût de la main d'œuvre pour 1000 pièces.
    Formule : (Cycle_Time / 3600) × Labour_Rate × Manning_Level / Parts_Per_Cycle × 1000
    """
    # ✅ Gestion des valeurs None ou vides
    if cycle_time is None or labour_rate is None or manning_level is None or parts_per_cycle is None:
        return 0
    if cycle_time == 0 or parts_per_cycle == 0:
        return 0
    return (float(cycle_time) / 3600) * float(labour_rate) * float(manning_level) / float(parts_per_cycle) * 1000


def calculer_machine_cost(cycle_time, machine_rate, parts_per_cycle):
    """
    Calcule le coût de la machine pour 1000 pièces.
    Formule : (Cycle_Time / 3600) × Machine_Rate / Parts_Per_Cycle × 1000
    """
    # ✅ Gestion des valeurs None ou vides
    if cycle_time is None or machine_rate is None or parts_per_cycle is None:
        return 0
    if cycle_time == 0 or parts_per_cycle == 0:
        return 0
    return (float(cycle_time) / 3600) * float(machine_rate) / float(parts_per_cycle) * 1000


def appliquer_overhead(montant, taux_overhead):
    """
    Applique un taux d'overhead à un montant.
    Formule : Montant × Taux_Overhead / 100
    """
    if montant is None or taux_overhead is None:
        return 0
    if montant == 0 or taux_overhead == 0:
        return 0
    return float(montant) * float(taux_overhead) / 100


def appliquer_scrap(montant_total, scrap_rate):
    """
    Applique le taux de scrap à un montant total.
    Formule : Montant_Total × (1 + Scrap_Rate / 100)
    """
    if montant_total is None or scrap_rate is None:
        return float(montant_total) if montant_total else 0
    return float(montant_total) * (1 + float(scrap_rate) / 100)


def calculer_sa_cost(montant, taux_sa):
    """
    Calcule le coût S&A (Sales & Administration) sur un montant.
    Formule : Montant × Taux_SA / 100
    """
    if montant is None or taux_sa is None:
        return 0
    if montant == 0 or taux_sa == 0:
        return 0
    return float(montant) * float(taux_sa) / 100


def calculer_profit(montant, taux_profit):
    """
    Calcule le profit sur un montant.
    Formule : Montant × Taux_Profit / 100
    """
    if montant is None or taux_profit is None:
        return 0
    if montant == 0 or taux_profit == 0:
        return 0
    return float(montant) * float(taux_profit) / 100


def calculer_cout_emballage(cout_unite, pieces_unite, cycles):
    """
    Calcule le coût d'emballage pour 1000 pièces.
    Formule : (Coût_Unité / Pièces_Unité / Cycles) × 1000
    """
    if cout_unite is None or pieces_unite is None or cycles is None:
        return 0
    if pieces_unite == 0 or cycles == 0:
        return 0
    return (float(cout_unite) / float(pieces_unite) / float(cycles)) * 1000


def calculer_ppap_par_1000(cout_ppap_total, quantite_amortissement):
    """
    Calcule le coût PPAP pour 1000 pièces.
    Formule : (PPAP_Total / Quantité_Amortissement) × 1000
    """
    if cout_ppap_total is None or quantite_amortissement is None:
        return 0
    if cout_ppap_total == 0 or quantite_amortissement == 0:
        return 0
    return (float(cout_ppap_total) / float(quantite_amortissement)) * 1000


def calculer_lta(prix_sop, annee, reduction):
    """
    Calcule le prix LTA (Long Term Agreement) après réduction annuelle.
    Formule : Prix_SOP × (1 - Réduction)^Année
    """
    if prix_sop is None:
        return 0
    return float(prix_sop) * ((1 - float(reduction) / 100) ** annee)


def arrondir(valeur, decimales=2):
    """
    Arrondit une valeur à un nombre donné de décimales.
    """
    if valeur is None:
        return 0
    return round(float(valeur), decimales)