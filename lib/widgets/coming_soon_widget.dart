import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/global_variables/colors.dart';
import 'package:netflix_clone_bloc/features/detailed_view/ui/detailed_view.dart';
import 'package:netflix_clone_bloc/global_variables/global_variables.dart';

class ComingSoonWidget extends StatelessWidget {
  String? monthShort;
  String? monthLong;
  String? date;
  String backdropPath;
  List<String?> genre;
  String title;
  bool top10;

  bool everyOnesWatching;
  bool series;
  int id;
  String? overview;
  ComingSoonWidget(
      {super.key,
      this.monthShort,
      this.date,
      required this.backdropPath,
      required this.genre,
      this.monthLong,
      required this.title,
      required this.id,
      this.overview,
      this.everyOnesWatching = false,
      this.top10 = false,
      this.series = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailedView(
          id: id,
          tvSeries: series,
        ),
      )),
      child: Container(
        margin: const EdgeInsets.all(5),
        height: everyOnesWatching ? deviceHeight * 0.48 : deviceHeight * 0.40,
        width: double.infinity,
        child: Row(
          children: [
            //-------------month and date--------------------
            Visibility(
              visible: !everyOnesWatching,
              child: Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                          visible: !top10, child: Text(monthShort ?? '')),
                      Text(
                        date ?? '',
                        style: Theme.of(context).textTheme.displayLarge,
                      )
                    ],
                  ),
                ),
              ),
            ), //-------------------------image --------------------
            Expanded(
              flex: 4,
              child: SizedBox(
                child: Column(
                  children: [
                    Expanded(
                      flex: top10 ? 2 : 3,
                      child: SizedBox(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                backdropPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 20, top: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                        'Asset/netflix_icon_n.webp',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      'U/A 16+',
                                      style: TextStyle(
                                        backgroundColor: primaryGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              child: IconButton(
                                iconSize: 45,
                                splashRadius: 40,
                                onPressed: () {},
                                icon: const Icon(Icons.play_arrow),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //----------------------title and icons----------------
                    Expanded(
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  title,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: everyOnesWatching || top10
                                      ? [
                                          Column(
                                            children: [
                                              IconButton(
                                                iconSize: 25,
                                                splashRadius: 60,
                                                onPressed: () {},
                                                icon: const Icon(Icons.share),
                                              ),
                                              const Text(
                                                'Share',
                                                style: TextStyle(fontSize: 12),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                iconSize: 25,
                                                splashRadius: 60,
                                                onPressed: () {},
                                                icon: const Icon(Icons.add),
                                              ),
                                              const Text(
                                                'My List',
                                                style: TextStyle(fontSize: 12),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                iconSize: 25,
                                                splashRadius: 60,
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.play_arrow),
                                              ),
                                              const Text(
                                                'Play',
                                                style: TextStyle(fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ]
                                      : [
                                          Column(
                                            children: [
                                              IconButton(
                                                iconSize: 25,
                                                splashRadius: 60,
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.notifications_none),
                                              ),
                                              const Text(
                                                'Remind me',
                                                style: TextStyle(fontSize: 12),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                iconSize: 25,
                                                splashRadius: 60,
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.info_outline),
                                              ),
                                              const Text(
                                                'Info',
                                                style: TextStyle(fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //---------------------coming soon and genre--------------
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: everyOnesWatching || top10
                                    ? SizedBox(
                                        height: 40,
                                        child: Text(
                                          overview ?? '',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 15, color: primaryGrey),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    : Text(
                                        'Coming on $date $monthLong',
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  genre.where((e) => e != null).join(' . '),
                                  style: TextStyle(
                                      fontSize: 12, color: primaryGrey),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
