void main() {
// Traditional if/else statement
int x = 10;
if (x < 100) {
  print('Yes');
} else {
  print('No');
}
// Dart also supports ternaries
String response = (x < 100) ? 'Yes' : 'No';
String name;
// If name is set, use it. Otherwise use 'No name given'
String res = name ?? 'No name given';

//aka "Elvis operator". If the object is non-null, evaluate 
//the property. Prevents null exceptions from throwing.
print(name?.length);

}