import 'dart:ui';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cinemate/core/constants/app_assets.dart';
import 'package:cinemate/core/utils/get_random_movies.dart';
import 'package:flutter/scheduler.dart';

class ScrollingMovies extends StatefulWidget {
  const ScrollingMovies({
    super.key,
    required this.columnChildren,
    required this.linearGradientStops,
  });

  final List<Widget> columnChildren;
  final List<double> linearGradientStops;

  @override
  State<ScrollingMovies> createState() => ScrollingMoviesState();
}

class ScrollingMoviesState extends State<ScrollingMovies>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController1;
  late final ScrollController _scrollController2;
  late final ScrollController _scrollController3;
  late final ScrollController _scrollController4;
  late final List<String> movies;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    movies = [
      AppAssets.movie1,
      AppAssets.movie2,
      AppAssets.movie3,
      AppAssets.movie4,
      AppAssets.movie5,
      AppAssets.movie6,
      AppAssets.movie7,
      AppAssets.movie8,
      AppAssets.movie9,
      AppAssets.movie10,
      AppAssets.movie11,
      AppAssets.movie12,
      AppAssets.movie13,
      AppAssets.movie14,
      AppAssets.movie15,
      AppAssets.movie16,
      AppAssets.movie17,
      AppAssets.movie18,
      AppAssets.movie19,
      AppAssets.movie20,
    ];
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
    _scrollController4 = ScrollController();
    _ticker = createTicker((_) => _autoScroll());
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    _scrollController4.dispose();
    super.dispose();
  }

  void _autoScroll() {
    const double scrollSpeed = 2.0;

    void scrollController(ScrollController scrollController) {
      if (scrollController.hasClients) {
        final currentPosition = scrollController.offset;
        final maxScrollExtent = scrollController.position.maxScrollExtent;

        if (currentPosition >= maxScrollExtent) {
          scrollController.jumpTo(0.0);
        } else {
          scrollController.animateTo(
            currentPosition + scrollSpeed,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }
    }

    scrollController(_scrollController1);
    scrollController(_scrollController2);
    scrollController(_scrollController3);
    scrollController(_scrollController4);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: List.generate(
            4,
            (columnIndex) {
              final ScrollController scrollController;
              switch (columnIndex) {
                case 0:
                  scrollController = _scrollController1;
                  break;
                case 1:
                  scrollController = _scrollController2;
                  break;
                case 2:
                  scrollController = _scrollController3;
                  break;
                case 3:
                  scrollController = _scrollController4;
                  break;
                default:
                  scrollController = _scrollController1;
              }
              return Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  reverse: columnIndex.isOdd ? false : true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final randomMovies = getRandomMovies(movies, 6);
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.25,
                            ),
                            child: Image.asset(
                              randomMovies[index % randomMovies.length],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        childCount: 6 * 500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: widget.linearGradientStops,
                colors: [
                  AppColors.darkPurple.withOpacity(0),
                  AppColors.black.withOpacity(0.95)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 9,
                sigmaY: 9,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      fillOverscroll: true,
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          const Expanded(child: SizedBox(),),
                          ...widget.columnChildren,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
