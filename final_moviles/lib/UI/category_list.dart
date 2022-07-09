import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_moviles/models/category.dart';
import 'package:final_moviles/utils/http_helper.dart';
import 'package:final_moviles/UI/category_detail.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  HttpHelper? helper;
  ScrollController? _scrollController;
  List<Category> categories = [];
  int? categoriesCount;
  bool loading = true;

  Future initialize() async{
    loadMore();
    initScrollController();
  }

  @override
  void initState(){
    super.initState();
    helper = HttpHelper();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: categories!.length,
        itemBuilder: (BuildContext context, int index){
          return MovieRow(categories![index]);
        },
      ),
    );
  }

  void loadMore() {
    helper!.getCategories().then((value) {
      categories += value;
      setState(() {
        categoriesCount = categories.length;
        categories = categories;
      });

      if(categories.length % 20 > 0){
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
}

class MovieRow extends StatefulWidget {
  final Category category;
  MovieRow(this.category);

  @override
  _MovieRowState createState() => _MovieRowState(category);
}

class _MovieRowState extends State<MovieRow> {
  Category category;
  _MovieRowState(this.category);

  late bool favorite;
  //String path;

  @override
  void initState(){
    favorite = false;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: Hero(
          tag: 'poster_'+widget.category.id.toString(),
          child: Image.network(category.thumb.toString()),
        ),
        title: Text(widget.category.title.toString()),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CategoryDetail(widget.category)
            ),
          ).then((value) {
          });
        },
      ),
    );
  }
}
