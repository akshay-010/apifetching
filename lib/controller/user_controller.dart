import 'dart:convert';

import 'package:api/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Usercontroller extends ChangeNotifier{
  List<model>usersList=[];

  Future fetchUsers()async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if(response.statusCode==200){
      final List responseData=jsonDecode(response.body);

      usersList= responseData.map((json) => model.fromJson(json)).toList();
      notifyListeners();
    }else{
      print('failed fetching data');
    }
  }
}
