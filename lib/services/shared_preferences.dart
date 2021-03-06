import 'package:shared_preferences/shared_preferences.dart';
import 'package:databank/databank_global_variables.dart';

class ShareFavourites {
  Future saveSettingsData() async {
    final prefs = await SharedPreferences.getInstance();

    final workersNumberKey = "saveWorkersNumber";
    final letPersonalDataKey = "savePersonalData";

    await prefs.setInt(workersNumberKey, workersNumber);
    await prefs.setBool(letPersonalDataKey, letPersonalData);
  }

  Future readData() async {
    final prefs = await SharedPreferences.getInstance();

    final workersNumberKey = "saveWorkersNumber";
    final letPersonalDataKey = "savePersonalData";

    workersNumber = prefs.getInt(workersNumberKey).toInt() ?? "";
    letPersonalData = prefs.getBool(letPersonalDataKey) ?? "";
  }
}
