// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_images.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/common/widgets/circular_buttom_widget.dart';

import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/enums/document_status_enum.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/home_controller.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/line_divider.dart';
import 'package:ods10/app/modules/journey/utils/translate_status.dart';

class DocumentModalItemWidget extends StatelessWidget {
  DocumentEntity document;
  final HomeController controller = Modular.get();
  DocumentModalItemWidget({
    Key? key,
    required this.document,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CircularButtom(
                child: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                ),
                onPress: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              document.name,
              style: getBoldStyle(fontSize: 20, color: AppColors.black),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.dollarSign,
                ),
                _buildInfo(
                  title: 'Valor estimado',
                  value: 'R\$ ${document.price.toStringAsFixed(2)}',
                ),
                const SizedBox(width: 20),
                Image.asset(
                  AppImages.clock,
                ),
                _buildInfo(
                  title: 'Tempo estimado',
                  value: document.duration ?? 'indefinido',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    document.shortDescription,
                    style: getRegularStyle(
                        fontSize: 14,
                        color: AppColors.ligthBlack,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Saiba mais',
                      style: getBoldStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const LineDivider(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Estado do documento',
                style: getBoldStyle(fontSize: 12, color: AppColors.black),
              ),
            ),
            const SizedBox(height: 10),
            Observer(builder: (_) {
              return controller.store.loadingStatus
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTag(DocumentStatusEnum.missing, document.status),
                        _buildTag(
                            DocumentStatusEnum.requested, document.status),
                        _buildTag(DocumentStatusEnum.ready, document.status),
                      ],
                    );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(DocumentStatusEnum statusEnum, String status) {
    return InkWell(
      onTap: () async {
        document =
            await controller.updateUserDocuments(document.id, statusEnum);
      },
      child: Container(
        height: 38,
        width: 100,
        decoration: BoxDecoration(
          color: translateStatusEnum(statusEnum) == translateStatus(status)
              ? AppColors.secondary.withOpacity(0.1)
              : AppColors.grey,
          borderRadius: BorderRadius.circular(82),
          border: Border.all(
            color: translateStatusEnum(statusEnum) == translateStatus(status)
                ? AppColors.secondary
                : AppColors.grey,
          ),
        ),
        child: InkWell(
          child: Center(
            child: Text(
              translateStatusEnum(statusEnum),
              // translateStatus(status),
              style: translateStatusEnum(statusEnum) == translateStatus(status)
                  ? getBoldStyle(
                      fontSize: 12,
                      color: AppColors.black,
                    )
                  : getRegularStyle(
                      fontSize: 12,
                      color: AppColors.black,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo({required String title, required String value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: getRegularStyle(
            fontSize: 12,
            color: AppColors.black,
          ),
        ),
        Text(
          value,
          style: getBoldStyle(fontSize: 20, color: AppColors.black),
        ),
      ],
    );
  }
}
