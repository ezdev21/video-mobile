import 'package:dio/dio.dart';

Dio dio(){
var dio=Dio();
// try baseUrl http://127.0.0.1:8000 or localhost:8000(ios) if http://10.0.2.2 not working you your laptop ip address
dio.options.baseUrl = 'http://10.0.2.2:8000/api';
dio.options.headers['accept']='Application/Json';
dio.options.connectTimeout = 5000; //5s
dio.options.receiveTimeout = 3000;
return dio;
}