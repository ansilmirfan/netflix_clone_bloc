import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/features/detailed_view/ui/detailed_view.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/widgets/custom_text_button.dart';

import 'package:netflix_clone_bloc/global_variables/global_variables.dart';

class FeaturedWidget extends StatelessWidget {
  String imageUrl;
  List<String?> genre = [];
  int id;
  FeaturedWidget(
      {super.key,
      required this.imageUrl,
      required this.genre,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailedView(
          id: id,
          tvSeries: true,
        ),
      )),
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          height: deviceHeight * 0.6,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    //-----------------------genre-----------------------
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          genre.length,
                          (index) => Row(
                            children: [
                              Text(
                                genre[index] ?? '',
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Visibility(
                                visible: genre[index] != null &&
                                    index == genre.length - 1,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 2,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //-------------------------text buttons-------------------------------
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomTextButton(
                          bgColor: primaryWhite,
                          height: 30,
                          width: deviceWidth * .35,
                          child: Wrap(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: primaryBlack,
                              ),
                              Text(
                                'Play',
                                style: TextStyle(color: primaryBlack),
                              )
                            ],
                          ),
                        ),
                        CustomTextButton(
                          bgColor: Colors.white10,
                          height: 30,
                          width: deviceWidth * .35,
                          child: const Wrap(
                            children: [
                              Icon(
                                Icons.add,
                              ),
                              Text(
                                'My List',
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
