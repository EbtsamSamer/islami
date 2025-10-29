
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/models/prayer_rersponse_model.dart';
class ApiManager {
 static Future<PrayerRersponseModel>getPrayingDate() async{
    //String date= DateFormat("dd-MM-yyyy").format(DateTime.now());
    try{
      Uri uri = Uri.parse(
        "https://api.aladhan.com/v1/timingsByCity/16-07-2024?city=cairo&country=egypt",
      );
      var response= await http.get(uri);
      var jsonResponse=jsonDecode(response.body);
      return PrayerRersponseModel.fromJson(jsonResponse);
    }catch(e){
      rethrow;
    }
  }
}
