
import 'package:flutter/material.dart';
import 'package:pogoda/resources/pogoda_colors.dart';


import '../widgets/action_button.dart';
import 'city_weather_page.dart';


class MainPage extends StatefulWidget {


  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PogodaColors.background,
      body: SafeArea(
        child: MainPageContent(),
      ),
    );
  }
}



// вынесеный виджет
class MainPageContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityEditingController = TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cityEditingController,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.white,),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.red,),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),),),
            ),
            Align(alignment: Alignment.center,
              child: ActionButton(
                  onTap: () {
                    if(cityEditingController.text.length >= 3){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CityWeatherPage(city: cityEditingController.text,)));
                    }
                  },
                  text: "continuation"
              ),
            ),

          ]
      ),
    );
  }
}