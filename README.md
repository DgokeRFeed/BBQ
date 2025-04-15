# Движухи!
Веб-приложение, в котором вы можете запланировать событие и пригласить поучавствовать в нем своих друзей!  
Вы можете создать событие, указать адрес и время проведения, ограничить доступ с помощью пинкода, после чего смело кидайте ссылку на событие своим друзьям. На событие можно подписаться, оставить комментарии и поделиться фотографиями.

### При создании приложения были использованы:
- Яндекс.Карты API для отображения карты с адресом события
- Lightbox2 для отображения красивой галереи фотографий
- OmniAuth для аутентификации с помощью Github и VK
- ActionMailer и Mailjet для email рассылки
- ActiveStorage и Yandex Cloude Storage для хранения фото
- ActiveJob и Resque для создания фоновых задач чтобы рассылать почту

## Как развернуть приложение на локальной машине
Требуется
```
Ruby 3.1.2
Rails 7.0.3
```
Нужно установить необходимые гемы и подготовить базу данных
```
bundle install
bundle exec rails db:migrate
```
Для работы с внешними сервисами необходимо прописать ключи в файле `credentials.yml.enc`, предварительно удалив старый файл
```
rm -rf config/credentials.yml.enc
EDITOR=your_editor rails credentials:edit
```
В файл необходимо вставить следующую информацию со своими ключами
```
# keys for Yandex Cloud
yc:
  access_key_id: *your_access_key*
  secret_access_key: *your_secret_access_key*

# keys for Mailjet
mailjet:
  api_key: *your_api_key*
  secret_key: *your_secret_key*
  sender: *your_sender_mail*

# keys for google reCAPTCHA
recaptcha:
  public_key: *your_public_key*
  secret_key: *your_secret_key*

# keys for Yandex Map API
ymap:
  api_key: *your_api_key*

# keys for OAuth GitHub and VK
omniauth:
  vk_auth_id: *your_id_for_production*
  vk_auth_secret: *your_secret_key_for_production*
  vk_auth_id_dev: *your_id_for_development*
  vk_auth_secret_dev: *your_secret_key_for_development*
  github_auth_id: *your_id_for_production*
  github_auth_secret: *your_secret_key_for_production*
  github_auth_id_dev: *your_id_for_development*
  github_auth_secret_dev: *your_secret_key_for_development*
```
После можете запустить сервер командой
```
bundle exec rails s
```
