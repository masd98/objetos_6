
abstract class Line {
  float a, b, c, d;
  Node origin, end;
  color colores;

  Line(Node node1, Node node2,color col) {
    origin = node1;
    end = node2;
    colores=col;
  }
Line(){
}

  abstract void display();
  
  abstract Node pick(Node origin);
  
  abstract Node pick2(Node end);
  
  abstract color pick3(color col);
   
  Node origin() {
    return origin;
  }

  Node end() {
    return end;
  }
}
