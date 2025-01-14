import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/genre_selection_controller.dart';
import '../states/genre_selection_state.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/back_button.dart';

class GenreSelectionScreen extends StatefulWidget {
  final String userRole;

  const GenreSelectionScreen({
    super.key,
    required this.userRole,
  });

  @override
  State<GenreSelectionScreen> createState() => _GenreSelectionScreenState();
}

class _GenreSelectionScreenState extends State<GenreSelectionScreen> {
  late final GenreSelectionState _state;
  late final GenreSelectionController _controller;

  @override
  void initState() {
    super.initState();
    _state = GenreSelectionState(userRole: widget.userRole);
    _controller = GenreSelectionController(
      state: _state,
      onStateChanged: () => setState(() {}),
    );
  }

  Widget _buildLogoSection(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final size = isLandscape
        ? MediaQuery.of(context).size.height * 0.3
        : MediaQuery.of(context).size.width * 0.25;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'lib/assets/readlight_book.svg',
          height: size,
          width: size,
          fit: BoxFit.contain,
        ),
        SizedBox(height: isLandscape ? 10 : 20),
        SvgPicture.asset(
          'lib/assets/readlight.svg',
          height: size * 0.8,
          width: size * 0.8,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildGenreGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _state.genres.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => _controller.toggleGenreSelection(index),
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              child: Container(
                width: 111,
                height: 121,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: _state.isGenreSelected(index)
                      ? Border.all(
                    color: AppColors.onTertiaryContainer,
                    width: 8,
                  )
                      : null,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_state.isGenreSelected(index) ? 12 : 16),
                  child: Image.asset(
                    _state.genres[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _state.genres[index].name,
              style: const TextStyle(
                color: AppColors.onTertiaryContainer,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final mainContent = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Welcome, ${_state.userRole}!\nChoose your favorite Genres',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.onTertiaryContainer,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildGenreGrid(),
        const SizedBox(height: 32),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: CustomButton(
              text: 'CONTINUE',
              onPressed: () => _controller.onContinuePressed(context),
              isLoginButton: true,
              backgroundColor: AppColors.secondaryFixedDim,
            ),
          ),
        ),
      ],
    );

    if (isLandscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Center(child: _buildLogoSection(context)),
          ),
          Flexible(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: mainContent,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        const SizedBox(height: 48),
        _buildLogoSection(context),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: mainContent,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onSurfaceVariant,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: 16,
              left: 16,
              child: BackButtonWidget(),
            ),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}