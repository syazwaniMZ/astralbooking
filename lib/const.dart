import 'package:intl/intl.dart';

final barDateFormat = DateFormat('yMd');
final dateFormat = DateFormat ('yyyy-MM-dd');
final hourminutesFormat = DateFormat('HH:mm');

const int coachMAX = 6;
int seatMAX = 20; //Per coach

const Map<String,String> locationID = {
  'MW' : "Milky Way",
  'AD' : "Andromeda",
  'WP' : "Whirpool"
};

Map destToID = locationID.map((k, v) => MapEntry(v, k));

//Fees for train routes irrespective of direction
const double MWAD = 20.30; // Milkyway - Andromeda
const double ADWP = 25.20; // Andromeda - Whirpool
const double WPMW = 30.70; // Whirpool - Milkyway

List<String> GenerateAlphabets (){
  var aCode = 'A'.codeUnitAt(0);
  var zCode = 'Z'.codeUnitAt(0);
  return List<String>.generate(
    zCode - aCode + 1,
    (index) => String.fromCharCode(aCode + index),
  );
}
