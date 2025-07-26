import 'package:flutter/material.dart';
import 'package:rentalapp/data/models/car.dart';
import 'package:rentalapp/presentatoin/pages/mapsDetailpage.dart';
import 'package:rentalapp/presentatoin/widgets/car_card.dart';
import 'package:rentalapp/presentatoin/widgets/more_card.dart';

class CarDetailScreen extends StatefulWidget {
  final Car car;
  const CarDetailScreen({super.key, required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: Row(
            children: [Icon(Icons.info_outline), Text(' Information')],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(
              car: Car(
                model: widget.car.model,
                distance: widget.car.distance,
                fuelCapacity: widget.car.fuelCapacity,
                pricePerHour: widget.car.pricePerHour,
                imageUrl: widget.car.imageUrl,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/user.png'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'user123',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('\$4.256', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Mapsdetailpage(car: widget.car),
                          ),
                        );
                      },
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Transform.scale(
                            scale: _animation!.value,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/maps.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  MoreCard(
                    car: Car(
                      model: widget.car.model + "-1",
                      distance: widget.car.distance + 100,
                      fuelCapacity: widget.car.fuelCapacity + 100,
                      pricePerHour: widget.car.pricePerHour + 10,
                      imageUrl: widget.car.imageUrl,
                    ),
                  ),
                  SizedBox(height: 5),
                  MoreCard(
                    car: Car(
                      model: widget.car.model + "-1",
                      distance: widget.car.distance + 200,
                      fuelCapacity: widget.car.fuelCapacity + 200,
                      pricePerHour: widget.car.pricePerHour + 20,
                      imageUrl: widget.car.imageUrl,
                    ),
                  ),
                  SizedBox(height: 5),
                  MoreCard(
                    car: Car(
                      model: widget.car.model + "-1",
                      distance: widget.car.distance + 300,
                      fuelCapacity: widget.car.fuelCapacity + 300,
                      pricePerHour: widget.car.pricePerHour + 30,
                      imageUrl: widget.car.imageUrl,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
