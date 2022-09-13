import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_ui/utils/colors.dart';
import 'package:nft_ui/utils/sizedboxs.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SizedBoxs size = SizedBoxs();

  Widget? _child;

  List<CustomOptionPicker> options = [
    CustomOptionPicker(
      onTap: () {},
      text: 'Show',
      isSelected: false,
    ),
    CustomOptionPicker(
      onTap: () {},
      text: 'Auction',
      isSelected: true,
    ),
    CustomOptionPicker(
      onTap: () {},
      text: 'New',
      isSelected: false,
    ),
    CustomOptionPicker(
      onTap: () {},
      text: 'Fixed',
      isSelected: false,
    ),
  ];

  List<String> imageLink = [
    "mario",
    "ninja",
    "bobs",
    "micky",
    "naruto",
    "sonic",
  ];

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = Container();
          break;
        case 1:
          _child = Container();
          break;
        case 2:
          _child = Container();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
            svgPath: "assets/img/home.svg",
            // backgroundColor: primaryColor,
          ),
          FluidNavBarIcon(
            svgPath: "assets/img/send.svg",
            iconPath: "assets/img/send.png",
            // backgroundColor: primaryColor,
          ),
          FluidNavBarIcon(
            svgPath: "assets/img/add.svg",
            iconPath: "assets/img/add.png",
            // backgroundColor: primaryColor,
          ),
          FluidNavBarIcon(
            svgPath: "assets/img/heart.svg",
            iconPath: "assets/img/heart.png",
            // backgroundColor: primaryColor,
          ),
          FluidNavBarIcon(
            svgPath: "assets/img/wallet.svg",
            iconPath: "assets/img/wallet.png",
            // backgroundColor: primaryColor,
          ),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
            barBackgroundColor: Colors.white.withOpacity(0.4),
            // iconBackgroundColor: primaryColor,
            iconSelectedForegroundColor: primaryColor,
            iconUnselectedForegroundColor: Colors.white),
        scaleFactor: 1.5,
        defaultIndex: 1,
        itemBuilder: (icon, item) => Semantics(
          // label: icon.extras!["label"],
          child: item,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          size.hSize(40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(text: "NFT", children: [
                    TextSpan(
                      text: "market",
                      style: GoogleFonts.abel(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  style:
                      GoogleFonts.rubik(fontSize: 28.sp, color: primaryColor),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none, size: 30.r)),
                    Positioned(
                      top: 11,
                      right: 12.w,
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 4.r,
                      ),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: const AssetImage("assets/img/sonic.jpg"),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ListView.separated(
                    itemBuilder: (context, index) => options[index],
                    separatorBuilder: (context, index) => size.hSize(100),
                    itemCount: options.length),
              ),
              Expanded(
                  flex: 4,
                  child: ListView.separated(
                    itemBuilder: (context, index) => CustomCard(
                      img: imageLink[index],
                      name: imageLink[index],
                      onTap: () {},
                    ),
                    separatorBuilder: (context, index) => size.hSize(20),
                    itemCount: imageLink.length,
                  ))
            ],
          ))
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.img,
    required this.onTap,
    required this.name,
  }) : super(key: key);
  final String img;
  final VoidCallback onTap;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
            image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                image: AssetImage("assets/img/$img.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  child: Icon(
                    Icons.favorite_border,
                    color: white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: white.withAlpha(255).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(35.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.flash_on_outlined,
                        color: Colors.blue,
                      ),
                      Text(
                        "5h:45m:12s",
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: white),
                      ),
                      const Spacer(),
                      Text(
                        "Current Bid",
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: white),
                      ),
                    ]),
                    Row(
                      children: [
                        Text(
                          "Art $name",
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: white),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.diamond_sharp,
                          color: Colors.blue,
                        ),
                        Text(
                          "15.5ETH",
                          style: GoogleFonts.abel(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: white),
                        )
                      ],
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

class CustomOptionPicker extends StatelessWidget {
  const CustomOptionPicker({
    Key? key,
    required this.onTap,
    required this.text,
    required this.isSelected,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Transform.rotate(
        angle: 80.1,
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: isSelected ? primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r))),
                padding: const EdgeInsets.all(10),
                child: Text(
                  text,
                  style: GoogleFonts.abel(
                      color: isSelected ? white : primaryColor,
                      fontSize: 20.sp),
                )),
            Positioned(
                left: -15,
                top: 2,
                child: CircleAvatar(backgroundColor: black, radius: 12.r)),
            Positioned(
                right: -15,
                top: 2,
                child: CircleAvatar(backgroundColor: black, radius: 12.r)),
          ],
        ),
      ),
    );
  }
}
