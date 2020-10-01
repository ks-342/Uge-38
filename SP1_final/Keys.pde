class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean upDown = false;
  private boolean downDown = false;
  private boolean leftDown = false;
  private boolean rightDown = false;
  private boolean spaceDown = false;
  
  public Keys(){}
  
  public boolean wDown()
  {
    return wDown;
  }
  
  public boolean aDown()
  {
    return aDown;
  }
  
  public boolean sDown()
  {
    return sDown;
  }
  
  public boolean dDown()
  {
    return dDown;
  }
  public boolean upDown()
  {
    return upDown;
  }
  
  public boolean downDown()
  {
    return downDown;
  }
  
  public boolean leftDown()
  {
    return leftDown;
  }
  
  public boolean rightDown()
  {
    return rightDown;
  }
  public boolean spaceDown()
  {
    return spaceDown;
  }
  
  void onKeyPressed(char ch, int code)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = true;
    }
    if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    }
    if(ch == 'S' || ch == 's')
    {
      sDown = true;
    }
    if(ch == 'D' || ch == 'd')
    {
      dDown = true;
    }
    if(code==UP)
    {
      upDown = true;
    }
    if(code==DOWN)
    {
      downDown = true;
    }
    if(code==LEFT)
    {
      leftDown = true;
    }
    if(code==RIGHT)
    {
      rightDown = true;
    }
    if(ch == ' ')
    {
      spaceDown = true;
    }
  }
  
  void onKeyReleased(char ch, int code)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = false;
    }
    if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    }
    if(ch == 'S' || ch == 's')
    {
      sDown = false;
    }
    if(ch == 'D' || ch == 'd')
    {
      dDown = false;
    }
    if(code==UP)
    {
      upDown = false;
    }
      if(code==DOWN)
    {
      downDown = false;
    }
    if(code==LEFT)
    {
      leftDown = false;
    }
    if(code==RIGHT)
    {
      rightDown = false;
    }
    if(ch == ' ')
    {
      spaceDown = false;
    }
  }
}
