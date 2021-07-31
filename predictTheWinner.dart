import 'dart:math';
import 'dart:io';

bool theWinner(List<int> integers){
  if(integers == null){
    return true;
  }
  
  int len = integers.length;
  if(len == 1){
    return true;
  }
 
  var dp = List.generate(len, (_) => new List(len) , growable: false);
  int p2;
  
  for (var g = 0; g < dp.length ; g++){
    for(var i = 0 , j = g; j < dp.length; i++, j++){
      if(g == 0){
        dp[i][j] = integers[i];
      }else if(g == 1){
        dp[i][j] = max(integers[i], integers[j]);
      }else{
        int val1 = integers[i] + min(dp[i+1][j-1], dp[i+2][j]);
        int val2 = integers[j] + min(dp[i+1][j-1], dp[i][j-2]);
        p2 = min(val1, val2);
        dp[i][j] = max(val1, val2);
      }
      
    }
  }
  dp.forEach((row) => print(row));
  if(p2 < dp[0][integers.length -1]){
    return true;
  }else{
    return false;
  }
 
} 

void main() {
  
  int n = int.parse(stdin.readLineSync());
  List<int> integers = new List();
  for(int i = 0; i < n; i++){
    int value = int.parse(stdin.readLineSync());
    integers.add(value);
  }
  print(theWinner(integers));
  
   

}
