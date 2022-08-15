import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';

class TitleNewsCard extends StatelessWidget {
  const TitleNewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'ترجمة لرؤى وتطلعات جلالة الملك عبدالله الثاني المعظم في إيجاد جيل من الشباب المسلح بالمعرفة والعلم والانتماء، ليكون شريكا فاعلا في بناء حياتنا السياسية والاقتصادية والثقافية بعيدا عن التطرف والغلو، وفقا لما ',
      style: Theme.of(context).textTheme.labelLarge!.chathamsBlue,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
