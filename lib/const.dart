import 'package:intl/intl.dart';

final barDateFormat = DateFormat('yMd');
final dateFormat = DateFormat ('yyyy-MM-dd');
final hourminutesFormat = DateFormat('HH:mm');

int coachMAX = 6;
int seatMAX = 20; //Per coach

//Fees for train routes
double route16 = 120.30;
double route25 = 125.20;
double route34 = 100.70;

List<String> GenerateAlphabets (){
  var aCode = 'A'.codeUnitAt(0);
  var zCode = 'Z'.codeUnitAt(0);
  return List<String>.generate(
    zCode - aCode + 1,
    (index) => String.fromCharCode(aCode + index),
  );
}