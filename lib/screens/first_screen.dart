import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/utils/app_color.dart';
import 'package:yoga_app/utils/big_text.dart';
import 'package:yoga_app/utils/dimensions.dart';
import 'package:yoga_app/utils/unbold_text.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying=false;
  bool _disposed=false;
  int _isPlayingIndex=-1;
   VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/videoInfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }
  @override
  void dispose() {
     _disposed=true;
    _controller?.pause();
    _controller?.dispose();
    _controller=null;
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor7,
        leading: SvgPicture.asset(
          'assets/images/logo.svg', width: Dimensions.width60,
          height: Dimensions.size60,),
        title: BigText(
            text: 'MindFullness', color: Colors.black, size: Dimensions.size20),
        centerTitle: true,
        elevation: 1,
        actions: [
          Icon(
            Icons.info, color: AppColor.buttomColor1, size: Dimensions.size30,)
        ],),

      body: Padding(
        padding: EdgeInsets.all(Dimensions.size20),
        child: Container(
          child: Column(

            children: [
              
              _playArea == false ? Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: 'Yoga',
                              color: Colors.black,
                              size: Dimensions.size25),
                          // SizedBox(width: Dimensions.width10,),
                          // SvgPicture.asset(
                          //   'assets/images/cool.svg', width: Dimensions.width30,
                          //   height: Dimensions.size30,)
                        ],
                      ),
                      SizedBox(height: Dimensions.size15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          BigText(text: "#stayathome",
                              color: Colors.black,
                              size: Dimensions.size20),
                          SizedBox(width: Dimensions.width10,),

                          UnboldText(text: "routine",
                              color: Colors.black45,
                              size: Dimensions.size15)
                        ],
                      ),
                      SizedBox(height: Dimensions.size15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.flag, color: AppColor.buttomColor1,),

                          UnboldText(text: '10 exercises',
                              color: Colors.black54,
                              size: Dimensions.size12),

                          Icon(
                            Icons.timer_sharp, color: AppColor.buttomColor1,),
                          UnboldText(text: '10 exercises',
                              color: Colors.black54,
                              size: Dimensions.size12),
                          Icon(Icons.local_fire_department_outlined,
                            color: AppColor.buttomColor1,),
                          UnboldText(text: '10 exercises',
                              color: Colors.black54,
                              size: Dimensions.size12),

                        ],
                      ),
                    ],
                  )
              ) :
              Container(
                child: Column(
                  children: [
                    Row(
                       mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (
                                  context) => FirstScreen(),));
                            },
                            child: Icon(
                              Icons.arrow_back_ios, color: Colors.black54,)),
                      ],
                    ),
                    AspectRatio(
                        aspectRatio: 16/9,
                      child: _playView(context),

                    ),
                    _controlView(context),
                   
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.size20,
              ),
              Expanded(
                  child: GridView.builder(
                    itemCount: videoInfo.length,
                    physics: AlwaysScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          debugPrint("tapped");
                          _onTapVideo(index);
                          setState(() {
                            if (_playArea == false) {
                              _playArea = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.size10),
                          child: Container(

                            //color: Colors.red,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,
                                  child: Image.asset(videoInfo[index]["image"],
                                    fit: BoxFit.cover,),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: BigText(
                                    text: videoInfo[index]["title"],
                                    color: Colors.black,
                                    size: Dimensions.size15,),
                                ),
                                Positioned(
                                    right: 0,
                                    child: Container(
                                      child: Icon(Icons.play_circle_fill,
                                          color: AppColor.buttomColor1,
                                          size: Dimensions.size50),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },)
              ),
              Stack(

                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: Dimensions.size60,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: Dimensions.size50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              Dimensions.size30),
                          color: AppColor.buttomColor1
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UnboldText(text: 'START',
                              color: Colors.white,
                              size: Dimensions.size20),
                          SizedBox(width: Dimensions.width10,),
                          Icon(Icons.arrow_circle_right, color: Colors.white,
                            size: Dimensions.size30,)
                        ],
                      ),
                    ),
                  )
                ],
              )


            ],
          ),
        ),
      ),


    );
  }
  Widget _controlView(BuildContext context){
    return Container(
      height: Dimensions.size60,
      width: MediaQuery.of(context).size.width,
      color: AppColor.buttomColor1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: ()async{
                final index=_isPlayingIndex-1;
                if(index>=0 && videoInfo.length>=0){
                  _onTapVideo(index);
                }else{
                  Get.snackbar("Video","no more videos");
                }
              },
              icon: Icon(Icons.fast_rewind,size: Dimensions.size30,)
          ),
          IconButton(
              onPressed: ()async{
                if(_isPlaying){
                  setState(() {
                    _isPlaying=false;
                  });
                  _controller?.pause();
                }else{
                  setState(() {
                    _isPlaying=true;
                  });
                  _controller?.play();

                }
              },
              icon: Icon(_isPlaying?Icons.pause:Icons.play_arrow_sharp,size: Dimensions.size30,)
          ),
          IconButton(
              onPressed: ()async{
                final index=_isPlayingIndex+1;
                if(index<=videoInfo.length-1){
                _onTapVideo(index);
                }else{
                  Get.snackbar('Video', 'no more videos!!');
                }
              },
              icon: Icon(Icons.fast_forward,size: Dimensions.size30,)
          ),

        ],
      ),
    );
  }
 Widget? _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Container(

        child: VideoPlayer(controller),
      );
    }else {
      Center(child: UnboldText(text: "Loading..... ", color: Colors.white54, size: 40,));
    }
    return null;

  }
  var _onUpdateControllerTime;
 void _onControllerUpdate() async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime=0;
    final now=DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }
    _onUpdateControllerTime=now+600;
    final controller=_controller;
    if(controller==null){
      debugPrint('controller is null');
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("controller isnt initialized");
      return;
    }
    final playing=controller.value.isPlaying;
    _isPlaying=playing;
  }
  _onTapVideo(int index) async{
    final controller = VideoPlayerController.network(videoInfo[index]["video"]);
    _controller = controller;
    final old=_controller;
    _controller=controller;
    _isPlayingIndex=index;
    if(old!=null){
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller..initialize().then((_) {

        controller.addListener(_onControllerUpdate);
        // old?.dispose();
        controller.play();
        setState(() {});
      });
  }

  
  
}

