import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga_app/starting_interfaces/third_interface.dart';
import 'package:yoga_app/utils/big_text.dart';
import 'package:yoga_app/utils/dimensions.dart';
import 'package:yoga_app/utils/unbold_text.dart';

import '../utils/app_color.dart';
class SecondInterface extends StatelessWidget {
  const SecondInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SvgPicture.asset('assets/images/y2.svg',
                      width: Dimensions.width60,
                      height: Dimensions.size60,
                    ),
                    SizedBox(width: Dimensions.width10,),
                  BigText(text: 'MindFullness', color: Colors.black45, size: Dimensions.size25)
                  ],

                ),//for header text
             ),
              SizedBox(
                height: Dimensions.size100,

              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                    height: Dimensions.size200,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset('assets/images/y3.svg',),
                  ),
                  SizedBox(height: Dimensions.size50,),
                  BigText(text: 'Find Your Zen', color: Colors.black, size: Dimensions.size30),
                  UnboldText(text: "Practice Yoga to reduce stress,increce flexibility and build strength", color: Colors.black26, size: 16)
                ],
              ),
              SizedBox(height: Dimensions.size100,),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ThirdInterface()));
                },
                child: Ink(
                  height: Dimensions.size60,
                  width: Dimensions.width200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.size30),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next'),
                      Icon(Icons.arrow_forward_sharp,)

                    ],
                  ),
                ),
              ),
              SizedBox(height: Dimensions.size20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Dimensions.width100,
                    height: Dimensions.size5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.size12),bottomLeft: Radius.circular(Dimensions.size12)),
                        gradient: LinearGradient(
                            colors: [
                              AppColor.buttomColor3,
                              AppColor.buttomColor2,
                              AppColor.buttomColor3,
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
                  ),
                  Container(
                    width: Dimensions.width100,
                    height: Dimensions.size5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      color: AppColor.buttomColor4,
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
                  ),

                ],
              )



             ]
        ),
        ),
    )
    );
  }
}

