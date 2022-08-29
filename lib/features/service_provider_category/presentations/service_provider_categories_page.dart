import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/selected_item_listview.dart';
import 'package:taleb/features/service_provider_category/imports.dart';

class ServiceProviderCategoriesPage extends StatefulWidget
    implements AutoRouteWrapper {
  const ServiceProviderCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ServiceProviderCategoryCubit>(
      create: (BuildContext context) =>
          sl<ServiceProviderCategoryCubit>()..getServiceProviderCategorys(),
      child: this,
    );
  }

  @override
  State<ServiceProviderCategoriesPage> createState() =>
      _ServiceProviderCategoriesPageState();
}

class _ServiceProviderCategoriesPageState
    extends State<ServiceProviderCategoriesPage> {
  int? selectedIndex;
  ServiceProviderCategory? serviceProviderCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TalebColors.ghostWhite,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
          child: Column(
            children: [
              VerticalSpace(TalebSizes.h24),
              Text(
                TalebStrings.searchServiceProviderCategoryTitle,
                style: Theme.of(context).textTheme.labelMedium?.elephant,
              ),
              VerticalSpace(TalebSizes.h24),
              SizedBox(
                width: double.infinity,
                height: TalebSizes.h53,
                child: SearchWidget(
                  hintText:
                      TalebStrings.searchServiceProviderCategoryHintTextField,
                  onChanged: _onChangeSearch,
                ),
              ),
              VerticalSpace(TalebSizes.h12),
              Expanded(
                child: BlocBuilder<ServiceProviderCategoryCubit,
                    ServiceProviderCategoryState>(
                  builder: (BuildContext context,
                      ServiceProviderCategoryState state) {
                    if (state is ServiceProviderCategoryLoadedSuccessState) {
                      return Column(
                        children: [
                          SizedBox(
                            height: TalebSizes.h500,
                            child: ListView.separated(
                              itemCount: state.serviceProviderCategories.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const TalebDivider(
                                  color: TalebColors.brightGray,
                                  thickness: 1,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      serviceProviderCategory = state
                                          .serviceProviderCategories[index];
                                    });
                                  },
                                  child: ItemListViewWidget(
                                    name: state
                                        .serviceProviderCategories[index].name,
                                    selectedIndex: selectedIndex ?? -1,
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          TalebButtonWidget(
                            onPressed: () async => await context.router
                                .pop<ServiceProviderCategory>(
                                    serviceProviderCategory),
                            title: 'حفظ',
                          ),
                          VerticalSpace(TalebSizes.h16),
                        ],
                      );
                    } else if (state is ServiceProviderCategoryLoadingState) {
                      return const Center(
                          child: TalebCircularProgressIndicator());
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeSearch(String value) {
    context
        .read<ServiceProviderCategoryCubit>()
        .getServiceProviderCategorys(textSearch: value);
  }
}
