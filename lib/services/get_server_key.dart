import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
        {
          "type": "service_account",
          "project_id": "easyshopping-ce06a",
          "private_key_id": "adbe6fca5f3497dfe6fabd4109d357209b27fa83",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCcEyFxSH5ulmlm\noaD5FDitX7gxx0cqs0/BJKEChlbVEnrvu1DEH2LxEzVC/rPfYPJBWtjsla/TNMaA\n1UY0RlBOYDFakQhXDZiCiiYDXu7BvB+he1OyUOeXA3DZ7xWo8jVDfbOdHp/prl4w\nyTabBv36iLfI0+opDnAD1tEkI5u8P5OA8K9R9LLFM5IMvu6neMqk8up8GSJpV7Q2\nuVMInUgwDsGp0kFHus3oftQ04eUafmAbKgmmVfPGbua9MIpkrj2iMAjBzY2sVBy4\nNTAc/pA5CKb21iiffi0oOUVfK18hTywXwtkLWsjzNsjCLuQhLNNdJDRu+KdAo36q\n6FpubwKJAgMBAAECggEAI3Jy23w3/tzZdm5KFZgCoVnGh0O3xZpxCDBOAzlIml72\nneEAoHJyccdHhv47EwY9Lxu3fdAnXUQ0u0j1B2Va0tolC2k6KC9Vznwa0xQqDMUx\nt+a/JRYb6x/kbxLObA8KitgPRaWRcyzfhpwEc2Q8pbyMZSfAHHADf9O3r0oJElFR\nCvfSG7j13GxyaHybHy/6O7dIlhZYWQk+BHz0psrIlqEBonC9tV0sP011NaFx80nv\n7AxIPRrpKo87CJP5KCY6qRM8YTL4rBdKSKYwwK7sKLEmbzawx8xkYuwJV+vCs9Wl\nGHOPL7UmLI4jC47vY1KNTz8VPmkIPStjeaOGtVTqyQKBgQDZj7QvjJzgCr0hRpu5\nz8MnJ4k+mjki1NyjuXkh5TFcyHLU0vC6X9nPSVbi3h9oj8iozHgg82yOGH5QqfLY\n52IiHopsRxzlfopYu9QBlgMHJf9NOU18SCPPMOSolTKwEAJIjF4hc1INNp/ydzqN\ngvdRWkmmkgxaJOdP4bv64cP/rQKBgQC3pmNgWO1m/JIZfVv6kSg4bBNndTq97t55\nasDqjIsnuTVlk/YeznGGfIWpEReT4IJsuUhp0rOgzUdAOqlFB6GxhzV7hK9wIm/4\noiLqAhufgjTI4h9wzFIz8X4kyqPxF+GyWEZo9HtrQjHv1IEskgQRGAt8WrrO6A7m\nOyA97Xz5zQKBgBSV1U2+d0V3nqecX7W4I9X7lq/WtdtG2s2fCggcAIyv5rWec+qe\nkSRc4xy6OaySFkFqf19WyQm05ZbKTdEaK53g1+Yg4GoSjBKTSx8PS6AMh1iOOHeu\n97xt+uS8oTwpd53XsjxmBfh8F6xAfcjQAIixC1D4drS80yoqyLeXTw1NAoGAA4C2\n8IWBsa8rkjTj5jmSjNDy5cxEnI7Ly4EPwOmBVfagYBmcXiYN4ETLv9fFnVpw4mX+\nTZZpOq3vp/f2doyYtuwfRwXW2sqtXA6rn87+e+Jd4178vogHIVp/z2/WBKkx8tbg\nMOxI1lji3vIsrI70aOcOgQax/XRLpHSIPuYithkCgYAM9rGhJabtZuC6mFLyzIBD\nzIjzulZVWKv/MyJ5NfmmK0J+VfF8AF/nrDz9Sr2GZCQcqSZqWOwsyCALmRwRp9Pc\ni1zfw0DnrCzh6RPkMxhTugXR0xWZlzreIQOjioGsZ+6OtFc3vbwpiDQ5UbnVH821\nFgcJwQsm4CKoLxJzY+x69Q==\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-z2t1n@easyshopping-ce06a.iam.gserviceaccount.com",
          "client_id": "115427483621856800897",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-z2t1n%40easyshopping-ce06a.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        },
      ),
      scopes,
    );
    final accessServerKey = client.credentials.accessToken.data;
    return accessServerKey;
  }
}
