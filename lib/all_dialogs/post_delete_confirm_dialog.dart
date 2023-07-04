import 'package:dio/dio.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/data/api_constant/api_url.dart';
import 'package:fixgocompanyapp/data/data_constant/constant_data.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:fixgocompanyapp/presentation/dashboard_screen.dart';
import 'package:fixgocompanyapp/presentation/home_module/recent_pickup_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



class PostDeleteConfirmationDialog extends StatefulWidget {

  final String message;
  final String postId;
  final String openFrom;

  const PostDeleteConfirmationDialog({super.key, required this.message, required this.postId, required this.openFrom});

  @override
  State<PostDeleteConfirmationDialog> createState() => _PostDeleteConfirmationDialogState();
}

class _PostDeleteConfirmationDialogState extends State<PostDeleteConfirmationDialog> {


  final Dio _dio = Dio();

  bool isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onDoubleTap: () {},
      child: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 10),
                child: Center(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getMessageText(),
                          getAddForButtonsLayout(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: isLoading,
                child: CircularProgressIndicator()
            ),
          ],
        ),
      ),
    );
  }

  /*text filed Widget*/
  Widget getMessageText() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 2,
        left: 3,
        right: 3,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(widget.message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  // fontFamily: Constant.AVENIR_HEAVY,
                ),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  /* Widget for Buttons Layout0 */
  Widget getAddForButtonsLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            print("Yesss");

            if(mounted){
              setState(() {
                isLoading = true;
              });
            }

            if(widget.openFrom == "2") {
              postDeleteById(postId: widget.postId).then((value) {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              });
            }else if(widget.openFrom == "1"){
              ApiClient().pickUpAddressDeleteById(postId: widget.postId).then((value){
                isLoading = false;
                Navigator.pop(context);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PreviousAddressListScreen()));
              });
            }


          },
          child: Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    // fontFamily: Constant.AVENIR_HEAVY
                  ),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(
              color: CommonColor.SIGN_UP_TEXT_COLOR,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "No",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    // fontFamily: Constant.AVENIR_HEAVY
                  ),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }



  Future<void> postDeleteById({required String postId}) async {
    String url = "${ApiConstants().baseUrl}post/delete/$postId";
    String? sessionToken = GetStorage().read<String>(
        ConstantData.userAccessToken);

    try {
      var result = await _dio.delete(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $sessionToken',
            },
            validateStatus: (status) {
              return status! < 500;
            },
          )
      );

      print(result.statusCode);

      if(result.statusCode == 400){
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sorry! Expired Post cannot be deleted.")));
      }else if(result.statusCode == 200){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(isComeFrom: widget.openFrom == "2" ? '2' : "3",)));
        // if(widget.openFrom == 2){
        //
        // }else{
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(isComeFrom: '3',)));
        // }
      }


    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
