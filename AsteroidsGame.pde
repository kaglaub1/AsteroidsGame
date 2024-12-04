Spaceship bob;
Stars stars;
boolean isAccelerating = false;
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperspace = false;

int countDown = 60;
void setup()
{
  size(500, 500);
  bob = new Spaceship();
  stars = new Stars();
  textSize(24);
}
void draw()
{
  if (!isHyperspace)
  {
    background(0);
  } else
  {
    fill(0, 0, 0, 10);
    stroke(0, 0, 0, 10);
    rect(0, 0, width, height);
    countDown--;
    if (countDown == 0)
    {
      isHyperspace = false;
    }
  }
  if (keyPressed == true && key == ' ') 
    countDown = 60;
  stars.show();
  bob.show(isHyperspace, countDown, isAccelerating);
  bob.move();
  if (isAccelerating == true)bob.accelerate(.1);
  if (isRotatingLeft == true)bob.turn(-5);
  if (isRotatingRight == true)bob.turn(5);
}
void keyPressed()
{
  if (key == 'w') isAccelerating = true;
  if (key == 'a') isRotatingLeft = true;
  if (key == 'd') isRotatingRight = true;
  if (key == ' ')
  {
    bob.setX((int)(Math.random() * width));
    bob.setY((int)(Math.random() * height));
    bob.setPointDirection((int)(Math.random() * 360));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    isHyperspace = true;
    countDown = 60;
  }
}
void keyReleased()
{
  if (key == 'w') isAccelerating = false;
  if (key == 'a') isRotatingLeft = false;
  if (key == 'd') isRotatingRight = false;
}
