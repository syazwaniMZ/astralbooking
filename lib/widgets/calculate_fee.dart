import "package:astralbooking/const.dart";

double calcFee(String destA, String destB)
{
  String route = "$destA-$destB";

  if(route.contains(locationID['MW'] as Pattern) &&
  route.contains(locationID['AD'] as Pattern))
  {
      return MWAD;
  }
  else if(route.contains(locationID['AD'] as Pattern) &&
  route.contains(locationID['WP'] as Pattern))
  {
      return ADWP;
  }
  else if(route.contains(locationID['WP'] as Pattern) &&
  route.contains(locationID['MW'] as Pattern))
{
      return WPMW;
  }
  else {
    return 0;
  } 
}
