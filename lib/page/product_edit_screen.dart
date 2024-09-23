import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';


class EditProduct extends StatefulWidget {
  final Color color;

  const EditProduct({super.key, required this.color});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController _controller = TextEditingController();
  int productViews = 0;
  File? _imageFile;
  int productPrice = 500;
  String productName = 'Mouse';

  void _clearTextField() {
    _controller.clear();
  }

  void _pasteText() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      _controller.text = clipboardData.text ?? '';
    }
  }

  void _applyLink() async {
    final url = _controller.text;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      // Show an error message if the URL is not valid or cannot be launched
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cannot open the link")),
      );
    }
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _imageFile = File(result.files.single.path!);
      });
    }
  }

  void _editProductName(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // To adjust for keyboard popup
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // To avoid overlap with the keyboard
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Product Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                //  controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle saving the name, e.g., update the product name in your backend
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  width: double.infinity, // Make the button full width
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20), // Padding for aesthetics
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 1.0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit product',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: height * 0.11,
                  width: height * 0.11,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50, // Light background color
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _imageFile != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Icon(
                        Icons.broken_image_outlined,
                        size: height * 0.08,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: width * 0.04,
                right: width * 0.05,
                child: Container(
                  width: width * 0.058,
                  height: width * 0.058,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius:
                    BorderRadius.circular(50), // Custom rounded corners
                  ),
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Icon(Icons.add,
                        color: Colors.white, size: height * 0.015),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PRODUCT NAME',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF808080)),
                      ),
                      Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.mode_edit_outlined, size: 15)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Image.asset('assets/rupee.png',
                              height: 19, color: Colors.grey.shade800),
                          const SizedBox(width: 5),
                          Text('Price',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800))
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Text(
                    //     'Preview',
                    //     style: TextStyle(
                    //       color: Colors.grey.shade600,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          // Icon(Icons.currency_rupee,size: 20,),
                          Text(
                            '₹$productPrice',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2f518c),
                                fontSize:
                                20), // Change this to your desired color
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Selling Price*',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.currency_rupee,
                                          size: 16,
                                          color: Colors.grey.shade800,
                                        ),
                                        Text(
                                          '$productPrice',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'MRP',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.currency_rupee,
                                            size: 16,
                                            color: Colors.grey.shade800),
                                        Text(
                                          '$productPrice',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   height: 5,
            //   color: Colors.grey.shade200,
            // ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade800)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _buildDescriptionField(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: _buildYouTubeField(),
            ),
            SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.grey.shade200,
            //         borderRadius: BorderRadius.circular(10.0)),
            //     height: 125,
            //     child: Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.keyboard_arrow_up_outlined,
            //             color: Colors.grey.shade500,
            //             size: 35,
            //           ),
            //           Text(
            //             'Nothing more to show',
            //             style: TextStyle(
            //                 color: Colors.grey.shade500,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //           Text('Add more info to your content to attract customers',
            //               style: TextStyle(
            //                   color: Colors.grey.shade500, fontSize: 12))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            _bottomItem()
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: "Describe your content here...",
        // hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        // filled: true,
        // fillColor: Colors.grey[200],
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: BorderSide.none,
        // ),
      ),
    );
  }

  Widget _buildYouTubeField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/video.png',
                    height: 20,
                  ),
                  Text('YOUTUBE')
                ],
              ),
            ),

            const SizedBox(height: 5),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                // filled: true,
                // fillColor: const Color(0xFFf5f5f5),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                //   borderSide: BorderSide.none,
                // ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Paste your YouTube video link here',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            // SizedBox(
            //   height: 40,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       youtubeBut(_clearTextField, 'Clear', Icons.clear_all),
            //       youtubeBut(_pasteText, 'Paste', Icons.paste),
            //       youtubeBut(_applyLink, 'Apply', Icons.check),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget youtubeBut(onTap, name, icon) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 17),
            const SizedBox(width: 5),
            Text(
              name,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomItem() {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          itemBut(
                  () {}, 'Preview', Icons.remove_red_eye, const Color(0xFFfbc02d)),
          itemBut(() {}, 'Promote', Icons.campaign, const Color(0xFF284b88)),
          itemBut(() {}, 'Share', Icons.share, const Color(0xFF075e54)),
        ],
      ),
    );
  }

  Widget itemBut(onTap, butName, icon, color) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 5),
            Text(
              butName,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
