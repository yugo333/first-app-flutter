import 'package:first_app/video_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //おまじない：下記は記載しないとワーニングでる。
  const MyApp({Key? key}) : super(key: key);

  final ColorScheme colorScheme = const ColorScheme(
    primary: Color(0xFFFFFFFF), // <---- I set white color here
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFFF0000),
    secondaryVariant: Color(0xFFFFFFFF),
    background: Color(0xFF636363),
    surface: Color(0xFF808080),
    onBackground: Colors.white,
    error: Colors.redAccent,
    onError: Colors.redAccent,
    onPrimary: Colors.black,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
      ),
      home: Scaffold(
        appBar: AppBar(
          //文字寄せ
          centerTitle: false,
          //icon
          leading: const Icon(Icons.video_call),
          //header　title
          title: const Text('FirstApp!!!!'),
          actions: [
            SizedBox(
              width: 40,
              child: TextButton(
                child: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                onPressed: () {
                  print('yyyy');
                },
              ),
            ),
            SizedBox(
              width: 40,
              child: TextButton(
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.blue,
                ),
                onPressed: () {
                  print('yyyy');
                },
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('images/owl.jpg'),
                    ),
                    //空のsizeBoxで空白を作る
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'First App Flutter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.import_contacts_sharp,
                                color: Colors.grey,
                              ),
                              Text(
                                ' 登録する',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          onPressed: () {
                            print('yyyy');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      // print('yyyy');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPage()),
                      );
                    },
                    contentPadding: const EdgeInsets.all(8),
                    leading: Image.network(
                        'https://blogimg.goo.ne.jp/user_image/50/d3/6660ad7d51402aedceaf58d4e07a4ffb.png'),
                    title: Column(
                      children: [
                        Text('【FlutterSample[$index]】イケイケ選手権'),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: const [
                              Text('100万回再生',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                              Text('200日前',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    trailing: const Icon(Icons.more_vert),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
