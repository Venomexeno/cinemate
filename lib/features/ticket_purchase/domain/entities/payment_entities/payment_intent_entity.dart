import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/amount_details_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/automatic_payment_methods_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/metadata_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_method_options_entity.dart';
import 'package:equatable/equatable.dart';

class PaymentIntentEntity extends Equatable{
  final String? id;
  final String? object;
  final int? amount;
  final int? amountCapturable;
  final AmountDetailsEntity? amountDetails;
  final int? amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final AutomaticPaymentMethodsEntity? automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String? captureMethod;
  final String? clientSecret;
  final String? confirmationMethod;
  final int? created;
  final String? currency;
  final dynamic customer;
  final dynamic description;
  final dynamic invoice;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final bool? livemode;
  final MetadataEntity? metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodOptionsEntity? paymentMethodOptions;
  final List<String>? paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String? status;
  final dynamic transferData;
  final dynamic transferGroup;

  const PaymentIntentEntity({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  @override
  List<Object?> get props => [
    id,
    object,
    amount,
    amountCapturable,
    amountDetails,
    amountReceived,
    application,
    applicationFeeAmount,
    automaticPaymentMethods,
    canceledAt,
    cancellationReason,
    captureMethod,
    clientSecret,
    confirmationMethod,
    created,
    currency,
    customer,
    description,
    invoice,
    lastPaymentError,
    latestCharge,
    livemode,
    metadata,
    nextAction,
    onBehalfOf,
    paymentMethod,
    paymentMethodOptions,
    paymentMethodTypes,
    processing,
    receiptEmail,
    review,
    setupFutureUsage,
    shipping,
    source,
    statementDescriptor,
    statementDescriptorSuffix,
    status,
    transferData,
    transferGroup,
  ];
}