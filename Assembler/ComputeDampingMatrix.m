function MESH = ComputeDampingMatrix(MESH)
    %-------------------
    % Homework #5
    %-------------------
    %TODO: Computes damping matrix
    if strcmpi(MESH.DAMPING.name, 'rayleigh')
        %Get the Rayleigh coefficients

        %Compute the Rayleigh damping matrix

    elseif strcmpi(MESH.DAMPING.name, 'caughey')
        %Get the Caughey coefficients

        %Checks if Eigen analisis was performed

        %Compute the Caughey damping matrix
    else
        nfree = MESH.STORAGE.free;
        C = sparse(nfree,nfree);
    end

    %TODO: Stores the damping matrix in MESH
end
