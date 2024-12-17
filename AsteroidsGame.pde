Spaceship bob;
Stars stars;
ArrayList <Asteroids> rock = new ArrayList<Asteroids>();
ArrayList <Bullet> pew = new ArrayList<Bullet>();
boolean isAccelerating = false;
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperspace = false;
int health = 100;
int score = 0;
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
    for (int i = 0; i < pew.size(); i++){
      pew.get(i).move();
      pew.get(i).show();
      if (pew.get(i).getX() >= 800 || pew.get(i).getX() <= 0 || pew.get(i).getY() >= 800 || pew.get(i).getY() <= 0){
        pew.remove(i);
      }
     
    }
    //check hit
    for (int x = 0; x < rock.size(); x++){
      for (int i = 0; i < pew.size(); i++){
        if (Math.abs(pew.get(i).getX() - rock.get(x).getX()) <= 40 && Math.abs(pew.get(i).getY() - rock.get(x).getY()) <= 40){
          rock.remove(x);
          rock.add(0, new Asteroids((float)(Math.random()*3)-1, (float)(Math.random()*3)-1, (float)(Math.random()*0.05)-0.02));
          pew.remove(i);
          score += 1;
          break;
        }
      }
    }
    for (int i = 0; i < rock.size(); i++){
      if (Math.abs(bob.getX() - rock.get(i).getX()) <= 40){
        if (Math.abs(bob.getY() - rock.get(i).getY()) <= 40){
          rock.remove(i);
          health -= 5;
          rock.add(0, new Asteroids((float)(Math.random()*3)-1, (float)(Math.random()*3)-1, (float)(Math.random()*0.05)-0.02));
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
  fill(230);
  noStroke();
  textSize(20);
  textAlign(LEFT);
  text("Score: " + score, 10, 25);
  rect(390, 8, 104, 30);
  fill(255, 0, 0);
  rect(392, 10, health, 26);
  if (health <= 0){
    textSize(50);
    textAlign(CENTER);
    fill(0);
    rect(0, 0, 500, 500);
    fill(255, 0, 0);
    text("YOU LOSE", 250, 230);
    textSize(30);
    fill(230);
    text("Your score: " + score, 250, 270);
    for (int i = 0; i < pew.size(); i++){
      pew.remove(0);
    }
  }
}

void keyPressed()
{
  if (key == 'w') isAccelerating = true;
  if (key == 'a') isRotatingLeft = true;
  if (key == 'd') isRotatingRight = true;
  if (key == 'f' && health > 0){
    pew.add(0, new Bullet(bob));
    pew.get(0).shoot();
  }
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
