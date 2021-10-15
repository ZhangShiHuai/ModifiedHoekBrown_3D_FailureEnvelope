# ModifiedHoekBrown_3D_FailureEnvelope
Written by Shihuai Zhang.

This MATLAB script plots three-dimensional failure envelop in the principal stress space. For more information, please refer to the following papers:

(i) Wu, S., Zhang, S., Guo, C., & Xiong, L. (2017). A generalized nonlinear failure criterion for frictional materials. Acta Geotechnica, 12(6), 1353-1371.

(ii) Wu, S., Zhang, S., & Zhang, G. (2018). Three-dimensional strength estimation of intact rocks using a modified Hoek-Brown criterion based on a new deviatoric function. International Journal of Rock Mechanics and Mining Sciences, 107, 181-190.

(iii) Zhang, S., Wu, S., & Zhang, G. (2020). Strength and deformability of a low-porosity sandstone under true triaxial compression conditions. International Journal of Rock Mechanics and Mining Sciences, 127, 104204.


The new Hoek-Brown criterion enables a 3D failure envelop based only on conventional triaxial compression tests. In this package, I provide the peak strength data of Zigong sandstone from Reference(iii) as a demo.


Specifically, this package includes:
  1) Fitting strength parameters according to peak strength data. (File: Fitting_Para.m)
  2) Plot 3D failure envelope in the principal stress space. (File: ThreeDimen_Envelope.m)
  3) Plot different deviatoric (pi) planes along the hydrostatic axis, and project them onto the 2D plane. (File: Pi_Plane.m)
  4) Plot SqrtJ2 - I1 relationship and quantify the fittness error. (File: SqrtJ2_I1.m)
  5) Plot the effect of Sigma2 on strength. (File: IntermediateStress.m)







