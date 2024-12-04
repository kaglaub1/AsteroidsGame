class Stars
{
  int x[];
  int y[];
  int s[];
  int c[];
  Stars()
  {
    x = new int[200];
    y = new int[200];
    s = new int[200];
    c = new int[200];
    for (int i = 0; i< 200; i++)
    {
      x[i] = (int)(Math.random() * width);
      y[i] = (int)(Math.random() * width);
      s[i] = (int)(Math.random() * 3) + 2;
      c[i] = 255;
    }
  }
  void show()
  {

    for (int i = 0; i< 200; i++)
    {
      stroke(c[i]);
      strokeWeight(s[i]);
      point(x[i], y[i]);
    }
    strokeWeight(1);
  }
}
