class Bullet extends Floater{
  
  public Bullet(Spaceship bob){
    myCenterX = bob.getX();
    myCenterY = bob.getY();
    myXspeed = bob.getXspeed();
    myYspeed = bob.getYspeed();
    myPointDirection = bob.getPointDirection();
  }
  
  public void shoot(){
    accelerate(6);
  }
  public void show(){
    fill(255, 0, 0);
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
  
  public int getX() {
    return (int)myCenterX;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;
    
  }
}
