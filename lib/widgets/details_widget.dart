import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';
import 'package:netflix_clone_bloc/widgets/custom_text_button.dart';
import 'package:netflix_clone_bloc/widgets/youTubePlayerWidget.dart';


class DetailsWidget extends StatelessWidget {
  String imagePath;
  String title;
  String releasedYear;
  String runtimeOrSeason;
  String overview;
  String youTubeId;
  bool series;
  DetailsWidget(
      {super.key,
      required this.imagePath,
      required this.overview,
      required this.releasedYear,
      required this.runtimeOrSeason,
      required this.title,
      this.series = false,
      required this.youTubeId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //---------------image--------------------------
        Youtubeplayerwidget(id: youTubeId),
      
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     Image.network(imagePath),
        //     const Icon(
        //       Icons.play_circle_outline_outlined,
        //       size: 70,
        //     )
        //   ],
        // ),
        //-------------------details--------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //---------------title-----------------
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              //--------------year and duration--------------
              Align(
                alignment: Alignment.topLeft,
                child: DefaultTextStyle(
                  style: TextStyle(color: primaryGrey, fontSize: 16),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      Text(releasedYear),
                      const Text(
                        'U/A 16+',
                        selectionColor: Colors.grey,
                        style: TextStyle(
                            backgroundColor:
                                Color.fromARGB(255, 101, 101, 101)),
                      ),
                      series
                          ? Text('$runtimeOrSeason Seasons')
                          : Text(runtimeOrSeason)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextButton(
                splashColor: Colors.red,
                height: 50,
                bgColor: primaryWhite,
                child: Wrap(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: primaryBlack,
                    ),
                    Text(
                      'Play',
                      style: TextStyle(color: primaryBlack),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextButton(
                height: 50,
                bgColor: const Color.fromARGB(221, 94, 91, 91),
                child: const Wrap(
                  children: [
                    Icon(
                      Icons.file_download_outlined,
                    ),
                    Text(
                      'Download',
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //------------------overview----------------
              Text(overview),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: series ? double.infinity : deviceWidth * 0.60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              splashRadius: 90,
                              tooltip: 'My List',
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 35,
                              ),
                            ),
                            Text(
                              'My List',
                              style:
                                  TextStyle(fontSize: 12, color: primaryGrey),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              splashRadius: 90,
                              tooltip: 'Rate',
                              onPressed: () {},
                              icon: const Icon(
                                Icons.thumb_up_alt_outlined,
                                size: 28,
                              ),
                            ),
                            Text(
                              'Rate',
                              style:
                                  TextStyle(fontSize: 12, color: primaryGrey),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              splashRadius: 90,
                              tooltip: 'Share',
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                size: 28,
                              ),
                            ),
                            Text(
                              'Share',
                              style:
                                  TextStyle(fontSize: 12, color: primaryGrey),
                            )
                          ],
                        ),
                        Visibility(
                          visible: series,
                          child: Column(
                            children: [
                              IconButton(
                                splashRadius: 90,
                                tooltip: 'Download',
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.download,
                                  size: 28,
                                ),
                              ),
                              Text(
                                'Download',
                                style:
                                    TextStyle(fontSize: 12, color: primaryGrey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
