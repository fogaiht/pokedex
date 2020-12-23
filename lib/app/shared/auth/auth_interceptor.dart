import 'package:dio/dio.dart';

import '../../utils/custom_shared_preferences.dart';
import '../custom_dio/custom_dio.dart';

class AuthInterceptors extends InterceptorsWrapper {
  final CustomDio dio;
  AuthInterceptors(this.dio);
  String token;
   final CustomSharedPrefs prefs = CustomSharedPrefs();

  @override
  Future onRequest(RequestOptions options) async {    
    print("REQUEST: [${options.method}] -> PATH: ${options.path} Auth");
    print("REQUEST: [${options.method}] -> BASE URL: ${options.baseUrl} Auth");

    token = dio.token;
    // print(token);

    if (token == null) {
      dio.lock();
      print("token null");
      await dio.login();
      token = dio.token;
      options.headers.addAll({"auth": token});
      dio.unlock();
      return options;
    } else {
      print("token not null");
      // token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxOTIuMTY4LjEuMjQxIiwiZGlzcGxheU5hbWUiOiJCcnVuYSBQZXJ1Y2EgUm9kcmlndWVzIiwiaXNzIjoiaHR0cDovL3d3dy5reXJvcy5jb20uYnIiLCJ0eXBlIjoiTU9CSUxFIiwidXNlcklkIjoyLCJhdXRob3JpemF0aW9uVG9rZW4iOiJleUpoYkdjaU9pSklVelV4TWlKOS5leUp6ZFdJaU9pSmljblZ1WVhBaUxDSjBaVzVoYm5SSlpDSTZNU3dpYzJOdmNHVnpJanBiSWxkUUxsQk1RVmxGVWlJc0lsZFFMa0ZrYldsdUlsMHNJbkJsY20xcGMzTnBiMjV6SWpwYklsTlRUeTVUUVZaRklpd2lVMU5QTGxORlFWSkRTQ0lzSWxkUUxsQlNUMHBGUTFRdVUwVkJVa05JSWl3aVYxQXVVRkpQU2tWRFZDNVRRVlpGSWl3aVYxQXVVRXhCV1VWU0xsTkZRVkpEU0NJc0lsZFFMbEJNUVZsRlVpNVRRVlpGSWwwc0luVnliSE1pT2x0ZExDSjFjMlZ5Vkc5clpXNGlPaUpsZVVwb1lrZGphVTlwU2tsVmVsVjRUV2xLT1M1bGVVcDZaRmRKYVU5cFNtbGpibFoxV1ZoQmFVeERTbnBaTWpsM1dsaE5hVTlzYzJsV01VRjFVekZzVTFReFRYVlZSWGhDVjFWV1UwbHBkMmxSVlRWQ1ZFVnNWRlpGUldsTVEwcFlWVU0xUWxKRk1VcFVhVWx6U1d0MFdsVnJPVWhWYTBaT1VWTTFTRlZzVmxGVWVUVllVbFZLUWxSRlpFSlZhMDVUVkZSSmFVeERTa3hYVmtwUVVqRktRbFJWUlhWUlZVNUdWVEZPVUV4clRsQlVNVXBGVWxVMVFsSkZPVk5WUmtwUVUydFdWVlI1U21STVEwcHdZek5OYVU5cFNtOWtTRkozVDJrNGRtUXpaRE5NYlhRMVkyMDVla3h0VG5aaVV6VnBZMmxKYzBsdGNEQmhVMGsyU1dwRmQxcFVaek5PVkdScFRGUnJlazFFWjNST1JHUnRUbE14YVZwVVp6Qk1WMVpxVDFSR2ExbFhTbXhaZWtwdFdXbEpjMGx0Ykdoa1EwazJUVlJWTkU1NlZYaFBWR042VGxnd0xqRlNWVWxuU1d0a2FrMUJZVmRhZG14M1gyd3Raa05OVDFSemNtOXBVMlZqTlRScmNYSnJjRzFRV2xaWllqUlpNVmRTVHkxVldHUnNibU4yYUZoRk5rSm9WMlpQTWkweFNYVkRUVk5zVDNjNVJqY3pPVkJCSWl3aVozSnZkWEJ6SWpwYmV5SmxlSFJsY201aGJFTnZaR1VpT2lKWFVDNVFURUZaUlZJaUxDSm5jbTkxY0VSbGMyTnlhWEIwYjNJaU9pSlFaWEptYVd3Z1pHVWdablZ1WTJsdmJzT2hjbWx2SUdwdloyRmtiM0lzSUhGMVpTQjBaWExEb1NCemRXRWdaV1pwWTJsdVpXTnBZU0JsSUdOdmJtaGxZMmx0Wlc1MGIzTWdiV1ZrYVdSdmN5SXNJbUZrYldsdWFYTjBjbUYwYjNKR2JHRm5Jam94TENKemVYTjBaVzFHYkdGbklqb3dmU3g3SW1WNGRHVnlibUZzUTI5a1pTSTZJbGRRTGtGa2JXbHVJaXdpWjNKdmRYQkVaWE5qY21sd2RHOXlJam9pUTI5c1lXSnZjbUZrYjNKbGN5QmtZU0JMZVhKdmN5SXNJbUZrYldsdWFYTjBjbUYwYjNKR2JHRm5Jam94TENKemVYTjBaVzFHYkdGbklqb3dmVjBzSW1semN5STZJbWgwZEhBNkx5OTNkM2N1YTNseWIzTXVZMjl0TG1KeUlpd2lhblJwSWpvaU16Y3labUZqTkRJdFpUTmhNaTAwTWpNMkxUZzVOelF0T1Roa05UQmhaV05pWVRGaElpd2lhV0YwSWpveE5UZzNOVEU1TnpNMWZRLllNYS1LeHp2RGVGTUFobXpGTk9MZkRzbVpaeFJPczN6cUJDaHJMLThJdjlYNE1uQ3JIUFhldUYwZDVVUkxqZDE3ZGNqeExzT2hHa2xEM3VuOGhjcWJBIiwiY29tcGFueUlkIjoxLCJwZXJtaXNzaW9ucyI6WyJTU08uU0FWRSIsIlNTTy5TRUFSQ0giLCJXUC5QUk9KRUNULlNFQVJDSCIsIldQLlBST0pFQ1QuU0FWRSIsIldQLlBMQVlFUi5TRUFSQ0giLCJXUC5QTEFZRVIuU0FWRSJdLCJuYW1lIjoiQnJ1bmEgUGVydWNhIFJvZHJpZ3VlcyIsInNjb3BlcyI6WyJXUC5QTEFZRVIiLCJXUC5BZG1pbiJdLCJleHAiOjE1ODc1MjAzMzUsImlhdCI6MTU4NzUxOTczNSwiZW1haWwiOiJicnVuYXBAa3lyb3MuY29tLmJyIiwidXNlcm5hbWUiOiJicnVuYXAifQ._QhpXfxOXczVBV16pxr-A5to0Uti4Qtce93wDul4ZUwWwVUHMlnQD-QCERghBDiBSdTpL1VNcWB6-Hia0uu76A";
      options.headers.addAll({"auth": token});
      return options;
    }
  }

  @override
  Future onError(DioError e) async {
    print(
        "RESPONSE: [${e.response?.statusCode}] -> PATH: ${e.request.path} Auth");
    print(e.message);

    if (e.response?.statusCode == 402) {
      var options = e.response.request;

      if (token != options.headers["auth"]) {
        options.headers["auth"] = token;
        return dio.request(options.path, options: options);
      }

      dio.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();
      return dio.login().then((d) {
        //update csrfToken
        options.headers.addAll({"auth": token});
      }).whenComplete(() {
        dio.unlock();
        dio.interceptors.responseLock.unlock();
        dio.interceptors.errorLock.unlock();
      }).then((e) {
        //repeat
        return dio.request(options.path, options: options);
      });
    }

    return e;
  }

  @override
  Future onResponse(Response response) async {
    print(
        "RESPONSE: [${response.statusCode}] -> PATH: ${response.request.path} Auth");

    return response;
  }
}
