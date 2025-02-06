import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/bloc/text_expansion_bloc.dart';
import 'package:ticket_app/bloc/text_expansion_events.dart';
import 'package:ticket_app/bloc/text_expansion_states.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int hotelIndex = 0;
  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var index = ModalRoute.of(context)!.settings.arguments as Map;
      hotelIndex = index["index"];
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.00,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppStyles.primaryColor),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                Positioned.fill(
                    child: Image.asset(
                  "assets/images/${hotelList[hotelIndex]["image"]}",
                  fit: BoxFit.cover,
                )),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        hotelList[hotelIndex]["place"],
                        style: TextStyle(fontSize: 24, color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: AppStyles.primaryColor,
                            offset: const Offset(2.0, 2.0)
                          )
                        ]),
                      )),
                )
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ExpendedTextWidget(
                    text:hotelList[hotelIndex]["detail"]),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "More images",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                    itemCount: hotelList[hotelIndex]["images"].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, imageIndex) {
                      return Container(
                          margin: const EdgeInsets.all(16.0),
                          child: Image.asset("assets/images/${hotelList[hotelIndex]["images"][imageIndex]}"));
                    }),
              )
            ]),
          )
        ],
      ),
    );
  }
}


class ExpendedTextWidget extends StatelessWidget {
  final String text;
  const ExpendedTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TextExpansionBloc, TextExpansionState>(builder: (context, state){
      var isExpanded = (state as TextExpansionExpanded).isExpanded;
      var textWidget = Text (
        text,
        maxLines: isExpanded?null:9,
        overflow: isExpanded?TextOverflow.visible:TextOverflow.ellipsis,
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget,
          GestureDetector(
            onTap: (){
              context.read<TextExpansionBloc>().add(ToggleExpansion(!isExpanded));
            },
            child: Text(isExpanded?"Less":"More", style: AppStyles.textStyle.copyWith(
                color: AppStyles.primaryColor
            ),),
          )
        ],
      );
    });
  }
}
