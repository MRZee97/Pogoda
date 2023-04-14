
import 'package:flutter/material.dart';
import 'package:pogoda/resources/pogoda_colors.dart';


import '../widgets/action_button.dart';
import 'city_weather_page.dart';


class MainPage extends StatelessWidget {

  MainPage({Key? key}) : super(key: key);

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

class MainPageContent extends StatefulWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  late final TextEditingController _cityEditingController;
  @override
  void initState() {
    super.initState();
 _cityEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityEditingController,
              style: const TextStyle(
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
                    if(_cityEditingController.text.length >= 3){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CityWeatherPage(city: _cityEditingController.text,),),);
                    }
                  },
                  text: "Next"
              ),
            ),

          ]
      ),
    );
  }
}

