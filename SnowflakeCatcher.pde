Snowflake [] raul = new Snowflake [100];
int h=0;
void setup()
{
  size (500,500);
  background (0);
    for (int i=0; i<100; i++)
    {
      raul[i]= new Snowflake();
    }
}
void draw()
{
  for (int i=0; i<100; i++)
  {
    if (raul[i].isMoving == false)
    {
      raul[i]= new Snowflake ();
    }
    raul[i].erase();
    raul[i].lookDown();
    raul[i].move();
    raul[i].wrap();
    raul[i].show();
  }
  if (mousePressed)
    mouseDragged();
  if (keyPressed == true && key== 'r')
    background(0);

}
void mouseDragged()
{
  noStroke();
  fill (228,216,59);
  ellipse (mouseX, mouseY, 10,10);
}

class Snowflake
{
  int x,y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501)-500;
    isMoving = true;
  }
  void show()
  {
    noStroke ();
    fill (255);
    ellipse(x,y,5,5);
    quad (x-7, y, x+7, y, x, y+3, x, y-3);
    quad (x, y-7,x,y+7, x+3, y, x-3, y);
  }
  void lookDown()
  {
    if ((y>0 && y<500)&&(get(x,y+8)!=color(0)))
    {
      isMoving = false;
    }
    else isMoving = true;
  }
  void erase()
  {
    fill (0);
    ellipse (x,y,14,14);
  }
  void move()
  {
    if (isMoving)
    {
      y+=1.5;
    }
  }
  void wrap()
  {
    if (y==499)
    {
      y=0;
      x=(int)(Math.random()*501);
    }
  }
}


