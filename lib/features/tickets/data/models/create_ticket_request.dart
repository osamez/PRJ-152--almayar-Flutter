import 'package:json_annotation/json_annotation.dart';

part 'create_ticket_request.g.dart';

@JsonSerializable(createFactory: false)
class CreateTicketRequest {
  final String? title;
  final String? description;
  @JsonKey(name: 'from_system')
  final String? fromSystem;
  @JsonKey(name: 'to_system')
  final String? toSystem;
  final String? priority;
  @JsonKey(name: 'shipment_code')
  final String? shipmentCode;

  const CreateTicketRequest({
    this.title,
    this.description,
    this.fromSystem = '1',
    this.toSystem,
    this.priority,
    this.shipmentCode,
  });

  Map<String, dynamic> toJson() => _$CreateTicketRequestToJson(this);
}
