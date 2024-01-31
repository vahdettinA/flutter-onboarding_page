import 'package:flutter/material.dart';
import 'package:my_extension/my_extension.dart';
import 'package:onborading_page/enum/image_enum.dart';
import 'package:onborading_page/views/home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _controller;
  final List<String> _image = [
    ImageEnum.im_one.imagePath,
    ImageEnum.im_two.imagePath,
    ImageEnum.im_three.imagePath
  ];
  int initialPage = 0;
  final List<Map<String, String>> _description = [
    {
      "title": "Quality Food",
      "content":
          "Quis excepteur officia ipsum in proident aliquip ad non dolore quis ipsum proident elit. Sint ex eu enim nulla veniam dolore non dolore sint pariatur"
    },
    {
      "title": " Fast Delivery",
      "content":
          "Quis excepteur officia ipsum in proident aliquip ad non dolore quis ipsum proident elit. Sint ex eu enim nulla veniam dolore non dolore sint pariatur"
    },
    {
      "title": "Reward Surprises",
      "content":
          "Quis excepteur officia ipsum in proident aliquip ad non dolore quis ipsum proident elit. Sint ex eu enim nulla veniam dolore non dolore sint pariatur"
    }
  ];
  @override
  void initState() {
    _controller = PageController(initialPage: initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.midlleSymetricPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: context.dynamicHeight(0.8),
              width: context.width,
              color: Colors.white,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _image.length,
                  controller: _controller,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: context.dynamicHeight(0.8),
                      width: context.width,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(_image[index]),
                          Column(
                            children: [
                              Text(
                                _description[index]["title"].toString(),
                                style: context.textTheme.titleLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _description[index]["content"].toString(),
                                style: context.textTheme.labelSmall?.copyWith(
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
              width: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _image.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: 20,
                          width: index == initialPage ? 20 : 10,
                          decoration: BoxDecoration(
                            color: index == initialPage
                                ? Colors.orange
                                : Colors.grey,
                            borderRadius: context.lowRadius,
                          ),
                        ));
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: context.dynamicWidth(0.6),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    if (initialPage != 2) {
                      _controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.linearToEaseOut);
                      setState(() {
                        initialPage++;
                      });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                  },
                  child: initialPage == 2
                      ? Text("Get Started",
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: Colors.white))
                      : Text(
                          "Next",
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: Colors.white),
                        )),
            )
          ],
        ),
      ),
    );
  }
}
