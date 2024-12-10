import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/dashboard_controller.dart';
import '../utils/text_styles.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          _appbar(context),
          Center(
            child: Text(
              'Sohil Sardar',
              style: TextHelper.size16(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: Row(
              children: [
                Container(
                  width: 1.w,
                  height: 3.h,
                  color: Colors.red,
                ),
                SizedBox(width: 2.w),
                Text(
                  "Recommended",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Expanded(child: _recommendeList(context)),
        ],
      ),
    );
  }

  Widget _appbar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.home,
          color: Colors.redAccent,
        ),
        SizedBox(width: 2.w),
        Text(
          'WORK',
          style: TextHelper.size16(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _recommendeList(BuildContext context) {
    return Obx(() {
      if (controller.recommendations.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        itemCount: controller.recommendations.length,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        itemBuilder: (context, index) {
          final item = controller.recommendations[index];
          return Card(
            margin: EdgeInsets.only(bottom: 2.h),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.image!,
                  width: 12.w,
                  height: 12.w,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                item.name!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              subtitle: Text(
                'Price: ₹${item.price}',
                style: TextStyle(fontSize: 12.sp),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  // Handle add to cart
                },
              ),
            ),
          );
        },
      );
    });
  }
}
