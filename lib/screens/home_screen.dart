import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ova_furniture_ui/theme/app_color.dart';
import 'package:ova_furniture_ui/theme/app_text_style.dart';
import 'package:ova_furniture_ui/widgets/apply_padding.dart';

import '../models/furniture.dart';
import '../widgets/furniture_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['All', 'Chair', 'Table', 'Sofa', 'Bed'];
    final List<Furniture> furnitureList = [
      Furniture(
        selectedColorIndex: 1,
        colors: [
          Color(0xff0b0b75),
          Color(0xffe35218),
          Colors.purple,
          Colors.yellow,
        ],
        model3D: [
          'chair_orange2_1.glb',
          'chair_orange2.glb',
          'chair_orange2_2.glb',
          'chair_orange2_3.glb',
        ],
        name: "Orange Armchair",
        imageName: "chair_orange2.png",
        auteur: "Ovaar",
        price: 210,
        description:
            "An elegant orange velvet armchair with soft padding, ideal for modern interiors looking for a splash of warm color and comfort.",
      ),
      Furniture(
        colors: [Colors.black, Colors.red, Colors.blue],
        model3D: [
          'chair_black.glb',
          'chair_black.glb',
          'chair_black.glb',
          'chair_black.glb',
        ],
        name: "Black Faux Fur Lounge",
        imageName: "chair_black.png",
        auteur: "Urban Edge",
        price: 160,
        description:
            "A cozy black chair wrapped in soft faux fur, combining modern style and tactile comfort for chic and trendy living spaces.",
      ),

      Furniture(
        model3D: [
          'chair_blue.glb',
          'chair_blue.glb',
          'chair_blue.glb',
          'chair_blue.glb',
        ],
        name: "Ocean Blue Modern Couch",
        imageName: "chair_blue.png",
        auteur: "BlueNest Studio",
        price: 480,
        description:
        "A spacious and comfortable couch in ocean blue tones, crafted for both style and relaxation in contemporary homes.",
      ),
      Furniture(
        model3D: [
          'chair_white.glb',
          'chair_white.glb',
          'chair_white.glb',
          'chair_white.glb',
        ],
        name: "Minimalist White Chair",
        imageName: "chair_white.png",
        auteur: "Nordic Haus",
        price: 95,
        description:
            "A lightweight white plastic chair with a minimalist frame, perfect for kitchens, dining rooms, or outdoor use with a clean aesthetic.",
      ),
      Furniture(
        model3D: [
          'chair_plastic_orange.glb',
          'chair_plastic_orange.glb',
          'chair_plastic_orange.glb',
          'chair_plastic_orange.glb',
        ],
        name: "Orange Stackable Patio",
        imageName: "chair_plastic_orange.png",
        auteur: "SunCraft Outdoor",
        price: 75,
        description:
            "A vibrant orange plastic chair, stackable and weather-resistant — ideal for patios, gardens, or casual seating areas.",
      ),
      Furniture(
        model3D: [
          'chair_orange.glb',
          'chair_orange.glb',
          'chair_orange.glb',
          'chair_orange.glb',
        ],
        name: "Sunset Lounge Chair",
        imageName: "chair_orange.png",
        auteur: "Studio Luma",
        price: 210,
        description:
        "An elegant armchair upholstered in vivid orange velvet, offering a perfect blend of comfort and modern aesthetics. Ideal for brightening up any living space with a cozy yet bold presence.",
      ),
    ];

    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
            child: Column(
          children: [
            ...applyPadding([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find Your\nDream Furniture',
                    style: AppTextStyle.xl(fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('assets/images/profile.jpg')),
                  )
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      hintText: 'Search furniture',
                      elevation: WidgetStatePropertyAll(0),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      leading: SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 25,
                        width: 25,
                        color: Colors.black.withAlpha(150),
                      ),
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 16)),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(16)),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/icons/settings.svg',
                          width: 25,
                          height: 25)),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ]),
            SizedBox(
              height: 50,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == 1;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: isSelected
                            ? AppColor.first
                            : Colors.grey.withAlpha(50)),
                    child: Center(
                        child: Text(
                      categories[index],
                      style: AppTextStyle.small(
                          color: isSelected ? Colors.white : Colors.black),
                    )),
                  );
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ...applyPadding([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chair Collections',
                    style: AppTextStyle.large(fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 420,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: furnitureList.length,
                itemBuilder: (context, index) {
                  Furniture f = furnitureList[index];
                  Color c = AppColor.colors[index % AppColor.colors.length];
                  return FurnitureCard(
                    furniture: f,
                    color: c,
                  );
                },
              ),
            )
          ],
        )));
  }
}
