import 'package:databank/services/networking.dart';
import 'package:databank/databank_global_variables.dart';

class WorkerModel {
  Future<dynamic> getWorkerData() async {
    final apiURL =
        'https://randomuser.me/api/?results=$workersNumber&inc=name,picture,nat,gender,phone,email,location,dob&noinfo';
    var workerData;

    NetworkHelper networkHelper = NetworkHelper(apiURL);
    workerData = await networkHelper.getData();

    return workerData;
  }
}
