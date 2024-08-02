import 'package:cinemate/core/constants/api_keys.dart';
import 'package:cinemate/core/constants/app_strings.dart';
import 'package:cinemate/core/services/api_service.dart';
import 'package:cinemate/features/ticket_purchase/data/models/payment_models/ephemeral_key_model.dart';
import 'package:cinemate/features/ticket_purchase/data/models/payment_models/payment_intent_input_model.dart';
import 'package:cinemate/features/ticket_purchase/data/models/payment_models/payment_intent_model.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/init_payment_sheet_input_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_entity.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/payment_entities/payment_intent_input_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService _apiService;

  StripeService(this._apiService);

  Future<PaymentIntentEntity> createPaymentIntent(
    PaymentIntentInputEntity paymentIntentInputEntity,
  ) async {
    // Create an instance of PaymentIntentInputModel
    var paymentIntentInputModel = PaymentIntentInputModel(
      customerId: paymentIntentInputEntity.customerId,
      amount: paymentIntentInputEntity.amount,
      currency: paymentIntentInputEntity.currency,
    );

    // Use the instance to call toJson
    var response = await _apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputEntity
          initPaymentSheetInputEntity}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputEntity.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputEntity.ephemeralKeySecret,
        customerId: initPaymentSheetInputEntity.customerId,
        merchantDisplayName: AppStrings.appName,
      ),
    );
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await _apiService.post(
      token: ApiKeys.secretKey,
      body: {
        'customer': customerId,
      },
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2024-06-20',
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
    );

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputEntity paymentIntentInputEntity}) async {
    var paymentIntentModel =
        await createPaymentIntent(paymentIntentInputEntity);

    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputEntity.customerId,
    );

    var initPaymentSheetInputEntity = InitPaymentSheetInputEntity(
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret,
      customerId: paymentIntentInputEntity.customerId,
    );

    await initPaymentSheet(
        initPaymentSheetInputEntity: initPaymentSheetInputEntity);
    await displayPaymentSheet();
  }



}
