import 'dart:convert';
import 'dart:math';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show HttpException;

class HttpClient {
  final String baseUrl;
  final http.Client _client;

  HttpClient({required this.baseUrl, http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> getJson(String path) async {
    // Build original URL and an encoded form for proxies that accept URLs as query params
    final originalUrl = '$baseUrl/$path';
    final encodedUrl = Uri.encodeComponent(originalUrl);

    // Proxies to try (dev only). Order matters: prefer ones that tend to be reliable.
    // These are development-time helpers only — enabling CORS on the API server is the
    // correct long-term fix.
    final proxyFormats = [
      'https://corsproxy.io/?{url}', // expects the full URL after the `?`
      'https://api.allorigins.win/raw?url={url}', // expects encoded URL as query value
      'https://thingproxy.freeboard.io/fetch/{url}', // appended path
    ];

    // Exponential backoff parameters
    const int maxAttempts = 4; // attempts per endpoint/proxy
    const Duration baseDelay = Duration(milliseconds: 300);

    // Helper to attempt a single Uri with retries
    Future<Map<String, dynamic>> _attemptUri(Uri uri) async {
      int attempt = 0;
      while (true) {
        attempt++;
        try {
          final resp = await _client.get(uri).timeout(const Duration(seconds: 15));
          if (resp.statusCode >= 200 && resp.statusCode < 300) {
            return json.decode(resp.body) as Map<String, dynamic>;
          } else {
            throw HttpException('Status code: ${resp.statusCode}');
          }
        } catch (e) {
          if (attempt >= maxAttempts) {
            rethrow;
          }

          // jittered exponential backoff
          final exp = pow(2, attempt - 1);
          final jitter = Random().nextDouble() * 0.5 + 0.75; // between 0.75 and 1.25
          final delayMs = (baseDelay.inMilliseconds * exp * jitter).round();
          await Future.delayed(Duration(milliseconds: delayMs));
        }
      }
    }

    // If running on the web, try a small list of public dev proxies before falling back
    // to a direct request. Each proxy is attempted with retries/backoff.
    if (kIsWeb) {
      for (final format in proxyFormats) {
        try {
          final uriString = format.contains('?') || format.contains('raw')
              ? format.replaceAll('{url}', encodedUrl)
              : format.replaceAll('{url}', originalUrl);
          final uri = Uri.parse(uriString);
          // Try this proxy with retries
          return await _attemptUri(uri);
        } catch (e) {
          // swallow and try next proxy — keep going until one succeeds
        }
      }

      // Last resort: try direct request. This may still fail due to CORS, but we attempt it
      // so consumers can fall back to cache behavior if the request is blocked.
      try {
        final directUri = Uri.parse(originalUrl);
        return await _attemptUri(directUri);
      } catch (e) {
        rethrow;
      }
    } else {
      // Non-web platforms: direct request with retries/backoff
      final uri = Uri.parse(originalUrl);
      return await _attemptUri(uri);
    }
  }
}
