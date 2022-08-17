import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/city/presentations/cubit/city_cubit.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/selected_item_listview.dart';
import 'package:taleb/features/service_provider/presentations/cubit/service_provider_cubit.dart';

class SearchSearviceProviderPage extends StatelessWidget
    implements AutoRouteWrapper {
  const SearchSearviceProviderPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ServiceProviderCubit>(
      create: (BuildContext context) =>
          sl<ServiceProviderCubit>()..getServiceProviders(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceProviderCubit, ServiceProviderState>(
      builder: (BuildContext context, ServiceProviderState state) {
        if (state is ServiceProviderLoadedSuccessState) {
          return Container(
            color: TalebColors.ghostWhite,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                child: Column(
                  children: [
                    VerticalSpace(TalebSizes.h24),
                    Text(
                      'اختيار الناشر',
                      style: Theme.of(context).textTheme.labelMedium?.elephant,
                    ),
                    VerticalSpace(TalebSizes.h24),
                    SizedBox(
                      width: double.infinity,
                      height: TalebSizes.h53,
                      child: const SearchWidget(
                        hintText: 'أكتب اسم الناشر',
                      ),
                    ),
                    VerticalSpace(TalebSizes.h12),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.serviceProviders.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const TalebDivider(
                            color: TalebColors.brightGray,
                            thickness: 1,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ItemListViewWidget(
                            name: state.serviceProviders[index].name,
                            selectedIndex: 3,
                            index: index,
                            logo: state.serviceProviders[index].image,
                          );
                        },
                      ),
                    ),
                    TalebButtonWidget(
                      onPressed: () async => await context.router.pop<int>(2),
                      title: 'حفظ',
                    ),
                    VerticalSpace(TalebSizes.h16),
                  ],
                ),
              ),
            ),
          );
        } else if (state is CityLoadingState) {
          return const Center(child: TalebCircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
