const AUTH_ENDPOINT = 'auth.YOURDOMAIN.com';
const API_HOST = 'api.YOURDOMAIN.com';
const API_VERSION = 'v1';
const API_ENDPOINT = 'https://$API_HOST/$API_VERSION';
const REFRESH_ENDPOINT = 'https://$AUTH_ENDPOINT/$API_VERSION/refresh';
const SSL_PORT = 443;
const AUTH_ENDPOINTS = {
  'github': 'https://github.com/login/oauth/authorize',
  'google': 'https://accounts.google.com/o/oauth2/v2/auth',
  'facebook': 'https://www.facebook.com/v9.0/dialog/oauth',
  'apple': 'https://appleid.apple.com/auth/authorize',
};
const AUTH_REDIRECT_URI = {
  'github': 'https://$AUTH_ENDPOINT/$API_VERSION/auth/github',
  'google': 'https://$AUTH_ENDPOINT/$API_VERSION/auth/google',
  'facebook': 'https://$AUTH_ENDPOINT/$API_VERSION/auth/facebook',
  'apple': 'https://$AUTH_ENDPOINT/$API_VERSION/auth/apple',
};
const GOOGLE_PROFILE_SCOPE = 'https://www.googleapis.com/auth/userinfo.profile';
const GOOGLE_EMAIL_SCOPE = 'https://www.googleapis.com/auth/userinfo.email';
const AUTH_SCOPE = {
  'github': 'read:user%20user:email',
  'google': '$GOOGLE_PROFILE_SCOPE%20$GOOGLE_EMAIL_SCOPE',
  'facebook': 'email',
  'apple': 'name%20email',
};
const SOCKET_ENDPOINT = 'wss://$API_HOST:$SSL_PORT/v1/wss';
const BEARER = 'Bearer ';
