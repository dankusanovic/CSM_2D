function MESH = ComputeForceVector(MESH, t)
    %-------------------
    % Homework #3
    %-------------------
    %Allocate memory for Force Vector (total)
    ntotal = MESH.STORAGE.total;
    F = zeros(ntotal,1);
    
    %TODO: Assembles point nodal force contribution (F)
    for k = 1:length(MESH.LOAD.Point)
        %Obtain the force information
    
        %Assembles each node force
    end

    %Assembles element body force contribution
    for k = 1:length(MESH.LOAD.Volume)
        %Obtaines the force information
        elems = MESH.LOAD.Volume(k,1).element;
        value = MESH.LOAD.Volume(k,1).value(t);
        dir   = MESH.LOAD.Volume(k,1).dir;
        qe    = value*dir;

        %Assembles each element force
        for m = 1:length(elems)
            e = elems(m);
            n = MESH.ELEMENT(e,1).node;
            name = MESH.ELEMENT(e,1).name;
            
            %Element's connectivity vector
            if length(n) == 2
                edof = [MESH.NODE(n(1), 1).total, MESH.NODE(n(2), 1).total];
            elseif length(n) == 4
                edof = [MESH.NODE(n(1), 1).total, MESH.NODE(n(2), 1).total, MESH.NODE(n(3), 1).total, MESH.NODE(n(4), 1).total];
            end

            %Computes the element stiffness matrix
            ie = find(strcmpi({MESH.LIBRARY.name}, name));
            Fe = feval(MESH.LIBRARY(ie).fe, MESH.ELEMENT(e,1), MESH.NODE(n), qe);

            %Assemble the force
            F(edof,1) = F(edof,1) + Fe;
        end
    end
    
    %TODO: Stores the vector force (free) in MESH 
end
