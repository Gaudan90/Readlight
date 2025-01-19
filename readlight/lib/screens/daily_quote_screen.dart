import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../controllers/daily_quote_controller.dart';
import '../data/daily_quote.dart';
import '../states/daily_quote_state.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';

class DailyQuoteScreen extends ConsumerStatefulWidget {
  const DailyQuoteScreen({super.key});

  @override
  ConsumerState<DailyQuoteScreen> createState() => _DailyQuoteScreenState();
}

class _DailyQuoteScreenState extends ConsumerState<DailyQuoteScreen> {
  late DailyQuoteController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DailyQuoteController(ref);
    _controller.loadDailyQuote();
  }

  @override
  Widget build(BuildContext context) {
    final quoteState = ref.watch(dailyQuoteProvider);
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: isLandscape
                    ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildLogoSection(),
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildQuoteSection(quoteState),
                    ),
                  ],
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLogoSection(),
                    _buildQuoteSection(quoteState),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ZoomIn(
          duration: const Duration(seconds: 4),
          child: SvgPicture.asset(
            'lib/assets/readlight_book.svg',
            height: 100,
            width: 100,
          ),
        ),
        const SizedBox(height: 20),
        ZoomIn(
          duration: const Duration(seconds: 8),
          child: SvgPicture.asset(
            'lib/assets/readlight.svg',
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }

  Widget _buildQuoteSection(AsyncValue<DailyQuote> quoteState) {
    return quoteState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (quote) => Column(
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceDim,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  quote.quote,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.brownDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  '- ${quote.author}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.brownSand,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              quote.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: 'CONTINUE',
            isLoginButton: true,
            onPressed: () => _controller.navigateToNext(context),
          ),
        ],
      ),
    );
  }
}