import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/core/utils/format_timestamp.dart';
import 'package:cinemate/features/tickets/domain/entities/ticket_entity.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketsListViewItem extends StatelessWidget {
  const TicketsListViewItem({
    super.key,
    required this.ticket,
  });

  final TicketEntity ticket;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: QrImageView(
              data: ticket.id,
              version: QrVersions.auto,
            ),
          ),
        ),
        Expanded(
            child: Text('Purchased on: ${formatTimestamp(ticket.createdAt)}',
                style: AppStyles.medium20)),
      ],
    );
  }
}
