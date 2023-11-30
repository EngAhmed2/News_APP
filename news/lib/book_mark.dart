import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/repository/news_repository.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsRepository().getTopBusinessNews(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasData == true) {
          final data = snapshot.data!.articles;

          //final newsModel = TopBusinessNews.fromJson(data);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: Color(0xff231F20),
                ),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Color(0xffE9EEFA),

                // For Android (dark icons)
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: const Color(0xffE9EEFA),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 24,),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return  ListTile(
                    trailing: Icon(Icons.image_rounded),
                    title: Text(
                      data[index].description??'No Description Found',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff231F20),
                      ),
                    ),
                    subtitle: Text(
                      data[index].source.name??'Interior',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6D6265),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Container();
      }
    );
  }
}
