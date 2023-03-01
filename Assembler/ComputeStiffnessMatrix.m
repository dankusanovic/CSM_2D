function MESH = ComputeStiffnessMatrix(MESH)
    %-------------------
    % Homework #3
    %-------------------
    %TODO: Allocate memory for sparse stiffness matrix
            
    %TODO: Compute the element stiffness matrices
    for k = 1:length(MESH.ELEMENT)
        %Get the element name
        %name = ?

        %Get the element connectivity
        %node = ?
        
        %Computes the element stiffness matrix
        ie = find(strcmpi({MESH.LIBRARY.name}, name));
        ke = feval(MESH.LIBRARY(ie).ke, MESH.ELEMENT(k,1), MESH.NODE(node));

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
