//VARIABLES

//Image de fond
PImage fond;
//Bordure jeu
int bordure = 100;
//Liste de briques
ArrayList<Brique> liste = new ArrayList<Brique>();
//Balle
Balle balle;
//Joueur
Joueur j = new Joueur(725, 700, 150, 10, color(128, 128, 128));

//FONCTIONS BOOLEENNES

//Collision bas brique
boolean touche_bas_brique(Balle balle, Brique b) {
  return ((balle.dep_y>0)&&(get((int)balle.x, (int)(balle.y-balle.diametre/2))==b.couleur));
}

//Collision haut brique
boolean touche_haut_brique(Balle balle, Brique b) {
  return ((balle.dep_y<0)&&(get((int)balle.x, (int)(balle.y+balle.diametre/2))==b.couleur));
}

//Collision droite brique
boolean touche_droite_brique(Balle balle, Brique b) {
  return ((balle.dep_x>0)&&(get((int)(balle.x+balle.diametre/2), (int)balle.y)==b.couleur));
}

//Collision gauche brique
boolean touche_gauche_brique(Balle balle, Brique b) {
  return ((balle.dep_x<0)&&(get((int)(balle.x-balle.diametre/2), (int)balle.y)==b.couleur));
}

//Collision joueur
boolean touche_joueur(Balle balle, Joueur j) {
  return (get((int)balle.x, (int)(balle.y+balle.diametre/2))==j.couleur);
}

//Partie en cours
boolean partie_en_cours() {
  return balle.y<height-bordure && liste.size()!=0;
}


void settings() {
  size(displayWidth, 9*displayHeight/10);
  fond = loadImage("/Images/fond.jpg");
  fond.resize(width, height);
  //Création des briques
  for (int i = 0; i<5; i++) {
    Brique b1 = new Brique(bordure/2, height/10+height/20*(i+1), (width-bordure)/5, height/20, color(0, 135+i*30, 0));
    liste.add(b1);
    Brique b2 = new Brique(bordure/2+(width-bordure)/5, height/10+height/20*(i+1), (width-bordure)/5, height/20, color(135+30*i, 0, 0));
    liste.add(b2);
    Brique b3 = new Brique(bordure/2+2*(width-bordure)/5, height/10+height/20*(i+1), (width-bordure)/5, height/20, color(0, 0, 135+30*i));
    liste.add(b3);
    Brique b4 = new Brique(bordure/2+3*(width-bordure)/5, height/10+height/20*(i+1), (width-bordure)/5, height/20, color(135+30*i, 135+30*i, 0));
    liste.add(b4);
    Brique b5 = new Brique(bordure/2+4*(width-bordure)/5, height/10+height/20*(i+1), (width-bordure)/5, height/20, color(0, 135+30*i, 135+30*i));
    liste.add(b5);
  }
  //Création de la balle
  balle = new Balle(width/2, (height-bordure)-(height/5), 50, color(255), 5, 5);
}

void draw() {
  //Dessin de l'espace de jeu
  background(fond);
  strokeWeight(bordure);
  stroke(0);
  noFill();
  rect(0, 0, width, height);

  if (partie_en_cours()) {
    //Dessin des briques
    for (Brique b : liste) {
      b.dessiner();
    }
    //dessin de la balle
    strokeWeight(2);
    fill(balle.couleur);
    stroke(0);
    ellipse(balle.x, balle.y, balle.diametre, balle.diametre);

    //dessin du joueur
    fill(j.couleur);
    rect(j.x, j.y, j.largeur, j.hauteur);

    //mouvement de la balle
    balle.deplacer();

    //collision avec une brique
    balle.casser_brique();

    //déplacement joueur
    j.deplacer();
  } else {
    if (balle.y>=height-bordure) {
      //Partie perdue
      //Affichage du message
      textAlign(CENTER);
      textSize(100);
      fill(255, 0, 0);
      text("Perdu", width/2, height/2+height/20);
    }
    if (liste.size()==0) {
      //Partie gagnée
      //Affichage du message
      textAlign(CENTER);
      textSize(100);
      fill(0, 255, 0);
      text("Gagné", width/2, height/2+height/20);
    }
  }
}