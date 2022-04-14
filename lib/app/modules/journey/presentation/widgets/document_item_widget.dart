import 'package:flutter/material.dart';

import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/line_divider.dart';
import 'package:ods10/app/modules/journey/utils/get_status_tag_color.dart';
import 'package:ods10/app/modules/journey/utils/translate_status.dart';

class DocumentItemWidget extends StatelessWidget {
  final DocumentEntity item;
  final VoidCallback? onTap;
  const DocumentItemWidget({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                _buildTag(
                  translateStatus(item.status),
                  getStatusTagColor(item.status),
                ),
                const SizedBox(width: 10),
                _buildTag(
                  translatePrice(item.price),
                  getPriceTagColor(item.price),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                item.name,
                style: getBoldStyle(fontSize: 18, color: AppColors.black),
              ),
              subtitle: Text(
                item.description,
                style: getRegularStyle(fontSize: 12, color: AppColors.black),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const LineDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: getRegularStyle(
            fontSize: 12,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
