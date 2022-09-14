import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fill Feature',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<QuestionModel> allQuestions=[
    QuestionModel(question:"_ _ _ _ _ _ _ _ is a variant of cellulose but present as a store house of energy in plant tissues",
    answer: "Starch",options: ["su","ar","gar","st","ch"])
  ];
  List<String> selectedOptions=[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffCAF1DE),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text("FILL FEATURE"),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 2),
              borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.all( 10),
            child: Text(allQuestions.first.question??"",
            style: TextStyle(
              color: Colors.black,
              fontSize:20
            ),),
          ),
            Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(allQuestions.first.options?.length??0, (index) {
              return  selectedOptions.contains(allQuestions.first.options?[index]??"")?
                  SizedBox( height: 55,
                    width: 55,):
                GestureDetector(
                  onTap: (){
                    selectedOptions.add(allQuestions.first.options?[index]??"");
                    setState(() {});
                  },
                  child: Container(
                    height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.all( 10),
                  child:Center(
                    child: Text(allQuestions.first.options?[index]??"",style:
                      TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),),
                  ) ,),
                );
            }),
          ),
            Spacer(),
            GestureDetector(
              onTap: ()
              {
               selectedOptions.clear();
               setState(() {

               });
              },
              child: Container(
                width: 800,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green
                ),
                child: Center(
                  child: Text("Try again",
                    style: TextStyle(
                        fontSize: 20,color: Colors.white
                    ),),
                ),
              ),
            ),

            SizedBox(height: 10,),
            GestureDetector(
             onTap: ()
             {
               if(selectedOptions.isEmpty)
                 {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text("Please select any option first"),
                   ));
                 }
               else{
                 String guessedAnswer="";
                 selectedOptions.forEach((element) {
                   guessedAnswer=guessedAnswer+element;
                 });
                 print("______${guessedAnswer}");
                 if(guessedAnswer.toLowerCase()==allQuestions.first.answer?.toLowerCase())
                   {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       content: Text("Congratulations! Your answer is correct"),
                     ));
                   }
                 else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text("Oops! Your answer is wrong"),
                   ));
                 }
               }
             },
             child: Container(
               width: 800,
               height: 50,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.grey
               ),
               child: Center(
                 child: Text("Check",
                 style: TextStyle(
                   fontSize: 20,color: Colors.white
                 ),),
               ),
             ),
           ),

            SizedBox(height: 10,)
          ],
        ),
      )
    );
  }
}

class QuestionModel
{
  String? question;
  String? answer;
  List<String>? options;
  QuestionModel({this.question, this.answer, this.options});


}