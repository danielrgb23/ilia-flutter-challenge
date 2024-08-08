enum HttpMethod { get, post, delete, patch, put }

abstract class HttpFacade {
  call(
    HttpMethod method,
    String endPoint, {
    Map<String, dynamic>? params,
    dynamic data,
  });
}