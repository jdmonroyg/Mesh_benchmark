# Taller de mallas poligonales

## Propósito

Estudiar la relación entre las [aplicaciones de mallas poligonales](https://github.com/VisualComputing/representation), su modo de [representación](https://en.wikipedia.org/wiki/Polygon_mesh) (i.e., estructuras de datos empleadas para representar la malla en RAM) y su modo de [renderizado](https://processing.org/tutorials/pshape/) (i.e., modo de transferencia de la geometría a la GPU).

## Tareas

Hacer un benchmark (midiendo los *fps* promedio) de varias representaciones de mallas poligonales para los _boids_ del ejemplo del [FlockOfBoids](https://github.com/VisualComputing/framesjs/tree/processing/examples/Advanced/FlockOfBoids) (requiere la librería [frames](https://github.com/VisualComputing/framesjs/releases), versión ≥ 0.1.0), tanto en modo inmediato como retenido de rendering.

1. Represente la malla del [boid](https://github.com/VisualComputing/framesjs/blob/processing/examples/Advanced/FlockOfBoids/Boid.pde) al menos de ~tres~ dos formas distintas.
2. Renderice el _flock_ en modo inmediato y retenido, implementando la función ```render()``` del [boid](https://github.com/VisualComputing/framesjs/blob/processing/examples/Advanced/FlockOfBoids/Boid.pde).
3. Haga un benchmark que muestre una comparativa de los resultados obtenidos.

### Opcionales

1. Realice la comparativa para diferentes configuraciones de hardware.
2. Realice la comparativa de *fps* sobre una trayectoria de animación para el ojo empleando un [interpolator](https://github.com/VisualComputing/framesjs/tree/processing/examples/Basics/B8_Interpolation2) (en vez de tomar su promedio).
3. Anime la malla, como se hace en el ejemplo de [InteractiveFish](https://github.com/VisualComputing/framesjs/tree/processing/examples/ik/InteractiveFish).
4. Haga [view-frustum-culling](https://github.com/VisualComputing/framesjs/tree/processing/examples/Demos/ViewFrustumCulling) de los _boids_ cuando el ojo se encuentre en tercera persona.

### Profundizaciones

1. Introducir el rol depredador.
2. Cómo se afecta el comportamiento al tener en cuenta el [campo visual](https://es.wikipedia.org/wiki/Campo_visual) (individual)?
3. Implementar el algoritmo del ```flock()``` en [OpenCL](https://en.wikipedia.org/wiki/OpenCL). Ver [acá](https://www.youtube.com/watch?v=4NU37rPOAsk) un ejemplo de *Processing* en el que se que emplea [JOCL](http://www.jocl.org/).

### References

1. [Reynolds, C. W. Flocks, Herds and Schools: A Distributed Behavioral Model. 87](http://www.cs.toronto.edu/~dt/siggraph97-course/cwr87/).
2. Check also this [nice presentation](https://pdfs.semanticscholar.org/73b1/5c60672971c44ef6304a39af19dc963cd0af.pdf) about the paper:
3. There are many online sources, google for more...

## Integrantes

Máximo 3.

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|Jesus David Monroy Garces|jdmonrog|
|Helmer Andres Avendaño Vargas|helmeraac|

## Entrega

* Modo de entrega: Haga [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla e informe la url del repo en la hoja *urls* de la plantilla compartida (una sola vez por grupo). Plazo: 15/4/18 a las 24h.
* Exposición oral en el taller de la siguiente semana (6 minutos: 4 para presentar y 2 para preguntas). Estructura sugerida:
## Representaciones estudiadas.
En el taller se implemento dos modos de representacion de una malla poligonal que son Face-Vertex y Vertex-Vertex

#### Vertex-Vertex
En esta representación, se muestra un objeto como un conjunto de vértices que están conectados a otros vértices de una forma ordena. Es una representación no completa de hace, pero que tiene que tener un orden para poder representar la malla poligonal, debido a que la estructura solo posee información de los vértices, dejando implícito el borde y la cara de la malla. Es una representación costosa, debido a que recorre toda la lista de vértices para la generación de las caras de la malla. Esto se ve en cuanto hacemos la comparativa en el benchmark.

#### Face-Vertex
En esta representación se diseña un objeto como un conjunto de caras y un conjunto de vértices. Con respecto a la anterior representación mejora para el modelado de la malla con respecto a los FrameRate, ya que permite una búsqueda de los vértices de una cara y las caras que rodean a un vértice, por esto es más eficiente esta representación, lo veremos en el Benchmark.


## Teclas para funcionalidad
| Funcion | Tecla|
|------------|-------------|
|Cambiar de modo FV a VV o viceversa |q|
|Modo Inmediato|i|
|Modo Retenido|i|

## Resultados (benchmark).
Se realiza un benchmark con la siguiente configuracion:
* Se utilizan boids o nodos de 10,100,500 y 1000 para representar las mallas FV y VV, tanto en modo inmediato como en modo retenido 

Al realizar nuestros benchmark, a medida que vamos agregandos boids los fps van disminuyendo ya que requieren mayor recurso y se nota apartir de 500 en adelante.  
BenchmarkVV: ![alt](https://github.com/jdmonroyg/Mesh_benchmark/blob/master/Imagenes/Benchmark%20V-V.PNG)
BenchmarkFV: ![alt](https://github.com/jdmonroyg/Mesh_benchmark/blob/master/Imagenes/Benchmark%20F-V.PNG)

BenchmarkComparativa: ![alt](https://github.com/jdmonroyg/Mesh_benchmark/blob/master/Imagenes/Benchmark%20Comparativa.PNG)

## Conclusiones.
A traves de la grafica comparativa se puede observar, que la representacion VV requiere muchos más recursos que la de FV, debido a que la primera necesita recorrer toda la lista de vertices para poder ser modelada. Tambien se puede observar que el es modo inmediato tiene una muchos mas fps en promedios que el modo retenido. 
