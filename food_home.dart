import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minivines/swipe/food.dart';
import 'package:minivines/swipe/foodData.dart';
import 'package:minivines/swipe/food_card_widget.dart';
import 'feedback_position.dart';

List cuisinesLiked = [];
List recipeLiked = [];

class FoodHome extends StatefulWidget {
  @override
  _FoodHomeState createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  final List<Food> foods = dummyFood;
  int finalCuisineLiked = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        //appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              foods.isEmpty
                  ? Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Done for today!',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 22),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'From the observations,\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.white)),
                                        TextSpan(
                                            text: 'you like\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.white)),
                                        TextSpan(
                                            text:
                                                '${cuisinesLiked.map((cuisine) => cuisine.toString()).toString()}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
//                                              fontStyle: FontStyle.italic,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: ' foods.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),

//                                Text(
//                                    " you like ${cuisinesLiked.toString()} "),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text('Cook'),
                              onPressed: () async {
                                Navigator.pop(context);
//                                Navigator.pushReplacement(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context){
//                                          return Home();
//                                }));
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Stack(children: foods.map(buildUser).toList()),
              Expanded(child: Container()),
            ],
          ),
        ),
      );

/*  Widget buildAppBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
//          shadowColor: Colors.green.shade700,
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 22),
            children: <TextSpan>[
              TextSpan(
                  text: 'Res',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              TextSpan(
                  text: 'Pic',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700)),
            ],
          ),
        ),
      );*/

  Widget buildUser(Food food) {
    final userIndex = foods.indexOf(food);
    final isUserInFocus = userIndex == foods.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: FoodCardWidget(food: food, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: FoodCardWidget(food: food, isUserInFocus: isUserInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, food),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, Food food) {
    final minimumDrag = 150;
    if (details.offset.dx > minimumDrag) {
      food.isSwipedOff = true;
      setState(() {
        cuisinesLiked.add(food.designation);
        recipeLiked.add(food.foodName);
//        food.value -= 1;

//        initial_stack += 1;
      });
    } else if (details.offset.dx < -minimumDrag) {
      food.isLiked = true;
      setState(() {
//        initial_stack += 1;
//        food.designation
//        food.value += 1;
      });
    }

    setState(() {
      foods.remove(food);
      initial_stack += 1;
    });
  }
}
