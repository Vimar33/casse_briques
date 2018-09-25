class Balle {
  float x;
  float y;
  color couleur;
  float dep_x;
  float dep_y;
  float diametre;

  Balle(float x, float y, float diametre, color couleur, float dep_x, float dep_y) {
    this.x = x;
    this.y = y;
    this.diametre = diametre;
    this.couleur = couleur;
    this.dep_x = dep_x;
    this.dep_y = dep_y;
  }

  void deplacer() {
    this.x = this.x + this.dep_x;
    if (touche_droite() || touche_gauche()) {
      this.dep_x = -this.dep_x;
    }
    this.y = this.y - this.dep_y;
    if (touche_haut()) {
      this.dep_y = -this.dep_y;
    }
  }

  void casser_brique() {
    for (Brique b : liste) {
      if (touche_bas_brique(balle, b)) {
        liste.remove(b);
        this.dep_y = -this.dep_y;
        break;
      }
      if (touche_gauche_brique(balle, b)) {
        liste.remove(b);
        this.dep_x = -this.dep_x;
        break;
      }
      if (touche_droite_brique(balle, b)) {
        liste.remove(b);
        this.dep_x = -this.dep_x;
        break;
      }
      if (touche_joueur(balle, j)) {
        this.dep_y = -this.dep_y;
        break;
      }
    }
  }

  boolean touche_gauche() {
    return this.x<=bordure/2+this.diametre/2;
  }

  boolean touche_droite() {
    return this.x>=width-bordure/2-this.diametre/2;
  }

  boolean touche_bas() {
    return this.y>=height-bordure/2-this.diametre/2;
  }

  boolean touche_haut() {
    return this.y<=bordure/2+this.diametre/2;
  }
}