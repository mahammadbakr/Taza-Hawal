import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:taza_hawal/Components/NewsCard.dart';
import 'package:taza_hawal/Providers/CategoryProvider.dart';
import 'package:taza_hawal/Providers/NewsProvider.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

import '../../../Constants.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (_, catState, __) => ListView(
              children: [
                AdsSection(),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  height: 100,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: catState.categoryImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      String name = catState.categoryNames[index];
                      String image = catState.categoryImages[index];
                      return CategoryCard(
                        label: name,
                        image: image,
                        onPressed: () {
                          // setState(() {
                          //   currentCategory = "market";
                          // });
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Row(
                    children: [
                      Text('Products'),
                    ],
                  ),
                ),
                Consumer<NewsProvider>(
                    builder: (_, newsState, __) => Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: StaggeredGridView.countBuilder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            itemCount: newsState.allNews.length,
                            itemBuilder: (BuildContext context, int index) =>
                                NewsCard(news: newsState.allNews[index]),
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.fit(1),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                        )),
              ],
            ));
  }
}

class SubCategoryCard extends StatelessWidget {
  final String image;

  const SubCategoryCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(context, '/'),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: theme(context).dividerColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: theme(context).primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '23 dis.',
                style: theme(context).textTheme.caption,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String image;
  final Function onPressed;

  const CategoryCard(
      {required this.label, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: theme(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: theme(context).primaryColor,
              width: 35,
              height: 35,
            ),
            SizedBox(height: 10),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: theme(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class AdsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: CarouselSlider.builder(
          autoSliderDelay: Duration(seconds: 3),
          enableAutoSlider: true,
          scrollDirection: Axis.horizontal,
          unlimitedMode: true,
          slideBuilder: (index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Image.asset(
                  adImagesList[index],
                  fit: BoxFit.cover,
                ));
          },
          // slideTransform: CubeTransform(),
          // slideIndicator: CircularSlideIndicator(
          //   padding: EdgeInsets.only(bottom: 32),
          // ),
          itemCount: adImagesList.length),
    );
  }
}
