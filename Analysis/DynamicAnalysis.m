function MESH = DynamicAnalysis(MESH, nt, dt)
    %-------------------
    % Homework #5
    %-------------------
    %Newmark average acceleration
    gamma = 1/2;
    beta  = 1/4;

    %TODO: Allocate Solution vectors U, V, A

    %TODO: Computes Stiffness, Mass and Damping matrices

    %TODO: Compute the Newmark effective stiffness matrix
    %Keff = ?

    %
    wb = waitbar(0,'Dynamic Analysis in Progress...');
    for k = 1:nt
        %Computes the external force vector at k-th time step

        %Newmark-beta effective force vector
        %Feff = ?

        %Solves for the displacements

        %Update velocity and acceleration

        waitbar(k/nt,wb);
    end
    close(wb)

    %TODO: Stores the U.V,A information in MESH.SOLUTION
end
