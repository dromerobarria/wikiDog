
# Roadmap
Haciendo uso de la API publica: https://dog.ceo/dog-api/
- Crear una app que muestre una lista de las razas de perros disponibles
/api/breeds/list

Al seleccionar una raza se deben mostrar las imágenes asociadas a dicha raza
/api/breed/{breed name}/images

No hay requerimientos en cuanto a la versión de Swift puedes usar la que más te acomode.

Tampoco existen requerimientos en cuanto al diseño de la aplicación, no es necesario que se vea "bonita".

Adicionalmente te comento que en MobDev la calidad de software es muy importante, por lo que nos encantaría ver buenas prácticas como los principios SOLID, Clean Architecture y por supuesto tests.


Consideraciones


1- Se utilizo Clean Swift, junto a sus templates para la arquitectura
2- Se utilizo  Alamofire para la capa de network
3- Se utilizo  Realm como base de datos
4- Se utilizo  Kingfisher para el manejo de imagenes
5- Se realizon 3 simples test para verificar el total de razas como el primer y ultimo elemento , asi como un test de navegación. Estos fueron simples pero a modo de ejemplo de manejo de Test.
