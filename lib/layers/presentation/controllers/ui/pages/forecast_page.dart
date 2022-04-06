import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import '../../../../domain/entities/data/dto/forecast_dto.dart';

class ForecastPage extends StatelessWidget {
  final ForecastModelDto forecast;

  const ForecastPage({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(changeBackground(forecast)),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 55 / size.height),
                child: Stack(
                  children: [
                    BorderedText(
                      strokeWidth: 5.0,
                      child: Text(
                        forecast.nameDto,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 25 / size.height),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: size.height * 200 / size.height,
                    height: size.width * 200 / size.width,
                    decoration: BoxDecoration(
                        color: changeColor(forecast), shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 10 / size.height),
                    child: Container(
                      width: size.height * 180 / size.height,
                      height: size.width * 180 / size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 15 / size.height),
                    child: Container(
                      width: size.height * 170 / size.height,
                      height: size.width * 170 / size.width,
                      decoration: BoxDecoration(
                          color: changeColor(forecast), shape: BoxShape.circle),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 75 / size.height,
                      left: size.width * 50 / size.width,
                    ),
                    child: BorderedText(
                      strokeWidth: 5.0,
                      child: Text(
                        forecast.temperatureDto.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 35 / size.height),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BorderedText(
              strokeWidth: 5.0,
              child: Text(
                'Description',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 20 / size.height),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              forecast.descriptionDto.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 18 / size.height),
            ),
            const SizedBox(
              height: 15,
            ),
            BorderedText(
              strokeWidth: 5.0,
              child: Text(
                'Wind',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 20 / size.height),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              forecast.windDto.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 18 / size.height),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: size.height * 190 / size.height,
                    width: size.width * 390 / size.width,
                    child: ListView.builder(
                      itemCount: forecast.forecastDto?.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: size.height * 230 / size.height,
                          width: size.width * 150 / size.width,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BorderedText(
                                  strokeWidth: 5.0,
                                  child: Text(
                                    'Day ' +
                                        (forecast.forecastDto?[index].day ?? 0)
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            size.height * 15 / size.height),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BorderedText(
                                  strokeWidth: 5.0,
                                  child: Text(
                                    'Temperature',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            size.height * 15 / size.height),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (forecast.forecastDto?[index].temperature ?? 0)
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 15 / size.height),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BorderedText(
                                  strokeWidth: 5.0,
                                  child: Text(
                                    'Wind',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            size.height * 15 / size.height),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (forecast.forecastDto?[index].wind ?? 0)
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 15 / size.height),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String changeBackground(ForecastModelDto forecast) {
    String image;
    if (forecast.descriptionDto.toString() == "Partly cloudy") {
      image = 'assets/images/cloudy.gif';
      return image;
    }
    if (forecast.descriptionDto.toString() == "Patchy rain possible") {
      image = 'assets/images/cloudRain.gif';
      return image;
    }
    if (forecast.descriptionDto.toString() == "Sunny") {
      image = 'assets/images/sunny.gif';
      return image;
    }
    if (forecast.descriptionDto.toString() == "Clear") {
      image = 'assets/images/clear.gif';
      return image;
    }
    return 'assets/images/cloudy.gif';
  }

  Color changeColor(ForecastModelDto forecast) {
    if (forecast.descriptionDto.toString() == "Partly cloudy") {
      return Colors.grey;
    }
    if (forecast.descriptionDto.toString() == "Clear") {
      return Colors.blue;
    }
    if (forecast.descriptionDto.toString() == "Patchy rain possible") {
      return Colors.grey;
    }
    if (forecast.descriptionDto.toString() == "Light rain shower") {
      return Colors.grey;
    }
    if (forecast.descriptionDto.toString() == "Sunny") {
      return Colors.yellow;
    }
    return Colors.white;
  }

  returnDay(ForecastModelDto forecast) {
    forecast.forecastDto?.forEach((element) {
      print(element.day);
    });
  }
}