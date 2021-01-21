import 'package:get/get.dart';
import 'package:usm_mobile/Models/UniversityModel.dart';
import 'package:usm_mobile/Repositories/UniversityRepo.dart';

class UniversityController extends GetxController {
  var isLoading = true.obs;
  var uniList = List<UniversityModel>().obs;
  @override
  void onInit() {
    fetchUnis();
    super.onInit();
  }

  void fetchUnis() async {
    try {
      isLoading(true);
      var unis = await UniversityRepo.fetchUnis();

      if (unis != null) {
        uniList.assignAll(unis);
      }
    } finally {
      isLoading(false);
    }
  }
}
