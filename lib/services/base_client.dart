import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:event_handling/services/app_exception.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int timeOutDuration = 20;
  
  Future<Either<AppException, String>> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response =
          await http.get(uri).timeout(const Duration(seconds: timeOutDuration));
      return Right(_processResponse(response) as String);
    } on SocketException {
      return Left(
          throw FetchDataException('No Internet connection', uri.toString())
      );
    } on TimeoutException {
      Left(
        throw ApiNotRespondingException(
          'API not responded in time', uri.toString())
      );
    } on Exception{
      Left(
          throw UnknownException('unkown exception')
      );
    
    }
  }

  Either<AppException,String> _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
         return Right(responseJson);
      case 400:
      return left(
          throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString())
      );
      case 403:
      return Left(
          throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString())
      );
      
      case 422:
      return Left(
         throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString())
      );
       
      case 500:
      default:
      return Left(
          throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString())
      );
      
    }
  }
}
