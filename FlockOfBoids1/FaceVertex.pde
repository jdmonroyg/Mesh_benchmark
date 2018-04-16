import java.util.List;

public class FaceVertex{

    List<Face> facesList;
    List<PVector> vertexList;
    PShape my_shape;

    public FaceVertex(List<Face> facesList, List<PVector> vertexList) {

        this.facesList = facesList;
        this.vertexList = vertexList;
        buildMesh();
    }

    void renderMesh(String render){
        if(render == "Immediate"){
          beginShape(TRIANGLES);
            for(Face face : facesList) {
                face.renderFaceImmediate();
            }
          endShape();
        }
        else{
          shape(my_shape);
        }
    }
    
    void buildMesh(){
      my_shape=createShape();
      my_shape.beginShape(TRIANGLES);
      for(Face face : facesList) {
          face.renderFaceRetained(my_shape);
      }
      my_shape.endShape(CLOSE);
    }
}
