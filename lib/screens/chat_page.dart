import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatapp/const/const.dart';
import 'package:chatapp/helper/show_snake_bar.dart';
import 'package:chatapp/model/model.dart';
import 'package:chatapp/widget/chat_buble2.dart';
import 'package:flutter/material.dart';

import '../widget/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatpage extends StatelessWidget {
   chatpage({super.key});
   final controllers=ScrollController();

   CollectionReference message = FirebaseFirestore.instance.collection('message');
   TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
   var email =ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('creadtat',descending: true).snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            List<Message>messageslist=[];
            for(int i=0;i<snapshot.data!.docs.length;i++)
              {
                messageslist.add(Message.formjson(snapshot.data!.docs[i]) );
              }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Kprimarycolor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(keylogo,
                        height: 50,),
                      Text('chat',
                        style: TextStyle(
                            color: Colors.white
                        ),),


                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: controllers,
                        itemCount: messageslist.length,
                        itemBuilder: (context, index)
                      {


                        return messageslist[index].id==email? chatbuble(
                          message: messageslist[index],
                          issender: false,
                        ):chatbubles(message: messageslist[index],
                        issender: true,);
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (date) {
                          message.add({
                            'message': date,
                            'creadtat':DateTime.now(),
                            'id':email
                          });
                          controller.clear();
                          controllers.animateTo(controllers.position.maxScrollExtent,
                          duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn
                          );
                        },


                        decoration: InputDecoration(
                            hintText: 'send message',
                            suffixIcon: Icon(
                                Icons.send
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                    color: Kprimarycolor
                                )
                            )

                        ),
                      ),
                    )
                  ],
                )
            );

          }
        else{
        return Text('is loding');
        }





      }




    );
  }
}


