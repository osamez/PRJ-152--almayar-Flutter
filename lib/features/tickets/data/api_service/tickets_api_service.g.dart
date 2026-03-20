// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _TicketsApiService implements TicketsApiService {
  _TicketsApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets({
    int? status,
    int? page,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'status': status, r'page': page};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<TicketsResponseDataModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/tickets/all-tickets',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<TicketsResponseDataModel> _value;
    try {
      _value = BaseResponse<TicketsResponseDataModel>.fromJson(
        _result.data!,
        (json) =>
            TicketsResponseDataModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<TicketModel>> createTicket({
    String? title,
    String? description,
    String? fromSystem,
    String? toSystem,
    String? priority,
    String? shipmentCode,
    MultipartFile? file,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (title != null) {
      _data.fields.add(MapEntry('title', title));
    }
    if (description != null) {
      _data.fields.add(MapEntry('description', description));
    }
    if (fromSystem != null) {
      _data.fields.add(MapEntry('from_system', fromSystem));
    }
    if (toSystem != null) {
      _data.fields.add(MapEntry('to_system', toSystem));
    }
    if (priority != null) {
      _data.fields.add(MapEntry('priority', priority));
    }
    if (shipmentCode != null) {
      _data.fields.add(MapEntry('shipment_code', shipmentCode));
    }
    if (file != null) {
      _data.files.add(MapEntry('file', file));
    }
    final _options = _setStreamType<BaseResponse<TicketModel>>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'user/tickets/create',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<TicketModel> _value;
    try {
      _value = BaseResponse<TicketModel>.fromJson(
        _result.data!,
        (json) => TicketModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<TicketModel>> getTicketDetails(int ticketId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ticket_id': ticketId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<TicketModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/tickets/show',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<TicketModel> _value;
    try {
      _value = BaseResponse<TicketModel>.fromJson(
        _result.data!,
        (json) => TicketModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<TicketReplyModel>> replyTicket({
    String? description,
    String? ticketId,
    MultipartFile? file,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (description != null) {
      _data.fields.add(MapEntry('description', description));
    }
    if (ticketId != null) {
      _data.fields.add(MapEntry('ticket_id', ticketId));
    }
    if (file != null) {
      _data.files.add(MapEntry('file', file));
    }
    final _options = _setStreamType<BaseResponse<TicketReplyModel>>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'user/tickets/reply',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<TicketReplyModel> _value;
    try {
      _value = BaseResponse<TicketReplyModel>.fromJson(
        _result.data!,
        (json) => TicketReplyModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<TicketRepliesResponseDataModel>> getTicketReplies(
    int ticketId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ticket_id': ticketId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<BaseResponse<TicketRepliesResponseDataModel>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'user/tickets/replies',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<TicketRepliesResponseDataModel> _value;
    try {
      _value = BaseResponse<TicketRepliesResponseDataModel>.fromJson(
        _result.data!,
        (json) => TicketRepliesResponseDataModel.fromJson(
          json as Map<String, dynamic>,
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<TicketPriorityModel>>> getTicketPriorities() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<TicketPriorityModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/tickets/priorities',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<TicketPriorityModel>> _value;
    try {
      _value = BaseResponse<List<TicketPriorityModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<TicketPriorityModel>(
                    (i) =>
                        TicketPriorityModel.fromJson(i as Map<String, dynamic>),
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
  Future<BaseResponse<List<TicketSystemModel>>> getTicketSystems() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<TicketSystemModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'user/tickets/systems',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<TicketSystemModel>> _value;
    try {
      _value = BaseResponse<List<TicketSystemModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<TicketSystemModel>(
                    (i) =>
                        TicketSystemModel.fromJson(i as Map<String, dynamic>),
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
