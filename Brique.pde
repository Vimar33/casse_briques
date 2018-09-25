class Brique {
  float x;
  float y;
  float largeur;
  float hauteur;
  color couleur;

  Brique(float x, float y, float largeur, float hauteur, color couleur) {
    this.x = x;
    this.y = y;
    this.largeur = largeur;
    this.hauteur = hauteur;
    this.couleur = couleur;
  }

  void dessiner() {
    fill(this.couleur);
    noStroke();
    rect(this.x, this.y, this.largeur, this.hauteur);
  }
}