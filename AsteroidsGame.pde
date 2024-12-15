Spaceship bob;
Stars stars;
ArrayList <Asteroids> rock = new ArrayList<Asteroids>();
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
  for (int i = 0; i < 10; i++){
    rock.add(i, new Asteroids((float)(Math.random()*3)-1, (float)(Math.random()*3)-1, (float)(Math.random()*0.05)-0.02));
    rock.get(i).randomSpawn();  
}
  textSize(24);
}
void draw()
{
  
  if (!isHyperspace)
  {
    background(0);
    for (int i = 0; i < rock.size(); i++){
      rock.get(i).turn();
      rock.get(i).move();
      rock.get(i).show();
    }
    //check hit
    for (int i = 0; i < rock.size(); i++){
      if (Math.abs(bob.getX() - rock.get(i).getX()) <= 45){
        if (Math.abs(bob.getY() - rock.get(i).getY()) <= 45){
          rock.remove(i);
        }
      }
    }
    
  } else
  {
    fill(0, 0, 0, 10);
    stroke(0, 0, 0, 10);
    rect(0, 0, 800, 800);
    countDown--;
    if (countDown == 0)
    {
      isHyperspace = false;
    }
  }
  if (keyPressed == true && key == ' ') 
    countDown = 60;
  stars.show();
  for (int i = 0; i < rock.size(); i++)
    rock.get(i).show();
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
