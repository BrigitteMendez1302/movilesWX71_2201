import 'package:final_moviles/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_moviles/models/meal.dart';
import 'package:final_moviles/utils/http_helper.dart';

class CategoryDetail extends StatefulWidget {
  final Category category;
  CategoryDetail(this.category);

  @override
  _CategoryDetailState createState() => _CategoryDetailState(category);
}

class _CategoryDetailState extends State<CategoryDetail> {
  final Category category;
  HttpHelper? helper;
  ScrollController? _scrollController;
  List<Meal> meals = [];
  int? mealsCount;
  bool loading = true;
  String text = '';
  String? path;

  _CategoryDetailState(this.category);

  @override
  void initState(){
    super.initState();
    text = this.category.title!;
    helper = HttpHelper();
    initialize();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future initialize() async{
    loadMore();
    initScrollController();
  }

  void loadMore() {
    helper!.getMealsByCategory(text).then((value) {
      meals += value;
      setState(() {
        mealsCount = meals.length;
        meals = meals;
      });

      if(meals.length % 20 > 0){
        loading = false;
      }
    });
  }

  void initScrollController() {
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if ((_scrollController!.position.pixels ==
          _scrollController!.position.maxScrollExtent) &&
          loading){
        loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title.toString()),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            child:
            Hero(
                  tag: 'poster_' + category.id.toString(),
                  child: Image.network(category.thumb.toString(),
                    height: height / 3.8,)
              ),
            ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Description:', style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(category.description.toString()),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text('List of meals:', style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            controller: _scrollController,
            itemCount: meals!.length,
            itemBuilder: (BuildContext context, int index){
              return MealRow(meals![index]);
            },
          ),
        ],),
      ),
    );
  }
}



class MealRow extends StatefulWidget {
  final Meal meal;
  MealRow(this.meal);

  @override
  _MealRowState createState() => _MealRowState(meal);
}

class _MealRowState extends State<MealRow> {
  Meal meal;
  HttpHelper? helper;
  _MealRowState(this.meal);
  //String path;

  @override
  void initState(){
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: Hero(
          tag: 'poster_'+widget.meal.id.toString(),
          child: Image.network(meal.thumb.toString()),
        ),
        title: Text(widget.meal.title.toString()),
      ),
    );
  }
}
