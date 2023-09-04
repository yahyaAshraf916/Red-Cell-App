import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red_cell_app/provider/list_provider.dart';
import 'package:red_cell_app/screens/home/donation_item.dart';

class OrderList extends StatelessWidget {
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    provider.fetchOrderListFromFireStore();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  height: MediaQuery.of(context).size.height * .233,
                  width: double.infinity,
                  image: AssetImage("assets/images/Group 1109.png"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                  child:
                      Text(
                        "Order list",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.donateModel.length,
                itemBuilder: (_, index) {
                  return DonationItem(
                    provider.donateModel[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
