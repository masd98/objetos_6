void home() {
  state=0;
  b.x=0;
  b.y=0;
  c.x=0;
  c.y=0;
  background(255);

  textAlign(CENTER);
  fill(153, 0, 153);
  textSize(70);
  text("Juego Euclid", width/2, height/4);
  textSize(25);
  fill(153, 0, 76);
  text("Nivel 1", width/2, height*4/8);
  text("Nivel 2", width/2, height*5/8);
  text("Nivel 3", width/2, height*6/8);
  text("Creador", width/2, height*7/8);
  boolean winner=true;
  for (int i = 0; i < total; i++) {
    winner=win[i]==1&&winner;
  }
  if (winner) {
    background(255);
    textAlign(CENTER);
    fill(#000000);
    textSize(60);
    text("Eres el ", width/2, height/3);    
    text("mejor :D", width/2, height*2/3);
    textSize(25);
  }

  if (mousePressed) {
    if (mouseY>height*4/8-20&&mouseY<height*4/8+20) {
      pantalla=1;
    } else if (mouseY>height*5/8-20&&mouseY<height*5/8+20) {
      pantalla=2;
    } else if (mouseY>height*6/8-20&&mouseY<height*6/8+20) {
      pantalla=3;
    } else if (mouseY>height*7/8-20&&mouseY<height*7/8+20) {
      pantalla=4;
    }
  }
}

void nivel1() {
  background(237, 218, 230);
  niveles[0].display();
  soluciones[0].display();
}

void nivel2() {
  background(214, 245, 153);
  niveles[1].display();
  soluciones[1].display();
}

void nivel3() {    
  background(206, 154, 193);
  niveles[2].display();
  soluciones[2].display();
}
int crea1=0;
void creador() {    

  if (crea1==0) {
    pushStyle();
    textSize(45);
    background(255, 255, 255);
    text("Nivel 2", width/2, height*1/3);
    text("Nivel 3", width/2, height*2/3);
    popStyle();
  }
  if (mousePressed) {
    if (mouseY>height*1/-20&&mouseY<height*1/3+20) {
      crea1=1;
    } else if (mouseY>height*2/3-20&&mouseY<height*2/3+20) {
      crea1=2;
    }
  }
  float l,k,j,h;
  if (crea1!=0) {
    
    
    if (crea1==1) {
      background(255, 255, 255);
    } else if (crea1==2) {
      background(255, 255, 255);
    }
  }
}
