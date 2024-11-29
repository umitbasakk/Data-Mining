import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    'f9al2jiq': {
      'en': 'The experience of buying food quickly',
      'es': 'La experiencia de comprar comida rápidamente',
      'fr': 'L’expérience d’acheter de la nourriture rapidement',
    },
    'q7mzy88d': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2egoby3b': {
      'en': 'Find and Get Your Best Food',
      'es': 'Encuentre y obtenga su mejor comida',
      'fr': 'Trouvez et obtenez votre meilleure nourriture',
    },
    'neuxxcug': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    'rijctza1': {
      'en': 'Foodie’s courier send with love',
      'es': 'El mensajero de Foodie envía con amor.',
      'fr': 'Courrier gourmand envoyé avec amour',
    },
    '5cdcpcqz': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2044raxp': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'kvk96b9a': {
      'en': 'Already Have an Account',
      'es': 'Ya tienes una cuenta',
      'fr': 'Vous avez déjà un compte',
    },
    'e9n9xv7z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Verification
  {
    'lnxzjexp': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'm8vt32wl': {
      'en': 'Verification Code',
      'es': 'Código de verificación',
      'fr': 'Le code de vérification',
    },
    'j0wt8bqq': {
      'en':
          'We have to sent the code verification 1234, Please enter the code to move forward',
      'es':
          'Tenemos que enviar el código de verificación 1234. Ingrese el código para seguir adelante.',
      'fr':
          'Nous devons envoyer le code de vérification 1234, veuillez entrer le code pour avancer',
    },
    'vfbmvgvb': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '5iqum420': {
      'en': 'Didn\'t recceive the code? ',
      'es': '¿No recibiste el código?',
      'fr': 'Vous n\'avez pas reçu le code ?',
    },
    '7axmi8vz': {
      'en': 'Resend',
      'es': 'Reenviar',
      'fr': 'Renvoyer',
    },
    'hvh480nv': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginAccount
  {
    'absgjmyr': {
      'en': 'Login Account',
      'es': 'Iniciar sesión cuenta',
      'fr': 'Compte de connexion',
    },
    '7yyc6yio': {
      'en': 'Please login with registered account',
      'es': 'Por favor inicie sesión con una cuenta registrada',
      'fr': 'Veuillez vous connecter avec un compte enregistré',
    },
    '0y1a56v9': {
      'en': 'Email ',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'xq55heau': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'j9otnesx': {
      'en': 'demo@email.com',
      'es': 'demostración@correo electrónico.com',
      'fr': 'démo@email.com',
    },
    'iyk0cszg': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'tec1pifi': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    '3f1bhb2o': {
      'en': '111111',
      'es': '111111',
      'fr': '111111',
    },
    '0c1sk3ec': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    '58ybobvm': {
      'en': 'Signin',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    '9ftxk5xj': {
      'en': 'Don\'t have an acccount',
      'es': 'No tengo una cuenta',
      'fr': 'Je n\'ai pas de compte',
    },
    'jlqha2r3': {
      'en': 'Signup',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '84xsjzjp': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Home
  {
    'nrjkv2kp': {
      'en': '- Roast Beaf -',
      'es': '- Carne Asada -',
      'fr': '- Rôti de Bœuf -',
    },
    'qbi76ffw': {
      'en': 'Buy 2 and ',
      'es': 'Compra 2 y',
      'fr': 'Achetez-en 2 et',
    },
    '365znznm': {
      'en': 'Get 2',
      'es': 'Consigue 2',
      'fr': 'Obtenez-en 2',
    },
    'qc5r40eh': {
      'en': 'The taste of the cake is worldwide',
      'es': 'El sabor del pastel es mundial.',
      'fr': 'Le goût du gâteau est mondial',
    },
    'gdd44mmx': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'fr': 'Trouvons la nourriture que vous aimez',
    },
    'yuxvfcy0': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Detail
  {
    'mnx04jee': {
      'en': 'Menu Detail',
      'es': 'Detalle del menú',
      'fr': 'Détail du menu',
    },
    'djb2f3n5': {
      'en': 'Noodles',
      'es': 'Fideos',
      'fr': 'Nouilles',
    },
    'mtpbo3c3': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    'vn8tgitw': {
      'en': 'Rating',
      'es': 'Clasificación',
      'fr': 'Notation',
    },
    '9qydxdue': {
      'en': '4,8',
      'es': '4,8',
      'fr': '4,8',
    },
    't0v4dcf1': {
      'en': 'Calories',
      'es': 'calorías',
      'fr': 'Calories',
    },
    'neg3msns': {
      'en': '124 Kcal',
      'es': '124 kilocalorías',
      'fr': '124 Kcal',
    },
    '3arxnrib': {
      'en': 'Time',
      'es': 'Tiempo',
      'fr': 'Temps',
    },
    'disilbb6': {
      'en': '15 min',
      'es': '15 minutos',
      'fr': '15 min',
    },
    'r8xqexim': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
    },
    'tz8hydwz': {
      'en':
          'Vegetable noodles is a healthy Chinese inspired dish where cooked noodles are stir fried with lots of vegetables. Further the dish is seasoned with a splash of sauces, vinegar and black ',
      'es':
          'Los fideos con verduras son un plato saludable de inspiración china en el que los fideos cocidos se saltean con muchas verduras. Además se condimenta el plato con un chorrito de salsas, vinagre y negro.',
      'fr':
          'Les nouilles aux légumes sont un plat sain d\'inspiration chinoise où les nouilles cuites sont sautées avec beaucoup de légumes. De plus, le plat est assaisonné d\'un peu de sauces, de vinaigre et de noir.',
    },
    'ofiu1ud3': {
      'en': 'Read More',
      'es': 'Leer más',
      'fr': 'En savoir plus',
    },
    '8u283qs4': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'cjnow4du': {
      'en': 'Open Location',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'xm7euxs5': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'kjyn3b76': {
      'en': '35.25',
      'es': '35.25',
      'fr': '35h25',
    },
    'xv6cwiei': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'bzzsk2tt': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Setting
  {
    'k9p4o7mq': {
      'en': 'General',
      'es': 'General',
      'fr': 'Général',
    },
    'huf27lxh': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'ds506agm': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    '4k922abp': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'ihvwbj05': {
      'en': 'Foodcort Version 1.0.12 Build 24',
      'es': 'Foodcort Versión 1.0.12 Compilación 24',
      'fr': 'Foodcort version 1.0.12 version 24',
    },
    'tpcxi4d9': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
  },
  // EditProfile
  {
    'czlgmhds': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    '36zgxj4d': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    '3ia1b2s1': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    '18dmglcv': {
      'en': 'Hendrix',
      'es': 'Hendrix',
      'fr': 'Hendrix',
    },
    'y62t4x4v': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'qoq8rd90': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'atadv3g7': {
      'en': 'demo@email.com',
      'es': 'demostración@correo electrónico.com',
      'fr': 'démo@email.com',
    },
    '8c7103h3': {
      'en': 'Account Liked With',
      'es': 'Cuenta que le ha gustado',
      'fr': 'Compte aimé avec',
    },
    'w6ao9nf7': {
      'en': 'Google connected.',
      'es': 'Google conectado.',
      'fr': 'Google connecté.',
    },
    '2es027e3': {
      'en': 'Connect device',
      'es': 'Conectar dispositivo',
      'fr': 'Connecter l\'appareil',
    },
    'vrtr6uvq': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'ubo5xh9z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Register
  {
    'a3gg4ld5': {
      'en': 'Create Account',
      'es': 'Iniciar sesión cuenta',
      'fr': 'Compte de connexion',
    },
    '6cx5py4h': {
      'en': 'Please login with registered account',
      'es': 'Por favor inicie sesión con una cuenta registrada',
      'fr': 'Veuillez vous connecter avec un compte enregistré',
    },
    'y40td43u': {
      'en': 'Name',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'bj378yya': {
      'en': 'Enter your name',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'q81wejb8': {
      'en': 'Username',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'c40yjchy': {
      'en': 'Enter your username',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'j0pbqbz3': {
      'en': 'Emai',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '3fd1z72m': {
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'ummu3nhe': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'cz2n8vfv': {
      'en': 'Enter your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'g11w1e6q': {
      'en': 'Signup',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'u2nj6oz7': {
      'en': 'Do you have an acccount',
      'es': 'No tengo una cuenta',
      'fr': 'Je n\'ai pas de compte',
    },
    'dnml2izy': {
      'en': 'Signin',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'iptkfnc8': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // registerSuccess_modal
  {
    'vkxriblo': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
    },
    'h2xdozlk': {
      'en':
          'Congratulation! your account already created.\nPlease login to get amazing experience.',
      'es':
          '¡Felicitaciones! su cuenta ya creada.\nInicie sesión para obtener una experiencia increíble.',
      'fr':
          'Félicitation ! votre compte déjà créé.\nVeuillez vous connecter pour vivre une expérience incroyable.',
    },
    't4tt10im': {
      'en': 'Go to Home',
      'es': 'Ir a casa',
      'fr': 'Aller à la maison',
    },
  },
  // ForgotPasswordPopup
  {
    '68da8o48': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    't0wp5kyz': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'fr': 'Entrez votre mail ou votre numéro de téléphone',
    },
    'laq1e1na': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '4wi8kjyp': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '4ligppz0': {
      'en': 'Send Code',
      'es': 'Enviar código',
      'fr': 'Envoyer le code',
    },
  },
  // newPassword_modal
  {
    'rkilnmjw': {
      'en': 'Create New Password',
      'es': 'Crear nueva contraseña',
      'fr': 'Créer un nouveau mot de passe',
    },
    'ud34pzj3': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'fr': 'Entrez votre mail ou votre numéro de téléphone',
    },
    '96yt5u83': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '6xsz8kht': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'w8i0tlah': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '667e4ujp': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'ucakz1il': {
      'en': 'Change Password',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // FilterPopup
  {
    '8jo71kve': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    '8eo5q4gq': {
      'en': 'Sort by',
      'es': 'Ordenar por',
      'fr': 'Trier par',
    },
    'qm6mzjkr': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'fr': 'Recommandé',
    },
    '2s5gpezj': {
      'en': 'Nearest',
      'es': 'Más cercano',
      'fr': 'La plus proche',
    },
    'iclmvv58': {
      'en': 'Fastest',
      'es': 'Lo más rápido',
      'fr': 'Le plus rapide',
    },
    'ra08b12o': {
      'en': 'Categories',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    '9f5qk755': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'fr': 'Hamburgers',
    },
    'eicbxmen': {
      'en': 'Pizza',
      'es': 'Pizza',
      'fr': 'Pizza',
    },
    '1wc8f4us': {
      'en': 'Cookies',
      'es': 'Galletas',
      'fr': 'Biscuits',
    },
    'q4amxetw': {
      'en': 'Price Ranges',
      'es': 'Rangos de precios',
      'fr': 'Gammes de prix',
    },
    'hnv04kes': {
      'en': 'Apply Filter',
      'es': 'Aplicar filtro',
      'fr': 'Appliquer le filtre',
    },
  },
  // confirm_modal
  {
    'wss38bpn': {
      'en': 'Are you sure you want to activate your location?',
      'es': '¿Estás seguro de que quieres activar tu ubicación?',
      'fr': 'Etes-vous sûr de vouloir activer votre localisation ?',
    },
    '29xlhpns': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'zuga39cj': {
      'en': 'Yes, Enable',
      'es': 'Sí, habilitar',
      'fr': 'Oui, activer',
    },
  },
  // AddExtraItem
  {
    '4wms16ni': {
      'en': 'Beef',
      'es': 'Carne de res',
      'fr': 'Bœuf',
    },
    'ejo6z1g1': {
      'en': '1 Slice',
      'es': '1 rebanada',
      'fr': '1 tranche',
    },
  },
  // logOut_modal
  {
    '38q11wq9': {
      'en': 'Are you sure you want to logout?',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'fr': 'Êtes-vous sûr de vouloir vous déconnecter?',
    },
    'mpj8eknt': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'p19zdwc8': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
  },
  // navigator
  {
    'w4ui9cw8': {
      'en': 'Pages',
      'es': 'paginas',
      'fr': 'Pages',
    },
    'tl1qab9r': {
      'en': 'Onboarding',
      'es': 'Inducción',
      'fr': 'Intégration',
    },
    '6vbi0byh': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    '3wz6lqp1': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'oj3cf9cd': {
      'en': 'Modals',
      'es': 'modales',
      'fr': 'Modaux',
    },
    '5o9cd5e2': {
      'en': 'Confirm',
      'es': 'Confirmar',
      'fr': 'Confirmer',
    },
    'c2evnsw5': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '8l5zbjdz': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'nouveau mot de passe',
    },
    'kwl7igml': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
    },
    '1z4hfai6': {
      'en': 'About Template',
      'es': 'Acerca de la plantilla',
      'fr': 'À propos du modèle',
    },
    '86o94vt0': {
      'en': 'Builderking',
      'es': 'constructor',
      'fr': 'Construction',
    },
  },
  // Miscellaneous
  {
    'b3u7as3r': {
      'en': 'Create Account',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'ctqamqlc': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    'umpm3yh5': {
      'en': 'Sign Up with Google',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'u17s3o3i': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'fr': 'Trouvons la nourriture que vous aimez',
    },
    'm470nw6c': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    'tkq1nhez': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'fr': 'Recommandé',
    },
    'amak33fx': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    '5hctr45y': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'fazi37bo': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    '6on3f8zv': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'fr': 'Entrer le code du bon',
    },
    'vc3k7k6z': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'fr': 'Hamburgers',
    },
    'cvmlykt8': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
    'ogz0ss6o': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'cpbcsw9m': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zi2yt9e7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vnau18bv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lktg3dy4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fjabeg9r': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '7yw004o2': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xsjq375t': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xiyzhulx': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm3u1mw7e': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dvzeat75': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4bdekwbm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rvm9rdle': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '3uxb43tw': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'g8ay9flm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0raeaqd3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'j3d762mc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jzepjy1z': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dlctomaa': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fdy7k4vs': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'o37sr5xj': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'v8s1znh7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jg3a7edz': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pcwstkno': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
