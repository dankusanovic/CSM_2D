function MESH = EigenAnalysis(MESH, n)
    %-------------------
    % Homework #4
    %-------------------
    %TODO: Computes Stiffness Matrix
    
    %TODO: Computes Mass Matrix

    %Computes the requested mode shapes
    options.disp = 0; 
    [V, D, ~] = eigs(MESH.MODEL.K, MESH.MODEL.M, n, 'SM', options);
    [wi, pos] = sort(sqrt(diag(D)));

    %TODO: Computes the periods from wi

    %TODO: Orders the modes according to (pos) and normalize them
    for k = 1:n
    end

    %TODO: Stores eigen information in MESH.MODEL.EIGEN
end
