part of '../../feature_imports.dart';

enum ShipmentType {
  air,
  sea;

  String get title {
    switch (this) {
      case ShipmentType.air:
        return LocaleKeys.receive_air_shipment_title.tr();
      case ShipmentType.sea:
        return LocaleKeys.receive_sea_shipment_title.tr();
    }
  }

  String get primaryOptionLabel {
    switch (this) {
      case ShipmentType.air:
        return LocaleKeys.receive_air_express_shipping.tr();
      case ShipmentType.sea:
        return LocaleKeys.receive_sea_private_shipping.tr();
    }
  }

  String get secondaryOptionLabel {
    switch (this) {
      case ShipmentType.air:
        return LocaleKeys.receive_air_economy_shipping.tr();
      case ShipmentType.sea:
        return LocaleKeys.receive_sea_shared_shipping.tr();
    }
  }
}
