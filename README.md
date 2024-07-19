# Flutter Donate App

Modern toplumda tüketim, toplumsal statü ve kimliğin bir göstergesi haline gelmiştir. Ancak, aşırı tüketim ve israf, günümüzün en büyük sorunları arasında yer almaktadır. Türkiye'de ve dünyada her yıl milyonlarca ton gıda israf edilmekte, aynı zamanda giyim ve diğer nesneler de gereksizce tüketilmektedir. Bu proje, bu israfı önlemeye ve ihtiyaç sahiplerine yardımcı olmaya yönelik bir çözüm sunmaktadır.

Bende Fazla, kullanıcıların kullanmadıkları ancak kullanılabilir durumda olan gıda, mobilya, giysi, kitap, oyuncak gibi nesneleri ihtiyaç sahiplerine bağışlamalarını amaçlayan bir mobil uygulamadır. Bu proje, israfı önlemek ve toplumda ihtiyaç sahiplerine yardım etmek amacıyla geliştiriliyor.

## Özellikler

- **Clean Architecture:** Projenin sürdürülebilir ve kolay geliştirilebilir bir yapıya sahip olması için Clean Architecture tercih ettim.
- **Riverpod:** State yönetimi için Riverpood tercih ettim.
- **Dependency Injection:** Bağımlılıkların uygulama genelinde enjekte edilmesi.
- **Singleton Pattern:** Bir sınıfın yalnızca bir örneğe sahip olmasını sağlar.
- **Localization:** Uygulamanın birden fazla dili desteklemesini sağlar.
- **Firebase Authentication:** Kimlik doğrulama hizmetleri sağlar.
- **Firebase Firestore:** Verileri depolamak ve senkronize etmek için ölçeklenebilir bir veritabanı.
- **Firebase Storage:** Kullanıcıların dosya yüklemesine ve indirmesine olanak tanır.
- **Go Router:** Yönlendirme ve navigasyonu basitleştirir.
- **Hive:** Hafif ve hızlı bir anahtar-değer veritabanı.
- **Permissions:** Konum, galeri ve kamera erişimi için izinleri yönetir.

## Tamamlanan Ekranlar

### SPLASH
<img src="https://github.com/user-attachments/assets/a1d154af-4c53-4b82-b86b-e4adb0598331" width="20%"></img> 

### ONBOARD
<img src="https://github.com/user-attachments/assets/b0693ccb-9f98-47f7-b117-c234d973e54f" width="20%"></img> 
<img src="https://github.com/user-attachments/assets/c617d932-52ee-40e3-88c8-145edff34927" width="20%"></img> 
<img src="https://github.com/user-attachments/assets/2260f65e-b7f6-4377-a138-58a3a1ea8550" width="20%"></img> 
<img src="https://github.com/user-attachments/assets/8281b67c-970a-4e94-9cb4-c0554a503f46" width="20%"></img> 

### GİRİŞ & KAYIT
<img src="https://github.com/user-attachments/assets/d770844a-eeb4-44ff-9ae7-73bd93b0ea36" width="20%"></img> 
<img src="https://github.com/user-attachments/assets/a972331f-607c-49d0-9acb-dcccbd18284d" width="20%"></img>

### ANA EKRAN
<img src="https://github.com/user-attachments/assets/5776344e-5658-496f-a863-079f51f89b82" width="20%"></img> 
<img src="https://github.com/user-attachments/assets/e14cd35d-f2ae-44d5-8e12-17b9b7361d40" width="20%"></img>

### PROFİL
<img src="https://github.com/user-attachments/assets/585598dd-3ec4-4c1d-86fc-1d2802ea443c" width="20%"></img> 

### PROFİL BİLGİLERİM
<img src="https://github.com/user-attachments/assets/e297cc40-2e9d-4079-8566-e1efa9f4aa44" width="20%"></img> 

### ADRESLERİM & ADRES EKLE
<img src="https://github.com/user-attachments/assets/78a71e06-0d44-4c6b-98ae-e59acc6ea84f" width="20%"></img> 
<img src="https://github.com/user-attachments/assets/c0f2cfb6-0957-4d99-b86c-da7e67c4cdea" width="20%"></img> 

