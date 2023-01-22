import 'package:yoga_app/starting_interfaces/second_interface.dart';
import 'package:yoga_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/utils/big_text.dart';
import 'package:yoga_app/utils/dimensions.dart';
class FirstInterface extends StatelessWidget {
  const FirstInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // print("height is"+MediaQuery.of(context).size.height.toString());
   // print('width is '+MediaQuery.of(context).size.width.toString());
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.buttomColor1,
                AppColor.buttomColor2
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Container(
                padding:  EdgeInsets.only(top:Dimensions.size60),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom:Dimensions.size20) ,
                      child:BigText(text:'Welcome to Mindfulness' , color: Colors.black54, size: Dimensions.size25),
                    ),
                    BigText(text: 'Yoga App', color: Colors.black54, size: Dimensions.size25)
                  ],
                ),//for header text
              ),
              SizedBox(
                height: Dimensions.size100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.size200,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset('assets/images/y1.svg',),
                  ),


                ],
              ),
              //for image and below text
              SizedBox(height: Dimensions.size50,),
              BigText(text: 'Start Your Yoga \n Journey Now!', color: Colors.black, size: Dimensions.size20),
              SizedBox(height: Dimensions.size50,),

              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondInterface()));
                },
                child: Ink(
                  height: Dimensions.size60,
                  width: Dimensions.width200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.size25),
                      gradient: LinearGradient(
                          colors: [
                            AppColor.buttomColor1,
                            AppColor.buttomColor2,
                          ]
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(4,6)
                        ),
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(-1,-4)
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('GET START'),
                      Icon(Icons.arrow_forward_sharp,)

                    ],
                  ),
                ),
              ),





            ],
          ),
        ),
      ),
    )  ;
  }
}
