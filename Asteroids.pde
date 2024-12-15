
class Asteroids extends Floater{
  float rot;
  public Asteroids(float x, float y, float r){
    corners = 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = (int)(Math.random()*10)-30;
    yCorners[0] = (int)(Math.random()*10)-30;
    xCorners[1] = (int)(Math.random()*10)+30;
    yCorners[1] = (int)(Math.random()*10)-30;
    xCorners[2] = (int)(Math.random()*25)+35;
    yCorners[2] = 0;
    xCorners[3] = (int)(Math.random()*10)+30;
    yCorners[3] = (int)(Math.random()*10)+30;
    xCorners[4] = (int)(Math.random()*10)-30;
    yCorners[4] = (int)(Math.random()*10)+30;
    xCorners[5] = (int)(Math.random()*25)-35;
    yCorners[5] = 0;
    xCorners[6] = xCorners[0];
    yCorners[6] = yCorners[0];
    rot = r;
    myColor = (int)(Math.random()*30)+40;
    
    myPointDirection = 0;
    myXspeed = x;
    myYspeed = y;
    myCenterY = 20;
    myCenterX = 20;
  }
  public void show(){
    translate((float)myCenterX, (float)myCenterY);
    rotate((float)myPointDirection);
    fill(myColor);
    noStroke();
    beginShape();
    for (int i = 0; i < corners; i++){
      vertex(xCorners[i], yCorners[i]);
    }
    endShape();
    
    
    rotate(-(float)myPointDirection);
    translate(-(float)myCenterX, -(float)myCenterY);
  }
  public void turn ()   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=rot;   
  }
  public int getX() {
    return (int)myCenterX;
  }
  public int getY() {
    return (int)myCenterY;
  }
}
