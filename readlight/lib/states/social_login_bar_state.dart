class SocialLoginBarState {
  bool isLoading = false;
  String? error;
  String? currentProvider;

  void startLoading(String provider) {
    isLoading = true;
    currentProvider = provider;
    error = null;
  }
  void stopLoading() {
    isLoading = false;
    currentProvider = null;
  }
  void setError(String errorMessage) {
    error = errorMessage;
    isLoading = false;
  }
  void reset() {
    isLoading = false;
    error = null;
    currentProvider = null;
  }
  bool isLoadingProvider(String provider) {
    return isLoading && currentProvider == provider;
  }
}