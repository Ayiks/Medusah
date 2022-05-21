import 'package:get/get.dart';
import 'package:medusah/views/dashboard.dart';
import 'package:medusah/views/stocks/product_detail.dart';

class RouteHelper {
  static const String initial ='/';
  static const String productPage = '/product-page';

  static String getInitial() => '$initial';
  static String getProduct(int pageId, String page) => '$productPage?pageId=$pageId&page=$page';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> DashboardView()),
    GetPage(name: productPage, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return ProductDetail(pageId: int.parse(pageId!), page: page!);
    },
    transition: Transition.fadeIn
    ),

  ];
}