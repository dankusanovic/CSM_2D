function Fe = leQuadF(ELEM, NODE, fe)
    %Gets the quadrature information
    n = sqrt(ELEM.npoints);
    [xi, wi] = GaussPoints(n);

    %Stiffness matrix allocation
    qe = fe';
    Fe = zeros(8,1);
    for j = 1:length(wi)
        for i = 1:length(wi)
            th = ELEM.prop(i+(j-1)*n, 4);
            rho = ELEM.prop(i+(j-1)*n, 3);

            %Jacobian matrix.
            Jij = JacobianMatrixQuad(xi(i), xi(j), NODE);

            %Compute Strain-Displacement Matrix at Gauss Point
            Hij = ComputeShapeFunctionMatrixQuad(xi(i), xi(j));

            %Numerical integration
            Fe = Fe + rho*wi(i)*wi(j)*th*abs(det(Jij))*Hij'*qe;
        end
    end
end

%Compute/update the local axis of the element.
function Jij = JacobianMatrixQuad(ri, si, NODE)
    %Gets the element coordinates in deformed configuration. 
    X1 = NODE(1).coords;
    X2 = NODE(2).coords;
    X3 = NODE(3).coords;
    X4 = NODE(4).coords;

    %Jacobian coefficients:
    J11 = -1.0/4.0*(1.0 - si)*X1(1) + 1.0/4.0*(1.0 - si)*X2(1) + 1.0/4.0*(1.0 + si)*X3(1) - 1.0/4.0*(1.0 + si)*X4(1);
    J12 = -1.0/4.0*(1.0 - si)*X1(2) + 1.0/4.0*(1.0 - si)*X2(2) + 1.0/4.0*(1.0 + si)*X3(2) - 1.0/4.0*(1.0 + si)*X4(2); 
    J21 = -1.0/4.0*(1.0 - ri)*X1(1) - 1.0/4.0*(1.0 + ri)*X2(1) + 1.0/4.0*(1.0 + ri)*X3(1) + 1.0/4.0*(1.0 - ri)*X4(1); 
    J22 = -1.0/4.0*(1.0 - ri)*X1(2) - 1.0/4.0*(1.0 + ri)*X2(2) + 1.0/4.0*(1.0 + ri)*X3(2) + 1.0/4.0*(1.0 - ri)*X4(2); 

    %Jacobian matrix:
    Jij = [J11, J12;
           J21, J22];
end

%Evaluates the strain-displacement matrix at a given Gauss point.
function Nij = ComputeShapeFunctionMatrixQuad(ri, si)
    %Shape function coefficients:
    N11 = 1.0/4.0*(1.0 - ri)*(1.0 - si);
    N22 = 1.0/4.0*(1.0 + ri)*(1.0 - si);
    N33 = 1.0/4.0*(1.0 + ri)*(1.0 + si);
    N44 = 1.0/4.0*(1.0 - ri)*(1.0 + si);

    %Shape function matrix:
    Nij = [N11, 0.0, N22, 0.0, N33, 0.0, N44, 0.0;
           0.0, N11, 0.0, N22, 0.0, N33, 0.0, N44];
end
