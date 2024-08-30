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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit product',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '$productName',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.circle,
            color: Colors.green,
            size: 20,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.maxFinite,
                height: 300,
                child: _imageFile != null
                    ? Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/gallery.png',
                        scale: 2,
                      )),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // Main image button
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // Shadow color
                              spreadRadius: 1,
                              // Spread radius
                              blurRadius: 3,
                              // Blur radius
                              offset: const Offset(0, 2)),
                        ],
                      ),
                      child: _imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              // Same as the container's border radius
                              child: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset(
                              'assets/gallery.png',
                              scale: 15,
                            ),
                    ),
                  ),
                  // Overlay camera button
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: _pickImage,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Image.asset(
                    'assets/edit.png',
                    height: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Product Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                productName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2f518c)),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 5,
                  color: Colors.grey.shade200,
                )),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(50))),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Product views ',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            TextSpan(
                              text: '$productViews',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2f518c),
                                  fontSize:
                                      15), // Change this to your desired color
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Preview',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
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
                        fontSize: 20), // Change this to your desired color
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
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
                                    size: 16, color: Colors.grey.shade800),
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
            Container(
              height: 5,
              color: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Image.asset('assets/document.png',
                    height: 15, color: Colors.grey.shade800),
                const SizedBox(width: 5),
                Text('Description',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800)),
                const Spacer(),
                Image.asset('assets/edit.png',
                    height: 15, color: Colors.grey.shade800)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildDescriptionField(),
            ),
            const SizedBox(height: 10),
            _buildYouTubeField(),
            Container(
              height: 125,
              color: Colors.grey.shade200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Colors.grey.shade500,
                      size: 35,
                    ),
                    Text(
                      'Nothing more to show',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500),
                    ),
                    Text('Add more info to your content to attract customers',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 12))
                  ],
                ),
              ),
            ),
            _bottomItem()
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: "Describe your content here...",
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildYouTubeField() {
    return Container(
      color: Colors.grey.shade800,
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
                  Image.asset(
                    'assets/youtube.png',
                    height: 20,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Copy URL of a YouTube video and paste it here.',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFf5f5f5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Paste your YouTube video link here',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  youtubeBut(_clearTextField, 'Clear', Icons.clear_all),
                  youtubeBut(_pasteText, 'Paste', Icons.paste),
                  youtubeBut(_applyLink, 'Apply', Icons.check),
                ],
              ),
            ),
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
