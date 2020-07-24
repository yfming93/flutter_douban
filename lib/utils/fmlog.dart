import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

enum DevStatus { kReleaseMode, kProfileMode, kDebugMode }


void fmlog(Object message, StackTrace trace, {Response response}) {
  DevStatus status = DevStatus.kDebugMode;
  if (status == DevStatus.kDebugMode) {
    //
    FMCustomTrace programInfo = FMCustomTrace(trace);
    if (programInfo != null &&
        programInfo.fileName != null &&
        programInfo.lineNumber != null) {

      if (response == null) {

        print(
            "所在文件: ${programInfo.fileName}, 所在行: ${programInfo.lineNumber}, 打印信息: $message");
      }else{
        Map httpLogMap = Map();
        httpLogMap.putIfAbsent("requestUrl", () => "${response.request.uri}");
        httpLogMap.putIfAbsent("requestHeaders", () => response.request.headers);
        httpLogMap.putIfAbsent(
            "requestQueryParameters", () => response.request.queryParameters);
        httpLogMap.putIfAbsent("respondData", () => response.data);

        //带有首行缩进的Json格式
        JsonEncoder encoder = JsonEncoder.withIndent('  ');

        try {
          var encoderString = encoder.convert(httpLogMap);
          var outString = "所在文件: ${programInfo.fileName}, 所在行: ${programInfo.lineNumber}, 打印信息: $encoderString";

          // print(encoderString);
          // 不使用print()方法是因为这是单条输出，如果过长无法显示全
          // 所以使用debugPrint()
          debugPrint(outString);
          // 下面这语句的效果与debugPrint 相同
          //encoderString.split('\n').forEach((element) => print(element));
        } catch (e) {
          print(e);
        }
      }

    } else {
      print("打印信息:$message");
    }
  } else if (status == DevStatus.kReleaseMode) {
    print("----ReleaseMode-------");
  } else if (status == DevStatus.kProfileMode) {
    print("----ProfileMode-------");
  }
}

class FMCustomTrace {
  final StackTrace _trace;

  String fileName;
  int lineNumber;
  int columnNumber;

  FMCustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = this._trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}