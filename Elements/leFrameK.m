function Ke = leFrameK(ELEM,NODE)
    %-------------------
    % Homework #4
    %-------------------
    %Gets the quadrature information
    n = ELEM.npoints;
    [xi, wi] = GaussPoints(n);
    
    %TODO: Get section properties
    %Elasticiy Modulus (E)
    %Cross-Section Area (A)
    %Cross-Section Inertia (I)

    %TODO: Compute Element length (Le)

    %TODO: Computes the Stiffness matrix in local coordinates using numerical integration
    for k = 1:length(wi)
        %Compute Strain-Displacement Matrix at Gauss Point (Bk)

        %Gets material tangent matrix at Gauss point (Sk)

        %Numerical integration for ke
    end

    %TODO: Compute the global axes transformation (Re)

    %TODO: Transform the Stiffness matrix in global coordinates (Ke)
end
