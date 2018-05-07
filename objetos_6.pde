Grafo[] niveles;
Grafo[] soluciones;
int total, state;
int pantalla;
Table proceso;
int[] win;

void setup() {
  size(600, 600);
  total = 3;
  niveles = new Grafo[total];
  soluciones = new Grafo[total];
  win= new int[total];
  for (int i = 0; i < niveles.length; i++) {
    String var1= new String("data/nivel");
    String var2= new String(".1.csv");    
    String var3= new String(".2.csv");    
    String var4= new String(".3.csv");
    String cadena1=  var1 + Integer.toString(i+1)+ var2;
    String cadena2=  var1 + Integer.toString(i+1)+ var3;
    String cadena3=  var1 + Integer.toString(i+1)+ var4;

    niveles[i] = new Grafo(loadTable(cadena1), loadTable(cadena2), #040F0F);
    soluciones[i] = new Grafo(loadTable(cadena1), loadTable(cadena3), #FCFFFC);
  }
}

void draw() {
  if (pantalla==0) {
    home();
  } else if (pantalla==1) {
    nivel1();
  } else if (pantalla==2) {
    nivel2();
  } else if (pantalla==3) {
    nivel3();
  }else if (pantalla==4) {
    creador();
  }
  if (pantalla!=0) {
    strokeWeight(5);
    if (b.x!=0&&b.y!=0) {
      line(c.x, c.y, mouseX, mouseY);
    }
  }
}
