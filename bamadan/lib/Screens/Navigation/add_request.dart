import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class AddRequestScreen extends StatefulWidget {
  const AddRequestScreen({super.key});

  @override
  State<AddRequestScreen> createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  bool isText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          margin: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'موضوع یا کتاب مورد نظر : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      icon: CircleAvatar(child: Icon(Icons.close)))
                ],
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'نوع فایل : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isText = true;
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: isText
                          ? MaterialStateProperty.all<Color>(
                              Color(0xFF198881),
                            )
                          : MaterialStateProperty.all<Color>(
                              Color(0xFFA7B3B2),
                            ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Text(
                        'متنی',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isText = false;
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: !isText
                          ? MaterialStateProperty.all<Color>(
                              Color(0xFF198881),
                            )
                          : MaterialStateProperty.all<Color>(
                              Color(0xFFA7B3B2),
                            ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Text(
                        'صوتی',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تعداد صفحه : ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'زمان تحویل : ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                        ),
                        readOnly: true,
                        onTap: () async {
                          Jalali? picked = await showPersianDatePicker(
                            context: context,
                            initialDate: Jalali.now(),
                            firstDate: Jalali.now(),
                            lastDate: Jalali.now().addMonths(3),
                            initialEntryMode: PDatePickerEntryMode.calendar,
                          );
                          if (picked != null) {}
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'دسته بندی : ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15)),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'توضیحات : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  minLines: 3,
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'کامل بودن توضیحات به ما برای ارائه خدمات بهتر کمک می کند',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    autofocus: true,
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Text(
                        'ثبت',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
