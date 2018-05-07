class Line_p extends Line {
  Node origin1, end1;
  color cv;

  Line_p(Node node1, Node node2, color col) {
    origin=node1;
    end=node2;
    cv=col;
  }

  @Override
    Node pick(Node origin1) {
    return origin;
  }

  @Override
    Node pick2(Node end1) {
    return end;
  }

  @Override
    color pick3(color col) {
    return cv;
  }

  void display() {
    a=origin().position().x;
    b=origin().position().y;
    c=end().position().x;
    d=end().position().y;

    pushStyle();
    strokeWeight(3);
    stroke(cv);

    float m=(d-b)/(c-a);
    m = m<0 ? -m :m;
    if (b==d) {
      if (a<c) {
        while (a<c) {
          line(a, b, a+10, d);
          a=a+20;
        }
      } else if (c<a) {
        while (c<a) {
          line(c, b, c+10, d);
          c=c+20;
        }
      }
    } else if  (a==c) {
      if (b<d) {
        while (b<d) {
          line(a, b, c, b+10);
          b=b+20;
        }
      } else if (d<b) {
        while (d<b) {
          line(a, d, c, d+10);
          d=d+20;
        }
      }
    } else if (a<c&&b<d) {
      while (a<c&&b<d) {
        line(a, b, a+(6), b+(6*m));
        //println(a,b);
        a=a+13;
        b=b+13*m;
      }
    } else if (a<c&&d<b) {
      while (a<c&&d<b) {
        line(a, b, a+(6), b-(6*m));
        println(a, d);
        a=a+13;
        b=b-13*m;
      }
    } else if (c<a&&b<d) {
      while (c<a&&b<d) {
        line(a, b, a-(6), b+(6*m));
        //println(a,b);
        a=a-13;
        b=b+13*m;
      }
    } else if (c<a&&d<b) {
      while (a<c&&d<b) {
        pushStyle();
       tint(255, 127);
        line(a, b, a-(6), b-(6*m));
        //println(a, b);
        a=a-13;
        b=b-13*m;
        popStyle();
      }
    } else {  

      line(a, b, c, d);
    }
    popStyle();
  }
}
