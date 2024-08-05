/*Write a Program to show swap of two No's without using third variable.*/

void main()
{
  var a=10,b=20;
  
  print("swap to a and b : $a $b");

  a = a + b;
  b = a - b;
  a = a - b;

  print("swap to a and b : $a $b");
}