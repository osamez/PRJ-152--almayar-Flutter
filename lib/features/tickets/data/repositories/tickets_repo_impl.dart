import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/tickets/data/datasources/tickets_datasource.dart';
import 'package:almeyar/features/tickets/data/models/create_ticket_request.dart';
import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_priority_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_replies_response_data_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_system_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'dart:io';
import 'tickets_repo.dart';

class TicketsRepoImpl implements TicketsRepo {
  final TicketsDataSource _dataSource;

  const TicketsRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<TicketsResponseDataModel>>> getAllTickets({
    int? status,
    int? page,
  }) async {
    try {
      final response = await _dataSource.getAllTickets(
        status: status,
        page: page,
      );
      AppLogger.info('TicketsRepoImpl - getAllTickets: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('TicketsRepoImpl - getAllTickets: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<TicketModel>>> createTicket({
    required CreateTicketRequest request,
    File? file,
  }) async {
    try {
      final response = await _dataSource.createTicket(
        request: request,
        file: file,
      );
      AppLogger.info('TicketsRepoImpl - createTicket: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('TicketsRepoImpl - createTicket: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<TicketModel>>> getTicketDetails(
    int ticketId,
  ) async {
    try {
      final response = await _dataSource.getTicketDetails(ticketId);
      AppLogger.info('TicketsRepoImpl - getTicketDetails: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'TicketsRepoImpl - getTicketDetails: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<TicketRepliesResponseDataModel>>> getTicketReplies(
    int ticketId,
  ) async {
    try {
      final response = await _dataSource.getTicketReplies(ticketId);
      AppLogger.info('TicketsRepoImpl - getTicketReplies: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'TicketsRepoImpl - getTicketReplies: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<TicketReplyModel>>> replyTicket({
    required String ticketId,
    String? description,
    File? file,
  }) async {
    try {
      final response = await _dataSource.replyTicket(
        ticketId: ticketId,
        description: description,
        file: file,
      );
      AppLogger.info('TicketsRepoImpl - replyTicket: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('TicketsRepoImpl - replyTicket: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<TicketSystemModel>>>>
  getTicketSystems() async {
    try {
      final response = await _dataSource.getTicketSystems();
      AppLogger.info('TicketsRepoImpl - getTicketSystems: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'TicketsRepoImpl - getTicketSystems: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<TicketPriorityModel>>>>
  getTicketPriorities() async {
    try {
      final response = await _dataSource.getTicketPriorities();
      AppLogger.info('TicketsRepoImpl - getTicketPriorities: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'TicketsRepoImpl - getTicketPriorities: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }
}
