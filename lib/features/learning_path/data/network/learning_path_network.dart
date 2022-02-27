import 'package:http/http.dart';

import './/core/constants/network/network_constants.dart';
import './/core/constants/interfaces/interfaces.dart';

class LearningPathNetwork implements NetworkInterface {
  /// get the row data form API
  @override
  Future<String?> getData() async {
    try {
      /// get the domain and endpoint
      var _url =
          Uri.parse(NetworkConstants.domain + NetworkConstants.getUserEndPoint);

      Response _response = await get(_url);

      /// in case ok sent the json data
      return _response.body;
    } catch (e) {
      return null;
    }
  }
}
