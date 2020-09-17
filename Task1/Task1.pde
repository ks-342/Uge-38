void setup()
{
  emptyLine();
  parameter("Poul");
  name("Kim",37);
}

  
void emptyLine()
{
println(); 
}

void parameter(String a)
{
  println(a);
}
void name(String name,int age)
{
  println("my name is "+name+", i am "+age+" years old");
}
