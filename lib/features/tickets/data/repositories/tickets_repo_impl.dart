import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/tickets/data/datasources/tickets_datasource.dart';
import 'package:almeyar/features/tickets/data/models/create_ticket_request.dart';
import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'dart:io';
import 'tickets_repo.dart';

class TicketsRepoImpl implements TicketsRepo {
  final TicketsDataSource _dataSource;

  const TicketsRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<TicketsResponseDataModel>>> getAllTickets() async {
    try {
      final response = await _dataSource.getAllTickets();
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
    List<File>? files,
  }) async {
    try {
      final response = await _dataSource.createTicket(
        request: request,
        files: files,
      );
      AppLogger.info('TicketsRepoImpl - createTicket: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('TicketsRepoImpl - createTicket: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<TicketModel>>> getTicketDetails(int ticketId) async {
    try {
      final response = await _dataSource.getTicketDetails(ticketId);
      AppLogger.info('TicketsRepoImpl - getTicketDetails: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('TicketsRepoImpl - getTicketDetails: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<TicketReplyModel>>> replyTicket({
    required String ticketId,
    String? description,
    List<File>? files,
  }) async {
    try {
      final response = await _dataSource.replyTicket(
        ticketId: ticketId,
        description: description,
        files: files,
      );
      AppLogger.info('TicketsRepoImpl - replyTicket: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('TicketsRepoImpl - replyTicket: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }
}

