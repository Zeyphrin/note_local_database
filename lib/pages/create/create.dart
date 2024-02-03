import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:note_local_database/pages/create/controller.dart';

class CreatePage extends GetView<CreatePageController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9792AE),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEBE5F4),
                ),
                onPressed: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xFF55545E),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  filled: true,
                  fillColor: const Color(0xFFEBE5F4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: controller.contentController,
                decoration: InputDecoration(
                  labelText: "Content",
                  filled: true,
                  fillColor: const Color(0xFFEBE5F4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEBE5F4),
                ),
                onPressed: controller.onSubmit,
                child: const Text(
                  "SUBMIT",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF55545E)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
