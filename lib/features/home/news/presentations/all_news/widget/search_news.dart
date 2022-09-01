import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/label_selected_filter_in_search.dart';
import 'package:taleb/features/home/news/presentations/all_news/cubit/news_cubit.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              SearchWidget(
                hintText: TalebStrings.newsHomeTextFieldHint,
                onChanged: (text) => context.read<NewsCubit>().searchNews(
                      text: text,
                      userId: state.serviceProvider?.id,
                      cityId: state.city?.id,
                    ),
              ),
              if (state.isSlectedNotNull) VerticalSpace(TalebSizes.h12),
              Row(
                children: [
                  if (state.serviceProvider != null)
                    LabelSelectedFilterInSearch(
                      filterName: state.serviceProvider!.name,
                      onCancel: () =>
                          _onServiceProviderCancel(context.read<NewsCubit>()),
                    ),
                  if (state.serviceProvider != null)
                    HorizontalSpace(TalebSizes.w8),
                  if (state.city != null)
                    LabelSelectedFilterInSearch(
                      filterName: state.city!.name,
                      onCancel: () => _onCityCancel(context.read<NewsCubit>()),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onServiceProviderCancel(NewsCubit cubit) {
    cubit.clearFilterServiceProvider();
  }

  void _onCityCancel(NewsCubit cubit) {
    cubit.clearFilterCity();
  }
}
