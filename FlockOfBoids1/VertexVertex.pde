import java.util.List;

public class VertexVertex{

    List<PVector> vertexList;
    PShape my_shape;

    public VertexVertex(List<PVector> vertexList) {
        this.vertexList = vertexList;
        buildMesh();
    }

    void renderMesh(String render){
        if(render == "Immediate"){
          beginShape();
            for(PVector vertex : vertexList) {
              vertex(vertex.x,vertex.y,vertex.z);
            }
          endShape();
        }
        else{
          shape(my_shape);
        }
    }
    
    void buildMesh(){
      my_shape=createShape();
      my_shape.beginShape();
      for(PVector vertex : vertexList) {
          my_shape.vertex(vertex.x,vertex.y,vertex.z);
      }
      my_shape.endShape(CLOSE);
    }
}
