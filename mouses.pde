
PVector b=new PVector(0, 0);  
PVector c=new PVector(0, 0);

public void mouseReleased() {

  //println(b,c);
  c.x=b.x;
  c.y=b.y;
  // println(b, c);

  if (state!=0) {
    pantalla=0;
  }
}
void mousePressed() {
  loop();
  if (pantalla!=0&&pantalla!=4) {
    String var1= new String("data/nivel");
    String var2= new String(".1.csv");    
    String var3= new String(".2.csv");    
    String var4= new String(".3.csv");
    String cadena1=  var1 + Integer.toString(pantalla)+ var2;
    String cadena2=  var1 + Integer.toString(pantalla)+ var3;
    String cadena3=  var1 + Integer.toString(pantalla)+ var4;
    niveles[pantalla-1] = new Grafo(loadTable(cadena1), loadTable(cadena2), #040F0F);
    soluciones[pantalla-1] = new Grafo(loadTable(cadena1), loadTable(cadena3), #FCFFFC);
    referencia_c=loadTable(cadena2);
    println("e",(mouseY-25)/50, (mouseX-50)/100);
    
      if (referencia.getInt((mouseY-(height/20))/(height/10), (mouseX-(width/20))/(width/10))!=0) {

      if (b.x==0&&b.y==0) {
        b.set(mouseX, mouseY);
        proceso=loadTable(cadena3);
      }


      if (b.x!=0&&b.y!=0&&c.x!=0&&c.y!=0) {
        if (referencia_c.getInt(ref_cont[(mouseX-(width/20))/(width/10)][(mouseY-(height/20))/(height/10)]-1, 
          ref_cont[((int(c.x)-(width/20))/(width/10))][((int(c.y)-(height/20))/(height/10))]-1)!=0) {
          b.set(mouseX, mouseY);
          
          int s=proceso.getInt(ref_cont[((int(b.x)-(width/20))/(width/10))][((int(b.y)-(height/20))/(height/10))]-1, 
            ref_cont[((int(c.x)-(width/20))/(width/10))][((int(c.y)-(height/20))/(height/10))]-1); 
          proceso.setInt(ref_cont[((int(b.x)-(width/20))/(width/10))][((int(b.y)-(height/20))/(height/10))]-1, 
            ref_cont[((int(c.x)-(width/20))/(width/10))][((int(c.y)-(height/20))/(height/10))]-1, s+1);

          s= proceso.getInt(ref_cont[((int(c.x)-(width/20))/(width/10))][((int(c.y)-(height/20))/(height/10))]-1, 
            ref_cont[((int(b.x)-(width/20))/(width/10))][((int(b.y)-(height/20))/(height/10))]-1);
          proceso.setInt(ref_cont[((int(c.x)-(width/20))/(width/10))][((int(c.y)-(height/20))/(height/10))]-1, 
            ref_cont[((int(b.x)-(width/20))/(width/10))][((int(b.y)-(height/20))/(height/10))]-1, s+1);
          boolean res=true;
          boolean mal=false;
          for (int i = 0; i < referencia_c.getRowCount(); i++) {
            for (int j = 0; j <  referencia_c.getRowCount(); j++) {
              res=(referencia_c.getInt(i, j)==proceso.getInt(i, j))&&res;              
              mal=(referencia_c.getInt(i, j)<proceso.getInt(i, j)||mal);
            }
          }
          if (res) {
            state=1;
          }
          if (mal) {
            state=3;
          }
          if (state!=0) {
            for (int i = 0; i <  referencia_c.getRowCount(); i++) {
              for (int j = 0; j <  referencia_c.getRowCount(); j++) {
                proceso.setInt(i, j, 0);
                if (state==1) {
                  pushStyle();
                  textAlign(CENTER);
                  fill(#7CDF64);
                  textSize(70);
                  text("Ganaste", width/2, height/2);
                  win[pantalla-1]=1;
                  popStyle();
                  noLoop();
                } else if (state==3) {
                  pushStyle();
                  textAlign(CENTER);
                  fill(#772E25);
                  textSize(70);
                  text("Perdiste", width/2, height/2);
                  popStyle();
                  noLoop();
                }
              }
            }
          }
          saveTable(proceso, cadena3);
        }
      }
      soluciones[pantalla-1] = new Grafo(loadTable(cadena1), loadTable(cadena3), #FCFFFC);
    }
  }
}
