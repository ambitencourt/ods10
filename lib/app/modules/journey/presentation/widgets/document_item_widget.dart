import 'package:flutter/material.dart';

import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/line_divider.dart';
import 'package:ods10/app/modules/journey/utils/get_status_tag_color.dart';
import 'package:ods10/app/modules/journey/utils/show_modal_bottom_sheet.dart';
import 'package:ods10/app/modules/journey/utils/translate_status.dart';

import 'document_modal_item_widget.dart';

class DocumentItemWidget extends StatelessWidget {
  final DocumentEntity item;
  const DocumentItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showBottomSheet(context);
      },
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
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  item.shortDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(fontSize: 12, color: AppColors.black),
                ),
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
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: getRegularStyleW400(
            fontSize: 12,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    showPersonalModalBottomSheet(
      context,
      DocumentModalItemWidget(document: item),
    );
  }
}
