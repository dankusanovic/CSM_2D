function MESH = ComputeMassMatrix(MESH)
    %-------------------
    % Homework #4
    %-------------------
    %TODO: Allocate memory for sparse mass matrix
            
    %TODO: Compute the element mass matrices
    for k = 1:length(MESH.ELEMENT)
        %Get the element name
        %name = ?

        %Get the element connectivity
        %node = ?

        %Computes the element mass matrix
        ie = find(strcmpi({MESH.LIBRARY.name}, name));
        me = feval(MESH.LIBRARY(ie).me, MESH.ELEMENT(k,1), MESH.NODE(node));

        %TODO: Assembly the element contribution
        ndof = MESH.LIBRARY(ie).ndof;
        for i = 1:ndof
            for j = 1:ndof
            end
        end
    end

    %TODO: Create the Elements Block Matrix

    %TODO: Assemble all Elements using the L operator

    %TODO: Enforce Restrains/Constraints using the T operator
end
