
import 'package:vector_math/vector_math.dart';

extension Matrix3Extension on Matrix3 {

  Vector3 getRightDiagonal(){
    return Vector3(this.entry(0, 0), this.entry(1, 1), this.entry(2, 2));
  }

  Vector3 getLeftDiagonal(){
    return Vector3(this.entry(0, 2), this.entry(1, 1), this.entry(2, 0));
  }
}