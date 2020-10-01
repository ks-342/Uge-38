import java.util.Random;

class Game
{
  private Random rnd;
  private final int width;
  private final int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int player2Life;
  private int playerScore;
  private int player2Score;
  private Dot player;
  private Dot player2;
  private Dot[] food;
  private Dot[] enemies;
  
   
  Game(int width, int height, int numberOfEnemies,int numberOfLives,int numberOfFood)
  {
    if(width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if(numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    resetGame(numberOfEnemies,numberOfLives,numberOfFood); // enemies,life
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getPlayerLife()
  {
    return playerLife;
  }
  public int getPlayer2Life()
  {
    return player2Life;
  }
  public void setPlayerLife(int life)
  {
    playerLife = life;
  }
  public void setPlayerLife2(int life)
  {
    player2Life = life;
  }  public int getPlayerScore()
  {
    return playerScore;
  }
  public int getPlayer2Score()
  {
    return player2Score;
  }

  public void resetGame(int numberOfEnemies,int life, int numberOfFood)
  {
    player = new Dot(0,0,width-1, height-1);
    player2 = new Dot(0,0,width-1, height-1);
    enemies = new Dot[numberOfEnemies];
    food = new Dot[numberOfFood];
    for(int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    for(int i = 0; i < numberOfFood; ++i)
    {
      food[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    this.playerLife = life;
    this.player2Life = life;
    this.playerScore = 0;
    this.player2Score = 0;
  }
  
  public void onKeyPressed(char ch, int code)
  {
    keys.onKeyPressed(ch, code);
  }
  
  public void onKeyReleased(char ch, int code)
  {
    keys.onKeyReleased(ch, code);
  }
  
  public void update()
  {
    updatePlayer();
    updatePlayer2();
    updateFood();
    updateEnemies();
    checkForCollisions();
    clearBoard();
    populateBoard();
  }
  
  
  
  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }
  
  private void clearBoard()
  {
    for(int y = 0; y < height; ++y)
    {
      for(int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }
  
  private void updatePlayer()
  {
    //Update player
    if(keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if(keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if(keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if(keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }
  }
  private void updatePlayer2()
  {
    //Update player2
    if(keys.upDown() && !keys.downDown())
    {
      player2.moveUp();
    }
    if(keys.leftDown() && !keys.rightDown())
    {
      player2.moveLeft();
    }
    if(keys.downDown() && !keys.upDown())
    {
      player2.moveDown();
    }
    if(keys.rightDown() && !keys.leftDown())
    {
      player2.moveRight();
    }
  }
  
  private void updateEnemies()
  {
    for(int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        int dx2 = player2.getX() - enemies[i].getX();
        int dy2 = player2.getY() - enemies[i].getY();
        
        if((dx) < (dx2))
        {
          //chase p1
          if (abs(dx)>abs(dy))
          {
            if(dx > 0)
            {
              //Player is to the right
              enemies[i].moveRight();
            }
            else
            {
              //Player is to the left
              enemies[i].moveLeft();
            }
          }
          else if(dy > 0)
          {
            //Player is down;
            enemies[i].moveDown();
          }
          else
          {          
            //Player is up;
            enemies[i].moveUp();
          }         
        }
        else
        {
          if (abs(dx2)>abs(dy2))
          {
            //chase p2
            if(dx2 > 0)
            {
              //Player2 is to the right
              enemies[i].moveRight();
            }
            else
            {
              //Player2 is to the left
              enemies[i].moveLeft();
            }
          
            if(dy2 > 0)
            {
              //Player2 is down;
              enemies[i].moveDown();
            }
            else
            {          
              //Player2 is up;
              enemies[i].moveUp();
            }
          }
        }
      }
      else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          //Move right
          enemies[i].moveRight();
        }
        else if(move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        }
        else if(move == 2)
         {
          //Move up
          enemies[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }
  
  private void updateFood()
  {
    for(int i = 0; i < food.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = 0, dy = 0, dx2 = 0, dy2 = 0;
        if(i < food.length/2){
          dx2 = player2.getX() - food[i].getX();
          dy2 = player2.getY() - food[i].getY();
        }else{
          dx = player.getX() - food[i].getX();
          dy = player.getY() - food[i].getY();
        }
        if(abs(dx) > abs(dy) || abs(dx2) > abs(dy2))
        {
          if(dx > 0 || dx2 > 0)
          {
            //Player is to the right
            food[i].moveLeft();
          }
          else
          {
            //Player is to the left
            food[i].moveRight();
          }
        }
        else if(dy > 0 || dy2 > 0)
        {
          //Player is down;
          food[i].moveUp();
        }
        else
        {//Player is up;
          food[i].moveDown();
        }
      }
      else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          //Move right
          food[i].moveRight();
        }
        else if(move == 1)
        {
          //Move left
          food[i].moveLeft();
        }
        else if(move == 2)
        {
          //Move up
          food[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }

  private void populateBoard()
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    board[player2.getX()][player2.getY()] = 4;
    //Insert enemies
    for(int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    for(int i = 0; i < food.length; ++i)
    {
      board[food[i].getX()][food[i].getY()] = 3;
    }
  }
   
  private void checkForCollisions()
  {
    //Check enemy collisions
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        //We have a collision
        --playerLife;
      }
      if(enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY())
      {
        //We have a collision
        --player2Life;
      }
    }
    for(int i = 0; i < food.length; ++i)
    {
      if(food[i].getX() == player.getX() && food[i].getY() == player.getY())
      {
        //We have a collision
        food[i].setX(rnd.nextInt(width-1));
        food[i].setY(rnd.nextInt(height-1));
        ++playerScore;
      }
      if(food[i].getX() == player2.getX() && food[i].getY() == player2.getY())
      {
        //We have a collision
        food[i].setX(rnd.nextInt(width-1));
        food[i].setY(rnd.nextInt(height-1));
        ++player2Score;
        
      }
    }
  }
}
