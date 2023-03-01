function Me = leFrameM(ELEM, NODE)
    %-------------------
    % Homework #4
    %-------------------
    %Gets the quadrature information
    n = ELEM.npoints;
    [xi, wi] = GaussPoints(n);
    
    %TODO: Get section properties
    %Material density (rho)
    %Cross-Section Area (A)

    %TODO: Compute the element length (Le)

    %TODO: Computes the Mass matrix in local coordinates using numerical integration
    for k = 1:length(wi)
        %Compute Interpolation Function Matrix at Gauss Point (Hij)

        %Gets material tangent matrix at Gauss point (Rij)

        %Numerical integration for me
    end

    %TODO: Compute the global axes transformation (Re)

    %TODO: Transform the Mass matrix in global coordinates (Me)
end
