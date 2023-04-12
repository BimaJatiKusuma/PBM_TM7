import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Route',
      home: Start(),
    );
  }
}





class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selamat Datang Di Aplikasi THE REAL GOAT"),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return Login();
              }));
            }, child: Text("Mulai"))
          ],
        ),
      ),
    );
  }
}



class Login extends StatelessWidget {

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login"),
          TextField(
            controller: textFieldController,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),

          ElevatedButton(onPressed: (){
            _sendDataToNextScreen(context);
          }, child: Text('Masuk'))
        ],
      ),
    );


    
  }
  void _sendDataToNextScreen(BuildContext context){
   String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(text: textToSend,),
        ));
}
}



class HomeScreen extends StatelessWidget {
  final String text;

  // receive data from the FirstScreen as a parameter
  HomeScreen({Key? key, required this.text}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GOAT OF FOOTBALL!!!'),
        backgroundColor: Color.fromARGB(255, 89, 60, 148),
      ),
      body: Column(
        children: [
          Text(text, style: TextStyle(fontWeight:FontWeight.w700 ),),
          Center(child: SelectionButton()),
        ],
      ) 
    );
  }
}
 
class SelectionButton extends StatelessWidget {
  const SelectionButton({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Lihat Pemain'),
    );
  }
 
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..showMaterialBanner(MaterialBanner(content: Container(
        width: 200,
        height: 200,
        child: Image.network("$result"),
      ), actions: [Text("")]));
      

  }
}
 
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Pemain'),
        backgroundColor: Color.fromARGB(255, 89, 60, 148),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 32, 101)),
                ),
                onPressed: () {
                  Navigator.pop(context, 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRbFGA177nqWs00jR60MLVe8tqgEWMHjSbjVWuKNMQbTwpfki0Np3n7My7ZGDRamjMlmboWBkacAqNGZoQ');
                },
                child: const Text('CR7'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 32, 101)),
                ),
                onPressed: () {
                  Navigator.pop(context, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDKEYocNmD__QkulJCLHfLh1GZLU8rj2kbkQ&usqp=CAU');
                },
                child: const Text('Messi'),
              ),
            )
          ],
        ),
      ),
    );
  }
}




