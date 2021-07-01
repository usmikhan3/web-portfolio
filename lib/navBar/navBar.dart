import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopNavBar();
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return DesktopNavBar();
      } else {
        return MobileNavBar();
      }
    });
  }
}

class DesktopNavBar extends StatelessWidget {

  downloadFile(url) {
    AnchorElement anchorElement = new AnchorElement(href: url);
    anchorElement.download = "Usman Resume";
    anchorElement.click();
  }
  _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        //constraints: BoxConstraints(maxWidth: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Muhammad Usman Khan",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Row(
              children: [

                  InkWell( onTap: () async {
                    await _launchURL(
                        url:
                        "https://www.github.com/usmikhan3");
                  },child: Text("GitHub",style: TextStyle(color: Colors.white),)),
                SizedBox(width: 20,),
                InkWell(
                    onTap: () async {
                      await _launchURL(
                          url:
                          "https://www.linkedin.com/in/usman-khan-bb278b140/");
                    },
                    child: Text("LinkedIn",style: TextStyle(color: Colors.white),)),
                SizedBox(width: 20,),
                MaterialButton(
                  onPressed: ()=>downloadFile("https://drive.google.com/file/d/1wEY9C8fbYp4KE9E84EWdtaNOkowfiFnc/view?usp=sharing"),
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Text("Download Resume",style: TextStyle(color: Colors.white),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {downloadFile(url) {
  AnchorElement anchorElement = new AnchorElement(href: url);
  anchorElement.download = "Usman Resume";
  anchorElement.click();
}
_launchURL({String url}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Muhammad Usman Khan",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell( onTap: () async {
                      await _launchURL(
                          url:
                          "https://www.github.com/usmikhan3");
                    },child: Text("GitHub",style: TextStyle(color: Colors.white),)),
                    SizedBox(width: 20,),
                    InkWell(
                        onTap: () async {
                          await _launchURL(
                              url:
                              "https://www.linkedin.com/in/usman-khan-bb278b140/");
                        },
                        child: Text("LinkedIn",style: TextStyle(color: Colors.white),)),
                    SizedBox(width: 20,),
                    MaterialButton(
                      onPressed: ()=>downloadFile("https://drive.google.com/file/d/1wEY9C8fbYp4KE9E84EWdtaNOkowfiFnc/view?usp=sharing"),
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      child: Text("Download Resume",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
