function Me = leQuadM(ELEM, NODE)
    %-------------------
    % Homework #5
    %-------------------
    %Gets the quadrature information
    n = sqrt(ELEM.npoints);
    [xi, wi] = GaussPoints(n);

    %TODO: Computes the Mass matrix using numerical integration
    for j = 1:length(wi)
        for i = 1:length(wi)
            %Get the thickness in this gauss point (th)

            %Compute material tangent matrix at Gauss point (Rij)

            %Compute the Jacobian matrix in this gauss point (Jij)

            %Compute Strain-Displacement Matrix at Gauss Point (Hij)

            %Numerical integration (Me)
        end
    end
end
