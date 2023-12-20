import 'dart:io';

bool winner=false;
bool isxturn=true;
int movecount=0;
 

List<String> value=['1','2','3','4','5','6','7','8','9'];
List<String> combination=['012','048','036','147','246','258','345','678'];


void main() {
  generarte_board();
  get_char();
}


bool check_combination(String combination,String check){
  List<int>numbers=combination.split('').map((item){
   return int.parse(item); 
  }).toList();
  
  bool match=false;
  for(final item in numbers){
   if(value[item]==check){
     match=true;
   }
    else{
      match=false;
      break;
    }
  }
  return match;
}

void check_winner(player){
  for(final item in combination){
    bool combination_validity=check_combination(item, player);
    if(combination_validity==true){
      print('$player won ....');
      winner=true;
      break;
    }
  }
}
  
 void get_char(){
   print("choose number for ${isxturn==true? 'X':'O'}");
   int number=int.parse(stdin.readLineSync()!);
   value[number-1]=isxturn? 'X':'O';
   isxturn=!isxturn;
   movecount++;
   if(movecount==9){
    winner=true;
     print('DRAW ....');
   }
   else{
     generarte_board();
   }
   check_winner('X');
   check_winner('O');
   if(winner==false){
     get_char();
   }
 } 

 void generarte_board(){
   print('cna cod ing');
   print('|  |  |  |');
   print('|${value[0]} | ${value[1]}| ${value[2]}|');
   print('|__|__|__|');
   print('|  |  |  |');
   print('|${value[3]} | ${value[4]}| ${value[5]}|');
   print('|__|__|__|');
   print('|  |  |  |');
   print('|${value[6]} | ${value[7]}| ${value[8]}|');
   print('|__|__|__|');
 }

