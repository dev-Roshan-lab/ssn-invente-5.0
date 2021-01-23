import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minivines/swipe/feedback_position.dart';
import 'package:minivines/swipe/food.dart';

int initial_stack = 1;
int final_stack = 6;

class FoodCardWidget extends StatelessWidget {
  final Food food;
  final bool isUserInFocus;

  const FoodCardWidget({
    @required this.food,
    @required this.isUserInFocus,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedbackPositionProvider>(context);
    final swipingDirection = provider.swipingDirection;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(food.imgUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0.5),
            ],
            gradient: LinearGradient(
              colors: [Colors.black12, Colors.black87],
              begin: Alignment.center,
              stops: [0.4, 1],
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 320,
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${initial_stack}/${final_stack}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                left: 10,
                bottom: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildUserInfo(food: food),
                  ],
                ),
              ),
              if (isUserInFocus) buildLikeBadge(swipingDirection)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLikeBadge(SwipingDirection swipingDirection) {
    final isSwipingRight = swipingDirection == SwipingDirection.right;
    final color = isSwipingRight ? Colors.green : Colors.pink;
    final angle = isSwipingRight ? -0.5 : 0.5;

    if (swipingDirection == SwipingDirection.none) {
      return Container();
    } else {
      return Positioned(
        top: 20,
        right: isSwipingRight ? null : 30,
        left: isSwipingRight ? 30 : null,
        child: Transform.rotate(
          angle: angle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: color
            ),
            child: Text(
              isSwipingRight ? 'YUM' : 'NO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget buildUserInfo({@required Food food}) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${food.foodName}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Text(
              food.designation,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              'Fat Content : ${food.fatContent} (g)',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
}
