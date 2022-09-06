import 'dart:ui';

extension MenuItemsFilter<E> on Iterable<E> {
  E get localeUK => first;
  E get localeSpain => last;
}

class Localization {
  static final locales = [const Locale('en', 'UK'), const Locale('es', 'SP')];
  static final menuItems = ['English - UK', 'Spanish - ES'];
  static final localeIcons = ['uk.png', 'es.png'];
  static final localeCodes = ['en_UK', 'es_SP'];
  static final localeSequence = [0, 1];
}
