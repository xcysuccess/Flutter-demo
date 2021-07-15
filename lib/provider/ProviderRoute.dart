import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartModel.dart';
import 'Item.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<CartModel>(
        create: (_) => CartModel(),
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              // Builder(builder: (context) {
              //   var cart = Provider.of<CartModel>(context, listen: true);
              //   return Text("总价: ${cart.totalPrice}");
              // }),
              Consumer<CartModel>(builder:
                  (BuildContext context, CartModel cart, Widget? widget) {
                return Text("总价: ${cart.totalPrice}");
              }),
              Builder(builder: (context) {
                print("RaisedButton build"); //在后面优化部分会用到
                return RaisedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    context.read<CartModel>().add(Item(20.0, 1));
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}

// class _ProviderRouteState extends State<ProviderRoute> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Container(
//         child: ChangeNotifierProvider<CartModel>(
//           create: (_) => _model,
//           child: Container(
//             child: Column(
//               children: [
//                 Container(
//                   height: 60.0,
//                   width: 100,
//                   //child: Text('${context.watch<CartModel>().totalPrice}'),
//                   //),
//                   child: Consumer<CartModel>(
//                     builder: (context, model, child) {
//                       return Text('总价：${model.totalPrice}');
//                     },
//                   ),
//                 ),
//                 Builder(builder: (context) {
//                   return FlatButton(
//                       onPressed: () {
//                         var cartModel =
//                             Provider.of<CartModel>(context, listen: false);
//                         cartModel.add(Item(20.0, 1));
//                       },
//                       child: Text('添加商品'));
//                 })
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
