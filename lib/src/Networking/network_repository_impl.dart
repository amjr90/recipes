import 'dart:convert';
import 'package:either_dart/either.dart';
import 'network_error.dart';
import 'network_repository.dart';
import 'package:http/http.dart' as http;

class NetworkRepositoryImpl extends NetworkRepository {
  @override
  Future getResponse(String url) async {
    final response = await http.get(Uri.parse(url));
    return returnResponse(response, true);
  }
}

Either<NetworkException, dynamic> returnResponse(
    http.Response response, bool isJson) {
  if (response.contentLength == 0) {
    return Left(
        FetchDataException('Error occured while communication with server'));
  }

  switch (response.statusCode) {
    case 200:
    case 201:
      if (isJson) {
        Object responseJson = jsonDecode(response.body);
        return Right(responseJson);
      } else {
        return Right(response.bodyBytes);
      }
    case 400:
      dynamic responseJson = jsonDecode(response.body);
      if (isJson) {
        return Left(BadRequestException(responseJson['message']));
      } else {
        var error =
            'Error occured while communication with server with status code : ${response.statusCode}, message: ${response.body}';

        return Left(BadRequestException(error));
      }

    case 401:
    case 403:
      dynamic responseJson = jsonDecode(response.body);

      return Left(BadRequestException(responseJson['message']));
    case 404:
      dynamic responseJson = jsonDecode(response.body);

      return Left(BadRequestException(responseJson['message']));
    case 500:
      dynamic responseJson = jsonDecode(response.body);
      return Left(BadRequestException(responseJson['message']));
    case 502:
      dynamic responseJson = response.statusCode.toString();
      // dynamic responseJson = jsonDecode(response.body);

      return Left(BadGateway(
          "Error occured while communication with server with status code : ${response.statusCode}"));
    default:
      return Left(FetchDataException(
          'Error occured while communication with server'
          ' with status code : ${response.statusCode}, message: ${response.body}'));
  }
}
