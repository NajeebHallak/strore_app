import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

class Api {
  final Dio dio = Dio();
  Future<dynamic> get({required String url}) async {
    try {
      Response response = await dio.get(url);
      return response.data;
    } on DioException catch (e) {
      throw Exception('the Error is Dio Exception is   :   $e');
    } catch (e) {
      throw Exception('the Error is $e');
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, String> body,
    @required String? token,
  }) async {
    Map<String, String> header = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    if (token != null) {
      header.addAll({
        'authention': 'Beare token',
      });
    }

    http.Response respons = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    Map<String, dynamic> theData = jsonDecode(respons.body);
    if (respons.statusCode == 200) {
      return theData;
    } else {
      throw Exception(
          'there is ERROr is : ${respons.body}and the respons StatusCode is : ${respons.statusCode}');
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, String> body,
    @required String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': '*/*',
    };
    if (token != null) {
      headers.addAll({
        'authention': 'Beare token',
      });
    }
    print('111111111111url $url , body is  : $body ');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> theData = jsonDecode(response.body);
      print(
        '2222222222url ${jsonDecode(response.body)} ',
      );
      return theData;
    } else {
      throw Exception(
          'there is ERROr is : ${response.body}and the respons StatusCode is : ${response.statusCode}');
    }
  }
}
