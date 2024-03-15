import 'package:api/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/user_controller.dart';

class ListViewww extends StatelessWidget {
  const ListViewww({super.key});

  @override
  Widget build(BuildContext context) {
    final usercontroller=Provider.of<Usercontroller>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
          future: usercontroller.fetchUsers(),
      builder: (context, snapshot) {
        return
        //   snapshot.connectionState== ConnectionState.waiting?
        //     const Center(
        //       child: CircularProgressIndicator(),
        //     )
        // :
          SizedBox(height: 600,
            child: ListView.builder(itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  title: Text(usercontroller.usersList[index].title!,style: TextStyle(color: Colors.white),),
                  subtitle: Text(usercontroller.usersList[index].body!),

                    ),
              );
            }),
          );
        }
      ),
    );
  }
}
