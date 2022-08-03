import 'package:cat_api_session/articale.dart';
import 'package:cat_api_session/news_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Map? data;
  @override
  void didChangeDependencies() async {
    Map data = await NewsApi().getNewsOf("python");
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (data == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    data!["articles"].length,
                    (index) {
                      var artical = Articale(data!["articles"][index]);
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [
                            Container(
                              decoration: (artical.imageUrl == null)
                                  ? null
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          artical.imageUrl!,
                                        ),
                                      ),
                                    ),
                              width: 150,
                              height: 150,
                            ),
                            Expanded(child: Column(
                              children:[
                                Text(artical.title!,style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold))
                                ,Text("${artical.describition}")
                              ]
                            ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
