import 'package:day08/models/users.dart';
import 'package:dio/dio.dart';

class UserService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String users = "users";

  Future<List<User>> getUsers() async {
    List<User> userss = [];
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl" + "$users");
    var data = response.data;
    data.forEach((userItem) {
      User user = User.fromJson(userItem);
      userss.add(user);
    });
    return userss;
  }
}
