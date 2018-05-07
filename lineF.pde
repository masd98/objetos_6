class Line_f extends Line {
  Node origin1, end1;
  color cv;

  Line_f(Node node1, Node node2, color col) {
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
    line(a, b, c, d);

    popStyle();
  }
}
