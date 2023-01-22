import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga_app/screens/first_screen.dart';
import 'package:yoga_app/utils/dimensions.dart';

import '../utils/app_color.dart';
import '../utils/big_text.dart';
import '../utils/unbold_text.dart';

class ThirdInterface extends StatelessWidget {
  const ThirdInterface({Key? key}) : super(key: key);

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
                        child: SvgPicture.asset('assets/images/y5.svg',),
                      ),
                      SizedBox(height: Dimensions.size50,),
                      BigText(text: 'Quick and Simple', color: Colors.black, size: Dimensions.size30),
                      UnboldText(text: "Learn yoga from the comfort of your home in just 10 minutes a day", color: Colors.black26, size: Dimensions.size15)
                    ],
                  ),
                  SizedBox(height: Dimensions.size100,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>FirstScreen()));
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
                            color: AppColor.buttomColor4,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),

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
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
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

                    ],
                  )



                ]
            ),
          ),
        )
    );
  }
}

