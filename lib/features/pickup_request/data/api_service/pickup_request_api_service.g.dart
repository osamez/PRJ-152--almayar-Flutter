// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_request_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _PickupRequestApiService implements PickupRequestApiService {
  _PickupRequestApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'tracking_number': trackingNumber,
      r'status': status,
      r'shipment_type': shipmentType,
      r'flight_type': flightType,
      r'shipping_method': shippingMethod,
      r'shipment_way': shipmentWay,
      r'page': page,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ShipmentRequestsDataModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/my-shipment-requests',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ShipmentRequestsDataModel> _value;
    try {
      _value = BaseResponse<ShipmentRequestsDataModel>.fromJson(
        _result.data!,
        (json) =>
            ShipmentRequestsDataModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<ShipmentContentModel>>> getShipmentContents() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<ShipmentContentModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/shipment-contents',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<ShipmentContentModel>> _value;
    try {
      _value = BaseResponse<List<ShipmentContentModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<ShipmentContentModel>(
                    (i) => ShipmentContentModel.fromJson(
                      i as Map<String, dynamic>,
                    ),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<ShipmentCategoryModel>>>
  getShipmentCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<ShipmentCategoryModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/shipment-categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<ShipmentCategoryModel>> _value;
    try {
      _value = BaseResponse<List<ShipmentCategoryModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<ShipmentCategoryModel>(
                    (i) => ShipmentCategoryModel.fromJson(
                      i as Map<String, dynamic>,
                    ),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<AppBranchModel>>> getReceivingBranches() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<AppBranchModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/receiving-branches',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<AppBranchModel>> _value;
    try {
      _value = BaseResponse<List<AppBranchModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<AppBranchModel>(
                    (i) => AppBranchModel.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<AppBranchModel>>> getDeliveryBranches() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<AppBranchModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/delivery-branches',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<AppBranchModel>> _value;
    try {
      _value = BaseResponse<List<AppBranchModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<AppBranchModel>(
                    (i) => AppBranchModel.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<AddShipmentRequestResponseData>> addShipmentRequest({
    required String receivingBranchId,
    required String deliveryBranchId,
    required String boxesCount,
    required String totalWeight,
    required String shipmentContentId,
    required String shipmentType,
    required String flightType,
    required String totalSize,
    required String categoryId,
    required String trackingNumber,
    required String supplierPhoneCode,
    required String supplierPhone,
    required String inspectionRequest,
    String? inspectionNote,
    List<MultipartFile>? documentImages,
    List<MultipartFile>? shipmentImages,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('receiving_branch_id', receivingBranchId));
    _data.fields.add(MapEntry('delivery_branch_id', deliveryBranchId));
    _data.fields.add(MapEntry('boxes_count', boxesCount));
    _data.fields.add(MapEntry('total_weight', totalWeight));
    _data.fields.add(MapEntry('shipment_content_id', shipmentContentId));
    _data.fields.add(MapEntry('shipment_type', shipmentType));
    _data.fields.add(MapEntry('flight_type', flightType));
    _data.fields.add(MapEntry('total_size', totalSize));
    _data.fields.add(MapEntry('category_id', categoryId));
    _data.fields.add(MapEntry('tracking_number', trackingNumber));
    _data.fields.add(MapEntry('supplier_phone_code', supplierPhoneCode));
    _data.fields.add(MapEntry('supplier_phone', supplierPhone));
    _data.fields.add(MapEntry('inspection_request', inspectionRequest));
    if (inspectionNote != null) {
      _data.fields.add(MapEntry('inspection_note', inspectionNote));
    }
    if (documentImages != null) {
      _data.files.addAll(
        documentImages.map((i) => MapEntry('document_images[]', i)),
      );
    }
    if (shipmentImages != null) {
      _data.files.addAll(
        shipmentImages.map((i) => MapEntry('shipment_images[]', i)),
      );
    }
    final _options =
        _setStreamType<BaseResponse<AddShipmentRequestResponseData>>(
          Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data',
              )
              .compose(
                _dio.options,
                'user/add-shipment-request',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<AddShipmentRequestResponseData> _value;
    try {
      _value = BaseResponse<AddShipmentRequestResponseData>.fromJson(
        _result.data!,
        (json) => AddShipmentRequestResponseData.fromJson(
          json as Map<String, dynamic>,
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
