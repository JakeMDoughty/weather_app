import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:weather_app/models/location_payload.dart';
import 'package:weather_app/support/constants/my_constant.dart';
import 'package:weather_app/support/helpers/my_utils.dart';
import 'package:weather_app/support/ui/theme.dart';
import 'package:weather_app/support/ui/widgets/my_button.dart';
import 'package:weather_app/support/ui/widgets/my_text.dart';

class LocationChangeDialog extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  LocationPayload? result;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: themeGreenLight,
      key: Key("LocationChangeDialog"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 120.0,
          child: Column(
            children: [
              k_height_gap_4,
              placesAutoCompleteTextField(context),
              k_height_gap_4,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    text: "Set Location",
                    onClick: (p0) {
                      if (result != null) {
                        Navigator.pop(context, result);
                      } else {
                        MyUtils.showSnackBarInfo(
                            context, "Please select location");
                      }
                    },
                  ),
                  k_width_gap_4,
                  MyButton(
                    text: "Current Location",
                    onClick: (p0) {
                      Navigator.pop(
                        context,
                        LocationPayload(
                          0.0,
                          0.0,
                          "",
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  placesAutoCompleteTextField(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller,
      googleAPIKey: GOOGLE_API_KEY,
      inputDecoration: textFieldDecoration("Search Location"),
      textStyle: Theme.of(context).textTheme.labelMedium!,
      debounceTime: 400,
      countries: ["us"],
      isLatLngRequired: true,
      showError: false,
      boxDecoration: BoxDecoration(),
      getPlaceDetailWithLatLng: (Prediction prediction) {
        final locationName =
            "${prediction.description?.split(",")[0] ?? ""}, ${prediction.description?.split(",")[1] ?? ""}";

        result = LocationPayload(
          double.parse(prediction.lat ?? "0.0"),
          double.parse(prediction.lng ?? "0.0"),
          locationName,
        );
      },

      itemClick: (Prediction prediction) {
        controller.text = prediction.description ?? "";
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: prediction.description?.length ?? 0));
      },

      itemBuilder: (context, index, Prediction prediction) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(
                width: 7,
              ),
              Expanded(
                  child: MyText(
                text: "${prediction.description ?? ""}",
                textStyle: Theme.of(context).textTheme.labelMedium!,
              ))
            ],
          ),
        );
      },

      isCrossBtnShown: false,

      // default 600 ms ,
    );
  }
}
