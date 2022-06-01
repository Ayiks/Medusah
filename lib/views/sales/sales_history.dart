import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/utils.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class SalesHistory extends StatelessWidget {
  const SalesHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Map<String, int> cartItemsPerOrder = Map();
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList().reversed.toList();
    for(int i = 0; i<getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
      }
    }

    List<int> cartItemsPerOrderToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

    return Scaffold(

      body: Column(
        children: [
          Container(
            height: Dimensions.height10 *10,
            color: Colors.orange,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45,right: Dimensions.width15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child:AppIcon(icon: Icons.arrow_back_ios, iconColor:Colors.orange,backgroundColor: Colors.white,)
                  ,
                ),
                BigText(text: 'Sales', color: Colors.white,),
              ],
            ),),
          Expanded(
              child: Container(
                height: Dimensions.height30*4,
                margin: EdgeInsets.only(
                  top: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView(
                      children: [
                        for(int i=0; i<itemsPerOrder.length; i++)
                          Container(
                            margin: EdgeInsets.only(bottom: Dimensions.height20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (()
                                {
                                  //gets the exact date from the cart list
                                  DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
                                  //converts the date from the cartList to a DateTime obj
                                  var inputDate = DateTime.parse(parseDate.toString());
                                  //the format in which date should appear
                                  var outPutFormat = DateFormat("MM/dd/yyyy hh:mm a");
                                  var outPutDate = outPutFormat.format(inputDate);
                                  return BigText(text: outPutDate);
                                }
                                  ()),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      direction: Axis.vertical,
                                      children: List.generate(itemsPerOrder[i], (index) {
                                        if(listCounter < getCartHistoryList.length){
                                          listCounter++;
                                        }
                                        return
                                        Container(
                                          child: Text(getCartHistoryList[listCounter - 1].name!),
                                        );
                                      }),
                                    ),
                                    Container(
                                      height: Dimensions.height20*4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          SmallText(text: 'Total',  color: Colors.black,),
                                          BigText(text: itemsPerOrder[i].toString() + ' Items', color:Colors.black,),
                                          GestureDetector(
                                            onTap: (){

                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10/2),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                                  border: Border.all(width: 1, color: Colors.orange)
                                              ),
                                              child: SmallText(text: 'one more', color: Colors.orange),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),

                          )
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}
