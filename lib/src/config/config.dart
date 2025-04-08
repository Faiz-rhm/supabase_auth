class Config {
  static const baseURL = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '',
  );

  static const socketURL = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '172.30.200.8:8000',
  );

  static const imageURL = String.fromEnvironment(
    'IMAGE_URL',
    defaultValue: 'http://172.30.200.26',
  );

  static const sentryDSN = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: 'https://60fa7be9482192177d6eadbe4cd95836@o1323265.ingest.sentry.io/4505679948546048',
  );
}
