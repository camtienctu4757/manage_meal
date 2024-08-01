import 'package:app_meals/provider/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget{
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterSelected = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Screen'),
      ),
      body:Column(
          children: [
            SwitchListTile(
              value: filterSelected[Filter.glutenFree]!,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilter(Filter.glutenFree,isChecked );
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten free meal',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: filterSelected[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                               ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree,isChecked );

              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lactose free meal',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: filterSelected[Filter.veganFree]!,
              onChanged: (isChecked) {
                               ref.read(filterProvider.notifier).setFilter(Filter.veganFree,isChecked );

              },
              title: Text(
                'Vegan-Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan free meal',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: filterSelected[Filter.vegetarianFree]!,
              onChanged: (isChecked) {
                              ref.read(filterProvider.notifier).setFilter(Filter.vegetarianFree,isChecked );

              },
              title: Text(
                'Vegetarian-Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian meal',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            )
          ],
        ),
    );
  }
}
