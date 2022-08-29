import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/core/widget/taleb_button.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/city/data/models/city.dart';
import 'package:taleb/features/city/presentations/cubit/city_cubit.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/features/home/widgets/selected_item_listview.dart';

class SearchCityPage extends StatefulWidget implements AutoRouteWrapper {
  const SearchCityPage({Key? key}) : super(key: key);
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CityCubit>(
      create: (BuildContext context) =>
          sl<CityCubit>()..getCitys(textSearch: null),
      child: this,
    );
  }

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  int? selectedIndex;
  City? city;

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
                'اختيار المدينة',
                style: Theme.of(context).textTheme.labelMedium?.elephant,
              ),
              VerticalSpace(TalebSizes.h24),
              SizedBox(
                width: double.infinity,
                height: TalebSizes.h53,
                child: SearchWidget(
                  hintText: 'أكتب اسم المدينة',
                  onChanged: _onChangeSearch,
                ),
              ),
              VerticalSpace(TalebSizes.h12),
              Expanded(
                child: BlocBuilder<CityCubit, CityState>(
                  builder: (BuildContext context, CityState state) {
                    if (state is CityLoadedSuccessState) {
                      return Column(
                        children: [
                          SizedBox(
                            height: TalebSizes.h500,
                            child: ListView.separated(
                              itemCount: state.cities.length,
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
                                      city = state.cities[index];
                                    });
                                  },
                                  child: ItemListViewWidget(
                                    name: state.cities[index].name,
                                    selectedIndex: selectedIndex ?? -1,
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          TalebButtonWidget(
                            onPressed: () => context.router.pop<City?>(city),
                            title: 'حفظ',
                          ),
                          VerticalSpace(TalebSizes.h16),
                        ],
                      );
                    } else if (state is CityLoadingState) {
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
    context.read<CityCubit>().getCitys(textSearch: value);
  }
}
