import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterPage extends StatefulWidget{
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage>{
  double before = 0 ;
  double result = 0;
  final TextEditingController controller = TextEditingController();

  void convert(){
    setState(() {
      result = int.parse(controller.text)* 90;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 20,
        title: const Text(
          "Currency Converter ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // text that show calculated value in INR
            Text("${result.toString()} INR",

              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),



            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(" ${before.toString()}",style: TextStyle(color: Colors.black),)),
            ),


            // Text field to get input from user
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 7,
                maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,

                controller: controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),

                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Enter the value in dollar",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  focusColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),

            //button to convert
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        )
                    ),

                    onPressed: (){
                      convert();
                      before = double.parse(controller.text);
                      controller.clear();
                    },
                    child: const Text("Convert",style: TextStyle(color: Colors.white,fontSize: 12),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
