import 'package:flutter/material.dart';

class PhoneList extends StatelessWidget {
  var phone = <String>['Phone 1', 'Phone 2', 'Phone 3', 'Phone 4', 'Phone 5'];
  var phoneimg = <String>[
    "https://assets.mspimages.in/c/tr:w-375,h-300,c-at_max/12174-264-1.jpg",
    "https://images.bewakoof.com/t320/i-m-lazy-xiaomi-redmi-note-9-pro-max-mobile-cover-465354-1642687794-1.jpg",
    "https://images.immediate.co.uk/production/volatile/sites/3/2021/10/iPhone-13-mini-review-3f70b9e.png",
    "https://priceintanzania.com/wp-content/uploads/2022/05/OnePlus-Ace-Racing-edition-300x300.jpg",
    "https://media.croma.com/image/upload/v1662703724/Croma%20Assets/Communication/Mobiles/Images/261934_qgssvy.png"
  ];
  var price = <int>[800, 700, 500, 300, 100];
  var color = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tech Shop"),
      ),
      body: ListView.builder(
        itemCount: phone.length,
        itemBuilder: (context, index) {
          return Card(
            color: color[index],
            child: ListTile(
              leading: Container(
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(phoneimg[index]),
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(phone[index],textAlign: TextAlign.center,),
              ),
              subtitle: Text("Amazing Phone",textAlign: TextAlign.center),
              trailing: Text("\$${price[index]}"),
            ),
          );
        },
      ),
    );
  }
}
void main(){
  runApp(MaterialApp(home:PhoneList()));
}