### BİZE ULAŞIN
<img src="https://github.com/user-attachments/assets/dc4311a5-982b-400e-94c1-3560866672af" width="20%"></img> 

### UYGULAMA HAKKINDA
<img src="https://github.com/user-attachments/assets/17c27dcd-67d1-48cb-b742-3418a61888b5" width="20%"></img> 

## Proje Yapısı

```plaintext
lib/
├── core/
│   ├── api_helper/
│   ├── config/
│   ├── constants/
│   ├── enums/
│   ├── extensions/
│   ├── router/
│   ├── service/
│   ├── theme/
│   ├── usecase/
│   ├── utils/
├── data/
│   ├── datasources/
│   ├── models/
│   ├── repositories/
├── di/
├── domain/
│   ├── entities/
│   ├── repositories/
│   ├── usecases/
├── presentation/
│   ├── view/
│   ├── viewmodel/
│   ├── widgets/
└── translations/
└── main.dart
```

## Kullanılan Paketler

## UI & Icons
- `cupertino_icons:` iOS stili ikonlar sağlar.
- `iconsax:` Geniş kapsamlı ikon kütüphanesi.
- `flutter_svg:` SVG görüntüleri render eder.
- `lottie:` Lottie dosyalarından animasyonlar.

## Utils
- `intl_phone_number_input:` Uluslararası telefon numarası girişi için.
- `image_picker:` Galeriden veya kameradan resim seçmek için.
- `carousel_slider:` Görsel slayt oluşturmak için.
- `toastification:` Toast bildirimleri göstermek için.
- `shimmer:` Shimmer yükleme efektleri için.
- `flutter_staggered_animations:` Animasyonlu Listeler için Staggered animasyonları.

## Core
- `equatable:` Eşitlik karşılaştırmalarını basitleştirir.
- `photo_manager:` Fotoğraf ve videoları yönetir.
- `connectivity_plus:` Ağ bağlantısı durumu için.
- `photo_view:` Görselleri zoom yapılabilir şekilde görüntülemek için.

## Network
- `http:` HTTP istekleri yapmak için.
- `url_launcher:` URL'leri açmak için.
- `cached_network_image:` Ağ üzerinden görüntüleri önbelleğe alarak görüntülemek için.

## Permissions
- `permission_handler:` İzinleri yönetmek için.

## Location
- `geolocator:` Cihazın konumunu almak için.
- `geocoding:` Adresleri koordinatlara ve tam tersi dönüştürmek için.

## Router
- `go_router:` Yönlendirme ve navigasyon için.

## Dependency Injection
- `get_it:` Bağımlılık enjeksiyonu için basit bir servis bulucu.

## Localization
- `easy_localization:` Uygulamanın kolayca yerelleştirilmesi için.

## Local Storage
- `hive:` Hafif bir anahtar-değer veritabanı.
- `hive_flutter:` Hive için Flutter entegrasyonu.

## State Management
- `flutter_riverpod:` Sağlayıcı tabanlı durum yönetim çözümü.

**Firebase**
- `firebase_core:` Firebase çekirdek işlevselliği.
- `firebase_auth:` Firebase kimlik doğrulama.

### Gereksinimler

- Flutter SDK
- Firebase proje kurulumu

### Kurulum

1. Depoyu klonlayın:
    ```sh
    git clone https://github.com/yourusername/your-repo.git
    cd your-repo
    ```

2. Bağımlılıkları yükleyin:
    ```sh
    flutter pub get
    ```

3. Firebase'i ayarlayın:
    - Firebase'i Flutter projenize eklemek için talimatları izleyin: [Firebase Setup](https://firebase.flutter.dev/docs/overview)
    - `google-services.json` ve `GoogleService-Info.plist` dosyalarını ilgili dizinlere yerleştirin.

### Kullanım

1. Uygulamayı çalıştırın:
    ```sh
    flutter run
    ```
- `cloud_firestore:` Cloud Firestore veritabanı.
- `firebase_storage:` Firebase bulut depolama.
- `firebase_crashlytics:` Firebase çökme raporlama.

