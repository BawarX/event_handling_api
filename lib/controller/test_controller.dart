import 'package:event_handling/controller/base_controller.dart';
import 'package:event_handling/services/base_client.dart';

class TestController extends BaseController {
  void getData() async {
    showLoading('Fetching data');
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/todos/1')
        .catchError(handleError);
      
    if (response == null) return;
    hideLoading();
   print(response);
  }
}