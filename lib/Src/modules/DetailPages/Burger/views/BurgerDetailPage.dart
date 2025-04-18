import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BurgerDetailPage extends StatefulWidget {
  const BurgerDetailPage({super.key});

  @override
  State<BurgerDetailPage> createState() => _BurgerDetailPageState();
}

class _BurgerDetailPageState extends State<BurgerDetailPage> {
  // Sample burger data
  final List<Map<String, dynamic>> burgers = [
    {
      'name': 'Classic Burger',
      'restaurant': 'Rose Garden',
      'price': 100,
      'image': Colors.grey,
    },
    {
      'name': 'Cheese Burger',
      'restaurant': 'Burger King',
      'price': 120,
      'image': Colors.blueGrey,
    },
    {
      'name': 'Chicken Burger',
      'restaurant': 'McDonald\'s',
      'price': 150,
      'image': Colors.brown,
    },
    {
      'name': 'Veggie Burger',
      'restaurant': 'Green Cafe',
      'price': 90,
      'image': Colors.green,
    },
    {
      'name': 'Bacon Burger',
      'restaurant': 'BBQ House',
      'price': 180,
      'image': Colors.red,
    },
    {
      'name': 'Double Patty',
      'restaurant': 'Burger Palace',
      'price': 200,
      'image': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 10.w),
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 18.sp, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Container(
          height: 40.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Center(
            child: Text(
              "Burgers",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(
                "Popular Burgers",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 20.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.72,
                ),
                itemCount: burgers.length,
                itemBuilder: (context, index) {
                  return _buildBurgerCard(burgers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBurgerCard(Map<String, dynamic> burger) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            height: 110.h,
            decoration: BoxDecoration(
              color: burger['image'],
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  burger['name'],
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  burger['restaurant'],
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs. ${burger['price']}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[700],
                      ),
                    ),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 18.sp,
                        color: Colors.orange[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}