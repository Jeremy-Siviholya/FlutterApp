
import 'package:dio/dio.dart';

class Servicedio{
  final dio=Dio();
  String baseurl="https://fakestoreapi.com/";
   Future<Response> getData(String url) async{
    var response= await dio.get(baseurl +url);
    return  response;
  }
}