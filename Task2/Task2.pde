boolean happy = false;
int a = 5;
int b = 5;


void setup() {
   if (iAmHappy())
   {
     println("I clap my hands");
   }
   else
   {
     println("I don't clap my hands"); 
   }
//Her "caller" jeg dem
Plus( 25,975);
STOREBOGSTAVER("Lang vej endnu!");
println(CAPS("Zygfcyrcycryx"));
}


boolean iAmHappy()
{
  // fill out what is missing here: 
 return(happy); 
}

int Plus(int a,int b)
{
 println(a + b);
 return(a + b);
}


String STOREBOGSTAVER(String ABC)
{
  println (ABC.toUpperCase());
  return (ABC.toUpperCase());
}  

boolean CAPS(String PQ)
{
  char O = PQ.charAt(0);
  if (Character.isUpperCase(O))
  {
    return true;
  }
  return false;
}
