part of '../features_imports.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  /// Tracks which tab indexes have been visited at least once.
  final Set<int> _visitedIndexes = {0};

  static const List<Widget> _pages = [
    HomeView(),
    ShipmentsTrackingView(fromMain: true),
    WalletsView(fromMain: true),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, int>(
      builder: (context, selectedIndex) {
        // Mark this tab as visited so it stays alive from now on.
        _visitedIndexes.add(selectedIndex);

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            final cubit = context.read<MainCubit>();

            // If not on Home tab → navigate to Home.
            if (cubit.state != 0) {
              cubit.changeIndex(0);
              return;
            }

            // On Home tab: if scrolled → scroll to top.
            if (cubit.isHomeScrolled) {
              cubit.scrollHomeToTop();
              return;
            }

            // Already at top of Home → exit the app.
            SystemNavigator.pop();
          },
          child: Stack(
            children: List.generate(_pages.length, (index) {
              return Offstage(
                offstage: index != selectedIndex,
                // Show an empty box if this page has NOT been visited yet.
                child: _visitedIndexes.contains(index)
                    ? _pages[index]
                    : const SizedBox.shrink(),
              );
            }),
          ),
        );
      },
    );
  }
}
