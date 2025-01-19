import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/daily_quote.dart';
import '../data/supabase_configuration.dart';

final dailyQuoteProvider =
    StateNotifierProvider<DailyQuoteNotifier, AsyncValue<DailyQuote>>((ref) {
  return DailyQuoteNotifier();
});

class DailyQuoteNotifier extends StateNotifier<AsyncValue<DailyQuote>> {
  DailyQuoteNotifier() : super(const AsyncValue.loading());

  Future<void> fetchDailyQuote() async {
    try {
      state = const AsyncValue.loading();

      final now = DateTime.now();
      final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;

      final countResponse =
          await SupabaseConfig.client.from('daily_quotes').select();

      final totalQuotes = countResponse.length;

      final indexForToday = dayOfYear % totalQuotes + 1;

      final response = await SupabaseConfig.client
          .from('daily_quotes')
          .select()
          .eq('id', indexForToday)
          .single();

      final quote = DailyQuote.fromJson(response);
      state = AsyncValue.data(quote);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
