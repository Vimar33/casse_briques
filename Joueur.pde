class Joueur {
  float x;
  float y;
  float largeur;
  float hauteur;
  color couleur;

  Joueur(float x, float y, float largeur, float hauteur, color couleur) {
    this.x = x;
    this.y = y;   
    this.largeur = largeur;
    this.hauteur = hauteur;
    this.couleur = couleur;
  }
  
  void deplacer() {
    this.x = mouseX;
    if(mouseX<=bordure/2) {
      this.x = bordure/2;
    }
    if(mouseX+this.largeur>=width-bordure/2) {
      this.x = width-bordure/2-this.largeur;
    }
  }
}