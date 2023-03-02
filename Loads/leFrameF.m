function Fe = leFrameF(ELEM, NODE, fe)
    %Gets the quadrature information
    n = sqrt(ELEM.npoints);
    [xi, wi] = GaussPoints(n);

    %Element direction and length
    ve = NODE(2).coords - NODE(1).coords;
    Le = norm(ve);

    %Computes the force vector in local coordinates using numerical integration
    Fe = zeros(6,1);
    for k = 1:length(wi)
        %Compute Interpolation Function Matrix at Gauss Point
        Hij = ComputeShapeFunctionMatrixFrame(xi(k), Le);

        %Gets material tangent matrix at Gauss point
        qij = ComputeLocalLoadFrame(ELEM.prop(k,:), ve, fe);

        %Numerical integration
        Fe = Fe + wi(k)*Le/2.0*Hij'*qij;
    end
    
    %Rotation matrix from global to local
    Re = LocalAxesFrame(ve);
    
    %Force in global coordinate
    Fe = Re'*Fe;
end

%Compute the local load of the element.
function q = ComputeLocalLoadFrame(SEC, v, fe)
    %Material density
    rho = SEC(2);

    %Cross-Section Area
    Ae = SEC(3);

    %Local axis definition.
    u = v/norm(v);
    R = [ u(1), u(2);
         -u(2), u(1)];

    %Transformation matrix
    q = rho*Ae*R*fe';
end

%Evaluates the strain-displacement matrix at a given Gauss point.
function Nij = ComputeShapeFunctionMatrixFrame(xi, L)
    %Shape function coefficients:
    N11 = 1.0/2.0*(1.0 - xi);
    N21 = 1.0/2.0*(1.0 + xi);
    N31 = 1.0/4.0*(1.0 - xi)^2*(2.0 + xi);
    N41 = L/8.0*(1.0 - xi)^2*(xi + 1.0);
    N51 = 1.0/4.0*(1.0 + xi)^2*(2.0 - xi);
    N61 = L/8.0*(1.0 + xi)^2*(xi - 1.0);

    %Shape function matrix:
    Nij = [N11, 0.0, 0.0, N21, 0.0, 0.0;
           0.0, N31, N41, 0.0, N51, N61];
end

%Compute/update the local axis of the element.
function R = LocalAxesFrame(v)
    %Local axis definition.
    u = v/norm(v);

    %Transformation matrix
    R =  [u(1), u(2), 0.0,   0.0,  0.0, 0.0;
         -u(2), u(1), 0.0,   0.0,  0.0, 0.0;
          0.0,   0.0, 1.0,   0.0,  0.0, 0.0;
          0.0,   0.0, 0.0,  u(1), u(2), 0.0;
          0.0,   0.0, 0.0, -u(2), u(1), 0.0;
          0.0,   0.0, 0.0,   0.0,  0.0, 1.0];
end
