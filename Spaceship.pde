class Spaceship extends Floater
{
  public Spaceship() {
    corners = 3;
    xCorners = new int[corners];
    xCorners[0] = 0;
    xCorners[1] = -8;
    xCorners[2] = -8;
    yCorners = new int[corners];
    yCorners[0] = 15;
    yCorners[1] = 8;
    yCorners[2] = -8;
    myColor = color(255, 255, 255);
    myCenterX = myCenterY = 250; //holds center coordinates
    myXspeed = myYspeed = 0; //holds x and y coordinates of the vector for direction of travel
    myPointDirection = 0;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myXspeed = x;
  }
  public double getDirectionX() {
    return myXspeed;
  }
  public void setDirectionY(double y) {
    myYspeed = y;
  }
  public double getDirectionY() {
    return myYspeed;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void show (boolean isHyperspace, int countDown, boolean jets)
  {  
    //Draws the floater at the current position
    if (isHyperspace == false)
    {
      fill(myColor);
      stroke(myColor);
    } else
    {
      fill(255, 255, 255, 60 - countDown);
      stroke(255, 255, 255, 60 - countDown);
    }
    //convert degrees to radians for sin and cos     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    translate((float)myCenterX, (float)myCenterY);
    rotate(dRadians);
    rotate(-(float)Math.PI/2);
    fill(230);
    noStroke();
    triangle(0, 15, -10, -15, 10, -15);
    fill(0);
    triangle(0, -10, -10, -15, 10, -15);
    fill(230);
    triangle(10, -15, 0, 15, 5, -20);
    triangle(-10, -15, 0, 15, -5, -20);
    
    if(jets)
    {
      stroke(#74DBFF);
      strokeWeight(2);
      noFill();
      ellipse(0, -15, 7, 4);
      ellipse(0, -20, 9, 4);
      ellipse(0, -25, 11, 4);
    }
    rotate((float)Math.PI/2);

    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
