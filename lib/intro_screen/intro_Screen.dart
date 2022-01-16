import 'package:flutter/material.dart';
import 'package:flutter_chat/Navigator/Page_Navigator.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<PageModel> pages = List<PageModel> ();

  // List<String> images =[
  //   'assets/bg.jpg',
  //   'assets/bg1.jpg',
  //   'assets/bg2.jpg',

  // ];

  // List<IconData> iconData=[
  //   Icons.map_rounded,
  //   Icons.mail_outline,
  //   Icons.business_center,
  // ];
  // List<String> title=[
  //   'global',
  //   'latest news',
  //   'business',

  // ];
  // List<String> descriptions=[
  //   'You will receive world news first Powell',
  //   'You will receive news of the world while you are at home',
  //   'You will receive economic, social, political and sports news through the application'
  // ];

  void _addPage(){
    pages.add(PageModel('global',Icons.map_rounded,'You will receive world news first Powell','assets/bs3.png'));
    pages.add(PageModel('latest news',Icons.mail_outline,'You will receive news of the world while you are at home','assets/bs2.png'));
    pages.add(PageModel('business',Icons.business_center,'You will receive economic, social, political and sports news through the application','assets/bs1.png'));

  }

  @override
  Widget build(BuildContext context) {

    _addPage();


    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              pages[index].image;

              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index]._image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0,-100),
                        child: Icon(pages[index]._icon,
                        
                          size: 75,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        pages[index]._title,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 45, top: 10),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24,left: 16,right: 16),
              child: SizedBox(
                height: 50,
                width: double.infinity,

                child: RaisedButton(

                  color: Colors.red.shade900,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PageNavigator()));
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, color: Colors.white,letterSpacing: 0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class PageModel{
  String _title;
  String _description;
  IconData _icon;
  String _image;

  PageModel(this._title,this._icon,this._description,this._image);

  String get image => _image;
  IconData get icon => _icon;
  String get description => _description;
  String get title => _title;
}
