import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/modules/DetailPages/Burger/views/BurgerDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCategories({required IconData icon, required String name, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 15.w), 
        child: Column(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Icon(
                icon,
                size: 30.sp,
                color: Colors.orangeAccent,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 70.w, // Constrain text width to icon width
              child: Text(
                name,
                style: TextStyle(fontSize: 14.sp),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
            child: Container(
              height: 150.h,
              width: double.infinity,
              color: Colors.blueGrey[300],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rose Garden Restaurant",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Burger - Chicken - Rice - Wings",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18.sp),
                    SizedBox(width: 4.w),
                    Text("4.7", style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(width: 12.w),
                    Icon(Icons.local_shipping_outlined,
                        color: Colors.orange, size: 18.sp),
                    SizedBox(width: 4.w),
                    Text("Free"),
                    SizedBox(width: 12.w),
                    Icon(Icons.access_time, color: Colors.orange, size: 18.sp),
                    SizedBox(width: 4.w),
                    Text("20 min"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 10.w),
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Icon(Icons.menu),
        ),
        title: ListTile(
          title: Text(
            "DELIVER TO",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 15.sp),
          ),
          subtitle: Text("Halal club office"),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.w),
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text("Hey Halal, Good Morning",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
            SizedBox(height: 30.h),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search for food',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10.h),
            ListTile(
              leading: Text("Categories", style: TextStyle(fontSize: 18.sp)),
              trailing: Text(
                "See All",
                style: TextStyle(color: Colors.orangeAccent, fontSize: 15.sp),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 120.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 5.w), // Initial spacing
                  _buildCategories(icon: Icons.fastfood, name: 'Burger',onTap: 
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BurgerDetailPage()),
                    );
                  }),
                  _buildCategories(icon: Icons.local_pizza, name: 'Pizza',onTap: 
                  () {
                    
                  }),
                  _buildCategories(icon: Icons.ramen_dining, name: 'Noodles',onTap: 
                  () {
                    
                  }),
                  _buildCategories(icon: Icons.lunch_dining, name: 'Sandwich',onTap: 
                  () {
                    
                  }),
                  _buildCategories(icon: Icons.local_drink, name: 'Drinks',onTap: 
                  () {
                    
                  }),
                  _buildCategories(icon: Icons.icecream, name: 'Desserts',onTap: 
                  () {
                    
                  }),
                  SizedBox(width: 5.w), // Ending spacing
                ],
              ),
            ),
            ListTile(
              leading: Text(
                "Open Restaurants",
                style: TextStyle(fontSize: 18.sp),
              ),
              trailing: Text(
                "See All",
                style: TextStyle(color: Colors.orangeAccent, fontSize: 15.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView(
                children: [
                  _buildRestaurantCard(),
                  _buildRestaurantCard(),
                  _buildRestaurantCard(),
                  _buildRestaurantCard(),
                  _buildRestaurantCard(),
                  SizedBox(height: 20.h), // Bottom spacing
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}