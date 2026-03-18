// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_transfers_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _MoneyTransfersApiService implements MoneyTransfersApiService {
  _MoneyTransfersApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<MoneyTransferResponse>> getMoneyTransfers({
    int? status,
    int? page,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'status': status, r'page': page};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<MoneyTransferResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/money-transfers',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<MoneyTransferResponse> _value;
    try {
      _value = BaseResponse<MoneyTransferResponse>.fromJson(
        _result.data!,
        (json) => MoneyTransferResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MessageModel> addMoneyTransfer({
    File? invoiceImages,
    String? invoiceValue,
    String? paymentCurrencyId,
    String? currencyId,
    String? supplierName,
    String? supplierAddress,
    String? supplierPhoneCode,
    String? supplierPhone,
    String? notes,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (invoiceImages != null) {
      _data.files.add(
        MapEntry(
          'invoice_images',
          MultipartFile.fromFileSync(
            invoiceImages.path,
            filename: invoiceImages.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    if (invoiceValue != null) {
      _data.fields.add(MapEntry('invoice_value', invoiceValue));
    }
    if (paymentCurrencyId != null) {
      _data.fields.add(MapEntry('payment_currency_id', paymentCurrencyId));
    }
    if (currencyId != null) {
      _data.fields.add(MapEntry('currency_id', currencyId));
    }
    if (supplierName != null) {
      _data.fields.add(MapEntry('supplier_name', supplierName));
    }
    if (supplierAddress != null) {
      _data.fields.add(MapEntry('supplier_address', supplierAddress));
    }
    if (supplierPhoneCode != null) {
      _data.fields.add(MapEntry('supplier_phone_code', supplierPhoneCode));
    }
    if (supplierPhone != null) {
      _data.fields.add(MapEntry('supplier_phone', supplierPhone));
    }
    if (notes != null) {
      _data.fields.add(MapEntry('notes', notes));
    }
    final _options = _setStreamType<MessageModel>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'user/add-money-transfer',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MessageModel _value;
    try {
      _value = MessageModel.fromJson(_result.data!);
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
