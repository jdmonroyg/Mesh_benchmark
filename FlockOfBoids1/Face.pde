public class Face{
  
  PVector v1;
  PVector v2;
  PVector v3;

  public Face(PVector v1, PVector v2, PVector v3) {
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
  }

  public void renderFaceImmediate(){
      vertex(v1.x,v1.y,v1.z);
      vertex(v2.x,v2.y,v2.z);
      vertex(v3.x,v3.y,v3.z);
  }

  public void renderFaceRetained(PShape my_shape){

      my_shape.vertex(v1.x,v1.y,v1.z);
      my_shape.vertex(v2.x,v2.y,v2.z);
      my_shape.vertex(v3.x,v3.y,v3.z);
  }

}
