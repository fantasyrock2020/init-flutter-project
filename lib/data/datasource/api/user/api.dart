import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'api.g.dart';


@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('/task')
  Future<void> getTask(); 

  @GET('/tasks')
  Future<List<String>> getTasks();
}
