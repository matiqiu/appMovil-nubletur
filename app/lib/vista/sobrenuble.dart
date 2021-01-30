import 'package:flutter/material.dart';

class paginasobrenuble extends StatefulWidget {
  @override
  _paginasobrenuble createState() => new _paginasobrenuble();
}

class _paginasobrenuble extends State<paginasobrenuble> {
  static String idsn = 'sobrenuble';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sobre Ñuble',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sobre Ñuble'),
        ),
        body: ListView(
          children: [
            region,
            Image.asset(
              'images/regionnuble1.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            textregion,
            textregion2,
            Image.asset(
              'images/regionnuble2.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            textregion3,
            textregion4,
            clima,
            textclima,
            textclima2,
            textclima3,
            textclima4,
            vegetacion,
            Image.asset(
              'images/vegetacion.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            textvegetacion,
            textvegetacion2,
            hidrografia,
            Image.asset(
              'images/hidrografia.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            texthidrografia,
            texthidrografia2,
            texthidrografia3,
            texthidrografia4,
          ],
        ),
      ),
    );
  }

  Widget region = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Región de Ñuble',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textregion = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'La región de Ñuble se localiza Cerca del Límite Sur De La Zona Central, Específicamente Entre Los 36º00 Y Los 37º12 De Latitud Sur. Limita Al Norte Con La Región Del Maule, Al Sur Con La Región Del Biobío, Al Oeste Con El Océano Pacífico Y Al Este Con La República Argentina. Consta Con Una Superficie Aproximada De 13.178 Km2 Representando A La Región Con Menor Extensión Del País. El Paisaje Regional Presenta Las Unidades Longitudinales Clásicas De La Zona Central De Chile, Con Presencia De Algunos Elementos Propios Como Lo Es La Presencia De Una Precordillera, De Gran Relevancia En La Configuración Espacial De Ñuble. Según El Censo 2017 La Población Alcanza Los 480.609 Habitantes Y Una Densidad De 36,47 Habitantes Por Kilómetro Cuadrado.',
      softWrap: true,
    ),
  );

  Widget textregion2 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Respecto A Las Condiciones Climáticas, Esta Zona Se Podría Definir Como El Último Tramo De La Región Mediterránea De Estación Seca Prolongada Del Chile Central. Estas Condiciones Le Confieren Un Carácter Con Algunas Variaciones Extremas Según La Estación Del Año. La Red Hidrográfica De La Región Se Organiza En Torno Al Principal Sistema Fluvial: El Río Itata. A Partir De Este Drenaje Se Articulan El Resto De Las Subcuencas Y Sistemas De Escurrimiento Menores.',
      softWrap: true,
    ),
  );

  Widget textregion3 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Ñuble A Pesar De Ser Una Región Nueva Dentro De La División Político-Administrativa Del País, Es Una Zona De Mucha Tradición, La Cual Se Vincula Con La Imagen Más Representativa Del Campo Chileno, Y En General Con El Valle Central De Nuestro País. Su Sistema Urbano Posee Uno De Los Ejemplos De Conurbación Que Existen En Chile: Chillán-Chillán Viejo. Su Economía Se Basa En Rasgos Variados Vinculados A La Actividad Agraria, Pecuaria, Silvícola, El Comercio Y Los Servicios Personales.',
      softWrap: true,
    ),
  );

  Widget textregion4 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Además De Ello, Ñuble Se Caracteriza Por Ser La Cuna De Grandes Personajes, De Gran Trascendencia En La Historia De Chile, Como Bernardo O Higgins Y Arturo Prat; O Grandes Figuras De La Esfera Cultural Como Claudio Arrau, Violeta Parra Y Marta Brunet, Entre Otros.',
      softWrap: true,
    ),
  );

  Widget clima = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Clima',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textclima = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Desde El Punto De Vista Climático, La Región Marca La Transición Entre Los Climas Templados Secos De La Zona Central De Chile Y Los Climas Templados Lluviosos Que Comienzan A Desarrollarse Desde El Borde Sur De La Cuenca Del Itata.',
      softWrap: true,
    ),
  );

  Widget textclima2 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'En La Franja Costera Y En Los Sectores Altos Y Laderas Occidentales De La Cordillera De La Costa Se Presenta Un Clima Templado Húmedo, Con Una Humedad Constante Con Precipitaciones Que Fluctúan Entre 800 Mm Y 1.000 Mm Anuales De Norte A Sur De La Región.',
      softWrap: true,
    ),
  );

  Widget textclima3 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Hacia El Interior El Clima Templado Mediterráneo Posee Temperaturas Más Fluctuantes, Donde Las Precipitaciones Alcanzan Entre 1.000 A 1.500 Mm Anuales Con Un Período Seco De Cuatro Meses. Este Contraste Es Particularmente Perceptible En El Valle Longitudinal, Franja En La Cual Las Temperaturas Presentan Un Mayor Contraste Entre Día Y Noche. Su Distribución Predomina Sobre Toda La Zona Intermedia, Bordes Orientales De La Cordillera De La Costa Y Los Sectores Más Bajos De La Precordillera.',
      softWrap: true,
    ),
  );

  Widget textclima4 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'En La Cordillera De Los Andes Por Sobre Los 1.500 Metros De Altitud Se Desarrolla El Clima Frío De Altura Con Abundantes Precipitaciones, Superando Incluso Los 2.000 Mm Anuales, Lo Que Sumado A Las Bajas Temperaturas Imperantes, Permiten La Presencia De Nieves Permanentes En La Sección De Mayores Altitudes.',
      softWrap: true,
    ),
  );

  Widget vegetacion = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Vegetación',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textvegetacion = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'La Convivencia De Ñuble Con El Dominio Templado Mediterráneo Permite La Observación De Las Especies Más Características De Esta Ecorregión, Destacando Ejemplares De La Estepa Como El Espino (Acacia Caven), Asociado Con El Boldo (Peumus Boldus), El Maitén (Maytenus Boaria), El Peumo (Cryptocarya Alba) Y El Quillay (Quillaja Saponaria), Todas Especies Que Son Parte De La Vegetación Esclerófila Tradicional Del Centro Del País. Debido A Alteraciones Antrópicas, Hacia El Sur De La Región, El Bosque Nativo Y Las Especies Autóctonas Han Dado Paso Las Plantaciones Forestales De Pinos Y Eucaliptus, Los Cuales Alternan Con Los Cultivos Agrícolas.',
      softWrap: true,
    ),
  );

  Widget textvegetacion2 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'En Algunas Secciones De La Cordillera De Los Andes, En La Punilla Y En Los Bordes De Los Cauces Medios De Los Ríos Más Australes De Ñuble, Aparece Paulatinamente El Desarrollo Del Bosque Templado Higromórfico, Con Una Marcada Predominancia De Especies Como El Roble (Nothofagus Obliqua), El Ciprés (Austrocedrus Chilensis), El Raulí (Nothofagus Alpina); Y En Los Sectores Con Mayores Altitudes Es Posible Encontrar La Lenga (Nothofagus Pumilio) Y El Mañío (Podocarpus Nubigenus).',
      softWrap: true,
    ),
  );

  Widget hidrografia = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Hidrografía',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget texthidrografia = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'La Región Del Ñuble Se Asocia Principalmente Al Gran Sistema Fluvial Del Río Itata, Dren Principal Que Nace En La Cordillera De Los Andes, Y Que En Su Recorrido Recibe Los Desagües De Buena Parte De Las Cuencas Altas De La División Administrativa.',
      softWrap: true,
    ),
  );

  Widget texthidrografia2 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'La Hoya Hidrográfica Del Río Itata Alcanza Una Superficie De 11.293 Km2 Y Está Formada Principalmente Por Tres Cursos De Agua: Los Ríos Itata, Ñuble Y Diguillín. Posee Una Longitud De 180 Km Incluyendo Dos Ríos Formativos: El Cholguán Y Huépil. Su Régimen Es Mixto, Ya Que Los Principales Afluentes Nacen En La Cordillera Y Precordillera De Los Andes Adquiriendo Su Aporte De Los Deshielos Primaverales, Además Del Aporte Hecho Por Las Precipitaciones Invernales. Este Río Cruza El Valle Longitudinal Donde En Su Entrada Presenta Un Gran Salto De Agua Que Muestra El Desnivel Del Terreno. Su Caudal Medio Anual Varía Entre 30 Y 67 M3, Según Sea El Año Estudiado Y La Estación Fluviométrica Utilizada.',
      softWrap: true,
    ),
  );

  Widget texthidrografia3 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Respecto Del Río Ñuble, Es El Principal Dren En El Transporte De Las Aguas De Las Cuencas Cordilleranas De La Sección Norte De La Región. Subtendiendo Una Superficie De 4.774 Km2, Es El Dren Que Recoge Los Aportes De La Sección Norte De La Región, Incluyendo A Sus Tributarios: Río Chillán, Río Cato Y Río Changaral.',
      softWrap: true,
    ),
  );

  Widget texthidrografia4 = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'El Río Diguillín Por Su Parte Es El Principal Curso Que Drena La Sección Latitudinal Centro-Sur De La Región. Con Una Cuenca De 1.386 Km2, Este Río Va Colectando Los Aportes De Los Cursos Cordilleranos, Como El Estero Renegado, Para Incorporar Incluso Aguas Provenientes De Otras Cuencas Mediante El Canal Laja-Diguillín, Y Que Ha Provisto De Un Suplemento De Aguas Destinadas Al Regadío A La Zona.',
      softWrap: true,
    ),
  );
}
