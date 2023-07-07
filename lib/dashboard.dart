import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/servicedio.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List<Product> products = [];
  Servicedio service = Servicedio();
  List<Product> listaddcard=[];
  bool loading = true;
  showproduct() async {
    try {
      setState(() {
        loading = true;
      });
      var response = await service.getData('products');
      (response.data as List).forEach((prod) {
        products.add(Product.fromJson(prod));
        setState(() {
          loading = false;
        });
      });
      print(products);
    } catch (e) {
      setState(() {
        loading = false;
        print(e);
      });
    }
  }

  addtocard(Product product){
    setState(() {
      listaddcard.add(product);
    });
  }

  removetocard(Product product)
  {
    setState(() {
      
    listaddcard.remove(product);
    });
  }

  sendData(){
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    showproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading? const Center(
        child: CupertinoActivityIndicator(
          radius: 50,
        ),
      ) :GridView.builder(
        itemCount: products.length,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
         itemBuilder: (context,index){
          final iscard=listaddcard.contains(products[index].id);
        return Card(
          child:Column(children: [
            Expanded(child:Image(image: NetworkImage('${products[index].image}')) ,),
            Column(children: [
              Text('${products[index].title}',
               overflow: TextOverflow.ellipsis,
              maxLines: 2,),
              Text('${products[index].description}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,),
              
              iscard?
              OutlinedButton(onPressed: (){removetocard(products[index]);}, child:const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.remove_shopping_cart),
                Text('remove')
              ],))
              :
              OutlinedButton(onPressed: (){addtocard(products[index]);}, child:const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.add_shopping_cart),
                Text('Add')
              ],))

            ],)
          ],),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Stack(
        children: [
          Positioned(
            top: 25,
            right:10,
            child:
           Icon(Icons.shopping_cart_rounded)
          ),
          Positioned(
            top: 3,
            right: 3,
            child: Text("${listaddcard.length}")
          ),
        ],
      ) ,),
    );
  }
}
